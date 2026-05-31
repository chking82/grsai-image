# 网络拓扑图 — Network Topology Diagram

## 适用场景
网络架构设计、网络安全布局、数据中心网络、企业网络拓扑、零信任网络架构。

## Prompt 结构
```
A professional network topology diagram showing {network type/scope}. The diagram features {number} network zones/segments: {zone list}. Each zone is enclosed in a {boundary type: dashed rectangle / colored area} labeled with its zone name. Network devices are represented as standard icons: {device conventions}. Connections between devices are {line style} with labels indicating {protocol/type}. Security elements include {security features}. The layout follows a {layout description} pattern. Clean network architecture style, standard iconography, suitable for infrastructure documentation and security reviews. High quality, vector-like rendering, no watermark, no text artifacts.
```

## 示例

### 示例 1
**用户输入：** 企业网络拓扑：互联网 → 防火墙 → 负载均衡器 → DMZ 区（Web 服务器）→ 内网（应用服务器 + 数据库）
**Prompt：**
```
A professional enterprise network topology diagram. The layout flows from top to bottom representing the traffic path from external to internal. At the very top, a cloud icon labeled "Internet / External Network" with incoming request arrows. Directly below, a red "Next-Gen Firewall (NGFW)" block with a shield icon, showing rule labels: "IPS/IDS, WAF, DDoS Protection". Below the firewall, a green "Load Balancer (HAProxy/F5)" block with a traffic-splitting icon directing traffic to multiple paths. The load balancer feeds into a "DMZ Zone" enclosed in an orange dashed rectangle containing: "Web Server 1 (Nginx)" and "Web Server 2 (Nginx)" as small server rack icons, plus a "Reverse Proxy" block. A second firewall (lighter red "Internal Firewall") sits below the DMZ, separating it from the "Internal Network" enclosed in a green dashed rectangle. Inside the Internal Network: an "Application Server Cluster" (3 small server icons with app icons), a "Database Server (MySQL Primary-Replica)" shown as a primary cylinder + replica cylinder with a replication arrow, and a "Redis Cache" block. On the right side of the internal network, a "Management Zone" (purple dashed rectangle) contains: "Bastion Host (Jump Server)", "Monitoring Server (Zabbix/Prometheus)", and "Log Server (ELK)". Connection lines are solid blue for internal traffic and dashed red for cross-zone traffic, with protocol labels: "HTTPS:443", "HTTP:80", "MySQL:3306", "Redis:6379". IP subnet labels sit on each zone boundary: "DMZ: 10.0.1.0/24", "Internal: 10.0.2.0/24", "Management: 10.0.3.0/24". The background is white with a faint network cable pattern. Clean network topology style, standard infrastructure icons, clear zone boundaries, vector quality, suitable for network security documentation, no watermark, no text artifacts.
```

### 示例 2
**用户输入：** 零信任网络架构（ZTNA）：用户身份验证 → 策略引擎 → 微隔离 → 动态访问控制 → 持续监控
**Prompt：**
```
A professional Zero Trust Network Architecture (ZTNA) diagram. The diagram uses a hub-and-spoke pattern centered around a large "Policy Engine" block (dark blue with a brain/gear icon). Around the center, 5 key components orbit in a circular arrangement: "Identity Provider (IdP)" at the top in purple with an ID card icon; "Device Posture Check" at top-right in teal with a laptop + checkmark icon; "Micro-Segmentation Gateway" at bottom-right in orange with a grid/fence icon; "Dynamic Access Controller" at bottom-left in green with a lock + key icon; and "Continuous Monitoring" at top-left in red with an eye icon. Each component connects to the center Policy Engine with bidirectional thick arrows, showing continuous policy evaluation. On the far left, a "User/Device" icon group (person with laptop + mobile) initiates a request that first passes through a "Never Trust, Always Verify" gate (a red checkpoint badge). The verified request flows to the Policy Engine. On the far right, the protected resources are shown as 3 vertically stacked blocks inside a "Protected Resources" dashed boundary: "SaaS Applications" (cloud icons), "On-Premise Servers" (rack icons), and "Cloud Workloads" (container icons). A small "Data Loss Prevention (DLP)" badge sits between the Access Controller and the resources. Throughout the diagram, small red "Verify" checkmarks appear on every connection point, emphasizing the continuous verification principle. The background is a subtle dark-to-light gradient suggesting a security perimeter. Clean zero-trust architecture style, circular hub-and-spoke layout, distinct component colors, flat design with subtle glow effects, vector quality, suitable for security architecture reviews and zero-trust adoption planning, no watermark, no text artifacts.
```

### 示例 3
**用户输入：** 多区域数据中心网络：Region A + Region B + Region C，通过专线互联，每区域含计算/存储/网络资源
**Prompt：**
```
A professional multi-region data center network topology diagram. The diagram shows 3 large rectangular regions arranged horizontally: "Region A (Beijing)" in blue, "Region B (Shanghai)" in green, and "Region C (Shenzhen)" in orange. Each region box contains an identical internal structure: a "Compute Zone" (small server rack icons with VM symbols), a "Storage Zone" (database cylinders with SAN/NAS labels), and a "Network Zone" (router and switch icons with VPC badge). Each region has a local "Load Balancer" and "Firewall" at its entry point. Between the 3 regions, thick bidirectional arrows labeled "Dedicated Line (10Gbps MPLS)" connect them in a full mesh pattern (A↔B, B↔C, A↔C), with small latency badges: "A-B: 20ms", "B-C: 15ms", "A-C: 30ms". At the top center, a "Global Traffic Manager (GTM/DNS)" cloud icon distributes user requests across regions based on health checks (shown as small heartbeat pulse icons). Below each region, a "Local Backup" cylinder and an off-site "Cross-Region Replication" arrow show data redundancy. On the far left, a "Central Management" box contains: "SDN Controller", "Network Monitoring Dashboard", and "Configuration Management Database (CMDB)". On the far right, a "Security Operations Center (SOC)" box shows: "SIEM Platform", "Threat Intelligence Feed", and "Incident Response Runbook". The background is white with a faint world map outline at 3% opacity. Clean multi-region topology style, consistent internal structure per region, clear inter-region connections, flat design, vector quality, suitable for enterprise infrastructure planning and disaster recovery documentation, no watermark, no text artifacts.
```

## 质量后缀
```
network topology diagram, infrastructure architecture design, network security layout, clean flat design with standard network icons, vector-like rendering, enterprise networking style, high resolution, professional infrastructure illustration
```

## 注意事项
- 节点类型用标准网络图标（路由器、交换机、防火墙、服务器等）
- 连接关系要明确，标注协议和端口
- 安全边界用虚线框或不同颜色区域表示
- 子网划分和 IP 地址段可以标注在区域边界
- 流量方向用箭头标注
- 适合网络设计文档、安全评审、基础设施规划
- 输出分辨率建议 2048x1152（16:9）
