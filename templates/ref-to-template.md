# 模板：参考图→提示词模板

## 适用场景
用户提供一张参考图片，要求提取其风格特征，生成一个**可复用的提示词模板**（含占位符），后续可以反复套用该模板生成同风格不同内容的图片。

## 标准标签体系

基于所有 7 个现有模板的共同结构，提取以下标准化占位符：

### 核心标签（每个模板必须包含）

| 标签 | 对应模板字段 | 说明 | 示例值 |
|------|-------------|------|--------|
| `[主体]` | Main elements | 画面核心内容 | ocean waves / city skyline / forest |
| `[构图]` | Layout | 画面布局方式 | rule of thirds / centered / symmetrical |
| `[色调]` | Color & lighting | 整体色彩方案 | warm orange and golden / cool blue |
| `[光线]` | Color & lighting | 光线设计 | soft studio lighting / sunset backlight |
| `[氛围]` | Visual goal | 情绪/氛围 | tranquil and warm / mysterious |

### 场景标签（根据参考图类型选择性包含）

| 标签 | 适用场景 | 说明 | 示例值 |
|------|---------|------|--------|
| `[背景]` | 所有 | 背景处理 | clean white background / gradient sky |
| `[道具]` | product, illustration | 搭配元素 | coffee cup / magazine / plants |
| `[材质]` | product, ui-element | 表面质感 | matte finish / glossy surface |
| `[表情]` | portrait, character | 面部表情 | friendly smile / confident gaze |
| `[服装]` | portrait, character | 穿着打扮 | casual hoodie / formal suit |
| `[文字区]` | poster, academic | 文字留白位置 | clean text space at top third |
| `[容器]` | ui-element | 图标外框形状 | rounded square container / circle |

### 固定标签（不可替换，从参考图提取后锁定）

| 标签 | 对应模板字段 | 说明 |
|------|-------------|------|
| `{风格}` | Style treatment | 艺术风格关键词 |
| `{品质}` | Style treatment | 品质后缀 |
| `{细节}` | Style treatment | 标志性细节处理 |
| `{禁止}` | Avoid | Avoid 清单 |

## 提示词模板内容框架

**每个提取的模板必须包含以下 8 个字段，与现有模板结构完全一致：**

| 序号 | 字段 | 内容来源 | 占位符 |
|------|------|---------|--------|
| 1 | **Title** | 从参考图主题提炼 | `[标题]` |
| 2 | **Subtitle** | 一句话概括画面主旨 | `[副标题]` |
| 3 | **Visual goal** | 核心感受/故事 | `[视觉目标]` |
| 4 | **Layout** | 画面布局、构图、层次 | `[构图]` + 固定描述 |
| 5 | **Main elements** | 主要视觉元素 | `[主体]` + 固定描述 |
| 6 | **Color & lighting** | 色彩方案 + 光线设计 | `[色调]` + `[光线]` + 固定描述 |
| 7 | **Style treatment** | 风格处理 + 技术细节 | `{风格}` + `{细节}` + `{品质}` |
| 8 | **Avoid** | 需要避免的元素 | `{禁止}` |

## Prompt 模板生成器（Meta-Prompt）

```
你将扮演"提示词模板提取器"。
任务：分析用户提供的参考图片，提取其风格特征，生成一个可复用的英文提示词模板。

分析步骤：
1. 使用 image 工具分析参考图片
2. 按照标准内容框架（8个字段）提取模板
3. 将分析结果分为两类：
   - **可替换元素** → 使用方括号 [标签] 标注
   - **固定风格** → 直接写入模板，不标注

### 输出格式

**模板名称：** 从参考图特征中提炼的简短名称

**适用场景：** 该模板适合生成什么类型的图片

**提示词模板（8字段结构）：**

Title: [标题] — 简洁的标题，概括画面核心
Subtitle: [副标题] — 一句话概括画面主旨
Visual goal: [视觉目标] — 这张图要传达的核心感受或故事
Layout: [构图] composition, [固定布局描述]
Main elements: [主体], [固定元素描述]
Color & lighting: [色调] color palette, [光线], [固定光线/背景描述]
Style treatment: {风格}, {细节}, {品质}
Avoid: {禁止}

**标签清单：**
| 标签 | 类型 | 说明 | 示例值 |
|------|------|------|--------|
| [标题] | 核心 | ... | ... |
| [副标题] | 核心 | ... | ... |
| ... | ... | ... | ... |

**固定风格（不替换）：**
| 标签 | 从参考图提取的值 |
|------|-----------------|
| {风格} | ... |
| {品质} | ... |
| {细节} | ... |
| {禁止} | ... |

**使用示例：**
- 示例1：替换所有 [标签]
- 示例2：替换所有 [标签]

**推荐参数：**
- model: gpt-image-2-vip
- imageSize: 根据用途推荐

语言：模板正文用英文（占位符用中文方括号），说明文字用中文。
```

