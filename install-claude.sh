#!/bin/bash
# dotfiles の .claude 配下を ~/.claude にシンボリックリンクする。
# ~/.claude には履歴やセッションなどの実行時データも置かれるため、ディレクトリごとではなく項目単位でリンクする。
set -eu

SRC="$(cd "$(dirname "$0")" && pwd)/.claude"
DEST="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"

link() {
  local src="$1" dest="$2"
  if [ -L "$dest" ]; then
    ln -sfn "$src" "$dest"
  elif [ -e "$dest" ]; then
    echo "skip: $dest は既に存在します（手動で退避してから再実行してください）" >&2
    return
  else
    ln -s "$src" "$dest"
  fi
  echo "link: $dest -> $src"
}

mkdir -p "$DEST/agents" "$DEST/rules" "$DEST/skills"
link "$SRC/settings.json" "$DEST/settings.json"
for dir in agents rules skills; do
  for item in "$SRC/$dir"/*; do
    link "$item" "$DEST/$dir/$(basename "$item")"
  done
done
