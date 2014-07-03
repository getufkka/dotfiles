;;; Full height for the default window
(setq default-frame-alist
      '((fullscreen . fullheight)))
;; Set the width in a hook and have all windows inherit
(setq frame-inherited-parameters
      '(width height))
(add-hook 'after-init-hook
          (lambda ()
                  (set-frame-parameter nil 'width 140)))

(recentf-mode 1)

(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))


(setq inhibit-startup-message t)

(global-linum-mode t)

;viewed as MB
(setq dired-listing-switches "-alh")


;initNovis.el 言語を日本語にする
(set-language-environment 'Japanese)
; UTF-8とする
(prefer-coding-system 'utf-8)
;; 背景色を設定します。 
;;(add-to-list 'default-frame-alist '(background-color . "navy")) 
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

;起動時のディスプレイサイズ変更(環境に応じて適宜変更)
(set-frame-height (next-frame) 50)
(set-frame-width (next-frame) 80)

(require 'time-stamp) 
(add-hook 'before-save-hook 'time-stamp) 
(setq time-stamp-active t) 
(setq time-stamp-start "last updated : ") 
(setq time-stamp-format "%04y/%02m/%02d/%02H/%02M/%02S/%u") 
(setq time-stamp-end " \\|$") 
(setq compilation-window-height 5)

;; バックアップファイルを作らない
(setq backup-inhibited t)

;; メニューバーを隠す
(tool-bar-mode -1)

(set-face-attribute 'default nil :family "monaco" :height 150)
(set-fontset-font
  (frame-parameter nil 'font)
    'japanese-jisx0208
    '("Hiragino Kaku Gothic ProN" . "iso10646-1"))
(set-fontset-font
  (frame-parameter nil 'font)
    'japanese-jisx0212
    '("Hiragino Kaku Gothic ProN" . "iso10646-1")) 
(set-fontset-font
  (frame-parameter nil 'font)
    'mule-unicode-0100-24ff
    '("monaco" . "iso10646-1"))
(setq face-font-rescale-alist
    '(("^-apple-hiragino.*" . 1.2)
      (".*osaka-bold.*" . 1.2)
      (".*osaka-medium.*" . 1.2)
      (".*courier-bold-.*-mac-roman" . 1.0)
      (".*monaco cy-bold-.*-mac-cyrillic" . 0.9) (".*monaco-bold-.*-mac-roman" . 0.9)
      ("-cdac$" . 1.3)))

;carbon-font の設定なのでだめっぽい。
;(if (eq window-system 'mac) (progn
;(require 'carbon-font)
;(fixed-width-set-fontset "hirakaku_w3" 14)
;)
;)

