# Local Replace — 局部修改

## 适用场景
产品颜色变更、局部细节调整、logo 替换、文字修改、包装标签更新。用于只需修改画面中特定区域的需求。

## Prompt 结构
```
A {product/scene description} with the {specific area} modified to show {new element/color/design}. The rest of the image {remains unchanged / maintains original appearance}. {Detail about how the modification integrates naturally}. Local area edit, targeted product modification, detail replacement --ar 4:5
```

## 示例

### 示例 1
**用户输入：** 产品颜色修改，运动鞋从白色改为红色，其余设计元素保持不变
**Prompt：**
```
A pair of premium running sneakers photographed on a clean light grey studio background, identical in design, construction, and angle to the original product — but with the shoe's upper color changed from white to a vibrant racing red (#DC2626). All other design elements remain exactly the same: the navy blue swoosh logo stays navy blue, the white foam midsole is unchanged, the navy blue rubber outsole with waffle tread pattern is identical, the lacing system, the heel counter, the back tab, and the air cushion unit are all preserved in their original colors and positions. The shoes are at the same three-quarter angle — left shoe showing full side profile, right shoe slightly behind showing the heel. The vibrant red color of the upper mesh fabric has the same texture and weave pattern as the original white version, with light catching the fabric surface creating natural highlights and shadows across the curved shoe form. The red is consistent across all upper panels including the tongue, the toe box, and the quarter panel. Professional product photography lighting from the upper left with soft diffused shadows extending to the lower right. Clean commercial product photography on light grey background. Local area edit, targeted product modification, detail replacement.
```

### 示例 2
**用户输入：** 产品包装局部修改，饮料瓶标签上的品牌名从"OLD BRAND"改为"NEW BRAND"，瓶身和标签设计其余部分不变
**Prompt：**
```
A 500ml clear plastic sports drink bottle on a white studio background, identical in every aspect to the original product design — the same electric blue liquid visible through the transparent bottle, the same contoured bottle shape with grip ridges on the sides, the same blue sport cap, the same wraparound label design with dynamic lightning bolt graphic in yellow and blue geometric accent patterns — but with only the brand name on the label changed. Where the label previously read "ENERGY FUEL" in bold white uppercase letters on a dark blue background band, it now reads "THUNDER DRINK" in the exact same font, size, position, and color (bold white uppercase), maintaining perfect alignment with the surrounding design elements. All other text on the label remains unchanged: the "500ml" volume indicator, the "ELECTROLYTES + VITAMINS" tagline, the nutrition facts panel on the back portion of the label, and the barcode area are all identical to the original. The lighting, shadows, bottle angle, and background are exactly the same as the original product shot. Clean professional beverage product photography. Local area edit, targeted product modification, detail replacement.
```

### 示例 3
**用户输入：** 室内装饰局部修改，客厅墙上挂画从风景画换为抽象几何画，沙发、茶几、灯光等其他元素不变
**Prompt：**
```
A modern living room interior photographed from a wide angle showing the full seating area, identical in every detail to the original room — the same charcoal grey L-shaped sectional sofa with scattered throw pillows in mustard yellow and teal, the same round wooden coffee table with a small potted succulent and a stack of design magazines on top, the same floor-to-ceiling windows with sheer white curtains letting in soft natural light, the same light oak hardwood flooring, the same potted fiddle leaf fig plant in the corner, and the same warm ambient lighting from a ceiling pendant lamp — but with only the wall art above the sofa changed. Where the original room had a large framed landscape photograph (mountain scene in blue and green tones) hanging centered above the sofa, the new version has a large framed abstract geometric artwork of the same size and frame style (thin black metal frame, approximately 120cm wide by 80cm tall). The abstract piece features bold geometric shapes — overlapping triangles and circles in terracotta orange, mustard yellow, and deep teal against a warm cream background — the colors intentionally chosen to complement the existing throw pillow colors in the room. The artwork hangs at the exact same height and position as the original, centered above the sofa with the same spacing. The room's lighting creates the same subtle reflection on the glass of the picture frame. The overall room aesthetic remains the same modern warm minimalism style. Local area edit, targeted product modification, detail replacement.
```

## 质量后缀
```
local area edit, targeted product modification, detail replacement
```

## 注意事项
- **改动最小化**：只修改需要改的部分，其他一切保持原样
- **风格延续**：新元素必须融入原有设计风格——字体、配色、比例要匹配
- **光影一致**：修改后的区域要保留原有的光影效果——高光、阴影方向不变
- **尺寸匹配**：替换元素的尺寸比例要与原元素一致
- **文字对齐**：文字替换要确保字号、字重、间距、对齐方式与原设计一致
- **颜色映射**：换颜色时注意材质的反光特性——红色塑料和红色金属的反光完全不同
- **边界融合**：修改区域的边缘要和原画面无缝衔接，不能有明显的边界线
- **多版本保留**：建议同时输出修改前和修改后的对比图
