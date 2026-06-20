---
name: grsai-image
description: GRS AI 图片生成技能 — 意图识别、模板匹配、需求收集、提示词审核、图片生成与交付
homepage: https://grsai.ai/
metadata:
---

# grsai-image — GRS AI 图片生成

通过 GRS AI API 进行图片生成，包含完整的业务逻辑工作流。

---

## 触发规则

### 一级触发（明确图片需求）
用户表达中直接包含图片生成意图，满足以下**任意一条**即激活：

| 触发词/短语 | 示例 |
|-----------|------|
| 画/画一/画张/画个 | "帮我画一张图" |
| 生成图/生成图片/生成头像/生成海报 | "生成一张产品图" |
| 做图/做张图/做图片 | "做张海报" |
| 文生图 | "文生图：一只猫" |
| 配图/插图/插画 | "帮我画张插画" |
| 设计图/设计一个… | "设计一个 logo" |

### 二级触发（具体图片类型）
用户提到以下具体类型时，激活并**直接匹配对应模板**：

| 关键词 | 匹配模板 |
|--------|---------|
| 头像/肖像/avatar | portrait |
| 海报/banner/封面 | poster |
| 产品/商品/展示图 | product |
| 图标/icon/按钮/UI | ui-element |
| 角色/吉祥物/IP/mascot | character |
| 架构图/流程图/数据流/方法论 | academic |
| 壁纸/wallpaper/背景图 | poster |
| 表情包/emoji/表情 | ui-element |

### 三级触发（隐含图片需求）
PPT 配图、封面图、缩略图、社交媒体配图、文章配图。

### 排除规则
编辑/修改已有图片、查看/读取图片内容、截图/录屏、拍照 → **不激活**。

### 激活后行为
1. 从 `templates/registry.json` 匹配最佳模板
2. 按模板的需求清单引导用户
3. 生成 prompt → 审核 → 调用脚本生成 → 交付

---

## 工作流总览

```
1. 意图识别 & 模板匹配
2. 需求收集（按模板需求清单逐项确认）
2.5 信息量评估 & 多图拆分（信息太多/太密 → 拆成多张系列图）
3. 生成提示词 + 推荐参数
4. 用户审核确认 ⚠️ 必须步骤
5. 调用 generate.sh 脚本生成图片（多图逐张确认）
6. 交付结果（下载到本地 → 飞书发送）
```

---

## 步骤 1：意图识别 & 模板匹配

读取 `templates/registry.json`，根据用户描述中的关键词匹配模板。
- 在 `keywords` 数组中搜索用户描述的关键词
- 按 `priority` 排序，数字越小优先级越高
- 无匹配时使用 `generic` 兜底模板

---

## 步骤 2：需求收集

按模板的需求清单逐项收集信息。

**收集策略：**
- 用户一次性提供了所有信息 → 直接提取
- 用户提供了部分信息 → 确认已有的，询问缺失的
- 用户只说模糊需求 → 按模板逐项引导

**参考图处理：**
1. 用 `image` 工具分析参考图风格/构图/色调
2. 分析结果写入 prompt
3. 调用 API 时传 `images` 参数（图生图）

---

## 步骤 2.5：信息量评估 & 多图拆分 ⚠️

> 来源经验 LRN-20260621-001：一张图硬塞太多信息 → 文字密集、易糊字、观感差。**信息太多就拆多张系列图。**

### 何时拆分（命中任一即建议拆）
- 信息要点 / 板块（module）**超过 5-6 个**
- 单图需要承载**完整流程 / 长时间线 / 多阶段叙事**（如全程历史、产品全功能、多步教程）
- 文字密度高：每个板块都需要标题+多行描述+多个数据点
- 用户已反馈「文字太密」或「内容太多」

### 拆分原则
1. **每张 4-5 个板块封顶**，宁可多一张也不要挤。
2. **按自然逻辑切**：时间阶段（PART 1/2/3）、主题分类、流程步骤、总分结构。
3. **统一视觉规格**：所有分图共用同一套 model / 比例 / 配色 / 字体 / 版式，组成系列。
4. **标题带系列标记**：如 `PART 1 · xxxx`、`1/3`，让多张图一眼成套。
5. **图文结合优先**：板块多时用「大场景插画 + 精简文字」替代纯文字卡片，降低密度（见步骤 3 规则）。

