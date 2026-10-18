# 中文网文创作 Skill

一个面向 Codex 的单一 Skill，覆盖中文网文从扫榜、选题、新书初始化，到范文拆解、原创大纲、章节连载、剧情审查、文笔润色、完稿校验和番茄投稿准备的工作流。同步发文是显式选择：没有提出发布需求时默认只生成稿件，不向平台发文。

## 本地安装

需要 macOS/Linux 和 Bash。克隆仓库后运行：

```bash
git clone https://github.com/kyle061/chinese-webnovel-skill.git
cd chinese-webnovel-skill
./install.sh
```

默认安装到 `${CODEX_HOME:-$HOME/.codex}/skills/chinese-webnovel`。也可指定 Codex 配置目录：

```bash
./install.sh --codex-home /path/to/codex-home
```

安装完成后重新启动 Codex，再使用 `$chinese-webnovel` 调用。

安装脚本不会覆盖已有目录。更新时先备份或移走已有 skill，再重新安装。

## 内容

- `chinese-webnovel/SKILL.md`：主工作流
- `chinese-webnovel/references/fanqie-workflow.md`：番茄投稿准备、签约/推荐跟踪与同步发布边界
- `tests/behavior-cases.md`：行为验收场景
- `功能汇总.md`：功能说明及前期检索到的同类项目摘要

番茄签约、内容审核、推荐分发及流量由平台决定，本 Skill 不保证结果。同步发布仅在用户明确提出时进入工作流，账号敏感操作和实际发布遵循具体授权范围。
