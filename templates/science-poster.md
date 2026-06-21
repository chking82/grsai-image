# 模板：Apple 风极简科普海报

## 适用场景
用户要求生成科普海报、物种介绍图、知识卡片、Apple 发布会风格的极简信息海报。主体放大、纯白背景、四栏极简信息。

## 需求收集清单

| 字段 | 类型 | 必填 | 选项/说明 |
|------|------|------|----------|
| subject | text | ✅ | 主体（动物/昆虫/植物/产品/概念） |
| cn_name | text | ✅ | 中文大标题（物种名/主题名） |
| subtitle | text | ❌ | 一句话定位 |
| en_name | text | ❌ | 英文名 |
| distribution | text | ❌ | 分布/来源信息 |
| features | text | ✅ | 4 个重点特征（标题+短说明） |
| summary | text | ❌ | 底部一句科普总结 |

## Prompt 生成器（Meta-Prompt）

```
你将扮演"Apple 风科普海报生成器"。
任务：生成 9:16 竖版极简科普海报，Apple keynote 产品发布风格。

按 6-Block 协议构建，核心规则：
1. 主体任务：主体动物/物体极度放大，占画面 50%-70%，成为最强视觉中心
2. 构图布局：
   - 顶部左侧标题区：中文大标题 + 灰色副标题 + 细短横线 + 英文名 + 分布信息
   - 中部/下中部：超高清立体主体，纯白背景，少量必要承托物（树枝/岩石/雪地）
   - 底部信息区：四列极简 icon + 标题 + 1-3行短说明，细竖线分隔，无卡片框
   - 最底部居中：一句灰色小字总结
3. 风格材质：纯白/极浅灰渐变背景，柔和棚拍光影，真实质感（毛发/鳞片/甲壳），主体有真实阴影
4. 文字标签：所有中文写死，标题巨大、副标题克制、正文小而清晰，留足呼吸感
5. 比例输出：9:16 竖版，2K 高清
6. 约束负面：不要淡黄旧纸背景、不要信息图网格、不要圆角卡片、不要厚边框、不要大面积色块、不要主体太小、不要文字压主体

色彩规范：背景纯白/极浅灰；主标题黑/深石墨；副标题正文中性灰；
底部四栏标题可用低饱和强调色（暖棕/冷蓝/松石绿/紫/橙），颜色只用于 icon 和小标题，不大面积铺色。
```

## ⚠️ 避坑指南

- **主体放大**：主体必须被极度放大，占画面 50%-70%，确保成为最强视觉中心，主体太小整张废。
- **信息克制**：遵循"少而准"，底部信息区只用四列极简布局，避免信息拥挤。
- **风格统一**：严格 Apple 式极简——纯白背景、干净排版、柔和棚拍光影，禁止传统信息图的卡片/圆角框/淡黄纸纹。
- **质感可信**：主体纹理必须真实（毛发/鳞片/甲壳/皮肤褶皱/羽毛/斑纹），避免变形、错误解剖、塑料感、卡通感。
- **文字呼吸感**：所有文字留足留白，标题巨大副标题克制，禁儿童科普风/低端展板风。

## 示例

**用户输入：** 做一张耳廓狐的科普海报

**生成 Prompt：**
```
A 9:16 vertical premium science poster, Apple keynote launch style, pure white background with subtle soft gradient, generous negative space, high-end editorial minimalism.

Top-left title area (render text exactly):
Large Chinese title: "耳廓狐"
Gray subtitle: "沙漠中最萌的听风者"
Thin short divider line
English name: "Fennec Fox"
Distribution: "主要分布：北非撒哈拉沙漠"

Center hero subject: an ultra-high-definition, photorealistic fennec fox with strong dimensionality, occupying 55%-65% of the visual area, alert showcase pose, oversized ears in sharp detail, realistic fur texture, soft studio lighting, real cast shadow grounding it like premium product photography, white background, minimal sandy ground hint only.

Bottom info area: four minimal columns, each with a thin-line icon + colored small title + 1-3 lines of short text, separated by thin light-gray vertical lines, no card frames, no rounded boxes.
Column titles (render exactly): "巨耳散热" / "夜行猎手" / "沙漠适应" / "群居生活"
Bottom centered gray summary line (render exactly): "在最干旱的土地上，它把生存演化成了优雅。"

Typography: large bold graphite Chinese title, neutral-gray subtitle with wider letter spacing, small gray English name.
Colors: pure white background, graphite title, neutral-gray body, low-saturation accent colors (warm brown / cool blue / turquoise / purple) only on icons and column titles.

Constraints: 2K high clarity, sharp realistic subject, no pale-yellow old-paper background, no infographic grid, no rounded cards, no thick borders, no large color blocks, subject not small, text not covering subject, no cartoon style, no low-end display-board look.
```

**推荐参数：**
- model: gpt-image-2-vip
- imageSize: 1152x2048（9:16）/ 1440x2560（更高）