## 工作流

```
用户上传参考图 + "帮我提取这个风格的模板"
  │
  ▼
1. 调用 image 工具分析参考图
  │
  ▼
2. 按 8 字段框架提取：
   Title / Subtitle / Visual goal / Layout
   Main elements / Color & lighting / Style treatment / Avoid
  │
  ▼
3. 区分可替换 [标签] 和固定 {标签}
  │
  ▼
4. 生成完整模板 → 用户确认
  │
  ▼
5. 保存模板，后续替换占位符 → 审核 → 生成
```

## 示例

**用户输入：** [上传一张水彩风格的山景插画] "帮我提取这个风格的提示词模板"

**image 工具分析：**
- style: 水彩插画
- composition: 三分法
- color: 暖色调，橙黄→粉紫渐变
- lighting: 日落逆光
- mood: 宁静温暖
- subject: 层叠山峦
- background: 渐变天空
- details: 水彩笔触、边缘晕染

**生成的模板：**

### 模板名称：水彩风景插画

### 适用场景
自然风光、城市景观、建筑等风景类水彩手绘风格插画

### 提示词模板（8字段结构）

Title: [标题] — A short title capturing the scene
Subtitle: [副标题] — One-line summary of the image
Visual goal: [视觉目标] — The core feeling or story this image should convey
Layout: [构图] composition, landscape elements in the lower two-thirds, sky occupying the upper third, clean visual flow from foreground to background
Main elements: [主体], layered forms receding into the distance, soft edges blending into the background
Color & lighting: [色调] color palette, [光线], gradient sky transitioning from warm tones to cool tones, atmospheric perspective softening distant elements
Style treatment: watercolor illustration style, visible watercolor brushstrokes, natural color bleeding at edges, soft translucent layers, hand-painted aesthetic, high quality
Avoid: photorealistic rendering, sharp digital edges, flat solid colors, cluttered composition, cartoon proportions

### 标签清单
| 标签 | 类型 | 说明 | 示例值 |
|------|------|------|--------|
| [标题] | 核心 | 图片标题 | Ocean Sunset / City Twilight / Autumn Valley |
| [副标题] | 核心 | 一句话概括 | A watercolor ocean scene at sunset / A watercolor cityscape at dusk |
| [视觉目标] | 核心 | 核心感受 | tranquility and warmth / urban serenity |
| [构图] | 核心 | 构图方式 | rule of thirds / centered / symmetrical |
| [主体] | 核心 | 画面主体景物 | ocean waves with whitecaps / city skyline / autumn forest |
| [色调] | 核心 | 天空/环境色调 | warm orange and golden / cool blue and silver |
| [光线] | 核心 | 光线设计 | sunset backlighting / soft morning light |

### 固定风格（不替换）
| 标签 | 从参考图提取的值 |
|------|-----------------|
| {风格} | watercolor illustration style, hand-painted aesthetic |
| {品质} | high quality |
| {细节} | visible watercolor brushstrokes, natural color bleeding at edges, soft translucent layers, atmospheric perspective |
| {禁止} | photorealistic rendering, sharp digital edges, flat solid colors, cluttered composition, cartoon proportions |

### 使用示例
- 海景：`[标题]=Ocean Sunset`, `[副标题]=A watercolor ocean scene at sunset`, `[视觉目标]=tranquility and warmth`, `[构图]=rule of thirds`, `[主体]=ocean waves with whitecaps`, `[色调]=warm orange and golden`, `[光线]=sunset backlighting`
- 城市：`[标题]=City Twilight`, `[副标题]=A watercolor cityscape at dusk`, `[视觉目标]=urban serenity`, `[构图]=centered`, `[主体]=city skyline with tall buildings`, `[色调]=cool blue and silver`, `[光线]=soft morning light`

### 推荐参数
- model: gpt-image-2-vip
- imageSize: 3840x2160
