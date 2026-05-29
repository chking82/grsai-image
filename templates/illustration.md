# 模板：插画/配图

## 适用场景
用户要求生成插画、配图、艺术图、概念图等。

## 需求收集清单

| 字段 | 类型 | 必填 | 选项/说明 |
|------|------|------|----------|
| subject | text | ✅ | 画面主体内容 |
| style | select | ✅ | 扁平插画/水彩/油画/像素/赛博朋克/手绘/极简/卡通 |
| mood | select | ❌ | 温暖/冷峻/梦幻/欢快/严肃/神秘/治愈 |
| composition | select | ❌ | 居中/三分法/对称/满构图/留白 |
| color_scheme | select | ❌ | 暖色调/冷色调/黑白/高饱和/低饱和/单色 |
| usage | text | ❌ | 用途说明 |

## Prompt 生成器（Meta-Prompt）

```
你将扮演"插画提示词生成器"。
任务：根据用户的需求描述，生成一段可直接交给图像生成模型使用的插画提示词。

请从以下维度提炼和构建提示词：

1. 主体描述：将用户需求转化为具体的视觉对象描述
2. 风格映射：将用户指定的风格转换为对应的英文风格关键词（见风格映射表）
3. 构图布局：画面分区、视觉焦点、留白位置
4. 色彩方案：主色、辅色、色彩情绪
5. 氛围光效：环境光、时间、天气、情绪光
6. 细节增强：质量相关的通用后缀

最终输出一段英文图像生成提示词，包含以下部分：

Title: 简洁的插画标题
Subtitle: 一句话概括画面主旨
Visual goal: 这张图要传达的核心感受或故事
Layout: 画面布局（主体位置、背景层次、视觉流向）
Main elements: 主要视觉元素，每个用短描述（6-10个英文单词）
Color & lighting: 色彩方案和光线设计
Style treatment: 风格处理和技术细节
Avoid: 避免照片级写实（除非要求）、过度复杂装饰、文字水印、模糊细节、风格不协调

语言：以英文为主。若用户明确要求包含中文文字（标题、标签、短文案等），必须在提示词中原封不动嵌入中文，不可翻译、不可替换为拼音。中文文字用引号包裹，例如 "标题文字"。
```

风格映射表：
- 扁平插画 → flat illustration, clean design, modern flat style, vector art
- 水彩 → watercolor painting, soft washes, artistic watercolor, translucent layers
- 油画 → oil painting, rich textures, classical painting, visible brushstrokes
- 像素 → pixel art, 16-bit style, retro game aesthetic, crisp pixels
- 赛博朋克 → cyberpunk, neon lights, futuristic, glowing signs, rain reflections
- 手绘 → hand-drawn illustration, sketchy lines, organic feel, ink and pencil
- 极简 → minimal illustration, clean lines, negative space, simple shapes
- 卡通 → cartoon style, cute, colorful, animated character style, bold outlines

## 示例

**用户输入：** 帮我画一张赛博朋克风格的雨夜城市街景

**生成 Prompt：**
```
Title: Neon Rain
Subtitle: A cyberpunk city street drenched in rain and neon light
Visual goal: A moody, atmospheric urban scene that captures the tension between technology and humanity in a futuristic city
Layout: Wide-angle street view receding into the distance, towering buildings framing the left and right sides, neon signs dominating the upper half, wet pavement reflecting lights in the lower half, a lone figure walking in the middle distance
Main elements: Glowing neon signs in Chinese and Japanese, wet asphalt with vivid light reflections, steam rising from street-level vents, distant flying vehicles, rain streaks catching the light, dark alley entrances
Color & lighting: Cold blue and electric magenta as primary colors, warm orange accent from street lamps, high contrast between neon glow and deep shadows, volumetric light through rain
Style treatment: Digital illustration with painterly rendering, cinematic color grading, soft atmospheric perspective, detailed environment design, professional concept art quality
Avoid: photorealistic photography, cluttered composition, text overlays, cartoon proportions, flat lighting, generic sci-fi tropes, muddy color mixing
```

**推荐参数：**
- model: gpt-image-2-vip
- imageSize: 3840x2160

