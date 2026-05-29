# 模板：产品图/商品图

## 适用场景
用户要求生成产品展示图、电商商品图、包装设计图、产品渲染等。

## 需求收集清单

| 字段 | 类型 | 必填 | 选项/说明 |
|------|------|------|----------|
| product | text | ✅ | 产品名称/描述 |
| category | select | ✅ | 电子产品/化妆品/食品/服装/家居/包装/其他 |
| style | select | ✅ | 白底图/场景图/生活方式/爆炸图/3D渲染 |
| angle | select | ❌ | 正面/斜45度/俯视/多角度展示 |
| background | select | ❌ | 纯白/纯色/自然场景/工作室/渐变/大理石 |
| lighting | select | ❌ | 均匀布光/侧光/顶光/自然光/摄影棚 |
| props | text | ❌ | 搭配的道具/配饰/装饰元素 |

## Prompt 生成器（Meta-Prompt）

```
你将扮演"产品摄影提示词生成器"。
任务：根据用户需求，生成一段可直接交给图像生成模型使用的产品展示提示词。

请从以下维度提炼和构建提示词：

1. 产品描述：名称、材质、颜色、形状、尺寸感知
2. 展示角度：最佳展示面、视角、是否展示多面
3. 背景设计：背景类型、色彩、材质、与产品的关系
4. 光线设计：主光方向、补光、反射光、材质表现
5. 场景元素：道具、配饰、环境元素（如适用）
6. 风格映射：将风格转换为对应英文关键词（见风格映射表）
7. 商业质感：商业摄影品质相关描述

最终输出一段英文图像生成提示词，包含以下部分：

Title: 简洁的产品标题
Subtitle: 一句话概括产品类型和展示方式
Visual goal: 这张图要展现的产品卖点和品质感
Layout: 产品在画面中的位置、道具的摆放关系、画面层次（前景/中景/背景）
Main elements: 产品本体特征、材质质感表现、搭配的道具或环境元素
Color & lighting: 产品色彩、光线方向和质量、背景色调、材质光泽表现
Style treatment: 风格处理和商业摄影品质描述
Avoid: 文字水印、品牌Logo（除非要求）、杂乱背景、变形产品形状、过度修图感、廉价塑料质感、不合理的透视

语言：以英文为主。若用户明确要求包含中文文字（标题、标签、短文案等），必须在提示词中原封不动嵌入中文，不可翻译、不可替换为拼音。中文文字用引号包裹，例如 "标题文字"。
```

风格映射表：
- 白底图 → white background product shot, clean e-commerce photo, pure white backdrop, isolated product
- 场景图 → lifestyle product photography, in-context scene, natural environment, styled setting
- 生活方式 → lifestyle photo, natural usage scene, real life context, authentic atmosphere
- 爆炸图 → exploded view, technical breakdown, floating components, component layout, 3D diagram
- 3D渲染 → 3D product render, studio quality, photorealistic 3D, octane render, ray tracing

## 示例

**用户输入：** 生成一个保温杯的产品展示图

**生成 Prompt：**
```
Title: Thermal Tumbler
Subtitle: A matte black stainless steel thermal tumbler styled in a morning coffee scene
Visual goal: Showcase the product's premium build quality and everyday usability in a relatable lifestyle context
Layout: Product positioned slightly off-center following the rule of thirds, placed on a white marble surface that occupies the lower two-thirds of the frame, ceramic coffee cup positioned to the right rear, open magazine casually placed to the left, clean negative space above the product
Main elements: Matte black cylindrical tumbler with subtle texture, screw-on lid with brushed metal accent, gentle condensation droplets on the surface, white marble with gray veining, warm ceramic coffee cup, lifestyle magazine with visible typography
Color & lighting: Matte black product against bright white marble for strong contrast, warm natural daylight streaming from the right side creating soft directional shadows, subtle rim light on the product edge, warm coffee tones as accent color
Style treatment: Lifestyle product photography, commercial quality, clean composition with breathing room, shallow depth of field keeping the product sharp while softly blurring background elements, natural and authentic styling
Avoid: text watermarks, brand logos, cluttered styling, distorted product proportions, plastic-like oversaturation, harsh shadows, studio backdrop feel, unrealistic props, over-composed flat lay
```

**推荐参数：**
- model: gpt-image-2-vip
- imageSize: 2880x2880

