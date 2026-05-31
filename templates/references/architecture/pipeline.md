# 方法管线图 — Pipeline Diagram

## 适用场景
机器学习管线图、研究流程图、算法处理管线、数据处理流水线、系统处理步骤。

## Prompt 结构
```
A clean and professional {pipeline type} diagram showing {number} sequential stages: {stage list}. The stages flow from left to right (or top to bottom) with clear directional arrows connecting each step. Each stage is represented as a {shape type} with a distinct color and an icon/symbol representing its function. The background is a light {color} with subtle grid pattern. Labels are clearly legible in a modern sans-serif font. The overall style is minimalist, flat design with subtle shadows for depth, suitable for academic papers and technical presentations. High quality, vector-like rendering, white or light background, no watermark, no text artifacts.
```

## 示例

### 示例 1
**用户输入：** 机器学习管线：数据收集 → 数据预处理 → 特征工程 → 模型训练 → 模型评估 → 部署
**Prompt：**
```
A clean and professional machine learning pipeline diagram showing 6 sequential stages: data collection, data preprocessing, feature engineering, model training, model evaluation, and deployment. The stages flow from left to right connected by smooth curved arrows. Each stage is represented as a rounded rectangle with a distinct gradient color — deep blue for data collection, teal for preprocessing, green for feature engineering, orange for training, red for evaluation, and purple for deployment. Each box contains a simple flat icon: a database cylinder, a filter funnel, a gear, a brain network, a bar chart, and a rocket respectively. The background is a very light gray (#F5F5F5) with a subtle dot grid pattern. Labels use a modern sans-serif font. The overall style is minimalist flat design with subtle drop shadows for depth, suitable for academic papers and technical presentations. High quality, vector-like rendering, clean composition, no watermark, no text artifacts.
```

### 示例 2
**用户输入：** 研究流程：问题定义 → 文献综述 → 假设提出 → 实验设计 → 数据收集 → 分析 → 结论
**Prompt：**
```
A clean and professional research methodology flowchart showing 7 sequential stages flowing in a circular loop layout: problem definition, literature review, hypothesis formulation, experimental design, data collection, data analysis, and conclusion. The circular flow suggests the iterative nature of research, with a feedback arrow from conclusion back to hypothesis formulation. Each stage is a rounded circle node with a distinct flat color — navy for problem definition, indigo for literature review, blue for hypothesis, cyan for design, green for collection, yellow for analysis, and coral for conclusion. Simple line icons sit inside each circle: a question mark, stacked books, a lightbulb, a clipboard, a magnifying glass, a chart with trendline, and a checkmark shield respectively. Arrows between nodes are thick and directional with arrowhead markers. The background is white with a faint geometric pattern of connected dots suggesting knowledge networks. Modern flat design style with subtle shadows. Clear, readable labels below each node. Vector-like quality, academic presentation style, no watermark, no text artifacts.
```

### 示例 3
**用户输入：** NLP 处理管线：文本输入 → 分词 → 词性标注 → 命名实体识别 → 情感分析 → 结果输出
**Prompt：**
```
A clean and professional NLP processing pipeline diagram showing 6 sequential stages flowing from left to right: text input, tokenization, part-of-speech tagging, named entity recognition, sentiment analysis, and result output. Each stage is a hexagonal tile shape with a gradient fill — slate gray for input, blue for tokenization, teal for POS tagging, green for NER, amber for sentiment, and emerald for output. Between each tile, a chevron-style arrow connector emphasizes the directional flow. A horizontal timeline bar runs beneath the tiles, with the input sample text "I love this product!" shown on the left and the structured output "{text: 'positive', confidence: 0.97}" on the right. Each tile contains a minimal icon: document, scissors splitting words, colored tag labels, highlighted person/location/org markers, a smiley-to-frown scale, and a JSON bracket respectively. The background is white with a faint code-pattern texture (subtle monospace characters at 3% opacity). Modern technical illustration style, clean lines, vector quality, academic paper suitable, no watermark, no text artifacts.
```

## 质量后缀
```
clean technical diagram, flat design with subtle shadows, vector-like rendering, minimalist style, academic paper quality, modern infographic design, high resolution, clear visual hierarchy
```

## 注意事项
- 阶段之间的顺序必须清晰，箭头方向一致（通常左到右或上到下）
- 每个阶段用不同颜色区分，但整体配色要协调统一
- 图标应简洁、语义明确，避免过度装饰
- 层次感通过阴影和大小差异体现，不要过度使用 3D 效果
- 背景保持干净（白色或浅灰），避免分散注意力
- 适合学术论文、技术报告、PPT 演示
- 输出分辨率建议 2048x1152（16:9）或 2048x2048
