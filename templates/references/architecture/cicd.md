# CI/CD 管线图 — CI/CD Pipeline Diagram

## 适用场景
DevOps 流水线、持续集成/持续部署流程、自动化构建测试部署、GitOps 工作流、发布管线。

## Prompt 结构
```
A professional CI/CD pipeline diagram showing the {process type} workflow. The pipeline flows from left to right through {number} stages: {stage list}. Each stage is represented as a {shape type} with a distinct color and {icon type}. Stage transitions are shown as {connector style} with success/failure paths. Automation badges and tool logos are included: {tools}. The overall style is clean and modern, suitable for DevOps documentation and engineering presentations. Flat design with subtle depth. Background is {background}. High quality, vector-like rendering, no watermark, no text artifacts.
```

## 示例

### 示例 1
**用户输入：** 标准 CI/CD 管线：代码提交 → 构建 → 单元测试 → 集成测试 → 代码扫描 → 部署到 Staging → 部署到 Production
**Prompt：**
```
A professional CI/CD pipeline diagram showing a standard continuous integration and deployment workflow. The pipeline flows left to right through 7 connected stages, each represented as a chevron-shaped block (arrow shape pointing right) with a distinct color: "Code Commit" in gray (Git icon), "Build" in blue (hammer/compile icon), "Unit Tests" in green (checkmark badge), "Integration Tests" in teal (linked chain icon), "Code Scanning" in amber (magnifying glass + shield icon), "Deploy Staging" in orange (cloud with arrow icon), and "Deploy Production" in dark green (rocket launch icon). Each chevron block contains a small percentage success rate badge (e.g., "98% pass rate"). Between stages, thin connector arrows show the flow. Below the main pipeline, a parallel "Quality Gates" track shows: "Lint & Format Check" (gray), "Security Scan (SAST)" (red), and "Performance Test" (purple), each connected to the main pipeline with vertical arrows indicating blocking gates. A "Rollback" curved arrow loops from the Production stage back to the Staging stage, labeled "Auto-rollback on failure". At the top, a "Trigger" banner shows: "Git Push / Pull Request / Scheduled / Manual". Above each stage, small tool logos appear: Git, Maven, JUnit, Selenium, SonarQube, Kubernetes, and ArgoCD respectively. The entire pipeline sits on a light gray track with a subtle progress bar effect (left stages slightly brighter). The background is white. Clean DevOps pipeline style, chevron shapes for stages, clear success/failure paths, flat design with subtle shadows, vector quality, suitable for CI/CD documentation and engineering presentations, no watermark, no text artifacts.
```

### 示例 2
**用户输入：** GitOps 工作流：开发者 Push 代码 → PR Review → Merge 到 main → ArgoCD 检测到变更 → 自动同步到 K8s 集群
**Prompt：**
```
A professional GitOps workflow diagram illustrating the Git-as-source-of-truth deployment pattern. The diagram is divided into two zones: "Git Repository" on the left and "Kubernetes Cluster" on the right, separated by a vertical "GitOps Boundary" line. In the Git zone: a developer pushes code (person + laptop icon) to a "Feature Branch" (light blue branch line), then creates a "Pull Request" (a blue PR box with review checklist and approval checkmarks). After approval (green "Approved" badge), the code merges to the "main" branch (thick dark blue branch line). From the main branch, a "YAML Manifest Update" flows across the GitOps boundary to the right side. In the Kubernetes zone, a large purple "ArgoCD" block (a bird/arrow icon) continuously "watches" the Git repository (shown as a curved watch arrow looping back from ArgoCD to Git). When a change is detected, ArgoCD triggers a "Sync & Deploy" action (a green sync arrow) that applies manifests to the "Kubernetes Cluster" — shown as a large teal box containing "Deployment", "Service", "Ingress", and "ConfigMap" resource blocks. Below the cluster, a "Health Check" badge shows green checkmarks for all resources. A "Drift Detection" label with a small radar icon shows ArgoCD comparing desired state (Git) vs actual state (K8s). A small "Rollback = git revert" badge emphasizes the GitOps rollback principle. At the top, a "Principles" banner lists: "Declarative", "Versioned", "Automated", "Self-Healing" with small icons. The background is white with a faint Git branch pattern. Clean GitOps workflow style, clear Git/K8s boundary, flat design, vector quality, suitable for DevOps training and GitOps adoption documentation, no watermark, no text artifacts.
```

### 示例 3
**用户输入：** 蓝绿部署管线：代码构建 → 测试通过 → 部署到绿色环境 → 流量切换 → 验证 → 废弃蓝色环境
**Prompt：**
```
A professional blue-green deployment pipeline diagram. The pipeline flows from left to right. On the far left, the standard CI stages are compact chevrons: "Build" in blue, "Unit Tests" in green, and "Integration Tests" in teal, all passing with green checkmark badges. After successful testing, the pipeline splits into a deployment visualization showing two identical environment boxes side by side: "Blue Environment (v1.2 — Live)" on the left and "Green Environment (v1.3 — Staging)" on the right. The Blue environment has a red "ACTIVE" badge and a thick green traffic arrow pointing to it from a "Load Balancer" block at the top. The Green environment has a yellow "STAGING" badge and shows new version artifacts being deployed (a green download arrow). A horizontal "Traffic Switch" toggle bar sits between the two environments with a sliding indicator moving from Blue to Green. Below the Green environment, a "Verification" section shows: "Health Checks ✓", "Smoke Tests ✓", and "Canary Analysis (95% confidence)" all with green checkmarks. A "Rollback" button (red) points back to Blue, and a "Promote" button (green) finalizes the switch to Green. After promotion, a "Decommission Blue" faded arrow shows the old environment being torn down (grayed out with a trash icon). At the bottom, a timeline bar shows the deployment phases: "Build → Deploy Green → Verify → Switch Traffic → Decommission Blue" with timestamps. The background is white. Clean blue-green deployment style, clear environment comparison, flat design with color-coded environments (blue vs green), vector quality, suitable for deployment strategy documentation and DevOps presentations, no watermark, no text artifacts.
```

## 质量后缀
```
CI/CD pipeline diagram, DevOps workflow visualization, continuous integration deployment illustration, clean flat design with tool icons, vector-like rendering, engineering presentation style, high resolution, professional DevOps documentation
```

## 注意事项
- 构建 → 测试 → 部署的流程顺序要明确
- 自动化标识（工具 logo、成功/失败标记）要清晰
- 成功路径和失败/回滚路径要区分
- 质量门禁（Quality Gate）要突出显示
- 可以用 chevron（箭头形状）表示管线阶段
- 适合 DevOps 文档、CI/CD 方案、工程实践汇报
- 输出分辨率建议 2048x1152（16:9）
