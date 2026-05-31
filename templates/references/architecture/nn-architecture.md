# 神经网络架构图 — Neural Network Architecture Diagram

## 适用场景
深度学习模型架构图、神经网络结构可视化、Transformer/ResNet/CNN 等模型示意、模型结构论文配图。

## Prompt 结构
```
A professional neural network architecture diagram illustrating {model name/description}. The architecture consists of {number} layers/blocks arranged in a {layout: vertical stack / horizontal flow} pattern. Each layer type is represented by a distinct shape and color: {layer type descriptions}. Connections between layers are shown as {connection style: solid lines / flowing curves / arrows} indicating {data flow direction}. The input enters from the {top/left} and the output exits at the {bottom/right}. The diagram uses a {color scheme} color palette. Background is {background style}. Clean, publication-quality technical illustration, suitable for academic papers and deep learning documentation. Vector-like rendering, precise geometry, no watermark, no text artifacts.
```

## 示例

### 示例 1
**用户输入：** Transformer 编码器架构：输入嵌入 → 多头自注意力 → 层归一化 → 前馈网络 → 层归一化 → 输出
**Prompt：**
```
A professional neural network architecture diagram illustrating the Transformer encoder block. The architecture flows from top to bottom through 6 stages. At the top, a wide rectangular "Input Embedding" block in light blue. Below it, a "Multi-Head Self-Attention" block in purple with 8 parallel curved lines inside representing attention heads, each line connecting the same input positions to different output positions with varying thickness. Below that, a "Layer Normalization" block in light green, depicted as a thin horizontal bar. Then a "Feed-Forward Network (FFN)" block in orange, shown as two sub-layers (linear → ReLU → linear) with a small expansion arrow in the middle. Below that, another "Layer Normalization" block in light green. At the bottom, an "Output" block in dark blue. Residual connections are shown as curved bypass arrows that skip around each sub-block and rejoin via small circle junction nodes, labeled with "+" symbols for element-wise addition. Small downward arrows between each block indicate the data flow direction. The entire encoder block is enclosed in a subtle dashed boundary rectangle labeled "Encoder Layer × N". The background is white with a very faint neural-network-pattern texture. Clean flat design with rounded rectangles, consistent spacing, and a professional color palette (blue-purple-green-orange). Publication-quality technical illustration, suitable for the "Attention Is All You Need" paper, vector-like rendering, no watermark, no text artifacts.
```

### 示例 2
**用户输入：** ResNet-50 残差网络：Conv1 → Max Pool → 4 个 Stage（每个含多个残差块）→ Global Average Pool → FC → Softmax 输出
**Prompt：**
```
A professional neural network architecture diagram illustrating the ResNet-50 residual network architecture. The diagram flows from left to right in a compact, layered style. On the far left, a 224×224 input image thumbnail feeds into a "Conv1 (7×7, 64 filters)" block in dark blue, then a "Max Pool (3×3)" block in slightly lighter blue. The main body consists of 4 stacked stage columns, each progressively taller to represent increasing channel dimensions: Stage 1 (64 channels, 3 blocks) in green, Stage 2 (128 channels, 4 blocks) in teal, Stage 3 (256 channels, 6 blocks) in orange, and Stage 4 (512 channels, 3 blocks) in coral red. Each residual block is shown as a small rectangle with a curved bypass arrow looping around it back to the block's output, labeled "identity mapping". Between stages, a small "downsample" arrow indicates spatial resolution reduction. After Stage 4, the flow continues to a "Global Average Pool" cylinder in purple, then a "Fully Connected (1000)" block in dark purple, and finally a "Softmax" output layer showing a small bar chart of class probabilities. A channel dimension scale runs along the bottom, showing the progressive increase from 64 → 128 → 256 → 512. The background is white with a subtle grid. Clean academic illustration style with consistent block sizing within stages, clear color progression by depth, vector quality, suitable for CVPR/ICCV paper figures, no watermark, no text artifacts.
```

### 示例 3
**用户输入：** CNN 卷积神经网络：输入图像 → 卷积层 → ReLU → 池化层 → 卷积层 → ReLU → 池化层 → 全连接层 → 输出分类
**Prompt：**
```
A professional convolutional neural network (CNN) architecture diagram. The network flows from left to right, starting with a colorful 3D input image cube (32×32×3 RGB) on the far left. The first "Conv Layer" is shown as a green 3D rectangular prism with small filter kernels (3×3 matrices) shown hovering above it, with connecting lines illustrating the sliding window operation. A "ReLU" activation is a thin yellow vertical slice. The first "Max Pool (2×2)" is a smaller blue 3D prism, visually reduced in height and width to show spatial downsampling. This pattern repeats for a second Conv-ReLU-Pool stack with an orange conv prism, yellow ReLU slice, and a smaller blue pool prism. Between each conv block, small label badges show the tensor dimensions: "32×32×32" → "16×16×32" → "8×8×64" → "4×4×64". After the pooling stages, the 3D prisms flatten into a "Flatten" arrow leading to a "Fully Connected" layer shown as interconnected circles (neurons) in purple — 128 neurons connected by a dense web of thin lines. A final purple neuron cluster of 10 output units sits at the far right, representing the 10 class probabilities. The background is white. The style is clean 3D-isometric for the conv blocks and flat for the FC layers, with consistent spacing, dimension labels, and arrow connectors. Technical textbook illustration quality, suitable for deep learning course materials and papers, vector rendering, no watermark, no text artifacts.
```

## 质量后缀
```
neural network architecture diagram, deep learning model visualization, publication-quality technical illustration, clean geometric layout, vector-like rendering, academic paper style, precise layer connections, high resolution
```

## 注意事项
- 层结构要清晰，不同类型层用不同形状和颜色区分
- 节点连接要明确，数据流向从左到右或从上到下
- 残差连接（skip connection）用曲线绕过子模块，标注 "+" 符号
- 张量维度变化可以标注在模块旁边（如通道数、空间尺寸）
- 卷积核操作可以用小矩阵示意
- 全连接层用神经元网络圆点+连线表示
- 适合学术论文、课程教材、技术文档
- 输出分辨率建议 2048x1152（16:9）或 2048x2048
