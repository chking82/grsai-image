# Tech Knowledge / Info-graphic Long Poster

## 适用场景

技术科普 / 行业分析 / 知识图谱 / 长图文摘要 等"信息密度高"的小红书 / 公众号 / 知乎长图。需要把"概念 + 数据 + 板块结构"在一张图里讲清。

适用：
- 行业科普（如"一张图看懂华为 AI 布局"）
- 产品对比 / 技术架构解读
- 财报 / 政策 / 报告 摘要
- 知识图谱 / 思维导图的可视化

**不适用：** 美妆 / 穿搭 / 探店 等生活方式内容（请用 `xiaohongshu.md`）。

## Prompt 结构

```
[主题 + 用途描述] + [顶部留白: 副标题 + 主标题 + 导语] + 
[6 个左右编号板块, 每板块: 编号 + 中英文标题 + 描述 + 3 个高亮数据点] + 
[底部时间线 / 总结区] + [配色 + 风格后缀]
```

## 推荐参数

- model: gpt-image-2-vip（中文渲染好）
- imageSize: **1024x1536 (2:3)** 或 1024x2048 (1:2)
  - gpt-image-2-vip **不支持比例参数**（3:4 / 2:3 / 1:2 都不行），必须用像素值
  - 1024x1536 是 2:3 比例，信息密度友好
  - 1024x2048 是 1:2 比例，模型支持的最长竖图

## 示例 Prompt（华为 AI 布局）

```
A 2:3 vertical long-form Xiaohongshu (Chinese social media) knowledge-sharing 
poster about 华为 AI 产业布局 2026, in Chinese with full Chinese text rendered.

Top: red accent bar, cyan subtitle 'HUAWEI AI · 2026', large white title 
'一张图看懂 华为 AI 布局', gray intro line.

6 numbered module cards stacked vertically, each with: red number 01-06, 
white Chinese title, cyan English subtitle, 2-3 line description, 
3 highlighted data points (big bold numbers in cyan or red).

01 芯片层 · 昇腾系列 (ASCEND CHIP): 4 代演进,训练推理全场景. 
   Data: 950PR 1.56 PFLOPS / 对标 H20 2.87 倍 / 4 代芯片
02 硬件层 · Atlas 系列 (ATLAS HARDWARE): 模块到超节点全覆盖. 
   Data: Atlas 350 上市 / 单卡 2300 tokens/s / 7 大伙伴
03 软件栈 · 6 件套 (SOFTWARE STACK): 底层算子到工具链. 
   Data: CANN 50+ 代码仓 / 800+ 算子 / 兼容 4+ 框架
04 大模型 · 盘古 5.5 (PANGU 5.5): 5 基础+5 行业. 
   Data: 30+ 行业 / 500+ 场景 / 5 行业深度版
05 华为云 · Agentic AI (AGENTIC INFRA): 通智一体化. 
   Data: 4 行业专区 / Agentic Infra / 盘古 5.5
06 超节点 · CloudMatrix 384 (SUPERNODE): 华为首创超节点. 
   Data: MoE +50% 效率 / 2300 tokens/s / 4 PFLOPS 终

Bottom timeline: 2025.6 HDC → 2025.8 昇腾峰会 → 2025.9 HC → 
2026.3 合作伙伴大会 → 2026.5 鲲鹏昇腾大会 → 2026.6 INSPIRE 创想者大会

Color: deep navy #0a0e27 background, Huawei red #C7000B, white text, 
cyan #00D4FF data highlights, subtle circuit pattern, modern tech 
info-graphic for Chinese Xiaohongshu, clean card-based vertical layout, 
bold sans-serif Chinese typography.
```

## 质量后缀（必备）

```
modern tech knowledge share aesthetic, premium info-graphic design for 
Chinese audience, clean card-based vertical long layout, bold sans-serif 
Chinese typography, neon data highlights, professional long-form poster 
for Xiaohongshu.
```

可选增强：
- `subtle circuit board pattern` — 加科技感纹理
- `faint neural network nodes` — 加 AI/科技氛围
- `vertical portrait orientation` — 强调竖版
- `with red Huawei accent stripes` — 加品牌色

## 注意事项

1. **完整中文写进 prompt**：gpt-image-2-vip 中文渲染能力强，**直接写中文**比英译好
2. **比例参数坑**：模型**不支持 3:4 / 2:3 / 1:2 比例参数**，必须用像素值
3. **板块数控制 4-8 个**：多了排版挤，少了信息不够
4. **数据点要带单位**：`1.56 PFLOPS`、`2300 tokens/s`、`30+ 行业` — 别光写数字
5. **底部时间线可选**：如果内容多就把时间线融进每个板块里，别硬加
6. **不要超过模型最长比例 1:2 (1024x2048)**：更长的图模型会强行压缩内容

## 与其他模板的差异

| 模板 | 风格 | 用途 |
|------|------|------|
| `xiaohongshu.md` | 生活感 / 种草 / 软性 | 美妆、穿搭、探店 |
| `tech-knowledge-poster.md` | 科技 / 信息图 / 硬核 | 行业科普、架构解读、报告摘要 |
| `corporate.md` | 商务 / 专业 / 几何 | 企业宣传、商业计划 |
| `event.md` | 活动 / 发布会 / 倒计时 | 峰会、发布会预告 |
