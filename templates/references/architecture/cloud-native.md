# 云原生架构图 — Cloud Native Architecture

## 适用场景
Kubernetes 部署架构、容器编排示意、云原生技术栈、微服务上云、容器化部署拓扑。

## Prompt 结构
```
A professional cloud native architecture diagram showing {technology/platform}. The diagram features {number} main components: {component list}. The layout shows {layout description}. Each component is represented as a {shape type} with appropriate icons and labels. Connections between components indicate {connection type}. Cloud provider elements use recognizable cloud shapes in {colors}. The overall style is clean, modern, and suitable for cloud infrastructure documentation. Flat design with subtle depth effects. Background is {background}. High quality, vector-like rendering, no watermark, no text artifacts.
```

## 示例

### 示例 1
**用户输入：** Kubernetes 集群架构：Master 节点（API Server、Scheduler、Controller Manager、etcd）+ Worker 节点（Kubelet、Kube-Proxy、容器 Pod）
**Prompt：**
```
A professional Kubernetes cluster architecture diagram. The diagram shows a clear Master-Worker separation. On the left side, a large blue-bordered box labeled "Master Node (Control Plane)" contains four component blocks arranged in a 2×2 grid: "API Server" in bright blue with a hub/spoke icon (central to all communication), "Scheduler" in purple with a calendar/checklist icon, "Controller Manager" in green with a loop/arrow icon, and "etcd" in orange with a key-value store cylinder icon. Arrows from the API Server connect to all other Master components and extend rightward to the Worker nodes. On the right side, two identical "Worker Node" boxes stacked vertically, each with a teal border. Inside each Worker Node: a small "Kubelet" block (light blue, agent icon), a "Kube-Proxy" block (gray, network proxy icon), and 2-3 "Pod" blocks (rounded rectangles with Docker whale icons inside). Each Pod contains one or two small container rectangles. Arrows show: API Server → Kubelet (pod scheduling), Kube-Proxy → external traffic (network routing), and horizontal arrows between Pods in the same Node (inter-pod communication). Above the entire diagram, a "kubectl" CLI icon connects to the API Server with a labeled arrow "kubectl commands". A small "Cloud Provider" block sits above the Master node, connected via "Cloud Controller Manager" dashed arrow. The background is white with a faint Kubernetes-logo-watermark at 3% opacity. Clean cloud-native diagram style, clear Master-Worker separation, flat design with distinct component colors, vector quality, suitable for K8s documentation and training, no watermark, no text artifacts.
```

### 示例 2
**用户输入：** 云原生技术栈：容器运行时 → 容器编排（K8s）→ 服务网格（Istio）→ CI/CD（GitLab）→ 监控（Prometheus + Grafana）
**Prompt：**
```
A professional cloud native technology stack diagram showing 5 layers arranged as a pyramid/funnel from bottom to top. The bottom layer "Container Runtime" in dark gray contains: "containerd", "runc", and "CRI-O" small blocks — the foundation layer. Above it, "Container Orchestration" in blue contains a large "Kubernetes" block with sub-components: "Deployment", "Service", "Ingress", "ConfigMap/Secret". The third layer "Service Mesh" in teal features a large "Istio" block with: "Traffic Management", "Security (mTLS)", "Observability" sub-blocks. The fourth layer "CI/CD Pipeline" in green shows: "GitLab CI" with pipeline stages (build → test → deploy) as connected chevrons, and "ArgoCD" for GitOps deployment. The top layer "Monitoring & Observability" in purple contains: "Prometheus" (time-series database icon), "Grafana" (dashboard chart icon), "Jaeger" (distributed tracing icon), and "Alertmanager" (bell/alert icon). On the right edge, a vertical "DevSecOps" bar spans all layers with security icons (lock, scan, audit) at each level. Arrows between layers show the technology dependency: Runtime ← Orchestration ← Mesh ← CI/CD ← Monitoring. The background is a subtle gradient from light gray (bottom) to white (top). Clean layered tech stack style, each layer has a distinct color, flat design with subtle depth, vector quality, suitable for cloud-native adoption planning and technology stack reviews, no watermark, no text artifacts.
```

### 示例 3
**用户输入：** AWS 云原生部署架构：ECS 容器服务 + RDS 数据库 + S3 存储 + CloudFront CDN + API Gateway + Lambda 函数
**Prompt：**
```
A professional AWS cloud native deployment architecture diagram. The layout flows from left to right showing the request path. On the far left, a "Users" icon group (browser, mobile, desktop) sends requests to "Amazon CloudFront" (a blue globe/CDN icon) for static content caching. Behind CloudFront sits "Amazon API Gateway" (a blue gate icon) routing API requests. From the API Gateway, requests split into two paths: (1) to "AWS Lambda" functions (orange lambda symbol blocks) for serverless compute, shown as 3 separate function blocks: "Auth Lambda", "Business Logic Lambda", and "Notification Lambda"; (2) to "Amazon ECS" containers (blue ship icon with container blocks inside) for long-running microservices. Both paths can access "Amazon RDS" (a blue database cylinder) for relational data and "Amazon S3" (a blue storage bucket icon) for object storage. Small arrows show: Lambda → RDS (queries), ECS → RDS (queries), ECS → S3 (file uploads), Lambda → SNS/SQS (orange notification icons) for async messaging. On the bottom, a shared "Amazon VPC" boundary (dashed green rectangle) encloses RDS, ECS, and Lambda, with subnets and security group badges. On the right side, "CloudWatch" (orange eye icon) and "AWS X-Ray" (orange trace icon) monitor the entire stack. The background is white. AWS service colors are accurate (blue for compute/storage, orange for messaging/serverless, green for VPC). Clean cloud architecture style, flat design with AWS-styled icons, vector quality, suitable for AWS solution architecture documentation, no watermark, no text artifacts.
```

## 质量后缀
```
cloud native architecture diagram, Kubernetes deployment visualization, container orchestration design, clean flat design with cloud icons, vector-like rendering, DevOps engineering style, high resolution, professional infrastructure illustration
```

## 注意事项
- 云图标要 recognizable（AWS/Azure/GCP 的标准图标风格）
- 容器集群用矩形框+内部多个小容器表示
- 自动伸缩可以用上下箭头或扩展/收缩动画示意
- Master/Worker 节点或 Control Plane/Data Plane 要区分
- 网络边界（VPC、安全组）用虚线框表示
- 适合云架构文档、部署方案、技术选型汇报
- 输出分辨率建议 2048x1152（16:9）
