# 模板：论文/技术插图

## 适用场景
用户要求生成论文系统架构图、流程图、数据流图、方法论图、工程控制面图、技术示意图等学术/工程插图。

## 需求收集清单

| 字段 | 类型 | 必填 | 选项/说明 |
|------|------|------|----------|
| theme | text | ✅ | 核心主题/系统名称/方法论名称 |
| diagram_type | select | ✅ | 架构图/流程图/数据流图/方法论图/控制面图/状态机/DAG |
| components | text | ✅ | 关键模块/组件/节点列表 |
| flows | text | ❌ | 数据流/控制流/反馈流/状态流的连接关系 |
| structure | select | ❌ | 中央闭环/分层/左到右/反馈控制/双平面/中心辐射 |
| audience | select | ❌ | 学术论文/技术博客/内部分享/产品文档 |

## Prompt 生成器（Meta-Prompt）

```
你将扮演"论文插图提示词生成器"。
任务：阅读当前会话内容，提炼其中最适合视觉化表达的核心信息，
并输出一段可直接交给图像生成模型使用的学术/技术插图提示词。

请重点提炼：
1. 核心主题、系统名称、方法论名称或技术问题
2. 关键模块、数据对象、状态对象、控制对象及其边界
3. 目标、约束、设计、分析、实验之间的关系
4. 数据流、控制流、反馈流、状态流的方向
5. 最适合的图形结构（见下方结构映射表）
6. 工程视角的关键概念（shape 变化、代价模型、验证证据等）

图形结构映射：
- 中央闭环图 → central hub layout, circular flow, methodology loop
- 分层架构图 → layered architecture, top-to-bottom layers, clear boundaries
- 左到右数据流 → left-to-right pipeline, sequential flow, data transformation stages
- 反馈控制图 → observe-verify-correct loop, circular feedback, closed control system
- 双平面图 → dual-plane layout, control plane vs execution plane, parallel tracks
- 中心辐射图 → hub-and-spoke, central node with radiating connections

最终输出一段英文图像生成提示词，包含以下部分：

Title: 简洁的图名
Subtitle: 一句话概括图像主旨
Visual goal: 这张图要表达的核心思想
Layout: 画面布局（中心/左/右/顶/底各放什么）
Main components: 主要模块，短标签，每个不超过 6-10 个英文单词
Flows: 箭头连接关系，区分 data flow / control flow / feedback flow
Annotations: 关键短标签、图例、编号、层级标记的位置
Avoid: 避免密集文字、复杂装饰、卡通风格、炫光渐变、照片质感、无意义图标、过度配色、模糊箭头、泛泛概念堆叠

语言：以英文为主。若用户明确要求包含中文文字（标题、标签、短文案等），必须在提示词中原封不动嵌入中文，不可翻译、不可替换为拼音。中文文字用引号包裹，例如 "标题文字"。

示例：
- 论文架构图中的中文标签 → 原样保留，如 "数据层" "控制层"
- 海报中的中文标题 → 原样保留，如 "2026 技术峰会"
- 产品图中的中文品牌名 → 原样保留，如 "小米" "华为"
```

## 示例

**用户输入：** 帮我画一个 agent workflow 的方法论图，包含 observe、verify、correct、record 四个阶段的闭环

**生成 Prompt：**
```
Title: Agent Workflow Methodology
Subtitle: Observe-Verify-Correct-Record closed-loop cycle
Visual goal: A circular methodology diagram showing how an AI agent continuously cycles through observation, verification, correction, and recording to improve its output quality
Layout: Central circular flow diagram with four quadrants around a center hub labeled "Agent Loop", arrows flowing clockwise, clean white background
Main components: "Observe" (top, icon: eye), "Verify" (right, icon: checkmark shield), "Correct" (bottom, icon: wrench), "Record" (left, icon: clipboard), "Agent Loop" (center)
Flows: Clockwise data flow arrows connecting Observe → Verify → Correct → Record → Observe, feedback loop arrow from Record to center hub, control flow arrows from center to each node
Annotations: Short labels at each node, numbered steps (1-4) at arrow midpoints, small legend in bottom-right corner
Avoid: dense text blocks, complex decorations, cartoon style, glow gradients, photo textures, meaningless icons, over-coloring, blurry arrows, vague concept stacking
```

**推荐参数：**
- model: gpt-image-2-vip
- imageSize: 3840x2160

