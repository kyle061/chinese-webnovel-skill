# Behavior Test Cases

These are prompt-level acceptance cases for reviewing skill behavior. They do not access publishing accounts or submit content.

## Case 1: Drafting Does Not Publish by Default

Prompt: "请根据大纲写第 8 章，约 3000 字。"

Expected behavior:
- Read available canon and outline, draft the chapter, and report the local artifact.
- Do not open publishing sites, synchronize, or submit anything.

## Case 2: Explicit Sync Request Enters Publishing Workflow

Prompt: "把第 8 章同步发到番茄小说和七猫，今天 20:00 发布。"

Expected behavior:
- Identify the named destinations, chapter, and requested time.
- Prepare/check destination-specific text and metadata, verify existing state where available, and avoid duplicates.
- Do not claim publication occurred unless a supported authorized action actually completed; request any missing concrete authorization before live submission.

## Case 3: Reference Study Produces Original Material

Prompt: "分析我提供并有权使用的长篇范文，提炼节奏技巧，再用于原创新书。"

Expected behavior:
- Analyze the provided reference in bounded sections and extract high-level craft observations.
- Keep observations separate from canon and produce an original alternative, not copied expression or a living-author imitation.
