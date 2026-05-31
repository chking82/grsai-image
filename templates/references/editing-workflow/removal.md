# Object Removal — 去水印/移除

## 适用场景
去除图片水印、移除多余元素/人物、清理场景中的干扰物、修复瑕疵。用于净化画面、提升专业度。

## Prompt 结构
```
A {scene/product description} with {unwanted elements — watermark/people/objects/text} cleanly removed. The area where the elements were previously located is {description of how the background is seamlessly reconstructed}. {Quality notes about the clean result}. Object removal, watermark elimination, clean image cleanup --ar 4:5
```

## 示例

### 示例 1
**用户输入：** 去除图片水印，一张产品摄影图上右下角有网站水印 logo，需要完全去除
**Prompt：**
```
A professional product photograph of a leather handbag on a clean light grey studio background, completely free of any watermarks, logos, or text overlays. The handbag is a structured tote bag in rich cognac brown leather (#8B4513) with visible natural leather grain texture, gold-tone hardware including two top handles with ring attachments, a front pocket with a magnetic closure, and protective metal feet on the bottom corners. The bag is photographed at a slight three-quarter angle showing both the front and one side, with the handles standing upright. The background is a seamless light grey (#E8E8E8) gradient that transitions smoothly from a slightly lighter tone behind the bag to a slightly darker tone at the bottom surface. Professional studio lighting from the upper left creates soft defined shadows — a gentle shadow extending to the lower right beneath the bag, and subtle highlight reflections on the gold hardware. The leather surface shows natural variation in color and texture, with slight creasing near the handle attachments suggesting the bag's soft structure. The image is completely clean with no watermarks, no text overlays, no logos, no branding marks anywhere — a pure unobstructed product photograph ready for commercial use. Object removal, watermark elimination, clean image cleanup.
```

### 示例 2
**用户输入：** 移除场景中的杂物，海滩度假照片中有其他游客和遮阳伞挡住背景，需要清理出干净的海滩
**Prompt：**
```
A pristine tropical beach scene completely cleared of any people, objects, or distractions — showing an empty stretch of paradise beach. The foreground features smooth white sand with gentle ripple patterns from the tide and a few natural shells and small pieces of coral scattered organically. The sand transitions from wet and reflective near the waterline (showing mirror-like reflections of the sky) to dry and powdery further up the beach. Crystal-clear turquoise water laps gently at the shore with small white foam lines where each wave breaks, the water shallow enough near the shore to see the sandy bottom through it. The horizon line is straight and clean — deep blue ocean meeting a clear sky with a few scattered white cumulus clouds. A line of tall palm trees stands along the upper edge of the beach on the right side, their trunks leaning slightly and their green fronds swaying gently. The lighting is bright midday tropical sun creating vivid saturated colors — electric blue water, white sand, deep green palm fronds, and a brilliant blue sky. The entire scene is completely empty of people, beach umbrellas, towels, boats, or any man-made objects — just the natural beauty of an untouched tropical beach. The composition leads the eye from the textured sand in the foreground through the clear water to the horizon, creating a sense of depth and tranquility. Object removal, watermark elimination, clean image cleanup.
```

### 示例 3
**用户输入：** 去除建筑外立面多余的空调外机和电线，让建筑外观干净整洁
**Prompt：**
```
A clean architectural photograph of a modern residential building's exterior facade, completely free of any air conditioning units, electrical wires, satellite dishes, or other visual clutter. The building is a six-story structure with a contemporary design — a smooth white rendered exterior (#FAFAFA) punctuated by a regular grid of large rectangular windows with dark grey aluminum frames (#4A4A4A). Each window is floor-to-ceiling height creating a sleek modern appearance, with some windows showing sheer curtains drawn inside. The building has horizontal accent bands in warm wood-look panels between every two floors, creating visual rhythm and breaking up the white facade. A small balcony with a glass railing appears on the third floor on the right side. The ground floor features a recessed entrance with a dark grey canopy and glass double doors, with the building number "42" in brushed metal numerals beside the door. Landscaping along the building base includes a row of trimmed boxwood hedges and a few ornamental grasses in a clean stone bed. The sidewalk in front is clean grey concrete with no parked cars, no trash bins, no signage, no utility boxes — a pristine streetscape. The sky above is a clear blue with soft white clouds. The building's facade is photographed straight-on with a slight upward tilt, showing clean geometric lines with no distortion. Every surface is clean and uncluttered — no visible pipes, no cables, no external units, no makeshift additions — just the architect's original clean design intent realized perfectly. Object removal, watermark elimination, clean image cleanup.
```

## 质量后缀
```
object removal, watermark elimination, clean image cleanup
```

## 注意事项
- **纹理重建**：移除物体后，原来被遮挡的区域需要重建纹理——砖墙要补砖缝，草地要补草纹
- **光影一致**：补画的区域光影方向要和原画面一致
- **透视正确**：重建部分的透视角度要和周围环境匹配
- **自然随机**：补画的纹理不要过于规则——自然界的纹理都有随机性
- **边缘融合**：移除区域和原画面的交界处要无缝过渡
- **多次迭代**：复杂场景的移除可能需要多次尝试才能达到完美效果
- **保留原图**：始终保留原始未修改的版本作为备份
- **法律合规**：移除水印可能涉及版权问题，商业用途需确保有使用权限
