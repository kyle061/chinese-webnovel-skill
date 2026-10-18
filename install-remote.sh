#!/usr/bin/env bash
set -euo pipefail

codex_home="${CODEX_HOME:-$HOME/.codex}"
while (($#)); do
  case "$1" in
    --codex-home)
      if (($# < 2)); then
        printf 'Usage: install-remote.sh [--codex-home DIR]\n' >&2
        exit 2
      fi
      codex_home="$2"
      shift 2
      ;;
    -h|--help)
      printf 'Usage: install-remote.sh [--codex-home DIR]\n'
      exit 0
      ;;
    *)
      printf 'Unknown option: %s\n' "$1" >&2
      printf 'Use --help to see accepted options.' >&2
      exit 2
      ;;
  esac
done

archive_url="${CHINESE_WEBNOVEL_ARCHIVE_URL:-https://github.com/kyle061/chinese-webnovel-skill/archive/refs/heads/main.tar.gz}"
temp_dir="$(mktemp -d)"
trap 'rm -rf "$temp_dir"' EXIT

curl -fsSL "$archive_url" | tar -xz -C "$temp_dir" --strip-components=1
"$temp_dir/install.sh" --codex-home "$codex_home"
