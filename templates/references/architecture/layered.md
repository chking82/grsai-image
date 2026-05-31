# 分层架构图 — Layered Architecture Diagram

## 适用场景
三层/四层/五层架构图、系统分层设计、MVC/MVVM 架构、企业应用分层、平台架构图。

## Prompt 结构
```
A professional layered architecture diagram showing a {number}-tier system design. The diagram consists of {number} horizontal layers stacked vertically: {layer names}. Each layer is a wide horizontal band with a distinct color gradient and contains {content type: component boxes / service icons / module labels}. The layers are separated by thin divider lines with small gap arrows showing inter-layer communication. Labels are clearly positioned on the left side or within each layer. The overall style is clean flat design with subtle shadows for depth. Background is {background}. Suitable for system design documentation and technical presentations. High quality, vector-like rendering, no watermark, no text artifacts.
```

## 示例

### 示例 1
**用户输入：** 三层 Web 应用架构：表示层（前端 UI）→ 业务逻辑层（API 服务）→ 数据访问层（数据库）
**Prompt：**
```
A professional layered architecture diagram showing a 3-tier web application architecture. The diagram consists of 3 horizontal layers stacked vertically with small gaps between them. The top layer "Presentation Tier" is a wide band in gradient blue (#4A90D9 → #6CB4EE), containing component boxes: "Web Browser", "Mobile App", and "SPA Frontend (React/Vue)". The middle layer "Business Logic Tier" is in gradient green (#4CAF50 → #81C784), containing: "API Gateway", "Authentication Service", "Order Service", "Payment Service", and "Notification Service". The bottom layer "Data Access Tier" is in gradient orange (#FF9800 → #FFB74D), containing: "MySQL Database", "Redis Cache", and "Elasticsearch". Each component is a rounded rectangle with a white icon and label. Thin bidirectional arrows connect components across layers showing request/response flow. A small "REST API" label sits on the arrow between Presentation and Business tiers, and "JDBC/ORM" label between Business and Data tiers. On the left edge, a vertical bracket spans all three layers labeled "Application System". The background is white with a subtle dot grid. Clean flat design with rounded shapes, subtle drop shadows on each layer band, modern sans-serif labels. Suitable for system design documentation, vector quality, no watermark, no text artifacts.
```

### 示例 2
**用户输入：** 五层企业级平台架构：用户接入层 → 应用服务层 → 业务中台层 → 数据平台层 → 基础设施层
**Prompt：**
```
A professional 5-layer enterprise platform architecture diagram. Five horizontal bands stacked vertically with consistent spacing: (1) "User Access Layer" in deep blue containing "Web Portal", "Mobile App", "Open API", and "Third-party Integration" icons; (2) "Application Service Layer" in teal containing "User Center", "Order Center", "Product Center", and "Content Center" service boxes; (3) "Business Middleware Layer" in green containing "Workflow Engine", "Rule Engine", "Message Queue", and "Task Scheduler" modules; (4) "Data Platform Layer" in amber containing "Data Warehouse", "Real-time Computing", "Data Lake", and "BI Analytics" storage/processing icons; (5) "Infrastructure Layer" in gray containing "Compute (K8s)", "Storage (Ceph)", "Network (VPC)", and "Monitoring (Prometheus)" infrastructure blocks. Each layer has a small numbered badge (L1–L5) on the left edge. Vertical communication channels are shown as two-way arrows passing through all layers, with labels: "HTTP/gRPC" between L1-L2, "Service Bus" between L2-L3, "Data API" between L3-L4, and "Resource API" between L4-L5. A vertical sidebar on the right labeled "Cross-cutting: Security & Monitoring" spans all five layers with a dashed border. The background is light gray. Clean enterprise architecture style, color-coded layers, flat design with subtle depth, vector quality, suitable for enterprise architecture reviews and platform planning, no watermark, no text artifacts.
```

### 示例 3
**用户输入：** MVVM 架构：View（UI 组件）→ ViewModel（状态管理）→ Model（数据模型），支持双向绑定
**Prompt：**
```
A professional MVVM (Model-View-ViewModel) architecture diagram. The layout shows three rounded-rectangle blocks arranged in a horizontal triangle pattern. On the left, a large light-blue "View" block contains UI component icons: a form, a list, a chart, and a button, labeled "UI Components & Templates". On the right, a purple "ViewModel" block contains: "State", "Commands", "Data Binding", and "Validation Logic" small boxes. At the bottom center, a green "Model" block contains: "Entity", "Repository", "Data Source", and "Business Rules" boxes. The key relationship is highlighted with thick curved arrows: a solid blue arrow from ViewModel to View labeled "Data Binding (Observable)", a dashed gray arrow from View to ViewModel labeled "User Events / Commands", and a solid green arrow between ViewModel and Model labeled "Data Access / Updates" with bidirectional arrowheads. A circular "Two-Way Binding" badge with rotating arrows sits between the View and ViewModel blocks, emphasized in bright yellow. Small "INotifyPropertyChanged" and "ObservableCollection" label tags attach to the ViewModel block. The background is white with a subtle hexagonal pattern. Clean software architecture diagram style, distinct colors per layer, clear binding arrows, suitable for WPF/Xamarin/Android development documentation, vector quality, no watermark, no text artifacts.
```

## 质量后缀
```
layered architecture diagram, multi-tier system design, clean flat design with subtle depth, color-coded layers, vector-like rendering, enterprise architecture style, high resolution, professional technical illustration
```

## 注意事项
- 层次必须分明，每层之间有明显的分隔线或间隙
- 层与层之间的接口/通信方式要清晰标注
- 颜色区分不同层，但整体配色要协调
- 每层内部的组件/模块要合理排列，避免拥挤
- 可以添加跨层关注（如安全、监控）作为侧边栏
- 适合系统设计文档、架构评审、技术汇报
- 输出分辨率建议 2048x1152（16:9）
