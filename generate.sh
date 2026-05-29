#!/usr/bin/env bash
# grsai-generate.sh - GRS AI 图片生成脚本
# 用法: ./grsai-generate.sh -p "提示词" [-m 模型] [-a 比例] [-s 分辨率] [-k API_KEY] [-n 数量] [-i 参考图URL]

set -e

# 默认配置
BASE_URL="https://grsai.dakka.com.cn"
MODEL="nano-banana-2"
ASPECT_RATIO="1:1"
IMAGE_SIZE="4K"
REPLY_TYPE="json"
COUNT=1
API_KEY=""
PROMPT=""
IMAGE_REF=""

# 解析参数
while [[ $# -gt 0 ]]; do
  case $1 in
    -p|--prompt) PROMPT="$2"; shift 2;;
    -m|--model) MODEL="$2"; shift 2;;
    -a|--aspect) ASPECT_RATIO="$2"; shift 2;;
    -s|--size) IMAGE_SIZE="$2"; shift 2;;
    -k|--key) API_KEY="$2"; shift 2;;
    -n|--count) COUNT="$2"; shift 2;;
    -i|--image) IMAGE_REF="$2"; shift 2;;
    -u|--url) BASE_URL="$2"; shift 2;;
    -h|--help)
      echo "用法: $0 -p '提示词' [选项]"
      echo "选项:"
      echo "  -m, --model    模型名称 (默认: nano-banana-2)"
      echo "  -a, --aspect   图片比例 (默认: 1:1)"
      echo "  -s, --size     分辨率 (默认: 4K)"
      echo "  -k, --key      API Key (默认从环境变量 GRSAI_API_KEY 读取)"
      echo "  -n, --count    生成数量 (默认: 1)"
      echo "  -i, --image    参考图 URL 或 base64"
      echo "  -u, --url      API 基础 URL (默认: 国内节点)"
      echo "  -h, --help     显示帮助"
      exit 0
      ;;
    *) echo "未知参数: $1"; exit 1;;
  esac
done

# 验证必填参数
if [ -z "$PROMPT" ]; then
  echo "错误: 必须提供提示词 (-p)"
  exit 1
fi

# 获取 API Key
API_KEY="${API_KEY:-$GRSAI_API_KEY}"
if [ -z "$API_KEY" ]; then
  echo "错误: 未提供 API Key，请设置环境变量 GRSAI_API_KEY 或使用 -k 参数"
  exit 1
fi

# 构建请求体
IMAGES_JSON=""
if [ -n "$IMAGE_REF" ]; then
  IMAGES_JSON="\"images\": [\"${IMAGE_REF}\"],"
fi

BODY="{
  \"model\": \"${MODEL}\",
  \"prompt\": \"${PROMPT}\",
  ${IMAGES_JSON}
  \"aspectRatio\": \"${ASPECT_RATIO}\",
  \"imageSize\": \"${IMAGE_SIZE}\",
  \"replyType\": \"${REPLY_TYPE}\"
}"

echo "🎨 正在生成图片..."
echo "   模型: ${MODEL}"
echo "   比例: ${ASPECT_RATIO}"
echo "   分辨率: ${IMAGE_SIZE}"
echo "   提示词: ${PROMPT}"
echo ""

# 发送请求
RESPONSE=$(curl -s -X POST "${BASE_URL}/v1/api/generate" \
  -H "Authorization: Bearer ${API_KEY}" \
  -H "Content-Type: application/json" \
  -d "${BODY}")

# 解析响应
STATUS=$(echo "$RESPONSE" | jq -r '.status // "unknown"')
TASK_ID=$(echo "$RESPONSE" | jq -r '.id // ""')

if [ "$STATUS" = "succeeded" ]; then
  echo "✅ 生成成功!"
  echo "$RESPONSE" | jq -r '.results[].url' | while read -r url; do
    echo "   📷 $url"
    # 自动下载到统一媒体路径
    OUTPUT_DIR="/tmp/openclaw/grsai"
    mkdir -p "$OUTPUT_DIR"
    FILENAME="${OUTPUT_DIR}/grsai_${TASK_ID}_$(date +%s).png"
    if command -v wget &>/dev/null; then
      wget -q "$url" -O "$FILENAME" && echo "   💾 已下载: $FILENAME"
    elif command -v curl &>/dev/null; then
      curl -sL "$url" -o "$FILENAME" && echo "   💾 已下载: $FILENAME"
    fi
  done
elif [ "$STATUS" = "running" ]; then
  echo "⏳ 任务已提交，正在处理中 (ID: ${TASK_ID})"
  echo "   查询命令: curl -s -H 'Authorization: Bearer ${API_KEY}' '${BASE_URL}/v1/api/result?id=${TASK_ID}' | jq"
elif [ "$STATUS" = "violation" ]; then
  echo "❌ 内容违规，请修改提示词后重试"
elif [ "$STATUS" = "failed" ]; then
  ERROR=$(echo "$RESPONSE" | jq -r '.error // "未知错误"')
  echo "❌ 生成失败: ${ERROR}"
else
  echo "❓ 未知状态: ${STATUS}"
  echo "$RESPONSE" | jq .
fi
