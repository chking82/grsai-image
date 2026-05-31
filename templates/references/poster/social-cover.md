# Social Cover

## 适用场景

社交媒体封面图：微信公众号首图、微博封面、YouTube Header、Facebook 封面等各大社交平台的封面/头图设计。

## Prompt 结构

```
[背景主体/氛围] + [平台尺寸留白] + [品牌色/风格] + [质量后缀] + [比例参数]
```

## 示例 1

A stunning social media cover image with an elegant gradient background flowing from warm amber to deep rose pink. Abstract soft cloud-like shapes blending seamlessly across the canvas. Clean horizontal band across the center-left area left intentionally empty for title text overlay. Subtle bokeh light particles scattered throughout for depth and visual interest. Modern lifestyle aesthetic with warm inviting tones. social media cover design, optimized for platform dimensions, premium visual quality, soft lighting, 16:9 aspect ratio --v 2

## 示例 2

Bold and energetic social media header featuring dynamic diagonal brush strokes in vivid coral, teal, and golden yellow. The composition creates a sweeping motion from bottom-left to top-right. Large clean zone in the upper center reserved for headline and branding. Textured paper-like overlay adding depth without overwhelming the design. Contemporary and eye-catching suitable for fashion or lifestyle brand presence. social media cover design, optimized for platform dimensions, vibrant commercial quality, crisp details, 2.35:1 aspect ratio --v 2

## 示例 3

Sophisticated dark-mode social cover with a deep charcoal background and subtle topographic contour lines in muted gold. A soft radial glow emanates from the lower right corner, creating natural focal interest. The left two-thirds of the image remains clean and uncluttered for text placement. Minimalist premium aesthetic that conveys authority and elegance. social media cover design, optimized for platform dimensions, editorial quality, refined composition, 3:1 aspect ratio --v 2

## 质量后缀

```
social media cover design, optimized for platform dimensions
```

可选增强：`premium visual quality, soft lighting, editorial quality, crisp details, refined composition`

## 注意事项

- **特定平台尺寸**：
  - 微信公众号封面：2.35:1（推荐 2350×1000px）
  - YouTube Header：16:9（2560×1440px，安全区域 1546×423px）
  - Facebook 封面：约 2.63:1（820×312px）
  - 微博封面：约 3.2:1（1920×600px）
- **文字安全区域**：各平台会在封面不同位置叠加 UI 元素（头像、按钮等），prompt 中需指定 "clean zone" 避开这些区域
- **跨平台适配**：如果要求多平台通用，优先使用 16:9 并在中心区域留白
