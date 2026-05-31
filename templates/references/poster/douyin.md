# Douyin/TikTok Video Cover

## 适用场景

抖音/短视频封面：竖版短视频封面、直播封面、短视频频道头图等，标准为 9:16 竖版比例。

## Prompt 结构

```
[视频主题/主体] + [9:16 竖版构图] + [视觉冲击力/文字安全区] + [质量后缀] + [比例参数]
```

## 示例 1

A dynamic vertical composition featuring an energetic fitness trainer mid-workout in a modern gym setting. Dramatic overhead spotlight illuminating the trainer while the background gym equipment fades into a softly lit bokeh. The trainer's determined expression and athletic pose create instant energy and motivation. The top and bottom portions of the frame are kept clean — soft blurred background areas above and below the subject — providing safe zones for video title text and channel name overlays without covering the main subject. High-energy, motivational, and designed to make viewers tap and watch. Douyin/TikTok video cover, short-form video thumbnail, vertical format design, fitness photography, dramatic spotlighting, soft bokeh background, high-energy composition, clean text zones at top and bottom, motivational fitness aesthetic, 9:16 aspect ratio --v 2

## 示例 2

An appetizing food tutorial vertical cover showing a gorgeous finished dish being garnished from above. The camera angle is top-down looking directly at a beautiful plate of food on a dark slate surface. Hands visible at the edge of the frame adding the final garnish creating a sense of action and immediacy. The top portion of the frame shows a clean dark surface area perfect for tutorial title text. The bottom portion has a clean zone for creator name and "watch more" call-to-action. The warm food colors against the dark surface create mouth-watering visual appeal that stops the scroll. Douyin/TikTok video cover, short-form video thumbnail, vertical format design, food photography, top-down angle, action-in-frame composition, warm food on dark slate, clean text zones, mouth-watering visual appeal, 9:16 aspect ratio --v 2

## 示例 3

A striking vertical travel cover featuring a person standing at the edge of a dramatic cliff overlooking a vast valley at sunset. The person is positioned in the lower third of the frame, small but clearly visible against the enormous landscape. The golden sunset sky fills the upper two-thirds of the composition with warm light and dramatic cloud formations. The upper portion provides a clean sky area for travel destination title text. The scale contrast between the small figure and the vast landscape creates an emotional pull that makes viewers want to experience this view themselves. Douyin/TikTok video cover, short-form video thumbnail, vertical format design, travel photography, dramatic landscape scale, golden hour sunset, small figure against vast scenery, clean sky zone for text, emotional wanderlust appeal, 9:16 aspect ratio --v 2

## 质量后缀

```
Douyin/TikTok video cover, short-form video thumbnail, vertical format design
```

可选增强：`high-energy composition, soft bokeh background, action-in-frame composition, dramatic landscape scale, emotional wanderlust appeal, motivational fitness aesthetic`

## 注意事项

- **9:16 竖版**：抖音/TikTok 全屏竖版比例为 9:16（1080×1920px），这是短视频平台的标准展示格式
- **视觉冲击力**：短视频封面需要在信息流中瞬间抓住眼球，主体要突出、色彩要鲜明、情绪要饱满 — "scroll-stopping"、"high-energy"、"dynamic"
- **文字安全区**：抖音 UI 会在画面右侧和底部叠加按钮（点赞、评论、分享），顶部叠加用户信息。prompt 中需明确 "clean text zones at top and bottom"，避免文字区域被 UI 元素遮挡
- **主体居中偏下**：考虑到 UI 遮挡，主体人物或物品应放在画面中下部，顶部和底部留白用于文字
