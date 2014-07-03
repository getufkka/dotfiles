; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;; ------------------------------------------------------------------------
;; @ load-path

;; load-pathの追加関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;;(add-to-load-path 'elisp)

;;--------------------------------------------------------------------
;; load-pathを追加
;;--------------------------------------------------------------------
(add-to-load-path "~/.emacs.d/elisp" ;;elisp格納ディレクトリ
		  "~/.emacs.d/conf") ;;個別の設定格納ディレクトリ

;; ------------------------------------------------------------------------
;; @ general

;; common lisp
(require 'cl)



;; 私の場合は個人設定ファイルに
(setq inhibit-startup-message t)
;; を書き加えると、emacsの二画面分割の起動が一画面になりました。

;; ただ、質問者さんの場合はスタートアップメッセージではなくscratchバッファのようなので、全く見当はずれかもしれませんが。


;; 文字コード
(set-language-environment "Japanese")
(let ((ws window-system))
  (cond ((eq ws 'w32)
         (prefer-coding-system 'utf-8-unix)
         (set-default-coding-systems 'utf-8-unix)
         (setq file-name-coding-system 'sjis)
         (setq locale-coding-system 'utf-8))
        ((eq ws 'ns)
         (require 'ucs-normalize)
         (prefer-coding-system 'utf-8-hfs)
         (setq file-name-coding-system 'utf-8-hfs)
         (setq locale-coding-system 'utf-8-hfs))))

;; Windowsで英数と日本語にMeiryoを指定
;; Macで英数と日本語にRictyを指定
(let ((ws window-system))
  (cond ((eq ws 'w32)
         (set-face-attribute 'default nil
                             :family "Meiryo"  ;; 英数
                             :height 100)
         (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Meiryo")))  ;; 日本語
        ((eq ws 'ns)
         (set-face-attribute 'default nil
                             :family "Ricty"  ;; 英数
                             :height 140)
         (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty")))))  ;; 日本語

;; スタートアップ非表示
(setq inhibit-startup-screen t)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;; ツールバー非表示
;;(tool-bar-mode 0)

;; メニューバーを非表示
(menu-bar-mode 1)


;; スクロールバー非表示
;;(set-scroll-bar-mode nil)

;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

; 起動時の画面はいらない
(setq inhibit-startup-message t)

(display-time-mode 1)
(display-battery-mode 1)
(if window-system (progn 

;; 文字の色を設定します。 
(add-to-list 'default-frame-alist '(foreground-color . "white")) 
;; 背景色を設定します。 
(add-to-list 'default-frame-alist '(background-color . "navy")) 
;; カーソルの色を設定します。 
(add-to-list 'default-frame-alist '(cursor-color . "yellow")) 
;; マウスポインタの色を設定します。 
(add-to-list 'default-frame-alist '(mouse-color . "SlateBlue2")) 
;; モードラインの文字の色を設定します。 
(set-face-foreground 'modeline "black") 
;; モードラインの背景色を設定します。 
(set-face-background 'modeline "orange") 
;; 選択中のリージョンの色を設定します。 
(set-face-background 'region "deeppink1") 
;; モードライン（アクティブでないバッファ）の文字色を設定します。 
(set-face-foreground 'mode-line-inactive "gray30") 
;; モードライン（アクティブでないバッファ）の背景色を設定します。 
(set-face-background 'mode-line-inactive "gray85") 
))

;; デフォルトの透明度を設定する (85%) 
(add-to-list 'default-frame-alist '(alpha . 85)) 

;; カレントウィンドウの透明度を変更する (85%) 
;; (set-frame-parameter nil 'alpha 0.85) 
(set-frame-parameter nil 'alpha 85) 

(global-set-key "\C-z" 'undo) 

;; 行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#500"
                    :height 0.9)

;; 行番号フォーマット
;;(setq linum-format "%4d")

;; 括弧の範囲内を強調表示
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

;; 括弧の範囲色
(set-face-background 'show-paren-match-face "#500")

;; 選択領域の色
(set-face-background 'region "#100")

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

;; タブをスペースで扱う
(setq-default indent-tabs-mode nil)

;; タブ幅
(custom-set-variables '(tab-width 4))

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

;; 最近使ったファイルをメニューに表示
(recentf-mode t)

;; 最近使ったファイルの表示数
(setq recentf-max-menu-items 10)

;; 最近開いたファイルの保存数を増やす
(setq recentf-max-saved-items 3000)

;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; ミニバッファの履歴の保存数を増やす
(setq history-length 3000)

;; バックアップを残さない
(setq make-backup-files nil)

;; 1行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
(setq comint-scroll-show-maximum-output t) ;; shell-mode

;;;doesn't work
;;; -*- syntax: emacs-lisp; coding: iso-2022-jp-unix; -*-
(defun increase-font-size ()
  (interactive)
  (set-face-attribute 'default
		      nil
		      :height
		      (+ 10 (face-attribute 'default :height))))

(defun decrease-font-size ()
  (interactive)
  (set-face-attribute 'default
		      nil
		      :height
		      ((lambda (h) (if (<= h 10) h (- h 10)))
		       (face-attribute 'default :height))))


(global-set-key [M-triple-wheel-up] 'increase-font-size)
(global-set-key [C-wheel-up] 'increase-font-size)
(global-set-key [?\C-+] 'increase-font-size)
(global-set-key [?\C-=] 'increase-font-size)

(global-set-key [M-triple-wheel-down] 'decrease-font-size)
(global-set-key [C-wheel-down] 'decrease-font-size)
(global-set-key [?\C--] 'decrease-font-size)

;; フレームの透明度
(set-frame-parameter (selected-frame) 'alpha '(1.00))

;;Cocoa Emacsに移行するにあたって、CarbonではデフォルトでCommandキーがMetaキーになってるんだけど、Cocoaではinit.elに自分で設定しなきゃならない。
;;(setq ns-command-modifier (quote super))
;;(setq ns-alternate-modifier (quote meta))

;; C-Ret で矩形選択
;; 詳しいキーバインド操作：http://dev.ariel-networks.com/articles/emacs/part5/
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; ------------------------------------------------------------------------
;; @ modeline

;; モードラインの割合表示を総行数表示
(defvar my-lines-page-mode t)
(defvar my-mode-line-format)

(when my-lines-page-mode
  (setq my-mode-line-format "%d")
  (if size-indication-mode
      (setq my-mode-line-format (concat my-mode-line-format " of %%I")))
  (cond ((and (eq line-number-mode t) (eq column-number-mode t))
         (setq my-mode-line-format (concat my-mode-line-format " (%%l,%%c)")))
        ((eq line-number-mode t)
         (setq my-mode-line-format (concat my-mode-line-format " L%%l")))
        ((eq column-number-mode t)
         (setq my-mode-line-format (concat my-mode-line-format " C%%c"))))

  (setq mode-line-position
        '(:eval (format my-mode-line-format
                        (count-lines (point-max) (point-min))))))

;; ------------------------------------------------------------------------
;; @ initial frame maximize

;; 起動時にウィンドウ最大化
;; http://www.emacswiki.org/emacs/FullScreen#toc12
(defun jbr-init ()
  "Called from term-setup-hook after the default
   terminal setup is
   done or directly from startup if term-setup-hook not
   used.  The value
   0xF030 is the command for maximizing a window."
  (interactive)
  (w32-send-sys-command #xf030)
  (ecb-redraw-layout)
  (calendar))

(let ((ws window-system))
  (cond ((eq ws 'w32)
         (set-frame-position (selected-frame) 0 0)
         (setq term-setup-hook 'jbr-init)
         (setq window-setup-hook 'jbr-init))
        ((eq ws 'ns)
         ;; for MacBook Air(Late2010) 11inch display
         (set-frame-position (selected-frame) 0 0)
         (set-frame-size (selected-frame) 30 40))))
         ;;(set-frame-size (selected-frame) 95 47)
;; 括弧の後ろでCtrl-jを押す
(frame-width)
(frame-height)

set-frame-size (selected-frame) 122 70)))

(require 'multi-term)

(setq multi-term-program "/bin/bash")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


キーバインド
(define-key global-map "\C-h" 'delete-backward-char) ; 削除
(define-key global-map "\M-?" 'help-for-help)        ; ヘルプ
(define-key global-map "\C-z" 'undo)                 ; undo
(define-key global-map "\C-ci" 'indent-region)       ; インデント
(define-key global-map "\C-c\C-i" 'dabbrev-expand)   ; 補完
(define-key global-map "\C-c;" 'comment-region)      ; コメントアウト
(define-key global-map "\C-c:" 'uncomment-region)    ; コメント解除
(define-key global-map "\C-o" 'toggle-input-method)  ; 日本語入力切替
(define-key global-map "\C-\\" nil) ; \C-\の日本語入力の設定を無効にする
(define-key global-map "\C-c " 'other-frame)         ; フレーム移動


(setq byte-compile-warnings '(free-vars unresolved callargs redefine obsolete noruntime cl-functions interactive-only make-local))
