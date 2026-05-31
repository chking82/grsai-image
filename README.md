# grsai-image

GRS AI 图片生成技能 — 通过 [GRS AI API](https://grsai.ai/) 进行图片生成，支持 `nano-banana` 和 `gpt-image-2` 系列模型。

## 特性

- **意图识别 & 模板匹配** — 15 个专业模板 + 通用兜底，自动匹配图片类型
- **Prompt 去重机制** — 同一 prompt + 模型 + 比例，1 小时内自动复用已有结果
- **自动节点回退** — 国内节点失败时自动切换备用节点
- **参数换算工具** — `param-converter.sh` 自动将分辨率×比例转换为像素值
- **Prompt 归档** — 每次生成自动归档，可追溯可复用

## 快速开始

### 前置条件

```bash
# 设置 GRS AI API Key（写入 ~/.bashrc）
export GRSAI_API_KEY=sk-your-key
source ~/.bashrc
```

### 生成图片

```bash
# 同步生成（小图）
./scripts/generate.sh -m gpt-image-2-vip -p "赛博朋克风格的雨夜城市街景" -a 2048x2048

# 异步生成（4K 或大图）
./scripts/generate.sh -m gpt-image-2-vip -p "赛博朋克风格的雨夜城市街景" -a 3840x2160 --async

# 指定输出路径
./scripts/generate.sh -m gpt-image-2-vip -p "prompt" -a 2048x2048 -o ./output.png

# 参考图生图
./scripts/generate.sh -m gpt-image-2-vip -p "prompt" -a 2048x2048 --image url_or_base64
```

### 参数转换

```bash
# 分辨率 + 比例 → 像素值（gpt-image-2-vip）
./scripts/param-converter.sh 4K 16:9   → 3840x2160
./scripts/param-converter.sh 2K 1:1    → 2048x2048
./scripts/param-converter.sh 2K 3:4    → 1728x2304
```

### 模板管理

```bash
# 列出所有模板
./scripts/template-manager.sh list

# 查看模板详情
./scripts/template-manager.sh show illustration

# 搜索模板
./scripts/template-manager.sh search 插画
```

## API 参数说明

### 三个模型系列的参数区别

| 模型系列 | aspectRatio | imageSize | 示例 |
|---------|-------------|-----------|------|
| **nano-banana** | 比例如 `"16:9"` | `1K`/`2K`/`4K` | `{"aspectRatio":"16:9","imageSize":"2K"}` |
| **gpt-image-2** | 比例或 1K 像素值 | 不需要 | `{"aspectRatio":"1024x1024"}` |
| **gpt-image-2-vip** | 1-4K 像素值 | 不需要 | `{"aspectRatio":"2048x2048"}` |

### gpt-image-2-vip 像素值速查

| 比例 \ 分辨率 | 1K | 2K | 4K |
|----------|--------|--------|--------|
| 1:1 | 1024×1024 | 2048×2048 | 2880×2880 |
| 16:9 | 1280×720 | 2048×1152 | 3840×2160 |
| 9:16 | 720×1280 | 1152×2048 | 2160×3840 |
| 3:4 | 864×1152 | 1728×2304 | 2448×3264 |
| 4:3 | 1152×864 | 2304×1728 | 3264×2448 |

> 完整换算表见 `scripts/param-converter.sh`

### 像素值约束（gpt-image-2-vip）

- 最大边长 ≤ 3840px
- 两条边都必须是 16 的倍数
- 长边/短边 ≤ 3:1
- 总像素数：655,360 ~ 8,294,400

## 支持的模型

**nano-banana 系列：** `nano-banana`, `nano-banana-fast`, `nano-banana-2`, `nano-banana-2-cl`, `nano-banana-pro`, `nano-banana-pro-vip`

**gpt-image-2 系列：** `gpt-image-2`, `gpt-image-2-vip`

## 目录结构

```
grsai-image/
├── SKILL.md                    # 技能说明和完整工作流
├── README.md                   # 本文件
├── .gitignore
├── scripts/
│   ├── generate.sh             # 主生图脚本（提交、轮询、下载、去重）
│   ├── param-converter.sh      # 分辨率×比例 → 像素值转换
│   └── template-manager.sh     # 模板管理 CLI
├── templates/
│   ├── registry.json           # 模板注册表
│   ├── illustration.md         # 插画/配图
│   ├── portrait.md             # 头像/肖像
│   ├── product.md              # 产品图/商品图
│   ├── poster.md               # 海报/Banner
│   ├── ui-mockup.md            # UI 素材/图标
│   ├── character.md            # 角色/吉祥物/IP
│   ├── architecture.md         # 架构图/流程图
│   ├── branding-packaging.md   # 品牌/包装
│   ├── editing-workflow.md     # 图片编辑
│   ├── logo.md                 # Logo 设计
│   ├── maps.md                 # 地图
│   ├── ppt-material.md         # PPT 素材
│   ├── storyboard.md           # 分镜
│   ├── generic.md              # 通用兜底
│   └── references/             # 子模板引用（129 个）
└── .gitignore
```

## License

MIT
