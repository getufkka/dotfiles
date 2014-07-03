;; coding-system の設定
(set-default-coding-systems 'euc-jp-unix)
(setq default-file-name-coding-system 'euc-jp-unix)
(setq default-buffer-file-coding-system 'euc-jp-unix)
(setq default-terminal-coding-system 'euc-jp-unix)
(setq default-keyboard-coding-system 'euc-jp-unix)


;; load-path の追加
;; いちいち root になって、システム全体にインストールする必要のない、
;; 自分だけで使うような elisp は、自分のホームディレクトリに置いてます。
(setq load-path
      (append '("/home/hoge/site-lisp/my-only/"
		"/home/hoge/site-lisp/etc/"
   		)
   	      load-path))


;; オープニングメッセージを表示しない
(setq inhibit-startup-message t)



;; バックアップファイルを作成しない
;; 危険なので、注意して下さい
(setq make-backup-files nil)



;; オートセーブファイルを作成しない
;; 危険なので、注意して下さい
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)


;; C-k １回で行全体を削除する
(setq kill-whole-line t)



;; 行の最後に来たら、新しい行を作らない
(setq next-line-add-newlines nil)




;; 1行づつスクロールする
(setq scroll-conservatively 1)



;; 対応する括弧をハイライトする
(show-paren-mode 1)

;; 対応する括弧の色の設定
(setq show-paren-style 'mixed)
(set-face-background 'show-paren-match-face "grey")
(set-face-foreground 'show-paren-match-face "black")



;; カーソル位置の桁数をモードライン行に表示する
(column-number-mode 1)



;; カーソル位置の行数をモードライン行に表示する
(line-number-mode 1)



;; リージョンを色付きにする
(transient-mark-mode 1)



;; cursor の blink を止める
(blink-cursor-mode 0)



;; active でない window の空 cursor を出さない
(setq cursor-in-non-selected-windows nil)



;; 予約語を色分けする
(global-font-lock-mode t)



;; C-x C-b でバッファリストを開く時に、ウィンドウを分割しない
(global-set-key "\C-x\C-b" 'buffer-menu)



;; C-h を Backspace として使い、
;; C-c h を HELP に割当てる
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)
(global-set-key "\C-ch" 'help-command)



;; 指定行にジャンプする
(global-set-key "\C-xj" 'goto-line)



;; bufferの先頭でカーソルを戻そうとしても音をならなくする
(defun previous-line (arg)
  (interactive "p")
  (condition-case nil
      (line-move (- arg))
    (beginning-of-buffer)))



;; bufferの最後でカーソルを動かそうとしても音をならなくする
(defun next-line (arg)
  (interactive "p")
  (condition-case nil
      (line-move arg)
    (end-of-buffer)))



;; エラー音をならなくする
(setq ring-bell-function 'ignore)



;; C-x C-l で現在行を top にする
;; 元々は C-u 0 C-l
;; ちなみに C-l は現在行を center にする
(defun line-to-top-of-window ()
  "Move the line point is on to top of window."
  (interactive) 
  (recenter 0))
(global-set-key "\C-x\C-l" 'line-to-top-of-window)



;; isearch の文字を取得
;; C-s した後に C-d すれば search する文字の入力を省けることに。
(defun isearch-yank-char ()
  "Pull next character from buffer into search string."
  (interactive)
  (isearch-yank-string
   (save-excursion
     (and (not isearch-forward) isearch-other-end
          (goto-char isearch-other-end))
     (buffer-substring (point) (1+ (point))))))
(define-key isearch-mode-map "\C-d" 'isearch-yank-char)



;; キーバインドを変更する
;; 他のキーバインドに影響しないように、あらかじめ、
;; HELP k (このページの設定では、C-c h k) で確認しておいた方が良いでしょう。

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C-o
(defvar ctl-o-map (make-keymap))
(fset 'ctl-o-prefix ctl-o-map)
(define-key global-map "\C-o"  'ctl-o-prefix)

;; 1行空ける
(define-key global-map "\C-o\C-i"    'open-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C-q
(defvar ctl-q-map (make-keymap))
(fset 'ctl-q-prefix ctl-q-map)
(define-key global-map "\C-q"  'ctl-q-prefix)
(define-key global-map "\C-q\C-q"    'scroll-down)

;; 例えば C-q C-i C-l で ^L の入力が可能
(define-key global-map "\C-q\C-i"    'quoted-insert)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C-k
(setq kill-whole-line t)
(defvar ctl-k-map (make-keymap))
(fset 'ctl-k-prefix ctl-k-map)
(define-key global-map "\C-k"  'ctl-k-prefix)

;; 行全体を削除 Emacs22以降で有効
(define-key global-map "\C-k\C-k"    'kill-whole-line)

;; 行全体を削除 Emacs21の場合
(defun kill-all-line (&optional numlines)
  (interactive)
  (setq pos(current-column))
  (beginning-of-line)
  (kill-line numlines)
  (move-to-column pos))
(define-key global-map "\C-k\C-k"    'kill-all-line)

;; カーソル位置より後(右)を削除
(define-key global-map "\C-k\C-e"    'kill-line)

;; カーソル位置より前(左)を削除
(define-key global-map "\C-k\C-a"    (lambda ()(interactive)(kill-line 0)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C-w
(defvar ctl-w-map (make-keymap)
  "keymap for kill or copy region")
(fset 'ctl-w-prefix ctl-w-map)
(define-key global-map "\C-w"  'ctl-w-prefix)

;; リージョンをコピー
(define-key global-map "\C-w\C-w"    'copy-region-as-kill)

;; リージョンを削除
(define-key global-map "\C-w\C-k"    'kill-region)

;; リージョンをコメント/アンコメント
(define-key global-map "\C-w\C-c" 'comment-or-uncomment-region)

;; リージョンをインデント
(define-key global-map "\C-w\C-i" 'indent-region)



;; メニューバーを消す
(menu-bar-mode nil)
;; M-x menu-bar-mode で、メニューバーを表示/非表示



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-x b でバッファの内容を表示しながら、バッファを切り替える
;; C-s,C-rで補完候補を選択
(iswitchb-mode 1)

(defadvice iswitchb-exhibit
  (after
   iswitchb-exhibit-with-display-buffer
   activate)
  "選択している buffer を window に表示してみる。"
  (when (and
         (eq iswitchb-method iswitchb-default-method)
         iswitchb-matches)
    (select-window
     (get-buffer-window (cadr (buffer-list))))
    (let ((iswitchb-method 'samewindow))
      (iswitchb-visit-buffer
       (get-buffer (car iswitchb-matches))))
    (select-window (minibuffer-window))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 日本語の locale が設定されている時の dired 対策
(require 'ls-lisp)
(defadvice insert-directory
  (around reset-locale activate compile)
    (let ((system-time-locale "C"))
        ad-do-it))



c-mode のインデント幅は デフォルトではスペース2個分で、 タブの替わりにスペースが入力されます。
C言語ではこの記法は好きではないので、 スペース4個分タブが入力されるようにします。
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; c-mode のインデントをスペース4個分のタブにする
(add-hook 'c-mode-common-hook
          '(lambda ()
             (c-set-style "k&r")
	     (setq c-basic-offset 4)
	     (setq indent-tabs-mode t)
	     (setq tab-width 4)))

