# Enhancement — 画质增强

## 适用场景
老照片修复、低清图片高清化、模糊图片锐化、噪点消除、色彩恢复。用于提升图像的整体质量和清晰度。

## Prompt 结构
```
An enhanced high-quality version of {original image description}, with {improvements — sharp detail restoration/noise reduction/color recovery/contrast enhancement}. The image has been {upscaling/restoration/enhancement technique}. {Quality level — crystal clear/highly detailed/vibrant colors}. Image quality enhancement, detail sharpening, photo restoration --ar 4:5
```

## 示例

### 示例 1
**用户输入：** 老照片修复，1970年代家庭合影，黑白泛黄照片修复为彩色高清版本
**Prompt：**
```
An enhanced restored and colorized version of a 1970s family photograph, transformed from a faded yellowed black-and-white original into a vibrant clear color image. The photograph shows a family of five — two parents and three children — standing together in front of a suburban house on a sunny day. The father (left) wears a brown corduroy jacket and wide-lapel shirt typical of 1970s fashion, with a warm smile and neatly combed hair; the mother (right) wears a floral-print dress in soft pink and green tones with her hair styled in soft waves, holding the youngest child — a toddler girl in a yellow dress — on her hip. Between them stand two older children — a boy (age 8) in a striped polo shirt and denim shorts, and a girl (age 12) in a denim jacket and flared jeans. All family members are smiling naturally. The image has been professionally restored — all scratches, creases, and spots from the original damaged photograph have been seamlessly removed with the underlying image content reconstructed. The faded yellowed tones have been replaced with accurate natural colorization — skin tones are warm and natural, clothing colors reflect the actual 1970s palette (browns, oranges, yellows, greens), the house behind them is painted in a soft cream color with white trim and a green lawn. The grass and trees in the background are vibrant natural greens, the sky is a clear light blue with soft white clouds. The image has been upscaled to high resolution with sharp clear detail — individual hair strands are visible, fabric textures are clear, facial features are crisp. The contrast has been optimized with deep rich shadows and bright clean highlights, eliminating the flat washed-out look of the original. Subtle film grain has been preserved to maintain the authentic 1970s photograph character rather than looking digitally over-processed. Expertly restored vintage family photograph with natural colorization and high-definition clarity. Image quality enhancement, detail sharpening, photo restoration.
```

### 示例 2
**用户输入：** 低清产品图片高清化，模糊的电商产品图提升为清晰锐利的高清图
**Prompt：**
```
An enhanced high-resolution version of a product photograph showing a wireless Bluetooth speaker, upscaled and sharpened from a blurry low-resolution original into a crystal-clear detailed commercial product image. The speaker is a cylindrical portable Bluetooth speaker approximately 18cm tall and 8cm in diameter, photographed on a clean white background at a slight three-quarter angle. The speaker body is covered in a fine grey fabric mesh (now showing the individual woven texture of the fabric clearly) with a solid rubber base and top ring in matte black. The top control panel features clearly readable icons — a power button symbol, volume up and down icons (plus and minus), a Bluetooth pairing button symbol, and a play/pause button — all embossed into the rubber surface and now crisply defined. A thin LED indicator light strip around the middle of the speaker shows a subtle blue glow. The speaker has visible branding text "SOUNDBAR PRO" printed in small white letters on the front fabric mesh, now sharp and legible. The image has been dramatically sharpened — all edges are crisp and well-defined, fine details like the fabric weave pattern, the subtle texture of the rubber surface, and the small text are all clearly readable. The contrast has been enhanced with proper black levels (the matte black rubber is now truly deep black rather than washed-out grey) and clean whites (the background is pure white #FFFFFF rather than off-white). Color accuracy has been improved — the grey fabric shows its true neutral tone without color cast. Noise and compression artifacts from the original low-quality image have been eliminated, resulting in a clean smooth image with no pixelation or JPEG blocking. Professional e-commerce product photography quality. Image quality enhancement, detail sharpening, photo restoration.
```

### 示例 3
**用户输入：** 夜景照片增强，暗淡噪点多的城市夜景提升为明亮清晰色彩丰富的夜景
**Prompt：**
```
An enhanced version of a city night skyline photograph, transformed from a dark noisy underexposed original into a vibrant clear detailed nightscape with rich colors and minimal noise. The photograph shows a panoramic view of a modern city waterfront at dusk-to-night — tall illuminated skyscrapers rising along the water's edge, their windows glowing with warm yellow and white lights, with LED accent lighting in blue and purple running vertically along several building facades. A river or bay in the foreground reflects the city lights as elongated golden streaks on the dark water surface, with a few small boats visible as tiny light sources on the water. In the far background, a distinctive observation tower or communications tower stands out with red aviation warning lights blinking at the top. The sky above the city is a deep navy blue (#0A1628) transitioning to a slightly lighter blue near the horizon where the last traces of sunset create a subtle warm glow. The enhanced image reveals dramatic detail improvements — building windows that were indistinguishable blobs in the original are now clearly individual lit squares, the reflection patterns on the water show detailed ripple textures, and the distant buildings that were lost in darkness are now visible with architectural detail. Noise reduction has been expertly applied — the grainy noisy look of the high-ISO original has been smoothed into clean tones while preserving real detail (edges of buildings, light sources, water texture remain sharp). The dynamic range has been expanded — shadow areas now show visible detail instead of being pure black, and bright light sources (building lights, street lamps) are clear and defined without blown-out blooming. Color saturation has been enhanced — the warm building lights glow richer gold, the LED accents pop in vivid blue and purple, and the deep blue sky has subtle color variation rather than flat darkness. The overall impression is a stunning vibrant nightscape that captures the energy and beauty of the illuminated city. Image quality enhancement, detail sharpening, photo restoration.
```

## 质量后缀
```
image quality enhancement, detail sharpening, photo restoration
```

## 注意事项
- **细节恢复有极限**：AI 无法凭空创造出原始照片中不存在的细节——合理预期
- **保留原始质感**：老照片修复要保留时代特征（胶片颗粒、色调倾向），不要修成数码照片
- **降噪不抹细节**：降噪算法容易把细节当噪声一起抹掉——要在降噪和保细节之间平衡
- **对比度适度**：过高的对比度会让图像看起来假——适度增强，保留自然的过渡
- **色彩准确**：增强色彩不等于饱和度过度——要以真实自然的色彩为基准
- **边缘锐化**：锐化要针对边缘，不要对平坦区域锐化（会产生噪点）
- **光源方向**：夜景增强中，光源（路灯、窗灯）应该比周围亮很多——这是夜景的关键特征
- **分区域处理**：不同区域可能需要不同的增强策略——天空降噪、建筑锐化、水面增强反射
