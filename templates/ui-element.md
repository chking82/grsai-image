# 模板：UI 素材/图标

## 适用场景
用户要求生成图标、按钮素材、UI 元素、装饰图形、emoji 等。

## 需求收集清单

| 字段 | 类型 | 必填 | 选项/说明 |
|------|------|------|----------|
| element | text | ✅ | 元素描述（什么图标/按钮/装饰）|
| style | select | ✅ | 线性图标/面性图标/3D图标/emoji/扁平/拟物/玻璃拟态 |
| color | select | ❌ | 单色/品牌色/渐变/彩色/黑白 |
| size_hint | select | ❌ | 小图标/中图标/大图标/装饰图形 |
| background | select | ❌ | 透明底/圆角方形/圆形/正方形 |
| consistency | text | ❌ | 是否需要与现有风格一致 |

## Prompt 生成器（Meta-Prompt）

```
你将扮演"UI 图标提示词生成器"。
任务：根据用户需求，生成一段可直接交给图像生成模型使用的图标提示词。

请从以下维度提炼和构建提示词：

1. 元素描述：图标的核心语义（搜索=放大镜，设置=齿轮…）
2. 视觉形态：形状、线条粗细、圆角、对称性
3. 风格映射：将风格转换为对应英文关键词（见风格映射表）
4. 色彩处理：颜色方案、渐变方向、高光和阴影
5. 背景/容器：图标的外框形状
6. UI 适配：用于界面设计，需要干净简洁

最终输出一段英文图像生成提示词，包含以下部分：

Title: 简洁的图标标题
Subtitle: 一句话概括图标语义和风格
Visual goal: 这个图标要传达的功能或含义
Layout: 图标在画面中的位置、容器形状、留白处理
Main elements: 图标的核心图形元素、装饰细节
Color & lighting: 颜色方案、渐变处理、光泽和阴影表现
Style treatment: 风格处理和 UI 适配描述
Avoid: 文字标签、复杂场景、照片级写实、过于细节的纹理、不协调的透视、过大尺寸感、多余装饰

语言：以英文为主。若用户明确要求包含中文文字（标题、标签、短文案等），必须在提示词中原封不动嵌入中文，不可翻译、不可替换为拼音。中文文字用引号包裹，例如 "标题文字"。
```

风格映射表：
- 线性图标 → line icon, stroke icon, outline style, thin clean lines, minimal design
- 面性图标 → solid icon, filled icon, glyph style, bold shapes, solid fills
- 3D图标 → 3D icon, isometric render, soft shadow, dimensional, glossy surface, depth of field
- emoji → emoji style, colorful emoji, playful character, rounded shapes, cheerful design
- 扁平 → flat icon, minimal design, solid colors, no gradients, geometric shapes
- 拟物 → skeuomorphic icon, realistic texture, detailed material, depth, shadows, highlights
- 玻璃拟态 → glassmorphism icon, frosted glass effect, translucent, blur background, soft edges

## 示例

**用户输入：** 帮我做一个齿轮设置的图标

**生成 Prompt：**
```
Title: Settings Gear
Subtitle: A 3D settings gear icon with metallic blue-gray finish
Visual goal: A clean, recognizable settings icon suitable for a mobile app interface, conveying configuration and system preferences
Layout: Single gear icon centered within a rounded square container, the container occupying approximately 70% of the frame, generous padding around the icon, centered and balanced composition
Main elements: Classic gear shape with evenly spaced teeth, central circular hub, subtle beveled edges on each tooth, small center bore hole, clean rounded square background container
Color & lighting: Metallic blue-gray gradient from lighter top-left to darker bottom-right, soft ambient lighting with a gentle fill light from below, subtle specular highlight on the top edge of the gear, soft drop shadow beneath grounding the icon on the container
Style treatment: 3D icon render with isometric perspective, clean modern UI design aesthetic, glossy surface with controlled reflections, suitable for mobile and web interface use, professional icon design quality
Avoid: text labels, complex background scenes, photorealistic photography, excessive surface texture detail, inconsistent perspective, oversized appearance, ornamental decorations, multiple icons in one image, low contrast against background
```

**推荐参数：**
- model: gpt-image-2-vip
- imageSize: 2048x2048

