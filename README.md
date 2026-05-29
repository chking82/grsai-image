# grsai-image

GRS AI 图片生成技能 — 完整的图片生成工作流，包括意图识别、模板匹配、需求收集、提示词审核、参数推荐、图片生成与交付。

通过 [GRS AI API](https://grsai.ai/) 进行图片生成，支持 `nano-banana` 和 `gpt-image-2` 系列模型。

## 特性

- **意图识别 & 模板匹配** — 7 个专业模板 + 通用兜底，自动匹配图片类型
- **标准化提示词框架** — 8 字段结构（Title/Subtitle/Visual goal/Layout/Main elements/Color & lighting/Style treatment/Avoid）
- **参考图→提示词模板** — 分析参考图，提取可复用的提示词模板（含占位符）
- **分辨率×比例换算表** — gpt-image-2-vip 完整像素值对照（15 种比例 × 3 种分辨率）
- **触发规则** — 四级触发机制，自动识别图片生成意图
- **审核流程** — 每次生成前必须展示 prompt + 参数，用户确认后才调用 API

## 模板列表

| 模板 | 适用场景 | 默认分辨率 |
|------|---------|-----------|
| 插画/配图 | 插画、配图、艺术图 | 4K 16:9 |
| 论文/技术插图 | 架构图、流程图、方法论图 | 4K 16:9 |
| 头像/肖像 | 头像、肖像照、社交头像 | 4K 1:1 |
| 角色/吉祥物/IP | 角色设计、吉祥物、IP 形象 | 4K 1:1 |
| 产品图/商品图 | 产品展示、电商图、渲染 | 4K 1:1 |
| 海报/Banner | 海报、封面、壁纸、宣传图 | 4K 16:9 |
| UI 素材/图标 | 图标、按钮、UI 元素、emoji | 2K 1:1 |
| 参考图→模板 | 从参考图提取可复用模板 | 4K 16:9 |
| 通用 | 兜底模板 | 4K 1:1 |

## 目录结构

```
grsai-image/
├── SKILL.md                    # 技能说明和完整工作流
├── generate.sh                 # 快速生成脚本
├── .gitignore
├── templates/
│   ├── registry.json           # 模板注册表
│   ├── illustration.md         # 插画/配图
│   ├── portrait.md             # 头像/肖像
│   ├── product.md              # 产品图/商品图
│   ├── poster.md               # 海报/Banner
│   ├── ui-element.md           # UI 素材/图标
│   ├── character.md            # 角色/吉祥物/IP
│   ├── academic.md             # 论文/技术插图
│   ├── ref-to-template.md      # 参考图→提示词模板
│   └── generic.md              # 通用兜底
└── scripts/
    └── template-manager.sh     # 模板管理 CLI
```

## 快速开始

### 前置条件

- GRS AI API Key（[获取](https://grsai.ai/zh/dashboard/api-keys)）
- 国内节点：`https://grsai.dakka.com.cn`
- 全球节点：`https://grsaiapi.com`

### 生成图片

```bash
./generate.sh -p "赛博朋克风格的雨夜城市街景" -m nano-banana-2 -a 16:9 -s 4K
```

### 管理模板

```bash
# 列出所有模板
./scripts/template-manager.sh list

# 查看模板详情
./scripts/template-manager.sh show illustration

# 搜索模板
./scripts/template-manager.sh search 插画

# 添加新模板
./scripts/template-manager.sh add food 美食 美食,食物,菜品 nano-banana-pro 4K 4:3
```

## API 参数

### gpt-image-2-vip（推荐）

使用 `imageSize` 传入像素值（不支持 aspectRatio）：

| 比例 | 1K | 2K | 4K |
|------|--------|--------|--------|
| 1:1 | 1024×1024 | 2048×2048 | 2880×2880 |
| 16:9 | 1280×720 | 2048×1152 | 3840×2160 |
| 9:16 | 720×1280 | 1152×2048 | 2160×3840 |

### nano-banana 系列

使用 `aspectRatio`（如 `"16:9"`）和 `imageSize`（如 `"4K"`）。

## License

MIT
