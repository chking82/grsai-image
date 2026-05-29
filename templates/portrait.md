# 模板：头像/肖像

## 适用场景
用户要求生成头像、肖像照、个人形象图、社交头像等。

## 需求收集清单

| 字段 | 类型 | 必填 | 选项/说明 |
|------|------|------|----------|
| subject | text | ✅ | 人物/角色描述（性别/年龄/特征）|
| style | select | ✅ | 写实照片/卡通/Q版/动漫/油画/素描/扁平头像 |
| expression | select | ❌ | 微笑/严肃/酷/可爱/自信/搞怪 |
| background | select | ❌ | 纯色/渐变/场景/虚化/几何图案/透明底 |
| angle | select | ❌ | 正面/四分之三侧面/侧面/仰视/俯视 |
| clothing | text | ❌ | 服装描述 |
| lighting | select | ❌ | 自然光/摄影棚/逆光/侧光/柔和 |

## Prompt 生成器（Meta-Prompt）

```
你将扮演"头像/肖像提示词生成器"。
任务：根据用户需求，生成一段可直接交给图像生成模型使用的肖像提示词。

请从以下维度提炼和构建提示词：

1. 人物特征：性别、年龄、面部特征、发型、肤色
2. 表情神态：面部表情、眼神、情绪传达
3. 服装造型：上衣、配饰、风格定位
4. 视角构图：正面/侧面/角度、画面裁剪范围
5. 背景处理：背景类型、色彩、与主体的关系
6. 光线设计：光源方向、光质、氛围光效
7. 风格映射：将风格转换为对应英文关键词（见风格映射表）

最终输出一段英文图像生成提示词，包含以下部分：

Title: 简洁的头像标题
Subtitle: 一句话概括人物特征和风格
Visual goal: 这个头像要传达的性格或身份感
Layout: 人物在画面中的位置、裁剪范围（胸部以上/半身等）、背景层次
Main elements: 面部特征、发型、表情、服装、配饰
Color & lighting: 肤色表现、光线方向和质量、背景色彩
Style treatment: 风格处理和技术细节
Avoid: 全身照（除非要求）、复杂背景喧宾夺主、变形五官、恐怖谷效应、过多文字元素、过度磨皮

语言：以英文为主。若用户明确要求包含中文文字（标题、标签、短文案等），必须在提示词中原封不动嵌入中文，不可翻译、不可替换为拼音。中文文字用引号包裹，例如 "标题文字"。
```

风格映射表：
- 写实照片 → photorealistic portrait, professional photography, DSLR quality, natural skin texture
- 卡通 → cartoon avatar, colorful cartoon style, clean character design, bold outlines
- Q版 → chibi style, cute small body big head, kawaii character, simplified proportions
- 动漫 → anime style, Japanese animation, cel shading, vibrant colors, expressive eyes
- 油画 → oil painting portrait, classical portrait, rich brushstrokes, Rembrandt lighting
- 素描 → pencil sketch portrait, detailed graphite drawing, crosshading, white paper background
- 扁平头像 → flat design avatar, minimalist profile picture, clean vector style, solid colors

## 示例

**用户输入：** 帮我生成一个戴眼镜的程序员头像

**生成 Prompt：**
```
Title: The Developer
Subtitle: A friendly young programmer avatar with glasses
Visual goal: A clean, approachable profile image that conveys intelligence and friendliness, suitable for professional or social use
Layout: Centered front-facing portrait cropped at shoulders, clean solid background occupying all space behind the subject, the face as the sole focal point, balanced and symmetrical composition
Main elements: Round wire-frame glasses, warm friendly smile, short dark hair, casual gray hoodie, clean skin with natural texture, expressive eyes looking directly at viewer
Color & lighting: Warm skin tones with subtle rosy cheeks, soft studio lighting from front with gentle fill light, clean light blue solid background, no harsh shadows
Style treatment: Flat design avatar style, minimalist profile picture, clean vector shapes with subtle gradients, geometric simplicity, modern UI-ready aesthetic, professional design quality
Avoid: full body shot, busy background, distorted facial proportions, uncanny valley effect, photo-realistic skin pores, text overlays, excessive detail, dramatic shadows
```

**推荐参数：**
- model: gpt-image-2-vip
- imageSize: 2880x2880

