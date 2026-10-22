# dotfiles

各種設定ファイル

## Claude Code

`.claude/` に Claude Code のユーザー設定（`~/.claude`）を置いています。

```bash
./install-claude.sh
```

`settings.json` と `agents/` / `rules/` / `skills/` の各項目を `~/.claude` にシンボリックリンクします。
既にファイルがある場合は上書きせずにスキップします。

| 種類 | 内容 |
| --- | --- |
| `settings.json` | モデル・権限・環境変数・ステータスライン |
| `rules/` | JavaScript / TypeScript とテストのコーディング規約、作業ディレクトリのルール |
| `agents/` | `explore`（読み取り専用の探索サブエージェント） |
| `skills/` | `agpr-pr` / `agpr-fix` / `sync-main` / `grill-me` / `genshijin*` |

外部リポジトリから取り込んだスキルは、`SKILL.md` の `metadata.github-repo` に取得元を、各ディレクトリの `LICENSE` にライセンスを置いています。

- `agpr-pr` / `agpr-fix`: [ksugawara61/agpr](https://github.com/ksugawara61/agpr)（MIT）
- `genshijin*`: [InterfaceX-co-jp/genshijin](https://github.com/InterfaceX-co-jp/genshijin)（MIT）
- `grill-me`: [mattpocock/skills](https://github.com/mattpocock/skills)（MIT）
