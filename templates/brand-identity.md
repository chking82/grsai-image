# 模板：品牌身份包/触点系统视觉板

## 适用场景
用户要求生成完整品牌身份系统、品牌触点视觉板、VI 应用展示、品牌提案页——不是单张 logo，而是一套覆盖产品/包装/物料/场景的统一视觉系统。

> 与 `logo.md` 区分：logo.md 做单个标识；本模板做整套品牌世界 + 多触点应用展示。

## 需求收集清单

| 字段 | 类型 | 必填 | 选项/说明 |
|------|------|------|----------|
| brand_name | text | ✅ | 品牌名称 |
| business | text | ✅ | 一句话业务描述 |
| industry | text | ✅ | 行业 |
| keywords | text | ✅ | 3-5 个品牌个性关键词 |
| feeling | select | ❌ | 触发感受：信任/兴奋/奢华/亲近/力量 |
| design_language | select | ❌ | 现代极简/日式留白/奢华编辑/科技品牌 |
| primary_color | text | ❌ | 主色 |
| touchpoints | text | ❌ | 要展示的触点（产品/包装/名片/菜单/场景） |

## Prompt 生成器（Meta-Prompt）

```
你将扮演"品牌身份系统视觉板生成器"。
任务：生成一张高端品牌触点系统视觉板，像顶级设计机构的提案页。

按 6-Block 协议构建：
1. 主体任务：品牌触点系统视觉板（非单张海报/logo），覆盖多个应用触点
2. 构图布局：主视觉 hero shot 最突出，辅助物料层级清楚，所有触点整齐但不死板，有品牌系统感
3. 风格材质：设计语言（现代极简/日式留白/奢华编辑/科技），主色+辅色，大量留白，细腻材质，真实阴影
4. 文字标签：品牌名、slogan 写死；微小文字清晰可读
5. 比例输出：16:9 或 4:3 提案页比例，4K
6. 约束负面：不要只生成一个 logo；不要把物料挤成杂乱拼贴；不要随机乱码文字；不要各物料风格割裂

触点系统必须包含：
- 主产品 hero shot
- 包装盒/手提袋/杯子/标签/贴纸/封签等品牌物料
- 菜单卡/价目表/小型排版样张
- 生活方式场景或用户使用片段
- 配色、字体、图形语言在不同触点上的统一应用
```

## ⚠️ 避坑指南

- **不要只生成一个 logo**：明确要求"一整套品牌应用展示"，含产品+包装+物料+场景多个触点。
- **先定关键词再出图**：先定义 3-5 个品牌关键词和气质，再要求视觉输出，结果更统一。
- **强制纯白/统一底**：物料展示底面用统一材质表面，方便整体感，避免各物料风格割裂。
- **物料别挤成拼贴**：要求"整齐但不死板，主视觉最突出，辅助物料层级清楚"，避免杂乱拼贴。
- **微小文字要可读**：菜单/标签上的小字明确"clean readable micro typography"，禁随机乱码。
- **品牌色只做点缀**：主色体现在细线、强调色、字体气质和光影里，不要大色块铺满。

## 示例

**用户输入：** 给一个精品咖啡品牌"野山café"做一套品牌视觉板

**生成 Prompt：**
```
A high-end brand touchpoint system visual board for a specialty coffee brand, like a top design agency proposal page, 16:9 layout.

Brand positioning: specialty boutique coffee, lifestyle.
Core keywords: 自然(natural), 治愈(healing), 手作(handcrafted).
Brand name (render exactly): "野山café"

Hero shot: a matte kraft coffee cup with minimal logo, placed on a warm light-wood surface with soft morning light and shallow shadow, as the most prominent visual.

Touchpoint system arranged cleanly around the hero (organized but not rigid, clear hierarchy):
- Packaging: kraft coffee bean bag, paper takeaway bag, cup sleeve, round sticker, sealing label
- Print: a minimal menu card and a small price-list sample with clean readable micro typography
- Lifestyle scene: a hand holding the coffee cup in a cozy cafe corner
- Consistent application of color, typography and graphic language across all items

Design language: modern minimal with Japanese negative space, primary color warm earthy brown, secondary color cream beige, generous white space, fine material texture (kraft paper, wood grain), realistic soft shadows.

Constraints: not just a single logo, items not crammed into messy collage, no random gibberish text, no clashing styles between packaging/menu/sticker, brand color used as accent not large blocks, 4K quality, premium agency proposal aesthetic.
```

**推荐参数：**
- model: gpt-image-2-vip
- imageSize: 3840x2160（16:9）/ 2304x1728（4:3）
