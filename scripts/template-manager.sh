#!/bin/bash
# GRS AI Template Manager
# 用法: ./template-manager.sh [list|show|add|remove|search] [args]

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_DIR="$(dirname "$SCRIPT_DIR")"
TEMPLATES_DIR="$SKILL_DIR/templates"
REGISTRY="$TEMPLATES_DIR/registry.json"

# 列出所有模板
list_templates() {
    echo "📋 已注册的模板（$(grep -c '"id"' "$REGISTRY") 个）:"
    echo ""
    # 用 node 解析 JSON（如果有 node 的话）
    if command -v node &>/dev/null; then
        node -e "
            const fs = require('fs');
            const reg = JSON.parse(fs.readFileSync('$REGISTRY', 'utf8'));
            reg.templates.forEach((t, i) => {
                const kw = t.keywords.length > 0 ? ' | 关键词: ' + t.keywords.join(', ') : ' | 兜底模板';
                console.log('  ' + (i+1) + '. [' + t.id +'] ' + t.name + ' | 模型: ' + t.default_model + ' | 分辨率: ' + t.default_resolution + ' | 比例: ' + t.default_ratio + kw);
            });
        "
    else
        # 简单 grep 版本
        grep -E '"id"|"name"|"default_model"' "$REGISTRY" | sed 's/.*: "//;s/"//' | paste - - -
    fi
}

# 显示模板详情
show_template() {
    local id="$1"
    if [ -z "$id" ]; then
        echo "用法: $0 show <template-id>"
        exit 1
    fi
    local file="$TEMPLATES_DIR/$id.md"
    if [ ! -f "$file" ]; then
        echo "❌ 模板不存在: $id"
        exit 1
    fi
    echo "📄 模板详情: $id"
    echo "---"
    cat "$file"
}

# 搜索模板（根据关键词）
search_template() {
    local query="$1"
    if [ -z "$query" ]; then
        echo "用法: $0 search <关键词>"
        exit 1
    fi
    echo "🔍 搜索关键词: $query"
    echo ""
    if command -v node &>/dev/null; then
        node -e "
            const fs = require('fs');
            const reg = JSON.parse(fs.readFileSync('$REGISTRY', 'utf8'));
            let found = false;
            reg.templates.forEach(t => {
                const match = t.keywords.some(k => k.toLowerCase().includes('$query'.toLowerCase()));
                if (match) {
                    found = true;
                    console.log('  ✅ [' + t.id + '] ' + t.name + ' (匹配关键词: ' + t.keywords.filter(k => k.toLowerCase().includes('$query'.toLowerCase())).join(', ') + ')');
                }
            });
            if (!found) {
                console.log('  ⚠️  无匹配模板，将使用 generic 兜底模板');
            }
        "
    else
        grep -l "$query" "$TEMPLATES_DIR"/*.md 2>/dev/null || echo "  ⚠️  无匹配"
    fi
}

# 添加新模板
add_template() {
    local id="$1"
    local name="$2"
    local keywords="$3"  # 逗号分隔
    local model="${4:-nano-banana-2}"
    local resolution="${5:-4K}"
    local ratio="${6:-1:1}"
    
    if [ -z "$id" ] || [ -z "$name" ]; then
        echo "用法: $0 add <id> <name> [keywords] [model] [resolution] [ratio]"
        echo "  示例: $0 add food 美食 美食,食物,菜品,餐饮 nano-banana-pro 4K 4:3"
        exit 1
    fi
    
    local file="$TEMPLATES_DIR/$id.md"
    if [ -f "$file" ]; then
        echo "⚠️  模板已存在: $id"
        exit 1
    fi
    
    # 创建模板文件
    cat > "$file" << 'TEMPLATE'
# 模板：NAME

## 适用场景
TEMPLATE

    sed -i "s/NAME/$name/g" "$file"
    cat >> "$file" << 'TEMPLATE'

## 需求收集清单

| 字段 | 类型 | 必填 | 选项/说明 |
|------|------|------|----------|
| description | text | ✅ | 描述你想要生成的内容 |

## Prompt 生成规则

\`\`\`
[描述], 高质量, 精细细节
\`\`\`

## 示例

**用户输入：** 
**生成 Prompt：** 
TEMPLATE
    
    # 更新 registry
    if command -v node &>/dev/null; then
        node -e "
            const fs = require('fs');
            const reg = JSON.parse(fs.readFileSync('$REGISTRY', 'utf8'));
            const kwArray = '$keywords'.split(',').map(k => k.trim()).filter(k => k);
            reg.templates.push({
                id: '$id',
                file: '$id.md',
                name: '$name',
                keywords: kwArray,
                default_model: '$model',
                default_resolution: '$resolution',
                default_ratio: '$ratio',
                priority: reg.templates.length * 10
            });
            fs.writeFileSync('$REGISTRY', JSON.stringify(reg, null, 2));
        "
        echo "✅ 模板已添加: $id ($name)"
    else
        echo "⚠️  需要 node 来更新 registry"
    fi
}

# 删除模板
remove_template() {
    local id="$1"
    if [ -z "$id" ]; then
        echo "用法: $0 remove <template-id>"
        exit 1
    fi
    
    local file="$TEMPLATES_DIR/$id.md"
    if [ ! -f "$file" ]; then
        echo "❌ 模板不存在: $id"
        exit 1
    fi
    
    if [ "$id" = "generic" ]; then
        echo "❌ 不能删除兜底模板 generic"
        exit 1
    fi
    
    rm "$file"
    
    if command -v node &>/dev/null; then
        node -e "
            const fs = require('fs');
            const reg = JSON.parse(fs.readFileSync('$REGISTRY', 'utf8'));
            reg.templates = reg.templates.filter(t => t.id !== '$id');
            fs.writeFileSync('$REGISTRY', JSON.stringify(reg, null, 2));
        "
        echo "✅ 模板已删除: $id"
    else
        echo "⚠️  需要 node 来更新 registry"
    fi
}

# 主入口
case "${1:-list}" in
    list|ls) list_templates ;;
    show) show_template "$2" ;;
    search|find) search_template "$2" ;;
    add) add_template "$2" "$3" "$4" "$5" "$6" "$7" ;;
    remove|rm) remove_template "$2" ;;
    *) 
        echo "GRS AI 模板管理器"
        echo ""
        echo "用法: $0 <命令> [参数]"
        echo ""
        echo "命令:"
        echo "  list              列出所有模板"
        echo "  show <id>         显示模板详情"
        echo "  search <关键词>   搜索匹配的模板"
        echo "  add <id> <name> [keywords] [model] [resolution] [ratio]  添加模板"
        echo "  remove <id>       删除模板"
        ;;
esac
