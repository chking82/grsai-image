# 数据流图 — Data Flow Diagram

## 适用场景
ETL 流程图、数据管线、数据处理管道、数据集成流程、数据搬运示意。

## Prompt 结构
```
A professional data flow diagram illustrating {data process description}. The diagram shows {number} interconnected components: {component list}. Data flows are represented by directional arrows with labels indicating the data type or transformation. Source systems are shown on the left, processing layers in the middle, and destination systems on the right. Each component type uses a consistent shape: {shape convention}. The color scheme uses {color description}. The background is light and clean. Flat design style with subtle depth effects, suitable for technical documentation and architecture presentations. High quality, vector-like rendering, no watermark, no text artifacts.
```

## 示例

### 示例 1
**用户输入：** ETL 数据管道：MySQL 数据库 → Kafka 消息队列 → Spark 流处理 → ClickHouse 数据仓库 → BI 报表
**Prompt：**
```
A professional data flow diagram illustrating a real-time ETL data pipeline. The diagram shows 5 interconnected components flowing from left to right: a MySQL database server, a Kafka message broker cluster, an Apache Spark streaming engine, a ClickHouse data warehouse, and a BI dashboard display. Data flows are represented by thick directional arrows with labeled bandwidth: "CDC binlog events" → "real-time event streams" → "transformed batches" → "analytical queries". The MySQL server is shown as a blue cylinder with database icon, Kafka as an orange cluster of interconnected message nodes, Spark as a green lightning bolt processor icon, ClickHouse as a purple columnar storage tower, and the BI dashboard as a teal monitor displaying colorful charts. Each component sits on a subtle platform rectangle. The background is white with a faint grid overlay. Clean flat design with subtle drop shadows for depth. Component labels in a modern sans-serif font below each icon. Arrows are gradient-filled to indicate flow direction. Technical architecture style, vector quality, suitable for system design documentation, no watermark, no text artifacts.
```

### 示例 2
**用户输入：** 数据湖架构：多源数据（日志、API、IoT传感器）→ 数据湖存储 → 数据清洗 → 数据集市 → 分析应用
**Prompt：**
```
A professional data lake architecture flow diagram showing data from multiple sources converging into a unified processing pipeline. On the far left, three source systems stack vertically: a gray server rack for application logs, a blue cloud API gateway for REST API data, and a green IoT sensor node with signal waves. All three streams converge via curved arrows into a large central dark blue "Data Lake" storage cylinder (S3-style object storage). From the data lake, data flows right through a yellow ETL processing funnel (labeled "Data Cleaning & Transformation"), then splits into three colored data marts: a red sales mart, an orange operations mart, and a green customer mart. Finally, arrows from all marts converge into a purple analytics layer showing dashboard charts and ML model icons. The diagram uses a left-to-right flow with a funnel-then-split pattern. Color coding is consistent: sources are muted tones, the lake is deep blue, processing is warm yellow, marts are distinct accent colors, analytics is purple. Background is light gray with subtle network pattern. Clean infographic style with rounded shapes, smooth arrow curves, and subtle shadows. Vector quality, enterprise architecture presentation style, no watermark, no text artifacts.
```

### 示例 3
**用户输入：** 实时数据流：前端用户行为 → 埋点 SDK → 网关 → Flink 实时计算 → 实时大屏展示
**Prompt：**
```
A professional real-time data streaming architecture diagram. The flow moves left to right through 5 stages: user devices (mobile phone and laptop icons) generating clickstream events → an embedding SDK layer represented as a small purple bridge component → an API gateway shown as a blue shield with load balancing arrows → an Apache Flink real-time processing engine depicted as a red-orange flame icon with streaming wave patterns → a large real-time dashboard display showing live KPI gauges, scrolling metrics, and a sparkline chart. Each stage is connected by thick animated-style flow arrows with data labels: "click events" → "SDK payload" → "API requests" → "streaming computations" → "live metrics". The entire diagram sits on a dark navy background (#1A1A2E) with glowing neon-style connections in cyan and magenta, giving it a modern tech-dashboard aesthetic. Components are flat-design icons with white outlines and colored fills. Small decorative elements like pulse dots along the arrows suggest real-time data movement. The style is dark-mode technical illustration, clean and modern, suitable for DevOps dashboards and system monitoring documentation, no watermark, no text artifacts.
```

## 质量后缀
```
professional data flow diagram, clean technical illustration, flat design with subtle depth, vector-like rendering, enterprise architecture style, high resolution, clear data pathway visualization
```

## 注意事项
- 数据流向必须清晰可见，箭头方向一致
- 不同节点类型（数据源、处理层、存储层、输出层）用不同形状或颜色区分
- 数据流上可以标注数据类型或传输协议
- 层次结构要清楚，避免线条交叉混乱
- 配色方案保持专业统一，避免过多鲜艳颜色
- 适合技术文档、架构设计文档、系统汇报
- 输出分辨率建议 2048x1152（16:9）
