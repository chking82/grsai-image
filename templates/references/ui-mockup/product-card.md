# product-card — 产品卡片

## 适用场景
电商商品列表/网格页、推荐商品卡片、搜索结果中的商品展示。

## Prompt 结构
```
A mobile product card UI design mockup, [card layout: image + title + price + action], [card style: flat / elevated / rounded], [context: list / grid view], [quality suffix], [aspect ratio]
```

## 示例 1
**用户输入：** 电商网格商品卡片
**Prompt：**
```
A set of product card UI designs in a 2-column grid layout on a mobile e-commerce app screen, each product card features a square product image with rounded corners taking up the top portion, below the image: product title in two lines of bold dark text with ellipsis for overflow, a price line with large bold red current price and smaller gray strikethrough original price, and a row of small gray tags like "Free Shipping" or "Best Seller", a small heart-shaped wishlist icon in the top-right corner of the product image, clean white card backgrounds with subtle light gray shadow for depth, consistent spacing between cards, overall light gray screen background, product card UI design, e-commerce listing card, modern shopping interface, clean card layout, professional UI/UX design, minimal aesthetic --ar 9:16
```

## 示例 2
**用户输入：** 带加入购物车的卡片
**Prompt：**
```
A single featured product card UI design on a clean white background, large hero product image with slight zoom effect and soft drop shadow below, product category label in small uppercase gray text above the title, product name in bold black text spanning two lines, star rating with 4.5 yellow stars and review count "(2,348)" in gray, pricing section with large bold black price "$49.99" and "20% OFF" badge in orange, below pricing a quantity selector with minus/number/plus controls in a bordered pill shape, and an "Add to Cart" button in vibrant orange with a shopping cart icon, product image and interactive elements have smooth rounded corners throughout, subtle hover-style shadow effect, product card UI design, e-commerce listing card, modern shopping interface, interactive product card, clean modern design, professional UI/UX design --ar 4:5
```

## 示例 3
**用户输入：** 商品列表（横向卡片）
**Prompt：**
```
A horizontal scrolling list of product card UI designs on a white background, each card in a landscape orientation with product thumbnail image on the left (square, rounded corners), product details on the right: product title in bold, short description in gray, price in large bold text with sale price highlighted in red, rightmost area with a prominent "Add to Cart" button in green with cart icon, small circular rating display with yellow stars, "In Stock" badge in green, subtle divider lines between cards in the list view, each card has a very light gray background with white inner content area, clean minimal e-commerce listing design, product card UI design, e-commerce listing card, list view layout, modern shopping app, professional UI/UX design --ar 16:9
```

## 质量后缀
```
product card UI design, e-commerce listing card, modern shopping interface, clean card layout, professional UI/UX design, minimal aesthetic
```

## 注意事项
- **产品图**：方形或 4:3 比例的主图，占卡片最大面积
- **价格**：当前价用大字号+品牌色（常红色），原价用小字号+灰色+删除线
- **名称**：通常限制两行，超出用省略号
- **加入购物车按钮**：醒目颜色，带购物车图标，便于快速操作
- **标签/徽章**：包邮、热卖、新品等小标签增加转化
- **收藏功能**：心形图标常放于图片右上角
- **一致性**：网格中卡片尺寸、间距、圆角统一
- **上下文场景**：可以是网格视图、列表视图或单独展示
