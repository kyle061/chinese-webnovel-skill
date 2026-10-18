#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
temp_root="$(mktemp -d)"
trap 'rm -rf "$temp_root"' EXIT

"$repo_dir/install.sh" --codex-home "$temp_root/codex-home"
installed="$temp_root/codex-home/skills/chinese-webnovel"
test -f "$installed/SKILL.md"
test -f "$installed/agents/openai.yaml"
test -f "$installed/references/fanqie-workflow.md"
grep -q 'Publishing is opt-in' "$installed/SKILL.md"

if "$repo_dir/install.sh" --codex-home "$temp_root/codex-home"; then
  printf 'Expected installer to refuse overwriting an existing skill.\n' >&2
  exit 1
fi

printf 'PASS: isolated install copies all required skill files.\n'
printf 'PASS: repeat install refuses to overwrite existing content.\n'
