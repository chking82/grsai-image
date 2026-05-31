# grsai-image

通过 [GRS AI API](https://grsai.ai/) 进行图片生成，支持 `nano-banana` 和 `gpt-image-2` 系列模型。内置 15 个专业模板，覆盖插画、海报、产品图、Logo、架构图等常见场景。

## 获取 API Key

1. 访问 [GRS AI 官网](https://grsai.ai/) 注册账号
2. 进入 [API Keys 管理页](https://grsai.ai/zh/dashboard/api-keys)
3. 创建新 Key 并复制保存
4. 设置环境变量：

```bash
echo 'export GRSAI_API_KEY=sk-你的key' >> ~/.bashrc
source ~/.bashrc
```

## 快速开始

```bash
# 同步生成（小图）
./scripts/generate.sh -m gpt-image-2-vip -p "赛博朋克雨夜城市街景" -a 2048x2048

# 异步生成（4K 或大图）
./scripts/generate.sh -m gpt-image-2-vip -p "赛博朋克雨夜城市街景" -a 3840x2160 --async

# 参考图生图
./scripts/generate.sh -m gpt-image-2-vip -p "prompt" -a 2048x2048 --image url_or_base64
```

## 模板列表

15 个专业模板 + 129 个子模板引用，覆盖常见图片生成场景：

| 模板 | 适用场景 | 子模板数 |
|------|---------|---------|
| 插画/配图 | 插画、配图、艺术图 | 10 |
| 海报/Banner | 海报、封面、壁纸、社交媒体 | 22 |
| 产品图/商品图 | 产品展示、电商图、渲染 | 15 |
| 头像/肖像 | 头像、肖像照、虚拟主播 | 18 |
| 角色/吉祥物/IP | 角色设计、吉祥物、IP 形象 | 6 |
| 架构图/技术插图 | 系统架构、流程图、数据流 | 14 |
| 品牌/包装 | 品牌设计、产品包装 | 6 |
| Logo | 品牌 Logo、标识设计 | 6 |
| UI 界面 | App 界面、网页 Mockup、组件 | 15 |
| 地图 | 城市地图、旅游路线、美食地图 | 5 |
| PPT 素材 | PPT 封面、数据页、过渡页 | 7 |
| 分镜/漫画 | 故事板、四格漫画、绘本 | 6 |
| 图片编辑 | 背景替换、增强、风格迁移 | 6 |
| 参考图→模板 | 从参考图提取可复用模板 | — |
| 通用兜底 | 未匹配时的兜底模板 | — |

完整子模板清单见 [SKILL.md](SKILL.md) 工作流文档。

## API 参数说明

### 模型参数区别

| 模型系列 | aspectRatio | imageSize | 说明 |
|---------|-------------|-----------|------|
| **nano-banana** | 比例 `"16:9"` | `1K`/`2K`/`4K` | 两个参数都需要 |
| **gpt-image-2** | 比例或 1K 像素值 | 不需要 | 灵活 |
| **gpt-image-2-vip** | 1-4K 像素值 | 不需要 | 推荐，质量最高 |

```bash
# 像素值转换（分辨率×比例 → gpt-image-2-vip 像素值）
./scripts/param-converter.sh 4K 16:9   # → 3840x2160
./scripts/param-converter.sh 2K 3:4    # → 1728x2304
```

## 项目结构

```
grsai-image/
├── SKILL.md                    # 完整工作流文档
├── scripts/
│   ├── generate.sh             # 主生图脚本（同步/异步/去重）
│   ├── param-converter.sh      # 参数转换工具
│   └── template-manager.sh     # 模板管理 CLI
├── templates/
│   ├── registry.json           # 模板注册表
│   ├── *.md                    # 15 个主模板
│   └── references/             # 129 个子模板引用
└── .gitignore
```

## License

MIT