### 拆分前先和用户确认
报方案：拆几张、每张主题、每张几个板块，等用户确认（或同意「全程拆 N 张」）再逐张生成。

### 生成与交付
- 多张图**逐张生成、逐张确认**第一张质量过关后再批量产其余（或并行生成，统一发）。
- 文件命名体现序号：`{topic}_part1.png` / `part2` / `part3`。
- 交付时按顺序发，附简短板块说明，让用户知道每张讲什么。

---

## 步骤 3：生成提示词 + 推荐参数

### Prompt 生成规则
1. 用户中文需求 → 按模板字段提取
2. 风格关键词替换为英文
3. 拼接完整英文 prompt
4. 补充质量关键词（high quality, detailed...）
5. **中文文字渲染**：gpt-image-2-vip 对中文支持良好，prompt 中直接包含中文标题/标签/短文案，用引号包裹
6. 用户明确要求含中文文字 → prompt 中原样嵌入，不翻译不替换拼音
7. **图文结合降密度**（LRN-20260621-001）：信息图/海报类，避免纯文字卡片堆砌。采用「顶部大场景插画（约 40% 高度）+ 每板块小插画 + 精简文字（一句描述+关键数据）」，文字量砍半，留白和呼吸感上来。prompt 里明写 `image-driven design, large illustrations with minimal concise text, not text-heavy cards`。
8. **敏感题材模型选择**（LRN-20260621-001）：军事/战争/政治敏感历史题材（如对越反击战），**gpt-image-2-vip 会主题级拦截**（连续 violation，脱敏到“纯历史知识图”仍被拦，别死磕）。→ 改用 **nano-banana-2**，实测能稳定出图且中文基本无错字。

### 参数推荐速查表

| 参数 | nano-banana 系列 | gpt-image-2 | gpt-image-2-vip |
|------|------------------|-------------|-----------------|
| aspectRatio | 比例如 `"16:9"` | 比例或 1K 像素值 | **1-4K 像素值**如 `"2048x2048"` |
| imageSize | `1K`/`2K`/`4K` | 不需要 | 不需要 |

### 分辨率 × 比例 → 像素值换算

使用 `scripts/param-converter.sh` 自动转换：
```bash
# 用法: ./scripts/param-converter.sh 分辨率 比例
./scripts/param-converter.sh 4K 16:9   → 3840x2160
./scripts/param-converter.sh 2K 1:1    → 2048x2048
./scripts/param-converter.sh 2K 3:4    → 1728x2304
```

### gpt-image-2-vip 像素值约束
- 最大边长 ≤ 3840px
- 两条边都必须是 16 的倍数
- 长边/短边 ≤ 3:1
- 总像素数：655,360 ~ 8,294,400

---

## 步骤 4：用户审核确认 ⚠️ 必须步骤

**调用 API 前必须展示并等待确认：**

```
📋 生成确认

🎨 提示词：
[英文 prompt]

⚙️ 参数：
- 模型：gpt-image-2-vip
- 分辨率：4K / 比例：3:4 → 像素值 2448x3264
- 模式：异步（预计 2-3 分钟）

确认生成？回复"确认"或"修改"。
```

**用户反馈处理：**
- "确认" / "好的" / "生成" → 进入步骤 4.5（prompt 归档）→ 步骤 5
- "修改" → 按意见更新后重新确认

---

## 步骤 4.5：Prompt 归档

用户确认后、调用脚本前，先归档 prompt：

```bash
mkdir -p ./grsai-prompts
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
PROMPT_FILE="./grsai-prompts/${TIMESTAMP}_${TEMPLATE_NAME}_${TOPIC_KEYWORD}.md"
```

归档文件内容：Time / Template / Model / Resolution / Aspect Ratio / Prompt / User Request

归档目录：`./grsai-prompts/`

---

## 步骤 5：调用 API 生成图片

### 使用 generate.sh 脚本

所有 API 调用统一使用 `scripts/generate.sh` 脚本：

```bash
# 同步生成（小图）
./scripts/generate.sh -m gpt-image-2-vip -p "prompt" -a 2048x2048

# 异步生成（4K 或大图，推荐）
./scripts/generate.sh -m gpt-image-2-vip -p "prompt" -a 3840x2160 --async

# 指定输出路径
./scripts/generate.sh -m gpt-image-2-vip -p "prompt" -a 2048x2048 -o ./output.png

# 参考图生图
./scripts/generate.sh -m gpt-image-2-vip -p "prompt" -a 2048x2048 --image url_or_base64

# 指定备用节点
./scripts/generate.sh -m gpt-image-2-vip -p "prompt" -a 2048x2048 -n https://grsaiapi.com
```

