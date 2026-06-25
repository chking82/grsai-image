#!/usr/bin/env bash
# grsai-image-generate.sh — GRS AI 图片生成主脚本
# 用法:
#   同步生成:  ./scripts/generate.sh -m gpt-image-2-vip -p "prompt" -a 2048x2048
#   异步生成:  ./scripts/generate.sh -m gpt-image-2-vip -p "prompt" -a 3840x2160 --async
#   指定输出:  ./scripts/generate.sh -m gpt-image-2-vip -p "prompt" -a 2048x2048 -o ./output.png
#   参考图生图: ./scripts/generate.sh -m gpt-image-2-vip -p "prompt" -a 2048x2048 --image url_or_base64

set -euo pipefail

# ─── 加载环境变量 ───
# .bashrc 有非交互式检查，直接 source 会 return
# 所以用 grep + sed 提取 key
if [ -z "${GRSAI_API_KEY:-}" ]; then
  GRSAI_API_KEY=$(grep '^export GRSAI_API_KEY=' ~/.bashrc 2>/dev/null | head -1 | sed 's/export GRSAI_API_KEY=//')
fi

# ─── 默认配置 ───
BASE_URL="${GRSAI_BASE_URL:-https://grsai.dakka.com.cn}"
BACKUP_URL="https://grsaiapi.com"
API_KEY="${GRSAI_API_KEY:-}"
# 剥掉从 .bashrc 提取时可能残留的首尾引号
API_KEY="${API_KEY%\"}"
API_KEY="${API_KEY#\"}"
OUTPUT_DIR="${GRSAI_OUTPUT_DIR:-./output}"
MAX_POLL=20
POLL_INTERVAL=15
# 生图慢，同步模式 curl 超时 300s
SYNC_TIMEOUT=300
# 任务注册表：记录已提交的任务，防止重复提交
TASK_REGISTRY_DIR="${GRSAI_TASK_REGISTRY:-./grsai-tasks}"
# 去重有效期（秒）：同一 prompt 在此时间内不重复提交
DEDUP_WINDOW=3600
MODEL="gpt-image-2-vip"
PROMPT=""
ASPECT_RATIO=""
IMAGE=""
ASYNC=false
OUTPUT_FILE=""
NODE=""

# ─── 参数解析 ───
while [[ $# -gt 0 ]]; do
  case "$1" in
    -m|--model)       MODEL="$2"; shift 2 ;;
    -p|--prompt)      PROMPT="$2"; shift 2 ;;
    -a|--aspectRatio) ASPECT_RATIO="$2"; shift 2 ;;
    -i|--image)       IMAGE="$2"; shift 2 ;;
    -o|--output)      OUTPUT_FILE="$2"; shift 2 ;;
    -n|--node)        NODE="$2"; shift 2 ;;
    --async)          ASYNC=true; shift ;;
    -h|--help)
      echo "用法: $0 -m MODEL -p PROMPT -a ASPECT_RATIO [--async] [-o OUTPUT] [-n NODE]"
      echo ""
      echo "参数:"
      echo "  -m, --model       模型名称 (默认: gpt-image-2-vip)"
      echo "  -p, --prompt      提示词 (必填)"
      echo "  -a, --aspectRatio 像素值或比例 (必填)"
      echo "  -i, --image       参考图 URL 或 base64 (可选)"
      echo "  -o, --output      输出文件路径 (可选，默认自动命名)"
      echo "  -n, --node        API 节点 (默认: 国内节点, 备选: https://grsaiapi.com)"
      echo "  --async           使用异步模式 (4K 或大图推荐)"
      echo "  -h, --help        显示帮助"
      exit 0
      ;;
    *) echo "❌ 未知参数: $1"; exit 1 ;;
  esac
done

# ─── 校验 ───
if [ -z "$PROMPT" ]; then
  echo "❌ 错误: prompt 必填 (-p)"
  exit 1
fi

if [ -z "$ASPECT_RATIO" ]; then
  echo "❌ 错误: aspectRatio 必填 (-a)"
  exit 1
fi

