# Store Distribution Map — 商店分布图

## 适用场景
品牌门店分布展示、零售选址分析、招商提案、品牌影响力可视化。用于展示连锁品牌的市场覆盖。

## Prompt 结构
```
An illustrated store distribution map showing {brand/type} locations across {region/city/country}. The map displays {number} store locations marked with {marker style — brand icon/custom pin/dot with cluster}. {Density visualization — heat zones/cluster circles/individual pins}. {Base map style — simplified city/region outline}. Store distribution map, retail location visualization, chain store coverage map --ar 16:9
```

## 示例

### 示例 1
**用户输入：** 星巴克中国门店分布图，主要城市标注门店数量，用热力区域表示密度，商业信息图风格
**Prompt：**
```
An illustrated store distribution map showing Starbucks (星巴克) locations across China, designed as a professional business infographic style visualization. The map shows a simplified outline of China in light grey (#E0E0E0) with provincial borders shown as faint dashed lines. Store density is shown through a heat map overlay using circular gradient zones in Starbucks green (#00704A) — the darkest green circles indicate the highest concentration areas (Shanghai with 1000+ stores, Beijing with 800+), medium green for major cities (Guangzhou, Shenzhen, Chengdu, Hangzhou with 300-500 stores), lighter green for secondary cities (Nanjing, Wuhan, Xi'an with 100-200 stores), and small green dots for emerging market cities. Each major city has a green circular marker with the city name in Chinese and English, plus the store count in a small white badge below — "上海 Shanghai · 1000+", "北京 Beijing · 800+", "广州 Guangzhou · 400+", etc. The eastern coastal region is visibly dense with overlapping green circles, while the western region shows scattered individual dots. A small Starbucks cup icon (green with white siren logo simplified) appears next to each city label as a store marker. The map includes a legend in the bottom-right corner showing the density scale (1-50 / 50-200 / 200-500 / 500+ stores) with corresponding circle sizes and color intensities. A title bar at the top reads "STARBUCKS CHINA — STORE DISTRIBUTION 2026" in green uppercase letters. The overall background is clean white with a subtle grid pattern, giving it a modern data visualization aesthetic with brand-consistent green coloring throughout. Store distribution map, retail location visualization, chain store coverage map.
```

### 示例 2
**用户输入：** 便利店城市覆盖地图，上海全市范围，每个区标注门店密度，用不同大小的圆点表示
**Prompt：**
```
An illustrated store distribution map showing convenience store coverage across Shanghai, displaying every district with varying store density represented by sized circle markers. The map shows a simplified outline of Shanghai's administrative boundaries with the Huangpu River (黄浦江) clearly visible as a blue S-curve dividing the city. Each district is labeled and has a circular marker whose size corresponds to the number of stores in that district: the largest circle (representing 200+ stores) is over Pudong New Area (浦东新区) on the east side of the river; large circles (150+ stores) cover Huangpu District (黄浦区), Jing'an District (静安区), and Xuhui District (徐汇区) in the central urban core; medium circles (80-150 stores) cover Changning (长宁), Putuo (普陀), Hongkou (虹口), and Yangpu (杨浦); smaller circles (30-80 stores) cover the suburban districts of Minhang (闵行), Baoshan (宝山), Jiading (嘉定); and the smallest dots (10-30 stores) mark the far suburbs of Songjiang (松江), Qingpu (青浦), Fengxian (奉贤), and Jinshan (金山). The circles are semi-transparent so overlapping areas create darker tones, visually reinforcing density. Each circle is in the brand's signature orange (#FF6600) with the store count number displayed in white text at the center. The map background is a light grey (#F5F5F5) with major roads shown as thin white lines and parks in light green. The Huangpu River serves as a natural divider, with the concentration visibly heavier on the Puxi (west) side historically and growing rapidly in Pudong. A small inset map in the corner shows Shanghai's location within China for context. Clean modern infographic aesthetic with data-driven visual hierarchy, store distribution map, retail location visualization, chain store coverage map.
```

### 示例 3
**用户输入：** 全球科技品牌零售店分布图，50 个国家和主要城市，标注旗舰店和普通店，深色主题科技感
**Prompt：**
```
An illustrated store distribution map showing a global technology brand's retail store locations across 50 countries, designed with a dark futuristic theme conveying technological sophistication. The world map is rendered in dark navy (#0A1628) with country borders as subtle lighter blue lines (#1A2A4A). Store locations are marked with two types of indicators: large glowing starburst markers (✨) in bright cyan (#00D4FF) for flagship stores (approximately 30 locations in major global cities — New York, London, Tokyo, Shanghai, Paris, Sydney, Dubai, Singapore, etc.) and smaller solid white dots for standard retail stores scattered across the remaining locations. The flagship store markers pulse with a subtle glow effect, appearing as small light sources on the dark map. Major ocean routes connecting flagship stores are shown as thin dashed cyan lines suggesting global connectivity. Each continent has the store count displayed in a floating label — "North America: 45 stores", "Europe: 38 stores", "Asia Pacific: 52 stores", "Middle East & Africa: 12 stores", "Latin America: 8 stores" — positioned near the respective continent. A vertical sidebar on the right side shows a timeline of store openings by year with small horizontal bar chart visualization. The overall aesthetic is dark mode data visualization with glowing cyan accents on navy background, resembling a futuristic command center display, with subtle particle effects (small floating dots) in empty ocean areas adding depth and atmosphere. Store distribution map, retail location visualization, chain store coverage map.
```

## 质量后缀
```
store distribution map, retail location visualization, chain store coverage map
```

## 注意事项
- **密度可视化**：用圆圈大小/颜色深浅/热力图来表达门店密度差异
- **分级标注**：旗舰店/标准店/加盟店用不同图标区分
- **数据准确**：门店数量和时间点要标注清楚
- **参照物**：河流、海岸线、省界等地理参照物帮助定位
- **图例必备**：必须提供图例说明不同标记和颜色的含义
- **趋势暗示**：可以用箭头或不同颜色暗示增长/收缩趋势
- **品牌色**：使用品牌标准色作为地图主色调，增强品牌感
- **对比清晰**：浅色地图用深色标记，深色地图用亮色标记
