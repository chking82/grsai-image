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

if [ -f "$REGISTRY_FILE" ]; then
  REGISTRY_TIME=$(python3 -c "import json; d=json.load(open('$REGISTRY_FILE')); print(d.get('time', 0))" 2>/dev/null || echo 0)
  REGISTRY_TASK_ID=$(python3 -c "import json; d=json.load(open('$REGISTRY_FILE')); print(d.get('task_id',''))" 2>/dev/null || echo "")
  CURRENT_TIME=$(date +%s)
  AGE=$((CURRENT_TIME - REGISTRY_TIME))
  
  if [ "$AGE" -lt "$DEDUP_WINDOW" ] && [ -n "$REGISTRY_TASK_ID" ]; then
    # 检查任务状态
    CHECK_STATUS=$(curl -s -m 10 "$NODE/v1/api/result?id=$REGISTRY_TASK_ID" \
      -H "Authorization: Bearer $API_KEY" 2>/dev/null || echo "")
    
    if [ -n "$CHECK_STATUS" ]; then
      TASK_STATE=$(echo "$CHECK_STATUS" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('status','unknown'))" 2>/dev/null || echo "unknown")
      
      if [ "$TASK_STATE" = "succeeded" ]; then
        echo "✅ 发现相同 prompt 的历史任务（${AGE}s 前），直接复用结果"
        STATUS="succeeded"
        IMAGE_URL=$(echo "$CHECK_STATUS" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('results',[{}])[0].get('url',''))")
        # 跳到下载步骤
        if [ -z "$OUTPUT_FILE" ]; then
          TIMESTAMP=$(date +%Y%m%d_%H%M%S)
          MODEL_SHORT=$(echo "$MODEL" | sed 's/[^a-zA-Z0-9-]//g')
          OUTPUT_FILE="$OUTPUT_DIR/${TIMESTAMP}_${MODEL_SHORT}.png"
        fi
        echo "📥 下载图片..."
        curl -sL -m 60 "$IMAGE_URL" -o "$OUTPUT_FILE"
        if [ $? -eq 0 ] && [ -f "$OUTPUT_FILE" ]; then
          FILE_SIZE=$(ls -lh "$OUTPUT_FILE" | awk '{print $5}')
          echo "✅ 已保存: $OUTPUT_FILE ($FILE_SIZE)"
          echo "$OUTPUT_FILE"
        else
          echo "❌ 下载失败"
          exit 1
        fi
        exit 0
      elif [ "$TASK_STATE" = "running" ]; then
        echo "⏳ 相同 prompt 正在生成中（Task: $REGISTRY_TASK_ID），开始轮询..."
        TASK_ID="$REGISTRY_TASK_ID"
        STATUS="running"
        # 跳到轮询步骤
      fi
    fi
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

if [ "$ASYNC" = true ]; then
  PAYLOAD="$PAYLOAD,\"replyType\":\"async\""
else
  PAYLOAD="$PAYLOAD,\"replyType\":\"json\""
fi
PAYLOAD="$PAYLOAD}"

# ─── 提交任务 ───
submit() {
  local url="$1"
  # 生图慢，curl 超时 300s
  curl -s -m 300 -X POST "$url/v1/api/generate" \
    -H "Authorization: Bearer $API_KEY" \
    -H "Content-Type: application/json" \
    -d "$PAYLOAD"
}

echo "📤 提交任务到 $NODE"
RESULT=$(submit "$NODE") || true

# 检查是否成功：需要返回非空且有 id/status
has_id=false
if [ -n "$RESULT" ]; then
  has_id=$(echo "$RESULT" | python3 -c "import sys,json; d=json.load(sys.stdin); print('yes' if d.get('id') or d.get('status') else 'no')" 2>/dev/null || echo "no")
fi

# 如果国内节点失败（空响应或无 id/status），尝试备用节点
# ⚠️ 备用节点是独立的 API，会生成新图，所以国内节点超时/失败时不再回退
if [ -z "$RESULT" ] || [ "$has_id" = "no" ]; then
  echo "⚠️ 国内节点返回异常，尝试备用节点..."
  RESULT=$(submit "$BACKUP_URL") || true
  NODE="$BACKUP_URL"
  # 备用节点成功后不再回退，避免重复生成
fi

if [ -z "$RESULT" ]; then
  echo "❌ API 返回空响应"
  exit 1
fi

STATUS=$(echo "$RESULT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('status','unknown'))" 2>/dev/null)

# ─── 注册任务（记录 task_id 到本地） ───
if [ "$STATUS" = "running" ]; then
  TASK_ID=$(echo "$RESULT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('id',''))")
  echo '{"task_id":"'"$TASK_ID"'","time":'$(date +%s)',"model":"'"$MODEL"'","prompt_hash":"'"$PROMPT_HASH"'"}' > "$REGISTRY_FILE"
fi

# ─── 同步模式 ───
if [ "$ASYNC" = false ] || [ "$STATUS" = "succeeded" ]; then
  if [ "$STATUS" = "succeeded" ]; then
    IMAGE_URL=$(echo "$RESULT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('results',[{}])[0].get('url',''))")
    echo "✅ 生成成功"
  else
    echo "❌ 生成失败: $RESULT"
    exit 1
  fi
else
  # ─── 异步模式 ───
  TASK_ID=$(echo "$RESULT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('id',''))")
  
  if [ -z "$TASK_ID" ]; then
    echo "❌ 提交失败: $RESULT"
    exit 1
  fi
  
  echo "🆔 Task ID: $TASK_ID"
  echo "⏳ 生成中，开始轮询..."
  
  for i in $(seq 1 $MAX_POLL); do
    sleep $POLL_INTERVAL
    CHECK=$(curl -s -m 10 "$NODE/v1/api/result?id=$TASK_ID" \
      -H "Authorization: Bearer $API_KEY")
    
    STATUS=$(echo "$CHECK" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('status','unknown'))" 2>/dev/null)
    PROGRESS=$(echo "$CHECK" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('progress',0))" 2>/dev/null || echo 0)
    
    echo "  [$i/$MAX_POLL] status=$STATUS progress=${PROGRESS}%"
    
    if [ "$STATUS" = "succeeded" ]; then
      IMAGE_URL=$(echo "$CHECK" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('results',[{}])[0].get('url',''))")
      echo "✅ 生成成功!"
      break
    elif [ "$STATUS" = "failed" ]; then
      echo "❌ 生成失败: $CHECK"
      exit 1
    elif [ "$STATUS" = "violation" ]; then
      echo "❌ 触发安全策略，请修改 prompt"
      exit 1
    fi
  done
  
  if [ "$STATUS" != "succeeded" ]; then
    echo "⏰ 超时（$MAX_POLL 次轮询后仍在生成中）"
    exit 2
  fi
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
  echo "$OUTPUT_FILE"
else
  echo "❌ 下载失败"
  exit 1
fi