if [ -z "$API_KEY" ]; then
  echo "❌ 错误: GRSAI_API_KEY 未设置，请检查 ~/.bashrc"
  exit 1
fi

mkdir -p "$OUTPUT_DIR"
mkdir -p "$TASK_REGISTRY_DIR"

# ─── 判断节点 ───
if [ -z "$NODE" ]; then
  NODE="$BASE_URL"
fi

# ─── Prompt 去重检查 ───
PROMPT_HASH=$(echo "${MODEL}|${PROMPT}|${ASPECT_RATIO}" | md5sum | cut -d' ' -f1)
REGISTRY_FILE="$TASK_REGISTRY_DIR/${PROMPT_HASH}.json"

# 新 API 为同步流式端点，无法事后按 task_id 重新拉取结果，
# 因此去重改为「本地已下载文件复用」：记录上次成功的本地文件，命中且文件仍在则直接复用。
if [ -f "$REGISTRY_FILE" ]; then
  REGISTRY_TIME=$(python3 -c "import json; d=json.load(open('$REGISTRY_FILE')); print(d.get('time', 0))" 2>/dev/null || echo 0)
  REGISTRY_OUTPUT=$(python3 -c "import json; d=json.load(open('$REGISTRY_FILE')); print(d.get('output',''))" 2>/dev/null || echo "")
  CURRENT_TIME=$(date +%s)
  AGE=$((CURRENT_TIME - REGISTRY_TIME))

  if [ "$AGE" -lt "$DEDUP_WINDOW" ] && [ -n "$REGISTRY_OUTPUT" ] && [ -f "$REGISTRY_OUTPUT" ]; then
    echo "✅ 发现相同 prompt 的历史结果（${AGE}s 前），直接复用本地文件"
    FILE_SIZE=$(ls -lh "$REGISTRY_OUTPUT" | awk '{print $5}')
    echo "✅ 已保存: $REGISTRY_OUTPUT ($FILE_SIZE)"
    echo "$REGISTRY_OUTPUT"
    exit 0
  fi
fi

# ─── 判断 nano-banana 系列需要额外传 imageSize ───
EXTRA_PARAMS=""
if [[ "$MODEL" == nano-banana* ]]; then
  # nano-banana 系列 aspectRatio 传比例，需要额外 imageSize
  # 如果 aspectRatio 包含 x，说明传的是像素值，需要转换
  if [[ "$ASPECT_RATIO" == *"x"* ]]; then
    echo "⚠️ nano-banana 系列 aspectRatio 应传比例（如 16:9），不是像素值"
    echo "   已自动使用 2K 分辨率"
    EXTRA_PARAMS=',"imageSize":"2K"'
  else
    EXTRA_PARAMS=',"imageSize":"2K"'
  fi
fi

# ─── 构建 JSON payload ───
PAYLOAD="{\"model\":\"$MODEL\",\"prompt\":\"$(echo "$PROMPT" | sed 's/"/\\"/g' | tr '\n' ' ')\",\"aspectRatio\":\"$ASPECT_RATIO\""
if [ -n "$IMAGE" ]; then
  PAYLOAD="$PAYLOAD,\"images\":[\"$IMAGE\"]"
fi
PAYLOAD="$PAYLOAD$EXTRA_PARAMS"
PAYLOAD="$PAYLOAD}"

# ─── 提交任务（新版流式端点 /v1/draw/{model}）───
# GRS AI 官方端点按模型族分路（SSE 流式），model 全名放 body。
# 旧的 /v1/api/generate 提交+轮询已废弃。
#   nano-banana 系列 → /v1/draw/nano-banana
#   gpt-image / 其他  → /v1/draw/completions
if [[ "$MODEL" == nano-banana* ]]; then
  DRAW_ENDPOINT="/v1/draw/nano-banana"
else
  DRAW_ENDPOINT="/v1/draw/completions"
fi

# 流式读取：GRS AI 在终态（succeeded/failed）后会关连接，curl 自然退出。
submit() {
  local url="$1"
  curl -s -m "$SYNC_TIMEOUT" -N -X POST "$url$DRAW_ENDPOINT" \
    -H "Authorization: Bearer $API_KEY" \
    -H "Content-Type: application/json" \
    -d "$PAYLOAD"
}

