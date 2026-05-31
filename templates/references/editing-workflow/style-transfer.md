# Style Transfer — 风格转换

## 适用场景
照片转插画风格、照片转水彩/油画效果、写实转扁平化设计、产品图转手绘风格。用于改变画面的艺术表现风格。

## Prompt 结构
```
A {subject/scene description} reimagined as a {target art style — watercolor painting/flat illustration/oil painting/colored pencil sketch/ink wash painting}. {Style characteristics — brush strokes/color bleeding/line art/hatching}. {Color palette adaptation}. {Overall artistic mood}. Style transfer, photo to illustration conversion, artistic style adaptation --ar 4:5
```

## 示例

### 示例 1
**用户输入：** 照片转水彩风格，城市街景照片转为透明水彩画效果，有色彩晕染和纸张纹理
**Prompt：**
```
A charming European city street scene reimagined as a transparent watercolor painting on cold-press watercolor paper with visible paper texture. The scene shows a narrow cobblestone street lined with colorful multi-story buildings — warm ochre yellow, terracotta orange, and soft pink facades with white-framed windows and flower boxes overflowing with red geraniums. At the end of the street, a small church tower rises above the rooftops against a pale blue sky. The watercolor technique is clearly visible — colors bleed softly into each other at the edges creating characteristic watercolor blooms and halos, especially where the warm building colors meet the blue-grey cobblestone street. The paint has pooled in some areas creating darker concentrated pigment (wet-on-wet technique) while other areas show the white of the paper showing through (dry brush technique). Fine ink line work in dark brown outlines the key architectural elements — window frames, roof edges, the church tower — but the lines are loose and sketchy rather than precise, with varying line weight suggesting a fountain pen. The sky is a light blue wash with subtle horizontal brush strokes, and white paper areas left unpainted represent clouds. The cobblestone street is suggested with quick horizontal strokes of blue-grey wash, individual stones implied rather than precisely drawn. A few figures walking in the distance are suggested with minimal ink marks — just enough to indicate human presence. The overall palette is warm and inviting with the characteristic luminous quality of transparent watercolor where light reflects through the pigment layers off the white paper. Loose sketchy watercolor painting aesthetic on textured paper with visible deckled edges. Style transfer, photo to illustration conversion, artistic style adaptation.
```

### 示例 2
**用户输入：** 产品照片转扁平插画风格，咖啡杯和产品包装转为简洁的扁平化矢量插画
**Prompt：**
```
A flat vector illustration style rendering of a specialty coffee product setup, reimagined as a clean minimalist illustration with solid colors and no gradients or shadows. The scene shows a coffee cup, a bag of coffee beans, and some scattered coffee beans arranged on a surface, all rendered in a flat illustration style similar to modern corporate illustration design. The coffee cup is a simple geometric shape — a slightly tapered cylinder in solid warm brown (#8B6914) with a C-shaped handle in the same color, no highlights or shading, flat uniform color throughout. The coffee inside the cup is shown as a flat dark brown oval (#3E2723) at the top opening. A small white rectangle on the cup side represents a label area with two thin brown horizontal lines suggesting text. The coffee bag behind the cup is a simple rectangular pouch shape in deep green (#2D5A27) with a flat yellow circle logo in the center containing a simplified coffee bean icon in brown, and a flat white text area below the logo with three horizontal lines of varying lengths suggesting product information. Five individual coffee beans are scattered around the base — each a simple oval shape in dark brown with a lighter brown center line, all the same size and orientation. The surface beneath everything is a flat cream-colored rectangle (#F5F0E8). The background is pure white with no gradient or texture. All elements use solid flat colors with no gradients, no shadows, no highlights, no texture — clean geometric shapes with bold simple forms. The illustration uses a limited color palette of approximately 6 colors (cream, warm brown, dark brown, deep green, yellow, white) creating a cohesive unified look. Modern flat vector illustration aesthetic suitable for web and mobile design. Style transfer, photo to illustration conversion, artistic style adaptation.
```

### 示例 3
**用户输入：** 人像照片转彩色铅笔素描风格，保留人物特征，手绘质感明显
**Prompt：**
```
A portrait of a young woman with long dark hair reimagined as a colored pencil sketch on textured drawing paper with visible tooth/grain of the paper showing through. The woman has a gentle smile looking slightly to her left, with her head tilted at a slight angle and her right hand lightly touching her chin in a thoughtful pose. The colored pencil technique is clearly visible throughout — individual pencil strokes can be seen as short directional marks that follow the contours of the face, with overlapping layers of color building up the skin tones (warm peach, pink, and light brown strokes layered to create natural skin color). The hair is rendered with long flowing strokes of dark brown and black pencil marks, with the characteristic colored pencil look of individual visible strokes creating texture rather than smooth uniform coverage. The eyes are drawn with sharper darker pencil strokes — the iris is built up with layers of warm brown pencil marks, the pupil is the darkest concentration of black pencil, and tiny white paper areas are left untouched as catchlights. The lips are rendered in soft rose pink with the characteristic colored pencil technique of layering light pink over peach to create depth. The hand touching the chin shows the characteristic simplified detail level of colored pencil portraiture — the overall shape and proportions are accurate but fine details like fingernail texture are suggested with a few strokes rather than precisely rendered. The background is left mostly as the textured off-white drawing paper with a few very light blue pencil suggestion strokes suggesting a simple abstract wash of color behind the head. The visible paper texture (the grain/tooth of the paper catching the pencil pigment) is a key characteristic visible throughout, giving the portrait a warm handmade quality. The edges of the portrait are slightly soft and sketchy where the pencil strokes fade into the paper, rather than hard precise outlines. Warm hand-drawn colored pencil portrait aesthetic on textured cream drawing paper. Style transfer, photo to illustration conversion, artistic style adaptation.
```

## 质量后缀
```
style transfer, photo to illustration conversion, artistic style adaptation
```

## 注意事项
- **风格特征明显**：水彩的晕染、油画的笔触、扁平的纯色——每种风格的标志性特征要突出
- **保留识别度**：风格转换后，主体内容仍然要可识别——不能为了风格牺牲内容
- **媒介质感**：纸张纹理、画布纹理、屏幕像素感——媒介本身的质感是风格的重要组成部分
- **色彩简化**：风格转换通常意味着色彩简化——从百万色减少到几十色甚至几色
- **细节取舍**：不是所有细节都要保留——水彩不画毛孔，扁平不画阴影
- **笔触方向**：油画和水彩的笔触方向要跟随物体的形态（如脸部的笔触顺着面部轮廓）
- **统一性**：画面中所有元素都要转换到同一风格——不能主体是水彩，背景是照片
- **多次尝试**：不同风格可能需要不同的 prompt 描述方式，建议多试几种描述
