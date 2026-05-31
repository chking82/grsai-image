# 模板：品牌 Logo/标识

## 适用场景
用户要求生成 Logo、品牌标识、图标、徽章、商标、品牌 VI 元素等。

## 需求收集清单

| 字段 | 类型 | 必填 | 选项/说明 |
|------|------|------|----------|
| brand_name | text | ✅ | 品牌/项目名称 |
| industry | text | ✅ | 所属行业 |
| sub_type | select | ✅ | 见下方子模板类型 |
| style | select | ❌ | 极简/文字型/图形型/组合型/复古 |
| colors | text | ❌ | 指定品牌色 |
| mood | select | ❌ | 专业/活泼/高端/科技/温暖 |

## 子模板类型（references/logo/）

| 子模板 | 文件 | 关键词 | 示例场景 |
|--------|------|--------|---------|
| 极简 Logo | `minimal.md` | 极简、几何、现代 | 科技公司、SaaS 产品 |
| 文字型 Logo | `wordmark.md` | 字体设计、排版 | 品牌名、企业名 |
| 图形 Logo | `iconic.md` | 图形、象征、图标 | 品牌图标、App 图标 |
| 组合 Logo | `combination.md` | 文字+图形组合 | 完整品牌标识 |
| 徽章/印章 | `badge.md` | 徽章、圆形、传统 | 学校、俱乐部、认证 |
| 复古 Logo | `vintage.md` | 复古、做旧、经典 | 餐饮、手工品牌 |

## 推荐参数

- model: gpt-image-2-vip
- imageSize: 2048x2048（2K 1:1）