echo "📤 提交任务到 $NODE$DRAW_ENDPOINT（model=$MODEL）"
RESULT=$(submit "$NODE") || true

# 解析流式响应：取最后一个含 status 的 data 行
parse_field() {
  # $1=字段名，从 RESULT 的最后一行 JSON 取值（无匹配不报错）
  echo "$RESULT" | grep -o '"'"$1"'":"[^"]*"' | tail -1 | sed 's/"'"$1"'":"//;s/"$//' || true
}

STATUS=$(parse_field status)

# 检测非流式错误响应（如 {"code":-1,"msg":"不存在该模型"}）
ERR_MSG=$(echo "$RESULT" | grep -o '"msg":"[^"]*"' | tail -1 | sed 's/"msg":"//;s/"$//' || true)
if [ -z "$STATUS" ] && [ -n "$ERR_MSG" ]; then
  echo "❌ API 错误: $ERR_MSG"
  exit 1
fi

# 国内节点异常（空响应或无 status）→ 尝试备用节点
# ⚠️ 备用节点是独立 API，会生成新图，仅在国内节点彻底失败时回退
if [ -z "$RESULT" ] || [ -z "$STATUS" ]; then
  echo "⚠️ 国内节点返回异常，尝试备用节点..."
  NODE="$BACKUP_URL"
  RESULT=$(submit "$NODE") || true
  STATUS=$(parse_field status)
fi

if [ -z "$RESULT" ]; then
  echo "❌ API 返回空响应"
  exit 1
fi

# 提取最终图片 URL（流式末尾 succeeded 行携带）
IMAGE_URL=$(echo "$RESULT" | grep -o '"url":"[^"]*"' | tail -1 | sed 's/"url":"//;s/"$//' || true)

if [ "$STATUS" = "succeeded" ] && [ -n "$IMAGE_URL" ]; then
  echo "✅ 生成成功"
elif [ "$STATUS" = "violation" ]; then
  echo "❌ 触发安全策略，请修改 prompt"
  exit 1
else
  FAIL_MSG=$(echo "$RESULT" | grep -o '"error":"[^"]*"' | tail -1 | sed 's/"error":"//;s/"$//' || true)
  FAIL_REASON=$(echo "$RESULT" | grep -o '"failure_reason":"[^"]*"' | tail -1 | sed 's/"failure_reason":"//;s/"$//' || true)
  echo "❌ 生成失败 (status=$STATUS reason=${FAIL_REASON} error=${FAIL_MSG})"
  exit 1
fi

# ─── 下载图片 ───
if [ -z "$IMAGE_URL" ]; then
  echo "❌ 未获取到图片 URL"
  exit 1
fi

if [ -z "$OUTPUT_FILE" ]; then
  TIMESTAMP=$(date +%Y%m%d_%H%M%S)
  MODEL_SHORT=$(echo "$MODEL" | sed 's/[^a-zA-Z0-9-]//g')
  OUTPUT_FILE="$OUTPUT_DIR/${TIMESTAMP}_${MODEL_SHORT}.png"
fi

echo "📥 下载图片..."
# 图片下载也给 60s
curl -sL -m 60 "$IMAGE_URL" -o "$OUTPUT_FILE"

if [ $? -eq 0 ] && [ -f "$OUTPUT_FILE" ]; then
  FILE_SIZE=$(ls -lh "$OUTPUT_FILE" | awk '{print $5}')
  echo "✅ 已保存: $OUTPUT_FILE ($FILE_SIZE)"
  # 写去重注册表：记录本地输出路径，1h 内同 prompt 直接复用
  echo '{"output":"'"$OUTPUT_FILE"'","time":'$(date +%s)',"model":"'"$MODEL"'","prompt_hash":"'"$PROMPT_HASH"'"}' > "$REGISTRY_FILE"
  echo "$OUTPUT_FILE"
else
  echo "❌ 下载失败"
  exit 1
fi
