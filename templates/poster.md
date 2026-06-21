# 模板：海报/Banner

## 适用场景
用户要求生成海报、Banner、封面图、背景壁纸、宣传图等。

## 需求收集清单

| 字段 | 类型 | 必填 | 选项/说明 |
|------|------|------|----------|
| theme | text | ✅ | 主题/核心内容 |
| type | select | ✅ | 活动海报/社交媒体封面/PPT背景/壁纸/文章封面/Banner |
| style | select | ✅ | 现代极简/渐变抽象/科技感/文艺/商务/节日 |
| color_scheme | select | ❌ | 品牌色/暖色/冷色/黑白/多彩/单色 |
| text_space | select | ❌ | 顶部留白/底部留白/居中留白/不留 |
| composition | select | ❌ | 对称/三分法/对角线/满构图 |
| mood | select | ❌ | 活力/高端/温馨/科技/专业/轻松 |

## Prompt 生成器（Meta-Prompt）

```
你将扮演"海报/Banner 提示词生成器"。
任务：根据用户需求，生成一段可直接交给图像生成模型使用的海报背景提示词。

请从以下维度提炼和构建提示词：

1. 主题表达：核心视觉元素、主题象征物、关键图形
2. 布局设计：画面分区（文字区域/视觉区域）、视觉流向、留白位置
3. 风格映射：将风格转换为对应英文关键词（见风格映射表）
4. 色彩方案：主色、辅色、配色关系、色彩情绪
5. 层次感：前景、中景、背景的元素分布
6. 文字空间：明确标注文字区域的位置和大小
7. 商业品质：设计品质相关描述

最终输出一段英文图像生成提示词，包含以下部分：

Title: 简洁的海报标题
Subtitle: 一句话概括海报主题和用途
Visual goal: 这张海报要传达的核心信息和情绪
Layout: 画面分区（文字区/视觉区）、视觉流向、层次关系
Main elements: 主要视觉图形元素、装饰元素、抽象图形
Color & lighting: 色彩方案、渐变处理、光影效果
Style treatment: 风格处理和设计品质描述
Avoid: 具体文字（模型生成文字效果差）、复杂装饰边框、过度渐变、廉价模板感、风格不统一、色彩过饱和、密集元素

语言：以英文为主。若用户明确要求包含中文文字（标题、标签、短文案等），必须在提示词中原封不动嵌入中文，不可翻译、不可替换为拼音。中文文字用引号包裹，例如 "标题文字"。

**✅ 中文渲染**：gpt-image-2-vip 对中文渲染支持良好，prompt 中直接原样嵌入中文标题/短文案（引号包裹）。军事/战争/政治敏感历史题材会被主题级拦截 → 改用 nano-banana-2。
```

## ⚠️ 避坑指南

- **标题文案硬编码**：主标题、副标题都写死，否则模型会疯狂加戏、自动瞎编不知所云的文字。
- **字体海报先锁标题**：概念字体类必须写明「标题必须拼写完全正确且成为主视觉」，否则容易变成漂亮但不可读的字效图。
- **图像要和字互动**：人物/物体/场景必须嵌入、遮挡、穿过或托起字形，只摆在旁边会像装饰素材。
- **禁止 moodboard 化**：明确要求 `single poster only`，避免模型生成多方案展示板、过程稿或样张拼贴。
- **运动/Campaign 海报先定结构**：先锁「单主视觉 / 三联画 / 数据涂鸦」，再写主体和文案，否则最容易变杂乱拼贴。
- **道具当构图骨架**：球拍/哑铃/球鞋这类道具指定角度、比例、位置，否则模型会画成普通背景装饰。
- **特殊屏幕比例锁前**：车机/智能家居等固定比例（如 21:9）必须写在 prompt 最前面，否则默认出 9:16。

风格映射表：
- 现代极简 → modern minimal design, clean layout, geometric shapes, generous negative space
- 渐变抽象 → abstract gradient background, fluid shapes, modern gradient, mesh gradient
- 科技感 → futuristic technology background, digital circuit pattern, holographic, data visualization elements
- 文艺 → artistic poster, vintage typography, hand-drawn elements, textured paper
- 商务 → corporate background, professional design, clean business style, subtle geometric patterns
- 节日 → festive poster, celebration theme, decorative elements, confetti, warm atmosphere

## 示例

**用户输入：** 帮我做一张科技峰会的活动海报背景

**生成 Prompt：**
```
Title: Tech Summit 2026
Subtitle: A futuristic technology conference poster background
Visual goal: Create a professional, cutting-edge atmosphere that conveys innovation and forward-thinking, with ample clean space for event text overlay
Layout: Dark gradient background occupying the full frame, abstract digital circuit patterns flowing diagonally from bottom-left to top-right, generous clean text space in the upper third (approximately 35% of the height), subtle holographic light beams radiating from the center, small geometric accent shapes scattered in the lower two-thirds
Main elements: Flowing circuit board traces with glowing nodes, holographic light rays in cyan and blue, subtle data visualization dot grids, geometric triangular accents, soft particle effects suggesting digital atmosphere
Color & lighting: Deep navy to near-black gradient as base, electric cyan and bright blue as accent colors, subtle magenta highlights on circuit nodes, soft volumetric light beams, high contrast between dark background and bright elements
Style treatment: Modern minimal design with technology aesthetic, professional event poster quality, clean and uncluttered composition suitable for text overlay, subtle depth through layered transparency effects, premium corporate design standard
Avoid: readable text characters, complex ornamental borders, excessive gradient banding, cheap template aesthetic, clashing color combinations, over-saturated neon, busy patterns, photographic elements, cartoon graphics
```

**推荐参数：**
- model: gpt-image-2-vip
- imageSize: 3840x2160

