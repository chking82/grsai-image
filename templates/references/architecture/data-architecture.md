# 数据架构图 — Data Architecture Diagram

## 适用场景
数据湖架构、数据仓库设计、数据平台整体架构、现代数据栈（Modern Data Stack）、数据中台。

## Prompt 结构
```
A professional data architecture diagram illustrating {data platform/system}. The architecture shows {number} layers: {layer list}. Data flows from {source types} on the left/upper side through {processing layers} to {output/consumption layers} on the right/lower side. Each layer contains {component types} represented as {shape convention}. The color scheme uses {color description} to differentiate layers. Background is {background style}. Clean, modern data architecture style, suitable for data engineering documentation and platform planning. High quality, vector-like rendering, no watermark, no text artifacts.
```

## 示例

### 示例 1
**用户输入：** 现代数据栈：数据源（业务 DB、SaaS API、日志）→ 数据集成（Fivetran/Airbyte）→ 数据仓库（Snowflake）→ 数据转换（dbt）→ BI 工具（Looker/Metabase）
**Prompt：**
```
A professional Modern Data Stack architecture diagram. The architecture flows left to right through 5 stages. On the far left, a "Data Sources" group shows three vertically stacked source blocks: a blue "Business Databases" cylinder (PostgreSQL, MySQL), a green "SaaS APIs" cloud (Salesforce, Stripe, HubSpot), and a gray "Log Files" server (application logs, clickstream). All source streams converge into a teal "Data Integration" layer containing "Fivetran" and "Airbyte" logos as connector blocks with many small input arrows merging into a single output stream. The stream feeds into a large dark blue "Data Warehouse (Snowflake)" block — a wide cylinder with internal layer labels: "Raw Landing Zone", "Staging Area", and "Curated Data Marts". From Snowflake, a teal arrow flows to a green "Data Transformation (dbt)" block showing a DAG graph of model dependencies (small interconnected boxes representing SQL models). Finally, the transformed data feeds into a purple "BI & Analytics" layer with three tool blocks: "Looker" (dashboard chart icon), "Metabase" (question mark / ad-hoc query icon), and "Jupyter Notebook" (code icon) for data science. A small "Data Governance" sidebar on the right edge spans all layers with icons for "Data Quality", "Catalog", and "Lineage". The background is white with a faint data-grid pattern. Clean modern data stack style, each stage has a distinct color, flat design with subtle shadows, vector quality, suitable for data platform planning and engineering documentation, no watermark, no text artifacts.
```

### 示例 2
**用户输入：** 数据湖仓一体（Lakehouse）：原始数据湖（Delta Lake）+ 数据仓库层 + 统一元数据 + 多引擎查询（Spark、Presto、Flink）
**Prompt：**
```
A professional Lakehouse (Data Lake + Data Warehouse unified) architecture diagram. The diagram is organized in a layered vertical structure. At the bottom, a wide deep blue "Storage Layer — Delta Lake on Object Storage (S3/ADLS)" block spans the full width, showing three internal zones: "Bronze (Raw)" in dark blue, "Silver (Cleaned)" in medium blue, and "Gold (Curated)" in light blue — each zone represented as a horizontal segment with a small table icon. Above the storage layer, a "Unified Metadata Layer" in teal contains "Delta Lake Transaction Log", "Schema Registry", and "Data Catalog (Unity Catalog)" blocks. The "Compute Layer" above that shows 4 parallel query engine blocks arranged horizontally: "Apache Spark" (orange lightning icon) for batch processing, "Apache Flink" (red flame icon) for stream processing, "Presto/Trino" (green magnifying glass icon) for interactive SQL, and "ML Engine" (purple brain icon) for machine learning. All compute engines connect downward to the storage layer with bidirectional arrows labeled "read/write via Delta format". At the top, a "Consumption Layer" in purple contains: "BI Dashboards", "Data Science Notebooks", "Data Applications", and "Real-time APIs". On the left edge, a "Data Ingestion" vertical bar shows "Batch (Airflow)" and "Streaming (Kafka)" feeding into the Bronze zone. On the right edge, a "Governance" vertical bar shows "Access Control", "Audit Logging", and "Data Quality Checks" spanning all layers. The background is white with a subtle layered pattern. Clean lakehouse architecture style, clear separation of storage/compute/consumption, flat design, vector quality, suitable for data platform architecture documentation, no watermark, no text artifacts.
```

### 示例 3
**用户输入：** 实时数据仓库：Kafka 实时接入 → Flink 流式 ETL → Doris/StarRocks OLAP → 实时报表 + 预警系统
**Prompt：**
```
A professional real-time data warehouse architecture diagram. The architecture flows left to right in a pipeline style optimized for low-latency processing. On the far left, a "Real-time Data Sources" group contains: "Application Binlog (CDC)" in blue, "IoT Sensor Streams" in green, and "User Click Events" in orange, all feeding into a large red "Apache Kafka" cluster block shown as a cluster of message broker nodes with partition labels (P0, P1, P2). From Kafka, an orange stream arrow flows into an orange-red "Apache Flink — Streaming ETL" block, which contains internal processing steps shown as connected chevrons: "Deserialize → Filter → Enrich → Aggregate → Window". A small "Checkpoint State Backend (RocksDB)" box sits below Flink. The processed stream splits into two paths: (1) a thick green arrow to a green "Apache Doris / StarRocks — OLAP Engine" block (a database cylinder with "MPP" badge), which serves real-time queries; (2) a thin gray arrow to a gray "Offline Sink — HDFS/Iceberg" block for historical data archival. From the OLAP engine, two output arrows point to: a purple "Real-time Dashboard" block showing a live KPI gauge and scrolling metrics, and a red "Alert System" block with a bell icon and rule engine. A small "Superset/Metabase" icon sits above the dashboard. The entire pipeline has a red "SLA: < 5s latency" badge at the top. The background is white with a faint real-time wave pattern. Clean real-time data architecture style, emphasis on streaming and low latency, flat design, vector quality, suitable for real-time analytics platform documentation, no watermark, no text artifacts.
```

## 质量后缀
```
data architecture diagram, data lake design, data warehouse visualization, modern data stack illustration, clean flat design with layered components, vector-like rendering, data engineering style, high resolution
```

## 注意事项
- 数据源、存储层、处理层、输出层要清晰区分
- 批处理和流处理要分开或用不同颜色标识
- 数据分层（Bronze/Silver/Gold 或 ODS/DWD/DWS/ADS）要明确
- 计算存储分离架构要体现清楚
- 数据治理（质量、血缘、目录）可以作为侧边栏
- 适合数据平台规划、数据中台架构、数据工程文档
- 输出分辨率建议 2048x1152（16:9）