### 脚本配置

| 配置项 | 值 |
|--------|-----|
| 国内节点 | `https://grsai.dakka.com.cn`（优先）|
| 备用节点 | `https://grsaiapi.com`（国内失败时回退，不重复生成）|
| API Key | 自动从 `~/.bashrc` 提取 |
| curl 超时 | 300s（生图慢）|
| 输出目录 | `./output/` |
| 任务注册表 | `./grsai-tasks/`（防止重复提交）|
| 去重窗口 | 3600s（同一 prompt + 模型 + 比例，1h 内复用已有结果）|

### 错误处理

| 状态 | 处理 |
|------|------|
| `succeeded` | 下载图片，进入步骤 6 |
| `failed` | 告知用户失败原因，建议重试 |
| `violation` | 触发安全策略，建议修改 prompt |
| 超时 | 20 次轮询（5 分钟）后仍未完成 → 提示用户 |

---

## 步骤 6：交付结果

### 统一输出路径
所有图片保存到 `./output/`

### 文件命名
自动命名格式：`{时间戳}_{模型}_{序号}.png`
- 示例：`20260529_124500_gpt-image-2-vip_01.png`

### 交付流程
1. 脚本已自动下载图片到 `./output/`
2. 用 `message` 工具（action=send）+ attachments 发送到飞书
3. 告知用户生成完成

---

## API 端点参考

| 方法 | 路径 | 说明 |
|------|------|------|
| POST | `/v1/api/generate` | 生成图片 |
| GET | `/v1/api/result?id={task_id}` | 查询异步结果 |
| POST | `/v1/api/edit` | 图片编辑 |

### 支持的模型

**nano-banana 系列：** `nano-banana`, `nano-banana-fast`, `nano-banana-2`, `nano-banana-2-cl`, `nano-banana-pro`, `nano-banana-pro-vip`
- 参数：`aspectRatio`（比例）+ `imageSize`（1K/2K/4K）

**gpt-image-2 系列：** `gpt-image-2`, `gpt-image-2-vip`
- `gpt-image-2`：`aspectRatio` 可传比例或 1K 像素值
- `gpt-image-2-vip`：`aspectRatio` 传 1-4K 像素值，不支持比例，不需要 `imageSize`

---

## 模板管理

### 目录结构
```
templates/
├── registry.json        # 模板注册表
├── illustration.md      # 插画/配图
├── portrait.md          # 头像/肖像
├── product.md           # 产品图
├── poster.md            # 海报/Banner
├── ui-element.md        # UI 素材/图标
├── character.md         # 角色/吉祥物/IP
└── generic.md           # 通用兜底
```

### 管理命令
```bash
# 列出所有模板
./scripts/template-manager.sh list

# 查看模板详情
./scripts/template-manager.sh show illustration

# 搜索匹配的模板
./scripts/template-manager.sh search 插画

# 添加新模板
./scripts/template-manager.sh add food 美食 美食,食物,菜品 nano-banana-pro 4K 4:3

# 删除模板
./scripts/template-manager.sh remove food
```

---

## 最佳实践

1. **Prompt 用英文** — 英文提示词效果更好
2. **具体优于模糊** — "一只橘猫坐在窗台上看夕阳" > "一只猫"
3. **参考图是好帮手** — 有参考图时用图生图
4. **4K 需要耐心** — 异步模式，预计 2-3 分钟
5. **审核不可跳过** — 必须让用户确认 prompt 和参数
6. **中文文字** — gpt-image-2-vip 对中文渲染支持良好，prompt 直接包含中文

---

## 文件清单

| 文件 | 说明 |
|------|------|
| `SKILL.md` | 本文件：工作流说明 |
| `scripts/generate.sh` | 主生图脚本：API 调用、轮询、下载 |
| `scripts/param-converter.sh` | 参数转换：分辨率+比例 → 像素值 |
| `scripts/template-manager.sh` | 模板管理脚本 |
| `templates/registry.json` | 模板注册表 |
| `templates/*.md` | 各类型模板 |
