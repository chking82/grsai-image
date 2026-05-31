# 流程图 — Flowchart Diagram

## 适用场景
业务流程图、算法流程图、决策树、状态机图、用户操作流程图、审批流程。

## Prompt 结构
```
A clean and professional flowchart diagram showing {process description}. The chart uses standard flowchart symbols: rounded rectangles for {start/end}, rectangles for {process steps}, diamonds for {decision points}, parallelograms for {input/output}. The flow direction is {direction: top-to-bottom / left-to-right}. Decision branches are labeled "Yes" / "No" (or condition labels) with clear paths. Each node has a concise label. The overall style is clean and modern, with {color scheme} for different node types. Background is {background}. Suitable for business process documentation and technical specifications. High quality, vector-like rendering, no watermark, no text artifacts.
```

## 示例

### 示例 1
**用户输入：** 用户注册流程：开始 → 填写信息 → 验证邮箱 → 邮箱是否有效？→ 是：设置密码 → 否：重新输入 → 注册成功 → 结束
**Prompt：**
```
A clean and professional user registration flowchart diagram. The chart flows top-to-bottom using standard flowchart symbols. At the top, a green rounded rectangle labeled "Start". Below it, a light blue rectangle "Fill Registration Form (email, username)". A parallelogram below that shows "System sends verification email to user". Then a yellow diamond decision node: "Email verified within 24h?" with two branches: the "Yes" branch (right, green arrow) leads to a rectangle "Set Password & Complete Profile", then a green rounded rectangle "Registration Successful → Redirect to Dashboard". The "No" branch (left, red arrow) loops back to a rectangle "Resend verification email", which connects back to the email verification step. A second decision diamond "Verification failed 3 times?" sits on the No path — if "Yes", it flows to a red rounded rectangle "Account locked, contact support". Standard flowchart symbols are used throughout: green rounded rectangles for start/end, blue rectangles for process steps, yellow diamonds for decisions, light gray parallelograms for I/O. Decision arrows are color-coded: green for Yes/positive paths, red for No/negative paths. The background is white with a faint flowchart grid pattern. Clean business process style, consistent node sizing, legible labels, flat design with subtle shadows, vector quality, suitable for product requirement documents and UX flow documentation, no watermark, no text artifacts.
```

### 示例 2
**用户输入：** 审批流程：员工提交申请 → 直属领导审批 → 是否通过？→ 通过：部门总监审批 → 是否通过？→ 通过：财务审批 → 结束；任一环节拒绝则退回申请人
**Prompt：**
```
A clean and professional multi-level approval process flowchart. The chart flows left to right with a clear escalation pattern. Starting from the left, a green rounded rectangle "Employee submits expense request". The flow enters a horizontal sequence of 3 approval stages, each represented by a blue rectangle with a small person icon: "Direct Manager Review" → "Department Director Review" → "Finance Department Review". After each approval rectangle, a yellow diamond decision node asks "Approved?" with two branches. The "Approved" path (green arrow, continuing right) moves to the next approval stage. The "Rejected" path (red arrow, branching downward) leads to a red rectangle "Return to applicant with comments", then a curved feedback arrow loops back to the start with a "Revise and resubmit" label. After the final Finance approval, a green rounded rectangle "Payment processed → Notification sent → End" concludes the flow. A small "SLA Timer" icon sits next each approval stage with time limits: "24h", "48h", "72h". A vertical "Escalation Path" sidebar on the right shows: "If no response within SLA → auto-escalate to next level" with upward arrows. Node colors are consistent: green for start/end, blue for approval actions, yellow for decisions, red for rejection/return. The background is white with a subtle process-flow grid. Clean approval workflow style, standard flowchart symbols, clear decision branches with color coding, flat design, vector quality, suitable for business process documentation and OA system design, no watermark, no text artifacts.
```

### 示例 3
**用户输入：** 快速排序算法流程：开始 → 选择基准 → 分区操作 → 递归左子数组 → 递归右子数组 → 返回排序结果 → 结束
**Prompt：**
```
A clean and professional algorithm flowchart illustrating the QuickSort sorting algorithm. The chart flows top-to-bottom with recursive branching shown clearly. At the top, a green rounded rectangle "Start QuickSort(arr, low, high)". Below, a blue rectangle "Base Case: if low >= high, return" connected to a yellow diamond "low >= high?" — the "Yes" branch (green arrow) goes directly to a green "Return (sorted)" rounded rectangle. The "No" branch continues to a blue rectangle "Choose Pivot (e.g., arr[high])", then "Partition: rearrange elements around pivot" (shown as a small array visualization with elements moving left and right of a pivot marker). Below partition, a purple rectangle "Get pivot index pi". From here, the flow splits into two parallel recursive branches shown side by side: the left branch is a blue rectangle "QuickSort(arr, low, pi-1)" with a curved "recursive call" arrow, and the right branch is a blue rectangle "QuickSort(arr, pi+1, high)" with a matching recursive arrow. Both recursive branches loop back upward to the "Base Case" decision node, with a small "recursion" label on the loop arrow. After both recursive calls complete, a green rounded rectangle "Return sorted array → End" sits at the bottom. The recursive loops are shown as curved arrows with a "↻" symbol to emphasize recursion. Small array visualization snippets appear at key steps: unsorted input [5,3,8,4,2], after partition [3,2,|4|,5,8], and sorted output [2,3,4,5,8]. The background is white with a faint code-pattern texture. Clean algorithm flowchart style, standard flowchart symbols, clear recursive structure visualization, flat design, vector quality, suitable for algorithm education and computer science materials, no watermark, no text artifacts.
```

## 质量后缀
```
flowchart diagram, process flow visualization, decision tree design, clean flat design with standard flowchart symbols, vector-like rendering, business process documentation style, high resolution, clear decision paths
```

## 注意事项
- 流程方向要一致（通常上到下或左到右）
- 决策节点用菱形，处理步骤用矩形，开始/结束用圆角矩形
- 分支路径用颜色区分（绿色=通过，红色=拒绝/失败）
- 循环/递归路径用曲线箭头标注
- 每个节点标签要简洁明确
- 适合业务流程文档、算法说明、系统设计
- 输出分辨率建议 2048x1152（16:9）
