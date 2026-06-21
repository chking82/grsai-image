# 模板：社交平台截图/直播界面

## 适用场景
用户要求生成社交平台内容截图（小红书/抖音/微博/朋友圈/X/B站）、直播界面截图（带货/才艺直播）、聊天截图等高仿真界面图。

## 需求收集清单

| 字段 | 类型 | 必填 | 选项/说明 |
|------|------|------|----------|
| platform | select | ✅ | 小红书/抖音/快手/微博/朋友圈/X(Twitter)/B站/微信 |
| scene_type | select | ✅ | 内容贴文/信息流/直播带货/才艺直播/聊天对话 |
| theme | select | ❌ | 深色模式/浅色模式 |
| content | text | ✅ | 正文内容（含指定中文文字） |
| account | text | ❌ | 账号信息：头像描述/用户名/认证标识 |
| interaction | text | ❌ | 互动数据：点赞/评论/转发/收藏数量 |
| ratio | select | ❌ | 9:16(手机) / 3:4 / 1:1 |

## Prompt 生成器（Meta-Prompt）

```
你将扮演"社交平台截图提示词生成器"。
任务：根据用户需求，生成一段高仿真社交/直播界面截图提示词。

按 6-Block 协议构建：
1. 主体任务：明确平台 + 场景类型（贴文/信息流/直播/聊天）+ 深浅模式
2. 构图布局：手机截图比例，顶部/中部/底部界面元素分区
3. 风格材质：平台视觉特征（见平台特征表），真实截图质感
4. 文字标签：账号信息、正文、互动数据，全部写死指定中文，引号包裹
5. 比例输出：固定 9:16 / 3:4 / 1:1
6. 约束负面：文字必须准确、禁乱码占位、界面元素不遮挡主体

最终输出英文主体 + 原样保留的中文文字。
```

### 平台特征表（生成前必须锁定，否则模型会混搭）
- **X (Twitter)** → 蓝勾认证、转发/引用区分、点赞/转发/书签图标行
- **抖音** → 右侧竖排图标（头像+关注/点赞/评论/分享）、左下账号文案、底部音乐碟片旋转
- **小红书** → 双列瀑布流封面、标题+正文+话题标签、底部点赞收藏评论
- **微博** → 转发/评论/点赞三栏、话题蓝字、九宫格配图
- **微信朋友圈** → 头像+昵称+正文+九宫格、底部点赞评论灰色卡片
- **B站** → 三连图标（点赞/投币/收藏）、弹幕、UP主信息
- **微信聊天** → 绿色气泡(自己)/白色气泡(对方)、头像、时间戳

### 直播界面 UI 叠加层（按直播类型选）
- **带货直播**：顶部主播头像+关注+在线人数+热值；右上角商品列表卡片；左下弹幕；底部输入框+购物车图标
- **才艺直播**：顶部主播信息+排名；左下弹幕滚动；中部/右下礼物特效+PK进度条；底部功能图标
- 主播：姿态（坐姿/站立/动作）、服装、直播间背景、灯光（暖/冷/混合）

## ⚠️ 避坑指南

- **先定平台再填细节**：截图区分平台特征（见上表），生成前必须指定平台，否则模型会把抖音音乐碟片画到小红书上。
- **强制文字锁定**：要求"文字绝对可读，必须显示指定的中文，禁止乱码和占位文本"，避免火星文按钮。
- **直播先定类型**：带货直播（右上角商品列表）和才艺直播（重弹幕互动）UI 布局差异大，先锁直播类型再填细节。
- **界面元素不遮主体**：明确弹幕/礼物特效"不遮挡主播面部"。
- **比例固定写最前**：手机截图固定 9:16，特殊屏幕（车机 21:9）比例必须写在 prompt 最前面。

## 示例

**用户输入：** 生成一张小红书的探店笔记截图，标题"这家咖啡店绝了☕"

**生成 Prompt：**
```
A Xiaohongshu (Little Red Book) app content screenshot, light mode, 3:4 mobile aspect ratio, authentic app UI texture.
Layout: top status bar and navigation, large cover photo of a cozy coffee shop interior occupying the upper 55%, title and body text below, topic tags, bottom interaction bar with like/collect/comment icons.
Account info: round avatar of a young woman, username "小café日记", with follower-style badge.
Title text (render exactly): "这家咖啡店绝了☕"
Body text (render exactly): "藏在巷子里的宝藏小店，手冲超惊艳，氛围感拉满，姐妹们冲！"
Topic tags (render exactly): "#探店 #咖啡 #周末去哪儿"
Interaction data: like "1.2万", collect "3506", comment "289".
Style: realistic Xiaohongshu UI screenshot, double-column-feed visual language, clean modern mobile interface, soft warm tones.
Constraints: text must be accurate and readable, no gibberish or placeholder text, UI elements not blocking the cover photo, fixed 3:4 ratio.
```

**推荐参数：**
- model: gpt-image-2-vip
- imageSize: 1728x2304（3:4）/ 1152x2048（9:16）
- 备选：含密集中文且 vip 出错字 → nano-banana-2
