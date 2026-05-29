# 模板：通用

## 适用场景
无法匹配到具体模板时的兜底模板。

## 需求收集清单

| 字段 | 类型 | 必填 | 选项/说明 |
|------|------|------|----------|
| description | text | ✅ | 描述你想要生成的图片内容 |
| style | select | ❌ | 写实/插画/3D/像素/艺术/照片/抽象 |
| mood | select | ❌ | 欢快/严肃/神秘/温暖/冷峻/梦幻 |
| ratio | select | ❌ | 1:1/16:9/9:16/4:3/3:2/21:9 |
| resolution | select | ❌ | 1K/2K/4K |

## Prompt 生成器（Meta-Prompt）

```
你将扮演"通用图像提示词生成器"。
任务：根据用户需求，生成一段可直接交给图像生成模型使用的图像提示词。

请从以下维度提炼和构建提示词：

1. 主体提取：用户描述中的核心视觉对象
2. 场景构建：环境、背景、空间关系
3. 风格推断：根据内容自动匹配合适的风格（见风格映射表）
4. 氛围营造：情绪、光线、色彩方案
5. 构图引导：画面布局和视觉焦点

最终输出一段英文图像生成提示词，包含以下部分：

Title: 简洁的图像标题
Subtitle: 一句话概括画面主旨
Visual goal: 这张图要传达的感受或故事
Layout: 画面布局和构图方式
Main elements: 主要视觉元素
Color & lighting: 色彩和光线设计
Style treatment: 风格处理
Avoid: 与用户需求冲突的元素、低质量特征

语言：以英文为主。若用户明确要求包含中文文字（标题、标签、短文案等），必须在提示词中原封不动嵌入中文，不可翻译、不可替换为拼音。中文文字用引号包裹，例如 "标题文字"。
```

风格映射表：
- 写实 → photorealistic, natural lighting, authentic details
- 插画 → digital illustration, artistic rendering, stylized
- 3D → 3D render, studio lighting, dimensional, octane render
- 像素 → pixel art, 16-bit aesthetic, retro style
- 艺术 → artistic painting, expressive brushwork, creative interpretation
- 照片 → professional photography, DSLR quality, natural depth of field
- 抽象 → abstract art, geometric shapes, fluid forms, non-representational

## 示例

**用户输入：** 一只在太空站里喝咖啡的猫

**生成 Prompt：**
```
Title: Space Cat
Subtitle: A cat enjoying coffee aboard a space station
Visual goal: A whimsical yet believable scene capturing the contrast between the cozy domestic ritual of drinking coffee and the extraordinary environment of space
Layout: The cat floating near a large observation window in the center-right of the frame, the window occupying the left third showing Earth below, space station interior panels and equipment visible in the background, a floating coffee mug with drifting liquid droplets near the cat's paws
Main elements: Fluffy domestic cat in zero-gravity posture, floating ceramic coffee mug, spherical coffee droplets suspended in air, large curved observation window, Earth visible below with blue oceans and white clouds, space station interior with soft-lit control panels
Color & lighting: Warm amber tones from the coffee contrasting with the cool blue of Earth and space, soft interior LED lighting casting gentle fill light, rim light from the window outlining the cat's silhouette, cinematic color grading
Style treatment: Photorealistic style with attention to fur detail and zero-gravity physics, detailed space station environment, professional concept art quality, believable yet charming atmosphere
Avoid: cartoon proportions, text overlays, unrealistic space physics, cluttered composition, low-quality rendering, dramatic action-movie lighting, multiple animals
```

**推荐参数：**
- model: gpt-image-2-vip
- imageSize: 3840x2160

