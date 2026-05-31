# dashboard — 仪表盘

## 适用场景
管理后台、SaaS 数据面板、运营监控大屏、业务分析看板。

## Prompt 结构
```
A [desktop / tablet] dashboard UI mockup, [layout: sidebar + topbar + main content area], [content: data cards, charts, tables], [color scheme], [style notes], [quality suffix], [aspect ratio]
```

## 示例 1
**用户输入：** SaaS 管理后台仪表盘
**Prompt：**
```
A desktop admin dashboard UI mockup for a SaaS analytics platform, left sidebar navigation in dark navy with white icons and labels: Dashboard, Users, Revenue, Products, Reports, Settings, current page highlighted with blue accent, top bar showing search field, notification bell with red badge, and user avatar, main content area on white background with a row of 4 KPI cards at top showing Total Revenue ($48,295), Active Users (2,847), Conversion Rate (3.24%), Avg. Order Value ($128), each card with a small trend arrow and percentage change indicator, below the cards a large area chart showing revenue trend over 30 days with gradient fill in blue, next to it a donut chart showing traffic sources breakdown, below the charts a data table with column headers: User, Email, Status, Plan, Revenue, each row with avatar and status badges (Active/Trial/Churned) in green/yellow/red, clean modern design with subtle shadows and rounded corners, admin dashboard UI, data analytics panel, SaaS management interface, clean business intelligence design, professional UI/UX design, Figma quality --ar 16:9
```

## 示例 2
**用户输入：** 电商运营数据看板
**Prompt：**
```
A desktop e-commerce operations dashboard UI mockup, light gray background with white content panels, top header with date range picker dropdown, export button, and refresh icon, KPI section with 6 metric cards in 2 rows of 3: Today's Orders, GMV, New Customers, Returning Rate, Inventory Alerts, Pending Shipments, each card with a large bold number, smaller label, sparkline mini-chart, and colored trend indicator, main area featuring a large bar chart comparing daily sales across product categories with color-coded bars, adjacent line chart showing order volume and fulfillment rate over time with dual Y-axes, bottom section with a horizontal scrollable list of recent orders showing order ID, customer name, items, amount, and status badges (Processing/Shipped/Delivered/Cancelled) in various colors, left sidebar with collapsible navigation sections, admin dashboard UI, data analytics panel, SaaS management interface, e-commerce operations, data visualization dashboard, professional UI/UX design --ar 16:9
```

## 示例 3
**用户输入：** 项目管理看板
**Prompt：**
```
A desktop project management dashboard UI mockup, clean white and light gray design, top navigation with project selector dropdown, team members avatars, and notification center, main area organized as a kanban-style board with 4 columns: To Do (3 cards), In Progress (5 cards), In Review (2 cards), Done (8 cards), each column with a colored header bar and card count badge, cards within columns showing task title, assignee avatars, priority labels (High/Medium/Low) in red/orange/gray, due date badges, and progress indicator bars, right sidebar panel showing task detail for selected card with description, subtask checklist, comment section with avatar and timestamps, and attachment area, left sidebar with navigation for Projects, Tasks, Calendar, Files, Team, admin dashboard UI, data analytics panel, SaaS management interface, project management tool, kanban board design, professional UI/UX design --ar 16:9
```

## 质量后缀
```
admin dashboard UI, data analytics panel, SaaS management interface, data visualization dashboard, clean business intelligence design, professional UI/UX design, Figma quality
```

## 注意事项
- **图表组件**：折线图、柱状图、饼图、面积图等数据可视化元素
- **数据卡片**：KPI 指标卡，大数字 + 小标签 + 趋势箭头
- **侧边导航**：深色或白色侧栏，图标 + 文字，当前页高亮
- **筛选器**：日期范围、状态下拉、搜索框等过滤控件
- **表格**：数据列表，带头像、状态徽章、操作按钮
- **颜色语义**：绿色=增长/正常，红色=下降/警告，蓝色=中性数据
- **响应式**：注意桌面端 16:9 比例的合理信息密度，避免过密
