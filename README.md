# dotfiles

各種設定ファイル

## Claude Code

`.claude/` に Claude Code のユーザー設定（`~/.claude`）を置いています。

```bash
./install-claude.sh
```

`settings.json` と `agents/` / `rules/` の各項目を `~/.claude` にシンボリックリンクします。
既にファイルがある場合は上書きせずにスキップします。

| 種類 | 内容 |
| --- | --- |
| `settings.json` | モデル・権限・環境変数・ステータスライン |
| `rules/` | JavaScript / TypeScript とテストのコーディング規約、作業ディレクトリのルール |
| `agents/` | `explore`（読み取り専用の探索サブエージェント） |
