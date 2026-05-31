# chat-ui — 聊天界面

## 适用场景
即时通讯应用对话页、客服聊天界面、群组聊天窗口。

## Prompt 结构
```
A mobile chat conversation UI mockup, [conversation type: 1-on-1 / group], [layout: header with avatar + name, message bubbles, input area], [color scheme], [message variety], [quality suffix], [aspect ratio]
```

## 示例 1
**用户输入：** 微信风格 1v1 聊天
**Prompt：**
```
A mobile instant messaging conversation screen UI mockup, clean light gray background, top header bar showing a contact avatar on the left, contact name, and online status indicator with green dot, message area with alternating speech bubbles: incoming messages as white bubbles aligned left with small contact avatar, outgoing messages as green bubbles aligned right, varied message lengths including short text messages and longer paragraphs, some messages containing emoji, one message with an embedded image thumbnail, timestamps shown between message groups in small gray text, bottom input area with voice button, text input field with rounded corners, emoji picker icon, camera icon, and green send button, subtle keyboard visible above input bar, chat app UI design, messaging interface, conversation screen, instant messaging app, clean modern design, iOS-style aesthetics, professional UI/UX design --ar 9:16
```

## 示例 2
**用户输入：** 群组聊天界面
**Prompt：**
```
A mobile group chat conversation screen UI mockup, light gray background, top header bar with group avatar, group name "Project Team", and member count "(8 members)", message area with colorful round avatars on the left of each incoming message, white speech bubbles with sender names in colored text above each bubble, varied message types including text messages, file attachments shown as document cards with file icons and names, image messages with rounded thumbnails, system messages like "User joined the group" in centered gray italic text, outgoing messages as blue bubbles aligned right without avatar, bottom input bar with text field, attachment paperclip icon, camera icon, and blue send button, chat app UI design, messaging interface, conversation screen, group chat design, modern collaboration tool, professional UI/UX design --ar 9:16
```

## 示例 3
**用户输入：** 客服聊天窗口
**Prompt：**
```
A mobile customer service chat interface UI mockup, white background, top header bar with a branded bot avatar, "Customer Support" title, and "Typically replies in minutes" subtitle in gray, welcome message from the bot in a white bubble with company logo, suggested quick reply buttons displayed as horizontally scrollable pill-shaped buttons below the welcome message, user responses shown as blue bubbles aligned right, bot responses include structured elements like order status cards with tracking number and progress bar, satisfaction rating prompt with star icons, clean input bar at bottom with text field and send button, professional support chat design, chat app UI design, messaging interface, customer service chatbot, modern support UI, professional UI/UX design --ar 9:16
```

## 质量后缀
```
chat app UI design, messaging interface, conversation screen, instant messaging app, clean modern design, professional UI/UX design
```

## 注意事项
- **气泡对话**：入消息居左（白/灰底），出消息居右（品牌色底）
- **输入框**：底部常驻，包含文本输入、发送按钮、附加功能按钮
- **头像列表**：群聊中每个消息旁显示发送者头像和名字
- **时间戳**：消息之间的时间段用灰色小字分隔显示
- **消息类型**：文本、图片、文件、链接预览、系统消息等多样化
- **状态指示**：正在输入、已送达、已读等状态图标
- **留白**：消息间距舒适，避免拥挤
