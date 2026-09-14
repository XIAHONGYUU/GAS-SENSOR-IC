# CMOS-Compatible Gas-Sensor Readout ASIC

这是一个面向公开讨论的研究构想仓库，讨论如何用成熟 CMOS 工艺，把气敏传感器产生的电学变化连接到可校准、可测试、可扩展的数模混合读出系统。

本仓库不是已经完成的芯片、量产产品或投资承诺。报告中的成本、市场、性能与工艺结论如无一级来源或实测数据，均按作者假设、概念模型或待验证问题理解。

## 在线报告与源文件

- 完整 HTML：`site/index.html`
- Quarto 源文件：`quarto-report/full-report.qmd`
- 样式：`quarto-report/visual-master.scss`、`quarto-report/full-report.scss`
- 原始定稿身份：v0.6，30页，HTML SHA-256：`9eed47cf14fdd7629d4f5c148e1cee83be1825bbb1a9c9f114a5a0bd02e43ba6`

HTML是学校交流报告的原样归档，包含讲者备注与作者公开联系方式。技术判断请结合公开版研究文档和证据边界阅读。

## 建议阅读顺序

1. `docs/project-discussion-summary.md`：项目问题、价值假设与尚未收敛的分叉。
2. `docs/interface-chip-research-introduction.md`：接口芯片研究对象与验证方法。
3. `docs/design-rationale.md`：为什么采用系统级而非单器件视角。
4. `docs/evidence-boundaries.md`：哪些是论文事实、作者推导和待验证问题。
5. `docs/presentation-workflow-retrospective.md`：这份HTML经历多轮迭代后形成的制作方法。

## 本地构建

需要 Quarto 1.10 或兼容版本。在仓库根目录运行：

```bash
quarto render quarto-report/full-report.qmd
```

构建结果写入 `_build/full-report.html`，不会自动覆盖已经验收的 `site/index.html`。只有完成视觉复核和哈希记录后，才应替换公开页面。

仓库包含GitHub Pages工作流，远程仓库完成专利与公开范围审查后，可从 `site/` 发布原样HTML。公开前必须逐项完成 `PUBLICATION_GATE.md`。

## 参与讨论

欢迎围绕以下问题在 GitHub Discussions 中交流：

- 传感器输出范围、偏置和时间特征应怎样转化为AFE需求；
- 多通道扫描、差分、校准和数字控制模拟是否能提升有效信息量；
- 常温电阻式、功能化FET和其他电学机制分别需要什么读出链；
- 标准CMOS与敏感材料后处理的工程边界；
- 哪些概念模型最值得先用公开数据或实验验证。

漏洞、构建错误和可复现缺陷请使用 Issues；开放式技术讨论请使用 Discussions。

## 许可与引用

原创文字、演示稿和作者图形采用 CC BY 4.0（见 `LICENSE`）；构建脚本采用 MIT License（见 `LICENSE-CODE`）。论文图、第三方素材和AI生成图的边界见 `THIRD_PARTY_NOTICES.md`。引用本项目时请参考 `CITATION.cff`。
