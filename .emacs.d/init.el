;;; load-pathの設定
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/auto-install/")

;; (install-elisp-from-emacswiki "auto-install.el")
;(require 'auto-install)
;; auto-installによってインストールされるEmacs Lispをロードパスに加える
;; デフォルトは ~/.emacs.d/auto-install-directory/
;(add-to-list 'load-path auto-install-directory)
;; 起動時にEmacsWikiのページ名を補完候補に加える
;(auto-install-update-emacswiki-package-name t)
;; install-elisp.el互換モードにする
;(auto-install-compatibility-setup)
;; ediff関連のバッファを1つのフレームにまとめる
;(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;; タブの設定
(setq-default tab-width 2 indent-tabs-mode nil)

;;; 現在行に色をつける
(global-hl-line-mode -1)
;; 色
(set-face-background 'hl-line "darkolivegreen")
;;; 履歴を次回Emacs起動時にも保存する
(savehist-mode 1)
;;; ファイル内のカーソル位置を記憶
(setq-default save-place t)
(require 'saveplace)
;;; 対応する括弧を表示
(show-paren-mode 1)
;;; シェルに合わせるため、C-hは後退に割り当て
(global-set-key (kbd "C-h") 'delete-backward-char)
;;; モードラインに時刻を表示
(display-time)
;;; 行番号・桁番号を表示
(line-number-mode 1)
(column-number-mode 1)
;;; リージョンに色をつける
(transient-mark-mode 1)
;;; GCを減らして軽くする
(setq gc-cons-threshold (* 10 gc-cons-threshold))
;;; ログの記録行数を増やす
(setq message-log-max 10000)
;;; ミニバッファを再帰的に呼び出せるようにする
(setq enable-recursive-minibuffers t)
;;; ダイヤログボックスを使わないようにする
(setq use-dialog-box nil)
(defalias 'message-box 'message)
;;; 履歴をたくさん保存
(setq history-length 1000)
;;; キーストロークをエコーエリアに早く表示する
(setq echo-keystrokes 0.1)
;;; 大きいファイルを開こうとした際に警告を表示
(setq large-file-warning-threshold (* 25 1024 1024))
;;; yesと入力するのをyで省略
(defalias 'yes-or-no-p 'y-or-n-p)
;;; ツールバーとスクロールバーを削除
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; 同じコマンドを連続実行した際の振る舞いを変更
(require 'sequential-command-config)
(sequential-command-setup-keys)

;;; ファイル名がかぶった場合にバッファ名をわかりやすく表示
(require 'uniquify)
;; filename<dir> 形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; *で囲まれたバッファ名は対象外にする
(setq uniquify-ignore-buffers-re "*[^*]+*")

;;; 最近利用したファイルを開く
;; 最近のファイル500個を保存
(setq recentf-max-saved-items 500)
;; 最近使ったファイルに加えないファイルを正規表現で指定
(setq recentf-exclude '("/TASS$" "/var/tmp/"))
(require 'recentf-ext)

;;; リージョンに色をつける
(setq transient-mark-mode t)

;;; 最後の編集箇所に移動
(require 'goto-chg)
(define-key global-map (kbd "<f8>") 'goto-last-change)
(define-key global-map (kbd "S-<f8>") 'goto-last-change-reverse)

;;; ファイル作成時にテンプレートを挿入
(auto-insert-mode)
;; rubyモード
(setq auto-insert-directory "~/.emacs.d/insert/")
(define-auto-insert "\\.rb$" "ruby-template.rb")
;; coding: utf-8 の自動挿入を停止
(require 'ruby-mode)
(defun ruby-mode-set-encoding () nil)

;;; redoの追加
(require 'redo+)
(global-set-key (kbd "C-M-/") 'redo)
(setq undo-no-redo t) ; 過去のundoがredoされないようにする
;; 大量のundoに耐えられるようにする
(setq undo-limit 600000)
(setq undo-strong-limit 900000)

;;; IDEのような入力支援(auto-complete.el)
;; (require 'auto-complete)
;; (global-auto-complete-mode 1)

;;; 現在桁をハイライト
(require 'col-highlight)
;; 常にハイライト
;(column-highlight-mode 1)
;; 何もしないでいるとハイライトを始める
(toggle-highlight-column-when-idle 1)
(col-highlight-set-interval 2)  ; ハイライトの秒数

;;; Emacs shell処理
;; エスケープシーケンスによる色付け
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; パスワードのプロンプトを認識し、入力時はミニバッファで伏せ字になる
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;; viewモード
(setq view-read-only t)
(require 'viewer)
;; 色名を指定
(setq viewer-modeline-color-unwritable "tomato")
(setq viewer-modeline-color-view "orange")
(viewer-change-modeline-color-setup)

;;; *.‾ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;;; 横に行番号を表示
(require 'linum)
(global-linum-mode 1)
;; (set-face-attribute 'linum nil
;; 		    :foreground "yellow"
;; 		    :height 0.9)
(setq linum-format "%4d| ")

;;; タブ幅の設定
(setq-default tab-width 4)
(setq default-tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
						64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

;; 改行・タブ・スペースを色付け
;(global-whitespace-mode 1)

;;; web-modeの設定
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

;; タブの設定
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq indent-tabs-mode 'nil)
  (setq web-mode-engines-alist
        '(("php"    . "\\.ctp\\'"))
        )
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; 色の設定
(custom-set-faces
 '(web-mode-doctype-face
   ((t (:foreground "blue"))))                          ; doctype
 '(web-mode-html-tag-face
   ((t (:foreground "MediumBlue" :weight bold))))             ; 要素名
 '(web-mode-html-attr-name-face
   ((t (:foreground "gold"))))                          ; 属性名など
 '(web-mode-html-attr-value-face
   ((t (:foreground "LimeGreen"))))                          ; 属性値
 '(web-mode-comment-face
   ((t (:foreground "red"))))                          ; コメント
 '(web-mode-server-comment-face
   ((t (:foreground "redF"))))                          ; コメント
 '(web-mode-css-rule-face
   ((t (:foreground "#A0D8EF"))))                          ; cssのタグ
 '(web-mode-css-pseudo-class-face
   ((t (:foreground "#FF7F00"))))                          ; css 疑似クラス
 '(web-mode-css-at-rule-face
   ((t (:foreground "#FF7F00"))))                          ; cssのタグ
)

;;; markdown-modeの設定
(autoload 'markdown-mode "markdown-mode"
"Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(setq markdown-command "~/.emacs.d/lisp/Markdown.pl")

;;; haml-modeの設定
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(add-hook 'haml-mode-hook
		  (lambda ()
			(setq indent-tabs-mode nil)
			(define-key haml-mode-map "\C-m" 'newline-and-indent)))

;;; sql-modeの設定
(custom-set-variables '(sql-product 'mysql))  ; デフォルトでMySQLが指定されるように設定

;;; sql-indentの設定
(eval-after-load "sql"
  '(load-library "sql-indent"))
