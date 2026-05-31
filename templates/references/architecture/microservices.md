# 微服务架构图 — Microservices Architecture Diagram

## 适用场景
微服务架构设计、分布式系统拓扑、服务网格示意、SOA 架构图、领域驱动设计（DDD）服务划分。

## Prompt 结构
```
A professional microservices architecture diagram showing a distributed system with {number} services. The architecture features an {API gateway type} at the top/center acting as the entry point. Behind the gateway, {number} microservice blocks are arranged in a {layout pattern}: {service names}. Each service is a {shape} with a distinct color and icon representing its domain. Services communicate via {communication pattern: message queue / event bus / direct API calls} shown as {connection style}. Supporting infrastructure includes {infrastructure list}. The overall style is clean and modern, flat design with subtle depth effects. Background is {background}. Suitable for distributed system documentation and engineering presentations. High quality, vector-like rendering, no watermark, no text artifacts.
```

## 示例

### 示例 1
**用户输入：** 电商微服务架构：API 网关 → 用户服务、订单服务、商品服务、支付服务、库存服务，通过消息队列异步通信
**Prompt：**
```
A professional microservices architecture diagram for an e-commerce platform. At the top center, a large blue "API Gateway" block (Kong/APIG) acts as the single entry point, with small client icons (web browser, mobile phone, third-party app) above it pointing downward. Behind the gateway, 5 microservice blocks are arranged horizontally in a row, each a rounded rectangle with a distinct color and icon: "User Service" in teal with a person icon, "Product Service" in blue with a product box icon, "Order Service" in orange with a shopping cart icon, "Payment Service" in green with a credit card icon, and "Inventory Service" in purple with a warehouse icon. Each service block contains small sub-labels showing its key capabilities (e.g., Order Service: "create, track, cancel"). Below the services, an orange "Message Queue (RabbitMQ/Kafka)" bus spans the width with event arrows flowing between services — Order Service publishes "OrderCreated" events, Inventory Service listens and responds with "StockReserved" events, Payment Service publishes "PaymentCompleted" events. On the far left, a blue "Service Registry (Consul/Eureka)" block with bidirectional arrows to each service showing registration/discovery. On the far right, a gray "Centralized Logging (ELK)" and "Monitoring (Prometheus)" stack. The background is white with a faint network topology pattern. Clean flat design, distinct service colors, clear communication patterns, suitable for distributed system documentation and engineering reviews, vector quality, no watermark, no text artifacts.
```

### 示例 2
**用户输入：** Service Mesh 微服务：sidecar 代理模式，Envoy 代理注入每个服务，控制平面 Istio 管理流量
**Prompt：**
```
A professional Service Mesh architecture diagram illustrating the Istio + Envoy sidecar proxy pattern. The diagram is divided into two zones: the "Data Plane" occupying the lower two-thirds and the "Control Plane" in the upper third. In the Data Plane zone, 4 microservice pods are shown as large rectangles arranged in a 2×2 grid: "Frontend", "User Service", "Order Service", and "Payment Service". Each pod contains two sub-blocks: the application container (colored rectangle) and an "Envoy Sidecar Proxy" (smaller gray rectangle with a satellite dish icon) connected by a small internal arrow showing all traffic passes through the proxy. Arrows between pods show inter-service communication, but each arrow actually connects sidecar-to-sidecar (not app-to-app), emphasized with a small "mTLS" lock icon on each connection. In the Control Plane zone above, the Istio control components are displayed: "Pilot" (traffic management, blue), "Citadel" (security/certificates, green), "Galley" (configuration, orange), and "Mixer" (policy/telemetry, purple). Dashed control arrows descend from each control component to all sidecar proxies, labeled "config sync", "cert rotation", "policy rules", and "telemetry reporting" respectively. A legend box explains "Solid arrows = data plane traffic, Dashed arrows = control plane communication". The background is light gray. Clean Kubernetes-native architecture style, clear separation of data/control planes, flat design with subtle shadows, vector quality, suitable for cloud-native engineering documentation, no watermark, no text artifacts.
```

### 示例 3
**用户输入：** 事件驱动微服务：事件溯源模式，Event Store 作为单一事实源，CQRS 读写分离
**Prompt：**
```
A professional event-driven microservices architecture diagram showing Event Sourcing and CQRS patterns. The diagram flows from left to right. On the left, a "Command Side" section with three command-handling services arranged vertically: "Order Command Handler" in orange, "Payment Command Handler" in green, and "Shipping Command Handler" in blue. Each service publishes events to a central "Event Store" — a large dark blue cylinder in the center labeled "Event Store (Single Source of Truth)" with a timeline of events shown as small horizontal bars: "OrderCreated → PaymentInitiated → PaymentCompleted → ShippingAssigned → Shipped". From the Event Store, events stream via a green "Event Stream (Kafka)" bus to the right-side "Query Side" section containing three read-model services: "Order Query Service" in light orange, "Payment Query Service" in light green, and "Shipping Query Service" in light blue. Each read service maintains its own "Materialized View" database (small cylinder icons). At the far right, three API endpoints serve queries to clients. A "CQRS" divider line separates the Command Side and Query Side with a large labeled badge. Event flow arrows are thick and curved, suggesting continuous streaming. Small icons on the Event Store show append-only behavior (downward arrows into the cylinder). The background is white with a subtle event-timeline pattern. Clean event-driven architecture style, clear separation of write/read models, flat design with color-coded services, vector quality, suitable for DDD and event sourcing documentation, no watermark, no text artifacts.
```

## 质量后缀
```
microservices architecture diagram, distributed system design, service mesh visualization, clean flat design with clear service boundaries, vector-like rendering, cloud-native engineering style, high resolution
```

## 注意事项
- 服务边界要清晰，每个服务是独立的单元
- API 网关作为统一入口要突出
- 消息队列/事件总线的位置和流向要明确
- 服务注册发现、监控、日志等基础设施要包含
- 通信方式（同步 RPC vs 异步消息）要区分
- 可以用颜色区分不同业务域/限界上下文
- 适合分布式系统设计文档、技术架构评审
- 输出分辨率建议 2048x1152（16:9）
