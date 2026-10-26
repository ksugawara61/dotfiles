# dotfiles

各種設定ファイル

## Claude Code

Claude Code のユーザー設定（`~/.claude` のルール・`settings.json`）とプラグインは、[ksugawara61/harness](https://github.com/ksugawara61/harness) で管理しています。

```bash
git clone https://github.com/ksugawara61/harness.git ~/.harness
~/.harness/scripts/install.sh
```

以前このリポジトリの `install-claude.sh` で配置した場合、`~/.claude` に dotfiles を指すシンボリックリンクが残ります。
`rules/` と `settings.json` は harness の `install.sh` が置き換えます。
`~/.claude/agents/explore.md` は harness ではプラグイン `workflow` に移したため、リンクを削除してください。
