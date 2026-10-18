#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
codex_home="${CODEX_HOME:-$HOME/.codex}"

usage() {
  printf 'Usage: %s [--codex-home DIR]\n' "$0"
}

while (($#)); do
  case "$1" in
    --codex-home)
      if (($# < 2)); then
        usage >&2
        exit 2
      fi
      codex_home="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf 'Unknown option: %s\n' "$1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

source_dir="$script_dir/chinese-webnovel"
target_dir="$codex_home/skills/chinese-webnovel"

if [[ ! -f "$source_dir/SKILL.md" ]]; then
  printf 'Skill source not found: %s\n' "$source_dir/SKILL.md" >&2
  exit 1
fi

if [[ -e "$target_dir" ]]; then
  printf 'Target already exists; refusing to overwrite: %s\n' "$target_dir" >&2
  exit 1
fi

mkdir -p "$(dirname "$target_dir")"
cp -R "$source_dir" "$target_dir"
printf 'Installed chinese-webnovel to %s\n' "$target_dir"
printf 'Restart Codex to discover the skill.\n'
