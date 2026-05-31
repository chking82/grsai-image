# Character Relations Diagram — 角色关系图

## 适用场景
游戏角色关系图、小说/动漫人物关系可视化、剧本角色网络、IP 世界观展示。帮助观众快速理解角色之间的联系。

## Prompt 结构
```
A character relationship diagram for {story/world description}, featuring {number} characters arranged in a {layout — circular/network/clustered} composition. Each character is shown as {portrait style — illustrated bust/icon/circular avatar}. {Relationship connection styles — colored lines/arrows/dashed lines} indicate {relationship types}. {Background style}. Character relationship diagram, visual relationship map, character connection chart --ar 16:9
```

## 示例

### 示例 1
**用户输入：** 游戏角色关系图，RPG 冒险小队 5 人，标注同伴、恋人、师徒关系，奇幻风格插画
**Prompt：**
```
A character relationship diagram for a fantasy RPG adventure party, featuring five characters arranged in a pentagonal network layout with a dark parchment-textured background. Each character is represented by a detailed illustrated bust portrait within a circular ornate gold frame. Top center: The Hero — a young man with brown spiky hair, a scar on his left cheek, wearing silver armor with a blue cape, determined expression. Top-left: The Mage — an elderly woman with long white hair, crystal staff, wise calm expression, deep blue robes with star patterns. Top-right: The Archer — a young elf woman with pointed ears, long green hair in a braid, bow slung across back, confident smirk, green leather armor. Bottom-left: The Healer — a gentle-looking young woman with blonde hair in a bun, white and gold cleric robes, soft smile, a small holy symbol pendant. Bottom-right: The Rogue — a lean man with dark hair covering one eye, black hooded outfit, mysterious half-smile, twin daggers visible at the belt. Relationship connections are shown as colored lines between character circles: thick blue solid line between Hero and Archer labeled "Companions" (恋人/romantic partners). Thick gold dashed line between Mage and Healer labeled "Master & Apprentice" (师徒). Thin grey solid lines connect Hero to all other members labeled "Party" (同伴). A red dotted line connects Rogue to Healer labeled "Secret Protector" (暗中保护). Each connection line has a small icon — hearts for romance, a book for master/apprentice, crossed swords for party members, a shield for protection. The background is a dark textured parchment with faint magical circle patterns, subtle vignette darkening at edges. Each character circle has their class name below in a medieval-style font. Character relationship diagram, visual relationship map, character connection chart.
```

### 示例 2
**用户输入：** 家庭剧人物关系，一个大家族 8 人，三代同堂，标注血缘/婚姻/矛盾关系
**Prompt：**
```
A character relationship diagram for a multi-generational family drama, featuring eight characters arranged in three horizontal rows by generation on a warm cream background with subtle watercolor wash. Generation 1 (top row, 2 characters): Grandfather — an elderly stern man with grey hair and a mustache, wearing a formal suit, arms crossed; Grandmother — a kind-faced elderly woman with grey hair in a bun, wearing a floral dress, holding a teacup. A thin solid line connects them labeled "Married 50 years". Generation 2 (middle row, 3 characters): Eldest Son — a middle-aged man with receding hairline, business suit, stressed expression; Daughter — a woman in her 40s with shoulder-length black hair, elegant dress, warm smile; Youngest Son — a man in casual clothes, unshaven, artistic look, holding a paintbrush. Solid blue lines connect each child to both parents labeled with their relationship (长子/长女/幺子). A red broken line connects Eldest Son and Youngest Son labeled "Conflict" (矛盾) with a small lightning bolt icon. Generation 3 (bottom row, 3 characters): Granddaughter — a teenager with long hair, school uniform, headphones around neck, rebellious expression; Grandson — a young boy (age 8) with messy hair, holding a soccer ball, big smile; Baby — an infant being held (no portrait, just a crib illustration). Lines connect each grandchild to their parent. A green heart-shaped line connects the Daughter to the Granddaughter labeled "Close bond". Small circular character portraits with soft watercolor style, warm family-oriented color palette with each generation having a subtle color coding — warm gold for Generation 1, blue for Generation 2, green for Generation 3. Clean organized layout with relationship labels in both Chinese and English. Character relationship diagram, visual relationship map, character connection chart.
```

### 示例 3
**用户输入：** 侦探小说角色关系图，中心是被害人，周围是 6 个嫌疑人，用线连接并标注动机
**Prompt：**
```
A character relationship diagram for a murder mystery novel, featuring a central victim portrait surrounded by six suspect portraits arranged in a circular pattern on a dark moody background with a subtle dark blue gradient. Center: The Victim — a wealthy middle-aged businessman in an expensive suit, confident arrogant expression, diamond ring visible on his finger. His portrait is slightly larger than the others with a subtle red border indicating his status as the victim. Six suspects arranged around him in a circle, each in a circular portrait with illustrated bust style: Suspect 1 (top) — The Wife, an elegant woman in her 30s with blonde hair, diamond necklace, cold expression. Connected to victim with a red jagged line labeled "Marriage failing / Inheritance motive". Suspect 2 (top-right) — The Business Partner, a nervous-looking man in glasses, sweating, loosened tie. Connected with an orange dashed line labeled "Embezzlement discovered / Financial motive". Suspect 3 (bottom-right) — The Secretary, a young woman with red lipstick, ambitious expression, holding files. Connected with a yellow dotted line labeled "Blackmail threat / Career motive". Suspect 4 (bottom) — The Rival CEO, a confident man in a sharp suit, smug expression. Connected with an orange solid line labeled "Business competition / Corporate motive". Suspect 5 (bottom-left) — The Estranged Son, a young man with tattoos, angry expression, leather jacket. Connected with a red solid line labeled "Disinherited / Emotional motive". Suspect 6 (top-left) — The Butler, an elderly distinguished man, calm unreadable expression, white gloves. Connected with a thin grey line labeled "Loyalty unknown / Hidden motive". Each connection line has a small evidence icon — a dollar sign for financial motives, a broken heart for emotional motives, a document for blackmail. The overall aesthetic is dark and atmospheric — a film noir detective mood with deep blues, warm amber accents, and dramatic lighting on each portrait. Character relationship diagram, visual relationship map, character connection chart.
```

## 质量后缀
```
character relationship diagram, game character connection chart, visual relationship map
```

## 注意事项
- **布局清晰**：角色之间的物理位置应该暗示关系亲疏——相关角色放一起
- **连线区分**：不同类型的关系用不同颜色/线型（实线=强关系，虚线=弱关系，红色=冲突）
- **头像一致**：所有角色的头像风格、大小、边框要统一
- **标签简洁**：关系标签用 2-4 个字的关键词，不要写长句子
- **中心角色**：最重要的角色放中心或顶部，用更大头像或不同边框强调
- **信息密度**：8-12 个角色是上限，太多会变成蜘蛛网看不清
- **图例说明**：复杂关系图需要在角落添加图例（颜色/线型含义）
- **背景不要抢**：深色背景配亮色连线效果好，但背景要足够低调
