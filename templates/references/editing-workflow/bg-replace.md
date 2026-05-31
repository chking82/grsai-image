# Background Replace — 换背景

## 适用场景
电商产品图背景替换、人像写真场景替换、证件照换底色、社交媒体照片背景美化。用于将主体从原背景中分离并替换到新背景。

## Prompt 结构
```
A {product/portrait} {description} placed on a {new background description}. The subject {subject details} is cleanly separated from the original background and composited onto {background scene/studio setting}. {Lighting direction matching between subject and background}. {Color tone harmony}. Background replacement, studio background substitution, clean background swap --ar 4:5
```

## 示例

### 示例 1
**用户输入：** 电商产品白底替换，运动鞋产品图，纯白背景，专业摄影棚效果
**Prompt：**
```
A pair of premium running sneakers photographed on a pure white seamless studio background. The shoes are positioned at a three-quarter angle — the left shoe standing upright showing the full side profile with the lacing system, midsole cushioning technology, and outsole tread pattern visible; the right shoe placed slightly behind at an angle showing the heel counter and back tab detail. The sneakers feature a white mesh upper with navy blue accents along the swoosh logo, a thick white foam midsole with visible air cushion unit in the heel, and a navy blue rubber outsole with a waffle traction pattern. The shoes are clean and new with no wear marks. The white background is a perfect pure white (#FFFFFF) with a subtle gradient where the surface meets the vertical backdrop creating a seamless infinity effect. Soft professional studio lighting from the upper left creates gentle shadows under the shoes — a soft diffused shadow extending to the lower right, indicating a large softbox light source. A subtle reflection on the white surface beneath the shoes adds a premium product photography feel. The overall lighting is bright and even with no harsh shadows, perfect for e-commerce product listing. Background replacement, studio background substitution, clean background swap.
```

### 示例 2
**用户输入：** 人像场景背景替换，商务女性肖像，从灰色背景换到现代办公室落地窗场景
**Prompt：**
```
A professional business portrait of a woman in her early 30s, composited into a modern corner office setting with floor-to-ceiling windows. The woman has shoulder-length dark hair styled in soft waves, wearing a tailored navy blue blazer over a white silk blouse, with small gold stud earrings and a warm confident smile. She stands in a relaxed power pose — one hand lightly resting on a sleek white desk surface, weight shifted to one leg, looking directly at the camera with an approachable yet authoritative expression. The background is a bright modern office on a high floor — large floor-to-ceiling windows behind her reveal a blurred city skyline with tall buildings in the distance, suggesting a prestigious business district location. Natural daylight streams through the windows creating a soft backlight rim effect around her hair and shoulders (the hair-light effect). The office interior visible on the sides includes a minimalist white bookshelf with a few books and a small plant, and a contemporary desk lamp. The lighting on the subject has been matched to the background — warm directional light from the windows on her right side, with soft fill light on the left side of her face creating a natural professional portrait lighting pattern. The color temperature is warm and inviting with cool blue tones from the window light balanced by warm interior tones. Background replacement, studio background substitution, clean background swap.
```

### 示例 3
**用户输入：** 产品户外场景替换，咖啡杯从白色背景换到木质桌面加自然光户外咖啡店场景
**Prompt：**
```
A ceramic coffee mug with latte art on top, composited into a cozy outdoor café table setting. The mug is a handmade-style ceramic cup in warm cream with slight irregularities in the glaze suggesting artisan craftsmanship, filled with a flat white coffee showing beautiful rosetta latte art on the surface — a white leaf pattern on the golden-brown crema. The mug sits on a weathered wooden table with visible wood grain, small knots, and a warm honey-brown color that has been sun-bleached slightly. Next to the mug on the table: a small silver spoon resting on a white napkin, and a few scattered coffee beans adding to the café atmosphere. The background beyond the table is softly blurred (bokeh effect) showing green foliage and dappled sunlight filtering through tree leaves, suggesting an outdoor garden café setting. Warm golden hour sunlight comes from the upper left at approximately 45 degrees, creating a warm highlight on the left side of the mug and casting a soft shadow to the lower right on the wooden surface. Steam gently rises from the coffee in thin wispy lines catching the golden light. The color palette is warm and inviting — golden yellows, warm browns, creamy whites, and soft greens — creating a cozy morning café atmosphere. The subject lighting matches the outdoor natural light source with warm directional highlights and soft ambient fill. Background replacement, studio background substitution, clean background swap.
```

## 质量后缀
```
background replacement, studio background substitution, clean background swap
```

## 注意事项
- **光源匹配**：主体的光线方向必须与新背景一致——窗户在左边，主体左边就要亮
- **色温统一**：室内暖光和室外冷光的色温差异要处理好，避免主体和背景色差明显
- **阴影自然**：主体在新背景上必须有投影——没有阴影的换背景一眼就能看出
- **边缘处理**：头发、半透明物体、毛玻璃等复杂边缘要精细处理
- **透视正确**：主体的透视角度要和背景场景匹配——不能俯视主体放在平视背景上
- **色彩融合**：环境色会反射到主体上——绿色草坪会在主体底部产生微妙的绿色反光
- **分辨率匹配**：主体和背景的分辨率/清晰度要一致，不能一个模糊一个锐利
- **白底最通用**：电商产品图换背景时，纯白背景是最安全的选择
