# Storyboard Sequence — 故事板

## 适用场景
影视分镜规划、广告创意展示、短视频脚本可视化、产品演示流程。用于在拍摄前规划每个镜头。

## Prompt 结构
```
A professional storyboard sequence of {number} frames arranged in a {grid layout — 3x2/2x3/linear row}, depicting {scene/sequence description}. {Frame-by-frame descriptions}. Each frame shows {shot type — wide/medium/close-up/POV} with {camera direction notes}. {Style — pencil sketch style/clean line art/cinematic thumbnail}. Storyboard sequence, film shot planning, advertising storyboard --ar 16:9
```

## 示例

### 示例 1
**用户输入：** 30 秒产品广告故事板，6 格，展示智能手表开箱到佩戴过程，电影感草图风格
**Prompt：**
```
A professional storyboard sequence of 6 frames arranged in a 3-column by 2-row grid layout, depicting the unboxing and first use of a smartwatch. Frame 1 (top-left, wide shot): A sleek rectangular product box sits centered on a clean minimalist desk surface, top-down camera angle. A hand enters from the right side reaching toward the box. Frame 2 (top-center, close-up): Two hands lift the box lid, revealing the smartwatch nestled in molded packaging foam. The watch face catches a soft highlight. Shallow depth of field blurs the background. Frame 3 (top-right, medium shot): The watch is lifted from the box by both hands, held at eye level. The watch face illuminates with a startup animation — a subtle circular progress ring glowing blue. Frame 4 (bottom-left, POV shot): First-person perspective of the watch on a wrist. The wearer's hand rotates the wrist, showing the watch face from different angles. The screen displays a clean watch face with time and heart rate. Frame 5 (bottom-center, medium close-up): The wearer taps the screen with their index finger. A menu interface appears on the watch display with four app icons. A subtle motion line indicates the tap action. Frame 6 (bottom-right, wide shot): The person stands up from the desk wearing the watch, walking toward a door with keys in hand, ready to head out. Natural morning light from a window creates a warm glow. Each frame has a small caption area below describing the shot type, camera movement, and approximate duration (5 seconds each). Clean pencil sketch style with blue accent markers indicating screen glow elements, professional storyboard aesthetic with numbered frames and directional arrows. Storyboard sequence, film shot planning, advertising storyboard.
```

### 示例 2
**用户输入：** 短视频脚本故事板，4 格，展示咖啡制作过程，适合抖音/快手，竖屏构图
**Prompt：**
```
A professional storyboard sequence of 4 frames arranged vertically in a single column with 9:16 aspect ratio each, depicting the process of making a pour-over coffee, designed for short-form video content. Frame 1 (top, wide establishing shot): A beautiful overhead flat-lay composition showing all coffee-making equipment arranged neatly on a wooden surface — a glass dripper, paper filter, gooseneck kettle, coffee beans, grinder, and a glass carafe. Morning light creates warm diagonal shadows across the surface. Frame 2 (second, medium shot): Close-up of hot water being poured from a gooseneck kettle in a slow circular motion over the coffee grounds in the dripper. Steam rises in thin wispy lines. The golden-brown coffee drips into the carafe below. Frame 3 (third, extreme close-up): Macro shot of the coffee blooming — hot water hitting fresh grounds causes them to expand and release gas bubbles, creating a foamy crust on top. Rich amber and dark brown color tones. Frame 4 (bottom, medium shot): The final pour-over coffee is served in a ceramic mug on the wooden surface next to a small plate with a biscuit. Steam curls upward. A hand reaches in to pick up the mug. Warm golden hour lighting. Each frame includes a small timing indicator (0-3s, 3-6s, 6-9s, 9-12s) and a brief action note below. Clean cinematic thumbnail style with muted warm tones emphasizing the rich browns and ambers of coffee, soft sketchy outlines with selective color emphasis on the coffee elements. Storyboard sequence, film shot planning, advertising storyboard.
```

### 示例 3
**用户输入：** 电影追逐戏故事板，6 格，主角在小巷中奔跑躲避追兵，紧张氛围，低角度镜头
**Prompt：**
```
A professional storyboard sequence of 6 frames arranged in a 3-column by 2-row grid layout, depicting a tense chase scene through narrow alleyways. Frame 1 (top-left, low-angle wide shot): A figure sprints away from the camera down a narrow brick alley at night. Motion blur lines trail behind the runner. The alley walls tower overhead with fire escapes and dangling wires visible above. A single flickering streetlamp casts dramatic long shadows. Frame 2 (top-center, medium tracking shot): The runner ducks under a low-hanging clothesline with laundry, the fabric whipping past. Behind the runner in the background, two shadowy pursuer silhouettes round the corner at the far end of the alley. Frame 3 (top-right, close-up action shot): The runner leaps over a pile of cardboard boxes, caught mid-air. The face shows determination — gritted teeth, focused eyes. One hand pushes off a brick wall for extra height. Debris and dust particles float in the air. Frame 4 (bottom-left, POV shot): First-person perspective as the runner turns a sharp corner — a dead end with a tall chain-link fence ahead. Hands reach up to grab the fence top. The pursuers' footsteps are visible approaching from behind as shadow reflections on the wall. Frame 5 (bottom-center, low-angle shot): The runner is mid-climb on the fence, one leg already over the top, fingers straining on the chain links. Metal fence links bend slightly under the weight. The pursuers appear at the bottom of the frame, reaching up but too late. Frame 6 (bottom-right, high-angle wide shot): From the top of the fence, looking down — the runner drops onto the other side into a rooftop area with a city skyline in the background. The pursuers are small figures at the bottom of the fence, unable to follow. Dramatic night sky with moonlight creating rim lighting. Each frame has camera direction notes (pan right, track forward, quick cut) and timing estimates. Dark moody pencil and marker style with strong contrast, deep shadows, and selective blue moonlight highlights conveying tension and urgency. Storyboard sequence, film shot planning, advertising storyboard.
```

## 质量后缀
```
storyboard sequence, film shot planning, advertising storyboard
```

## 注意事项
- **镜头语言**：每格要标注景别（远景/中景/近景/特写）和角度（俯视/平视/仰视）
- **时间标注**：故事板对应的是时间线，标注每段的大致时长
- **运动方向**：用箭头标注镜头运动方向（推拉摇移）和角色运动方向
- **关键帧原则**：不必画出每一帧，只画关键动作转折点
- **光影提示**：用简单阴影标注光源方向和阴影范围
- **情绪传递**：追逐/紧张场景用斜线和低角度，温馨场景用暖色和平视
- **竖屏适配**：短视频故事板要用 9:16 竖屏构图
- **对白精简**：故事板中的对白只写关键词，不必完整
