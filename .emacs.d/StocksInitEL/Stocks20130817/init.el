;; ------------------------------------------------------------------------
;; @ load-path

;; PDF出力
(setq my-pdfout-command-format "nkf -e | e2ps -a4 -p -nh | ps2pdf - %s")
(defun my-pdfout-region (begin end)
    (interactive "r")
    (shell-command-on-region begin end (format my-pdfout-command-format (read-from-minibuffer "File name:"))))
(defun my-pdfout-buffer ()
    (interactive)
    (my-pdfout-region (point-min) (point-max)))


;; load-pathの追加関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; load-pathに追加するフォルダ
;; 2つ以上フォルダを指定する場合の引数 => (add-to-load-path "elisp" "xxx" "xxx")
(add-to-load-path "~/.emacs.d/elisp")

;; ------------------------------------------------------------------------
;; @ general

;; common lisp
(require 'cl)

;; 文字コード
(set-language-environment "Japanese")
(let ((ws window-s
;; https://github.com/m2ym/auto-complete
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
  (setq ac-ignore-case t)
  (ac-config-default))

;; ------------------------------------------------------------------------
;; @ eldoc.el/eldoc-extension.el

;; カーソル付近にあるEmacs Lispの関数や変数のヘルプをエコーエリアに表示
;; http://www.emacswiki.org/emacs/eldoc-extension.el
(when (require 'eldoc-extension nil t)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
  (setq eldoc-idle-delay 0.2)
  (setq eldoc-minor-mode-string ""))

;; ------------------------------------------------------------------------
;; @ c-eldoc.el

;;カーソル付近にあるC言語の関数や変数のヘルプをエコーエリアに表示
(when (require 'c-eldoc nil t)
  (add-hook 'c-mode-hook
            (lambda ()
              (set (make-local-variable 'eldoc-idle-delay) 0.2)
              (set (make-local-variable 'eldoc-minor-mode-string) "")
              (c-turn-on-eldoc-mode))))

;; ------------------------------------------------------------------------
;; @ hideshow/fold-dwim.el

;; ブロックの折畳みと展開
;; http://www.dur.ac.uk/p.j.heslin/Software/Emacs/Download/fold-dwim.el
(when (require 'fold-dwim nil t)
  (require 'hideshow nil t)
  ;; 機能を利用するメジャーモード一覧
  (let ((hook))
    (dolist (hook
             '(emacs-lisp-mode-hook
               c-mode-common-hook
               python-mode-hook
               php-mode-hook
               ruby-mode-hook
               js2-mode-hook
               css-mode-hook
               apples-mode-hook))
      (add-hook hook 'hs-minor-mode))))

;; ------------------------------------------------------------------------
;; @ c/migemo.el

;; ローマ字で日本語をインクリメンタルサーチ
;; for Mac
(when (require 'migemo nil t)
  ;; cmigemoを使う
  (setq migemo-command "/usr/local/bin/cmigemo")
  ;; Migemoのコマンドラインオプション
  (setq migemo-options '("-q" "--emacs" "-i" "\a"))
  ;; Migemo辞書の場所
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  ;; cmigemoで必須の設定
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  ;; キャッシュの設定
  (setq migemo-use-pattern-alist t)
  (setq migemo-use-frequent-pattern-alist t)
  (setq migemo-pattern-alist-length 1000)
  (setq migemo-coding-system 'utf-8-unix)
  ;; Migemoを起動する
  (migemo-init))

;; ------------------------------------------------------------------------
;; @ color-moccur.el/moccur-edit.el

;; バッファの検索結果をリストアップ(複数バッファ可)
;; http://www.emacswiki.org/emacs/color-moccur.el
;; http://www.emacswiki.org/emacs/moccur-edit.el
(when (and (require 'color-moccur nil t)
           (require 'moccur-edit nil t))
  ;; AND検索
  (setq moccur-split-word t)
  ;; ディレクトリ検索のときに除外するファイル
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  ;; Migemoを利用できる環境であればMigemoを使う
  (when (and (executable-find "cmigemo")
             (require 'migemo nil t))
    (setq moccur-use-migemo t)))

;; ------------------------------------------------------------------------
;; @ wgrep.el

;;grepから検索結果を直接編集
;; https://raw.github.com/mhayashi1120/Emacs-wgrep/master/wgrep.el
(require 'wgrep nil t)

;; ------------------------------------------------------------------------
;; @ anything.el

;; 総合インタフェース
;; http://d.hatena.ne.jp/rubikitch/20100718/anything
(require 'anything-startup nil t)

;; ------------------------------------------------------------------------
;; @ js2-mode.el

;; JavaScriptのメジャーモード
;; https://raw.github.com/mooz/js2-mode/master/js2-mode.el
(when (autoload-if-found 'js2-mode "js2-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)))

;; ------------------------------------------------------------------------
;; @ flymake.el

(when (require 'flymake nil t)
  ;; 下の一行はflymakeモードでエラー行に飛べるコマンドをキーに割り当ててるコードですが、
  ;; 個人的な理由でコメントアウトしてます。必要でしたらこのコメント削除して、アンコメントしてください
  ;;(define-key global-map (kbd "C-cd") 'flymake-display-err-menu-for-current-line)

  ;; C
  ;; http://d.hatena.ne.jp/nyaasan/20071216/p1
  (defun flymake-c-init ()
    (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
           (local-file  (file-relative-name
                         temp-file
                         (file-name-directory buffer-file-name))))
      (list "gcc" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.\\(c\\|h\\|y\\l\\)$" flymake-c-init))
  ;; C++
  (defun flymake-cc-init ()
    (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
           (local-file  (file-relative-name
                         temp-file
                         (file-name-directory buffer-file-name))))
      (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.cpp$" flymake-cc-init))

  ;; Emacs Lisp
  ;; http://www.emacswiki.org/emacs/FlymakeElisp
  (defun flymake-elisp-init ()
    (unless (string-match "^ " (buffer-name))
      (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                           'flymake-create-temp-inplace))
             (local-file  (file-relative-name
                           temp-file
                           (file-name-directory buffer-file-name))))
        (list
         (expand-file-name invocation-name invocation-directory)
         (list
          "-Q" "--batch" "--eval"
          (prin1-to-string
           (quote
            (dolist (file command-line-args-left)
              (with-temp-buffer
                (insert-file-contents file)
                (condition-case data
                    (scan-sexps (point-min) (point-max))
                  (scan-error
                   (goto-char(nth 2 data))
                   (princ (format "%s:%s: error: Unmatched bracket or quote\n"
                                  file (line-number-at-pos)))))))
            )
           )
          local-file)))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.el$" flymake-elisp-init))

  (add-hook 'emacs-lisp-mode-hook
            ;; workaround for (eq buffer-file-name nil)
            (function (lambda () (if buffer-file-name (flymake-mode)))))
  (add-hook 'c-mode-common-hook
            (lambda () (flymake-mode t)))
  (add-hook 'php-mode-hook
            (lambda () (flymake-mode t)))
  )
