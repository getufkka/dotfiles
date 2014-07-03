;;
;; init.el
;;

;; Language.
(set-language-environment 'Japanese)

;; Coding system.
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Keys.
(global-set-key "\C-z" 'term)

;; Translate C-h to DEL.
(keyboard-translate ?\C-h ?\C-?)

;; Yen-key and backslash. (ここ、日記上だとわかりにくいのでコメントアウト)
;(define-key global-map [?\] [?\\])
;(define-key global-map [?\C-\] [?\C-\\])
;(define-key global-map [?\M-\] [?\M-\\])
;(define-key global-map [?\C-\M-\] [?\C-\M-\\])

;; Custom.
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-default-init t)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; Font, width, height, color.
(if (eq (window-system) 'ns)
    (progn
      (create-fontset-from-ascii-font "Menlo-15:weight=normal:slant=normal" nil "menlokakugo")
      (set-fontset-font "fontset-menlokakugo"
            'unicode
            (font-spec :family "Hiragino Maru Gothic ProN" :size 18)
            nil
            'append)
      (add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))
      (add-to-list 'default-frame-alist '(width . 128))
      (add-to-list 'default-frame-alist '(height . 60))
      (add-to-list 'default-frame-alist '(foreground-color . "black"))
      (add-to-list 'default-frame-alist '(background-color . "white"))
      (add-to-list 'default-frame-alist '(cursor-color . "blue4"))))

;; Set background color of current line.
;; Color table: http://life.a.la9.jp/hp/color/rgb-tab.html
(global-hl-line-mode 1)
(set-face-background 'hl-line "oldlace")

;; AutoInstall
(add-to-list 'load-path (expand-file-name "~/elisp"))
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(add-to-list 'load-path "~/.emacs.d/auto-install/")

;; Anything
(require 'anything-startup)
(setq anything-sources (list anything-c-source-buffers
                             anything-c-source-bookmarks
                             anything-c-source-recentf
                             anything-c-source-file-name-history
                             anything-c-source-locate
                 ))
(define-key anything-map (kbd "C-p") 'anything-previous-line)
(define-key anything-map (kbd "C-n") 'anything-next-line)
(define-key anything-map (kbd "C-v") 'anything-next-source)
(define-key anything-map (kbd "M-v") 'anything-previous-source)
(global-set-key (kbd "C-:") 'anything)

;; Remember point in file.
(setq-default save-place t)
(require 'saveplace)
