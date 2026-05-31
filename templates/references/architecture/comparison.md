# 对比图 — Comparison Chart

## 适用场景
性能对比图、before/after 对比、不同方案对比、竞品分析可视化、算法效果对比。

## Prompt 结构
```
A clean comparison visualization showing {what is being compared}. The layout is {layout type: side-by-side / stacked / grid} with {number} comparison panels. Each panel shows {content description}. The left/top panel represents {condition A} with a {color} accent, and the right/bottom panel represents {condition B} with a {color} accent. A clear dividing line or visual separator runs between panels. Metrics and data points are displayed using {chart type: bars/lines/radars/gauges}. The background is {background color}. Modern infographic style, clean typography, balanced composition, suitable for presentations and reports. High quality, vector-like rendering, no watermark, no text artifacts.
```

## 示例

### 示例 1
**用户输入：** 模型性能对比：传统 CNN vs Transformer 在图像分类任务上的准确率、速度、参数量对比
**Prompt：**
```
A clean comparison visualization showing a side-by-side performance comparison between a traditional CNN architecture and a Transformer architecture for image classification tasks. The layout features two tall vertical panels separated by a thin vertical divider line. The left panel has a blue accent header labeled "Traditional CNN" and the right panel has a purple accent header labeled "Transformer". Each panel contains three horizontal bar charts showing: Top-1 Accuracy (CNN: 76% vs Transformer: 88%), Inference Speed (CNN: 45ms vs Transformer: 32ms), and Parameter Count (CNN: 25M vs Transformer: 86M). The CNN bars are filled in blue gradient and Transformer bars in purple gradient. Below the bars, a small radar/spider chart compares 5 dimensions: accuracy, speed, memory, training cost, and transfer learning capability. The CNN radar is a blue outlined polygon and the Transformer is a purple outlined polygon, clearly showing the Transformer's advantage in accuracy and transfer learning but disadvantage in memory and training cost. A small "vs" badge sits at the center of the divider. The background is white with subtle light gray grid lines. Modern infographic style with clean sans-serif labels, balanced composition, suitable for academic papers and technical presentations. Vector quality, no watermark, no text artifacts.
```

### 示例 2
**用户输入：** 系统重构前后对比：响应时间降低 60%，吞吐量提升 3 倍，错误率降低 90%
**Prompt：**
```
A clean before-and-after comparison visualization showing system performance improvement after a major refactoring. The layout is a horizontal split with two equal halves. The left half labeled "BEFORE" has a warm orange-red accent color with slightly muted tones. The right half labeled "AFTER" has a vibrant green accent color with bright, optimistic tones. A bold zigzag lightning bolt divider separates the two halves with a large "60% faster" badge at the center. Each half displays three large metric cards stacked vertically: Response Time showing a gauge (BEFORE: 500ms in red zone, AFTER: 200ms in green zone), Throughput showing a bar chart (BEFORE: 1K req/s, AFTER: 3K req/s), and Error Rate showing a downward trend line (BEFORE: 5% in red, AFTER: 0.5% in green). Each metric card has a large percentage change badge: "-60%", "3x", "-90%" in green. The BEFORE side uses slightly faded, less saturated colors; the AFTER side uses bright, vivid colors to emphasize improvement. Background is white with a subtle upward-trending arrow watermark at 5% opacity. Modern dashboard infographic style, bold numbers, clean layout, suitable for engineering presentations and stakeholder reports. Vector quality, no watermark, no text artifacts.
```

### 示例 3
**用户输入：** 三种云服务商对比：AWS vs Azure vs GCP 在计算、存储、网络、价格维度的雷达图对比
**Prompt：**
```
A clean multi-axis comparison visualization showing a radar/spider chart comparing three cloud service providers — AWS, Azure, and GCP — across six dimensions: compute power, storage options, networking capabilities, pricing competitiveness, ecosystem maturity, and ease of use. The radar chart sits at the center of the composition with six axes radiating outward. AWS is represented by an orange filled polygon, Azure by a blue filled polygon, and GCP by a red-yellow filled polygon. Each polygon has a semi-transparent fill and a solid outline in its brand color. Small colored circles mark each vertex point. A legend sits in the bottom-right corner with provider logos (simplified flat icons) and names. Below the radar chart, six small mini bar charts provide detailed numerical scores for each dimension on a 1-10 scale. The overall layout is clean and balanced with the large radar chart taking the upper two-thirds and the detail bars filling the lower third. The background is white with a faint hexagonal grid pattern. Modern business intelligence style, clean typography, brand-accurate colors (AWS orange #FF9900, Azure blue #0078D4, GCP multi-color), suitable for technology evaluation reports and procurement presentations. Vector quality, no watermark, no text artifacts.
```

## 质量后缀
```
clean comparison chart, modern infographic design, flat design with clear contrast, balanced composition, vector-like rendering, data-driven visualization, high resolution, professional presentation quality
```

## 注意事项
- 左右/上下分屏布局要明确，分割线清晰可见
- 两个对比对象使用不同的配色方案（如冷色 vs 暖色）
- 数据对比要突出差异，使用颜色深浅或饱和度传达优劣
- 统一风格：两边的图表类型、字号、间距要一致
- 可以使用雷达图、柱状图、仪表盘等多种可视化形式
- 适合技术汇报、竞品分析、效果展示
- 输出分辨率建议 2048x1152（16:9）
