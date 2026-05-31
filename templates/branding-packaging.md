# 模板：品牌包装/包装设计

## 适用场景
用户要求生成品牌 VI 展示板、产品包装设计、礼盒包装、品牌识别手册封面等。

## 需求收集清单

| 字段 | 类型 | 必填 | 选项/说明 |
|------|------|------|----------|
| brand_name | text | ✅ | 品牌名称 |
| sub_type | select | ✅ | 见下方子模板类型 |
| product_type | text | ✅ | 产品类型 |
| style | select | ❌ | 极简/奢华/国潮/日式/工业风 |
| packaging_type | select | ❌ | 瓶/盒/袋/罐/礼盒 |
| color_scheme | text | ❌ | 品牌配色 |

## 子模板类型（references/branding-packaging/）

| 子模板 | 文件 | 关键词 | 示例场景 |
|--------|------|--------|---------|
| 品牌 VI 展示板 | `brand-board.md` | VI、品牌识别、配色 | 品牌手册、VI 手册 |
| 产品包装设计 | `product-packaging.md` | 包装、标签、品牌 | 饮料、化妆品包装 |
| 礼盒设计 | `gift-box.md` | 礼盒、节日、高端 | 节日礼品、企业礼盒 |
| 包装设计展示 | `mockup-display.md` | 多角度展示、场景 | 包装效果图 |
| 饮料标签 | `beverage-label.md` | 饮料、酒、咖啡 | 精酿啤酒、咖啡豆包装 |
| 化妆品包装 | `cosmetic.md` | 化妆品、护肤、美妆 | 面霜、口红包装 |

## 推荐参数

- model: gpt-image-2-vip
- imageSize: 2048x2048（2K 1:1）/ 3840x2160（4K 16:9 展示板）
