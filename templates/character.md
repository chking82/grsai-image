# 模板：角色/吉祥物/IP 形象

## 适用场景
用户要求生成角色设计、吉祥物、IP 形象、卡通人物、拟人化形象等。

## 需求收集清单

| 字段 | 类型 | 必填 | 选项/说明 |
|------|------|------|----------|
| character | text | ✅ | 角色描述（物种/特征/身份）|
| style | select | ✅ | Q版卡通/3D渲染/扁平插画/手绘/动漫/拟真 |
| personality | select | ❌ | 可爱/酷/搞笑/专业/活泼/温暖/凶猛 |
| pose | text | ❌ | 姿势/动作描述 |
| clothing | text | ❌ | 服装/配饰 |
| background | select | ❌ | 纯色/简单场景/透明底 |
| consistency | text | ❌ | 是否需要多角度/三视图 |

## Prompt 生成器（Meta-Prompt）

```
你将扮演"角色设计提示词生成器"。
任务：根据用户需求，生成一段可直接交给图像生成模型使用的角色设计提示词。

请从以下维度提炼和构建提示词：

1. 角色本体：物种/形态/身体比例/标志性特征
2. 表情性格：面部表情、眼神、性格传达
3. 姿势动作：站姿/坐姿/动作/手势
4. 服装配饰：穿着、装备、装饰元素
5. 风格映射：将风格转换为对应英文关键词（见风格映射表）
6. 背景处理：背景简洁不抢主体
7. 一致性：如需要多角度，添加 character sheet 描述

最终输出一段英文图像生成提示词，包含以下部分：

Title: 简洁的角色标题
Subtitle: 一句话概括角色身份和风格
Visual goal: 这个角色要传达的性格和身份感
Layout: 角色在画面中的位置、裁剪范围、背景处理
Main elements: 角色本体特征、表情、姿势、服装、配饰、标志性元素
Color & lighting: 角色色彩方案、光线方向和质量、材质表现
Style treatment: 风格处理和技术细节
Avoid: 恐怖谷效果、扭曲的身体比例（除非故意）、过于复杂的背景、文字元素、与其他角色混淆、写实皮肤纹理（非拟真风格时）

语言：以英文为主。若用户明确要求包含中文文字（标题、标签、短文案等），必须在提示词中原封不动嵌入中文，不可翻译、不可替换为拼音。中文文字用引号包裹，例如 "标题文字"。
```

风格映射表：
- Q版卡通 → chibi character, cute cartoon, kawaii style, oversized head small body, simple features
- 3D渲染 → 3D character render, Pixar style, soft studio lighting, dimensional, subsurface scattering
- 扁平插画 → flat character design, vector illustration, clean shapes, solid colors, no shading
- 手绘 → hand-drawn character, sketchy illustration, ink and watercolor, organic line work
- 动漫 → anime character, Japanese animation style, cel shading, large expressive eyes
- 拟真 → realistic character, detailed portrait, lifelike textures, professional photography

## 示例

**用户输入：** 帮我设计一个赛博朋克风格的小龙虾吉祥物

**生成 Prompt：**
```
Title: Cyber Crayfish
Subtitle: A cyberpunk-styled anthropomorphic crayfish mascot character
Visual goal: A cool, tech-forward mascot that blends the organic form of a crayfish with futuristic cybernetic armor, suitable as a brand IP character
Layout: Full-body character centered in frame, standing upright in a confident pose, occupying approximately 80% of the frame height, clean dark solid background that does not compete with the character, slight ground plane shadow anchoring the character
Main elements: Anthropomorphic crayfish standing on two legs, armored shell plates with glowing circuit line accents, large expressive visor eyes with orange glow, one arm resting confidently on hip, the other arm slightly raised, prominent crayfish claws with cybernetic enhancements, segmented tail curving behind
Color & lighting: Dark metallic gray as primary body color, electric blue and cyan as circuit accent colors, warm orange glow from visor eyes, rim lighting from behind creating a subtle silhouette edge, clean studio-style three-point lighting with soft fill
Style treatment: 3D character render in Pixar-style quality, dimensional with subsurface scattering on the shell, soft studio lighting, clean and polished character design suitable for brand use, professional mascot illustration standard
Avoid: uncanny valley realism, distorted body proportions, busy background scenes, text overlays, additional characters, photorealistic skin texture, horror aesthetics, overly complex mechanical details that obscure the character silhouette
```

**推荐参数：**
- model: gpt-image-2-vip
- imageSize: 2880x2880

