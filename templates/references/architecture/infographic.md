# 信息图 — Infographic Data Visualization

## 适用场景
统计数据可视化、数据报告配图、关键指标展示、调研结果可视化、KPI 看板。

## Prompt 结构
```
A modern infographic design presenting {data topic}. The infographic uses {layout style: vertical / horizontal / grid} with {number} key data points highlighted. Key metrics are displayed using {visualization types: large numbers, progress bars, donut charts, icon-based counters}. The color scheme uses {colors} for {purpose}. Icons and illustrations complement the data with {icon style}. The overall style is clean, modern, and visually engaging. Background is {background}. Suitable for reports, presentations, and social media sharing. High quality, vector-like rendering, no watermark, no text artifacts.
```

## 示例

### 示例 1
**用户输入：** 2025 年全球 AI 市场规模：总规模 3000 亿美元，年增长率 35%，主要应用领域分布（企业软件 40%、自动驾驶 15%、医疗 12%、金融 10%、其他 23%）
**Prompt：**
```
A modern infographic presenting the 2025 global AI market landscape. The layout is a tall vertical design with a dark navy (#1A1A2E) background and vibrant accent colors. At the top, a large headline "AI Market 2025" in white bold font. Below it, a massive "$300B" number in gradient gold (#FFD700 → #FFA500) with "Total Market Size" subtitle in smaller gray text. A green "+35% YoY Growth" badge with an upward arrow sits beside it. Below the headline metrics, a large colorful donut chart shows market segmentation by application: "Enterprise Software 40%" in blue, "Autonomous Driving 15%" in orange, "Healthcare 12%" in green, "Finance 10%" in purple, and "Other 23%" in gray. Each segment has a percentage label and a small icon (software window, car, medical cross, dollar sign, ellipsis). Below the donut chart, 4 horizontal stat cards arranged in a 2×2 grid: "2.5M AI startups worldwide" with a rocket icon, "78% of enterprises using AI" with a building icon, "$15.8B AI chip market" with a processor icon, and "4.2M AI jobs created" with a person icon. Each stat card has a large number in white, a smaller label in gray, and a colored icon. At the bottom, a small "Sources: Gartner, IDC, McKinsey" credit line in light gray. The overall design uses flat icons, bold numbers, gradient accents on the dark background, creating a high-impact data visualization. Vector quality, modern infographic style, suitable for conference presentations and social media sharing, no watermark, no text artifacts.
```

### 示例 2
**用户输入：** 用户增长数据看板：日活 500 万，月活 2000 万，留存率 D1 65% / D7 40% / D30 25%，新增用户渠道占比
**Prompt：**
```
A modern user growth metrics dashboard infographic. The layout is a clean horizontal design on a white background with a subtle gradient border. The title "User Growth Dashboard — Q2 2025" sits at the top in dark text with a blue accent underline. The main content area is divided into 3 sections. Section 1 (left): Two large KPI cards side by side — "DAU" showing "5.0M" in bold blue with a small upward trend sparkline, and "MAU" showing "20.0M" in bold purple with a monthly growth bar chart. Section 2 (center): A retention cohort visualization showing 3 horizontal bars: "Day 1 Retention: 65%" with a teal progress bar filled 65%, "Day 7 Retention: 40%" with an orange bar, and "Day 30 Retention: 25%" with a red bar. Each bar has a small icon (person returning, calendar, and clock respectively). Section 3 (right): A user acquisition channel breakdown shown as a stacked horizontal bar chart with labeled segments: "Organic Search 35%" (green), "Social Media 25%" (blue), "Paid Ads 20%" (orange), "Referral 12%" (purple), and "Direct 8%" (gray). Each segment has a corresponding flat icon (magnifying glass, social bubble, megaphone, hand-shake, and star). Below the 3 sections, a small "Key Insight" callout box in light yellow reads: "Organic + Referral channels growing 2x faster than paid — shift budget accordingly" with a lightbulb icon. The overall design is clean and data-dense, using a consistent color palette (blue, purple, teal, orange, red, green), flat icons, and clear typography. Vector quality, modern dashboard style, suitable for business reviews and stakeholder reports, no watermark, no text artifacts.
```

### 示例 3
**用户输入：** 开发者调研报告：10000 名开发者参与，最受欢迎的编程语言 Top 5，平均薪资，工作满意度
**Prompt：**
```
A modern developer survey results infographic. The layout is a vertical infographic on a light gray background (#F8F9FA) with colorful data visualizations. At the top, a large badge "Developer Survey 2025" with "10,000 developers worldwide" underneath in smaller text. Below the header, a "Top 5 Programming Languages" section shows a horizontal bar chart with colorful bars and language logos: "Python 68%" (blue bar with Python snake icon), "JavaScript 62%" (yellow bar with JS icon), "TypeScript 45%" (blue bar with TS icon), "Rust 32%" (orange bar with Rust gear icon), and "Go 28%" (cyan bar with Go gopher icon). Below that, a "Salary by Experience" section shows 4 vertical bars: "Junior (0-2yr): $65K" in light blue, "Mid (3-5yr): $95K" in medium blue, "Senior (6-10yr): $130K" in dark blue, and "Staff/Principal (10yr+): $175K" in navy. Each bar has a dollar amount on top and a small upward arrow showing year-over-year change. Below the salary chart, 3 circular gauge meters in a row: "Job Satisfaction: 7.8/10" in green (smiley face icon), "Remote Work: 62% prefer hybrid" in teal (home + office icons), and "Open Source Contribution: 45% contribute regularly" in purple (GitHub octocat icon). At the bottom, a "Methodology" footer in small gray text: "Survey conducted Jan-Mar 2025, 10,000 respondents across 80 countries, margin of error ±1%". The overall design uses a consistent color scheme (blues, teal, green, orange, purple), flat icon style, clean typography hierarchy, and generous whitespace. Vector quality, modern survey infographic style, suitable for tech blog posts and conference materials, no watermark, no text artifacts.
```

## 质量后缀
```
infographic data visualization, modern data-driven design, clean flat icons with bold numbers, vector-like rendering, professional report quality, high resolution, visually engaging statistics presentation
```

## 注意事项
- 数据要突出显示（大数字、彩色图表、进度条）
- 图标与数据内容要匹配，风格统一
- 信息层级要清楚：主数据 → 辅助数据 → 来源注释
- 配色要协调，不同类型数据用不同颜色
- 避免信息过载，每个信息图聚焦 3-5 个关键数据点
- 适合报告配图、演讲材料、社交媒体分享
- 输出分辨率建议 2048x1152（16:9）或 1152x2048（竖版）
