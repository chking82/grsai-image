# 模板：图片编辑/修图

## 适用场景
用户要求替换背景、局部修改、去水印、风格转换、图片增强、人像修饰等。

## 需求收集清单

| 字段 | 类型 | 必填 | 选项/说明 |
|------|------|------|----------|
| source_image | file | ✅ | 原始图片 |
| sub_type | select | ✅ | 见下方子模板类型 |
| edit_description | text | ✅ | 编辑需求描述 |
| mask_area | text | ❌ | 需要编辑的区域描述 |
| reference_style | text | ❌ | 参考风格（风格转换时）|

## 子模板类型（references/editing-workflow/）

| 子模板 | 文件 | 关键词 | 示例场景 |
|--------|------|--------|---------|
| 换背景 | `bg-replace.md` | 换背景、纯白、场景替换 | 产品图背景替换 |
| 局部修改 | `local-replace.md` | 局部替换、修改细节 | 修改产品颜色 |
| 去水印/移除 | `removal.md` | 去水印、移除元素 | 图片清理 |
| 风格转换 | `style-transfer.md` | 风格迁移、照片→插画 | 照片转插画风格 |
| 人像修饰 | `portrait-retouch.md` | 修图、美颜、修饰 | 人像精修 |
| 画质增强 | `enhancement.md` | 高清化、细节增强 | 老照片修复 |

## 推荐参数

- model: gpt-image-2-vip
- 使用 edit 端点：POST /v1/api/edit
- imageSize: 保持原图尺寸
