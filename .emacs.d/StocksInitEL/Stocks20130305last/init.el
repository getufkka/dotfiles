;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;一般設定
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;透明度を設定(アクティブ 非アクティブの透明度)
(add-to-list 'default-frame-alist '(alpha . (0.9 0.5)))

;;バイトコンパイル時のワーニングを抑制
(setq byte-compile-warnings '(free-vars unresolved callargs redefine obsolete noruntime cl-functions interactive-only make-local))

;;BackSpaceを有効に(isearch時にも効くように)
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)

;;改行後に自動インデント
(global-set-key "\C-m" 'newline-and-indent)

;; ビープ音を消す
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; C-k １回で行全体を削除する
(setq kill-whole-line t)

;;キルリングカスタマイズ（ ポイントが空行ならキルリングに追加しない )
(defun my-kill-or-delete-line ()
  "ポイントが空行ならキルリングに追加しない"
  (interactive)
  (if (and (bolp) (eolp)) ;お気に入り
      (my-delete-line)
    (my-kill-line)))
;; kill-line から置換
(defun my-delete-line (&optional arg)
  (interactive "P")
  (delete-region (point)
                 (progn
                   (if arg
                       (forward-visible-line (prefix-numeric-value arg))
                     (if (eobp)
                         (signal 'end-of-buffer nil))
                     (let ((end
                            (save-excursion
                              (end-of-visible-line) (point))))
                       (if (or (save-excursion
                                 (unless show-trailing-whitespace
                                   (skip-chars-forward " \t" end))
                                 (= (point) end))
                               (and kill-whole-line (bolp)))
                           (forward-visible-line 1)
                         (goto-char end))))
                   (point))))
(global-set-key (kbd "C-k") 'my-kill-or-delete-line)

;;my-kill-line（C-u C-k）
(defun my-kill-line ()
  "C-u C-k でキルリングに入れない"
  (interactive)
  (if current-prefix-arg
      (delete-region (point)
                     (save-excursion (end-of-line) (point)))
    (kill-line)))

;;C-h（BackSpace）でリージョンを一括削除
(delete-selection-mode 1)

;;ツールバーを非表示に
(tool-bar-mode nil)

;;*scratch* で最初に書かれる message を消す
(setq initial-scratch-message "")

;;Dropbox内のファイルはtemp以下にバックアップファイルを作成する
(setq auto-save-file-name-transforms
      `((".*/Dropbox/.*" ,temporary-file-directory t)))

;;diredで削除したときにゴミ箱へ移動させる
(setq delete-by-moving-to-trash t)

;;diredの機能を拡張する（C-x C-jで現在のカレントディレクトリでdiredを一発起動など）
(load "dired-x")

;; diredでマークをつけたファイルを開く(E-dit)
(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map (kbd "E") 'my-dired-find-marked-files)
     (defun my-dired-find-marked-files (&optional arg)
       "Open each of the marked files, or the file under the point, or when prefix arg, the next N files "
       (interactive "P")
       (let* ((fn-list (dired-get-marked-files nil arg)))
         (mapc 'find-file fn-list)))))

;; diredでマークをつけたファイルをviewモードで開く(V-iew)
(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map (kbd "V") 'my-dired-view-marked-files)
     (defun my-dired-view-marked-files (&optional arg)
       "Open each of the marked files, or the file under the point, or when prefix arg, the next N files "
       (interactive "P")
       (let* ((fn-list (dired-get-marked-files nil arg)))
         (mapc 'view-file fn-list)))))

;;wdiredをオンに(diredモード時にrで起動)
;;C-c C-c(C-x C-s)で変更確定/C-x C-k(C-x Esc)でキャンセル
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;dired-mode時、スペース(SPACE)でマークをトグル (デフォルトではm,uを使い分ける必要がある)
(define-key dired-mode-map " " 'dired-toggle-mark)
(defun dired-toggle-mark (arg)
  "Toggle the current (or next ARG) files."
  (interactive "P")
  (let ((dired-marker-char
         (if (save-excursion (beginning-of-line)
                             (looking-at " "))
             dired-marker-char ?\040)))
    (dired-mark arg)
    (dired-previous-line 1)))

;;矩形選択を簡単にするcua-mode(C-RETで選択→RETで実行)
(cua-mode t)
(setq cua-enable-cua-keys nil) ;; 変なキーバインド禁止(通常のC-w/M-w/C-y等でコピペする)
(defadvice cua-sequence-rectangle (around my-cua-sequence-rectangle activate)
  "連番を挿入するとき、紫のところの文字を上書きしないで左にずらす"
  (interactive
   (list (if current-prefix-arg
             (prefix-numeric-value current-prefix-arg)
           (string-to-number
            (read-string "Start value: (0) " nil nil "0")))
         (string-to-number
          (read-string "Increment: (1) " nil nil "1"))
         (read-string (concat "Format: (" cua--rectangle-seq-format ") "))))
  (if (= (length format) 0)
      (setq format cua--rectangle-seq-format)
    (setq cua--rectangle-seq-format format))
  (cua--rectangle-operation 'clear nil t 1 nil
     '(lambda (s e l r)
         (kill-region s e)
         (insert (format format first))
         (yank)
         (setq first (+ first incr)))))

;;view-modeをvi-likeな移動で
(setq view-read-only t)
(defvar pager-keybind
      `(
        ("h" . backward-char)
        ("l" . forward-char)
        ("j" . next-line)
        ("\C-j" . forward-paragraph)
        ("k" . previous-line)
        ("\C-k" . backward-paragraph)
        (";" . gene-word)
        ("b" . scroll-down)
        (" " . scroll-up)
        ("g" . beginning-of-buffer)
        ("G" . end-of-buffer)
        ))
(defun define-many-keys (keymap key-table &optional includes)
  (let (key cmd)
    (dolist (key-cmd key-table)
      (setq key (car key-cmd)
            cmd (cdr key-cmd))
      (if (or (not includes) (member key includes))
        (define-key keymap key cmd))))
  keymap)
(defun view-mode-hook0 ()
  (define-many-keys view-mode-map pager-keybind)
  (hl-line-mode 1)
  (define-key view-mode-map " " 'scroll-up))
(add-hook 'view-mode-hook 'view-mode-hook0)
;; 書き込み不能なファイルはview-modeで開くように
(defadvice find-file
  (around find-file-switch-to-view-file (file &optional wild) activate)
  (if (and (not (file-writable-p file))
           (not (file-directory-p file)))
      (view-file file)
    ad-do-it))
;; 書き込み不能な場合はview-modeを抜けないように
(defvar view-mode-force-exit nil)
(defmacro do-not-exit-view-mode-unless-writable-advice (f)
  `(defadvice ,f (around do-not-exit-view-mode-unless-writable activate)
     (if (and (buffer-file-name)
              (not view-mode-force-exit)
              (not (file-writable-p (buffer-file-name))))
         (message "File is unwritable, so stay in view-mode.")
       ad-do-it)))
(do-not-exit-view-mode-unless-writable-advice view-mode-exit)
(do-not-exit-view-mode-unless-writable-advice view-mode-disable)

;; 分割したウィンドウの大きさをインタラクティヴに変更する
(defun my-window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        action c)
    (catch 'end-flag
      (while t
        (setq action
              (read-key-sequence-vector (format "size[%dx%d]"
                                                (window-width)
                                                (window-height))))
        (setq c (aref action 0))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (let ((last-command-char (aref action 0))
                     (command (key-binding action)))
                 (when command
                   (call-interactively command)))
               (message "Quit")
               (throw 'end-flag t)))))))
(define-key global-map "\C-q" (make-sparse-keymap)) ;; C-q をプリフィックスキー化
(global-set-key "\C-q\C-q" 'quoted-insert)	    ;; quoted-insert（デフォルトではC-qの機能。制御文字の挿入） は C-q C-q へ割り当て
(global-set-key "\C-q\C-r" 'my-window-resizer)	    ;; window-resizer は C-q C-r (resize) で。その後はvi系移動でサイズ変更可
(global-set-key "\C-ql" 'windmove-right)
(global-set-key "\C-qh" 'windmove-left)
(global-set-key "\C-qj" 'windmove-down)
(global-set-key "\C-qk" 'windmove-up)

;; 折り返し表示ON/OFF
(defun toggle-truncate-lines ()
  "折り返し表示をトグル動作します."
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))
(global-set-key "\C-c\C-t\C-l" 'toggle-truncate-lines)

;; 単語略称モードを起動時にON
(setq-default abbrev-mode t)
(read-abbrev-file "~/abbrev_defs")
(setq save-abbrevs t)

;; C-u C-SPC C-SPC C-SPC... のように C-SPC を連続で入力するだけで，連続でマークを辿れるように
(setq set-mark-command-repeat-pop t)

;; フレームの最大化
(require 'maxframe)
(defvar my-fullscreen-p t "Check if fullscreen is on or off")
(defun my-toggle-fullscreen ()
  (interactive)
  (setq my-fullscreen-p (not my-fullscreen-p))
  (if my-fullscreen-p
	  (restore-frame)
	(maximize-frame)))
(global-set-key (kbd "<f11>") 'my-toggle-fullscreen)

;;END一般設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;カラー設定
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;カラーテーマ
(require 'color-theme)
(color-theme-initialize)
( color-theme-tangotango)
;; 関数内の強調表示
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-attribute 'show-paren-match-face nil :background "#0d5e56" :foreground "#ffffff")

;; 編集行のハイライト
(require 'highlight-current-line)
(highlight-current-line-on t)
(set-face-background 'highlight-current-line-face "#232323")

;;yankした文字列をハイライト表示する
(when (or window-system (eq emacs-major-version '21))
  (defadvice yank (after ys:highlight-string activate)
    (let ((ol (make-overlay (mark t) (point))))
      (overlay-put ol 'face 'highlight)
      (sit-for 0.5)
      (delete-overlay ol)))
  (defadvice yank-pop (after ys:highlight-string activate)
    (when (eq last-command 'yank)
      (let ((ol (make-overlay (mark t) (point))))
        (overlay-put ol 'face 'highlight)
        (sit-for 0.5)
        (delete-overlay ol)))))

;;ENDカラー設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;プラグイン
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; インストールプラグイン
(require 'install-elisp)
(setq install-elisp-repository-directory "c:/emacs-23.3/site-lisp/")

;; anything
(require 'anything-config)
(setq anything-sources (list anything-c-source-buffers
                             anything-c-source-bookmarks
                             anything-c-source-recentf
			     anything-c-source-emacs-commands
                             anything-c-source-file-name-history
                             anything-c-source-kill-ring
                             anything-c-source-locate))
(define-key anything-map (kbd "C-p") 'anything-previous-line)
(define-key anything-map (kbd "C-n") 'anything-next-line)
(define-key anything-map (kbd "C-v") 'anything-next-source)
(define-key anything-map (kbd "M-v") 'anything-previous-source)
(global-set-key (kbd "C-;") 'anything)
(define-key anything-map (kbd "C-M-n") 'anything-next-source)
(define-key anything-map (kbd "C-M-p") 'anything-previous-source)
;; anythingでコマンド絞り込み(M-xのanything拡張版)
(define-key global-map (kbd "M-x")
  (lambda ()
    "Execute emacs commands in anything"
    (interactive)
    (anything '(anything-c-source-emacs-commands))))
;;kill-ring の最大値. デフォルトは 30.
(setq kill-ring-max 20)
;;anything で対象とするkill-ring の要素の長さの最小値(デフォルトは 10.)
(setq anything-kill-ring-threshold 5)
(global-set-key (kbd "C-M-y") 'anything-show-kill-ring)
;;バッファリスト/バッファヒストリ/カレントディレクトリを表示（デフォルトのバッファ切替を上書き）
(global-set-key (kbd "C-x b")
		(lambda ()
		  "Open buffer list in anything"
		  (interactive)
		  (anything '(anything-c-source-buffers
			      anything-c-source-file-name-history
			      anything-c-source-files-in-current-dir))))
;; anythingインクリメンタルサーチ
(global-set-key (kbd "M-s")
		  '(lambda ()
		     "Search current buffer in anything"
		     (interactive)
		     (anything '(anything-c-source-occur))))

;;redoを使えるようにする
(require 'redo+)
(global-set-key (kbd "C-M-/") 'redo)
(setq undo-no-redo t)           ;;Undo時に過去のUndoがRedoされないように設定
(setq undo-limit 600000)        ;;デフォルトでは20000
(setq undo-strong-limit 900000) ;;デフォルトでは30000

;;履歴拡張
(require 'recentf-ext)
(setq recentf-max-saved-items 500)
(setq recentf-exclude '("/TAGS$" "/var/tmp/"))

;;jaspace.el を使った全角空白、タブ、改行表示モード
;;切り替えは M-x jaspace-mode-on or -off
(require 'jaspace)
(setq jaspace-alternate-jaspace-string "□");; 全角空白を表示させる。

;; color-moccur の設定(moccur拡張 M-x moccurで全バッファから検索を行う)
(require 'color-moccur)

;;moccur-edit の設定(使い方はwdiredと一緒。rでバッファが編集可能になって、保存はC-x C-s。保存したくないときはC-x C-k。)
(load "moccur-edit")

;; org-mode(Emacsでメモ・TODO管理)
(require 'org-install)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-remember)
(setq org-startup-truncated nil)
(setq org-return-follows-link t)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(org-remember-insinuate)
(setq org-directory "~/memo/")
(setq org-default-notes-file (concat org-directory "notes.org"))
(setq org-agenda-files '("~/memo/notes.org"))
(setq org-remember-templates
      '(("Memo"        ?m "** %?\n   %i\n   %a\n   %t" nil "Memos")
	("ZBrush"      ?z "** %?\n   %i\n   %a\n   %t" nil "ZBrush")
	("Emacs"       ?e "** %?\n   %i\n   %a\n   %t" nil "Emacs")
	("Blender"     ?b "** %?\n   %i\n   %a\n   %t" nil "Blender")
	("Photoshop"   ?p "** %?\n   %i\n   %a\n   %t" nil "Photoshop")
	("3D-Coat"     ?3 "** %?\n   %i\n   %a\n   %t" nil "3D-Coat")))
(define-key org-mode-map [(control up)] 'outline-previous-visible-heading)
(define-key org-mode-map [(control down)] 'outline-next-visible-heading)
(define-key org-mode-map [(control right)] 'org-cycle)

;;describe-bindings を anything で置き換える（キーバインドを途中まで打ってから、F1で候補表示/絞り込み）
(require 'descbinds-anything)
(descbinds-anything-install)

;;key-code.elを使用して同時押しでコマンドを実行する
(require 'key-chord)
(setq key-chord-two-keys-delay 0.04)
(key-chord-mode 1)
(key-chord-define-global "jk" 'view-mode)             ;;jk同時押しでview-modeのトグル
(key-chord-define-global "df" 'describe-bindings)     ;;df同時押しでdescbinds-anything起動
(key-chord-define-global "11" 'delete-other-windows)  ;;他のウィンドウを閉じる（C-x 1）
(key-chord-define-global "rr" 'remember)	      ;;rememberモードも多用するので
(defadvice toggle-input-method (around toggle-input-method-around activate)
  (let ((input-method-function-save input-method-function))
    ad-do-it
    (setq input-method-function input-method-function-save)))

(require 'switch-window) ; C-x o が dim:switch-window になる
(define-key global-map (kbd "C-t") 'other-window)       ;;C-t に other-window(C-tは文字の交換がデフォルトで割り当てられているが、こっちのほうが便利)

;;リージョン選択機能の拡張（単語選択など）
(require 'thing-opt)
(define-thing-commands)
(key-chord-define-global "ii" 'mark-word*) ;; i連続押しで現在の単語を選択
(global-set-key (kbd "C-2") 'mark-string)  ;; C-2でストリングを選択
(global-set-key (kbd "C-8") 'mark-up-list) ;; C-8で（...）を選択
(global-set-key (kbd "C-7") 'mark-symbol)  ;; C-7でシンボル'...を選択(シングルクォート)

;; undo の履歴を木構造で辿る
(require 'undo-tree)
(global-undo-tree-mode)
(define-key undo-tree-visualizer-map (kbd "j") 'undo-tree-visualize-redo)                ;;vi系移動
(define-key undo-tree-visualizer-map (kbd "k") 'undo-tree-visualize-undo)                ;;vi系移動
(define-key undo-tree-visualizer-map (kbd "h") 'undo-tree-visualize-switch-branch-left)  ;;vi系移動
(define-key undo-tree-visualizer-map (kbd "l") 'undo-tree-visualize-switch-branch-right) ;;vi系移動

;; 連続操作のプリフィックスキーを省略する
(require 'smartrep)
;; Org-modeのキーバインド設定
(smartrep-define-key
    org-mode-map "C-c" '(("C-n" . (outline-next-visible-heading 1))
			 ("C-p" . (outline-previous-visible-heading 1))))
(setq smartrep-mode-line-active-bg "black" )

;; find-file( C-x C-f )の補完をzshライクに。物理移動は一般的なPNBFで行う
(require 'zlc)
(let ((map minibuffer-local-map))
  (define-key map (kbd "<backtab>") 'zlc-select-previous)
  (define-key map (kbd "S-<tab>") 'zlc-select-previous)
  (define-key map (kbd "C-p") 'zlc-select-previous-vertical)
  (define-key map (kbd "C-n") 'zlc-select-next-vertical)
  (define-key map (kbd "C-b") 'zlc-select-previous)
  (define-key map (kbd "C-f") 'zlc-select-next)
)

;; shell-command のコマンド入力補完
(require 'shell-command)
(shell-command-completion-mode)

;; スクラッチバッファのログをとるプラグイン
(require 'scratch-log)
(setq sl-scratch-log-file "~/scratchlog/scratch-log.org")
(setq sl-prev-scratch-string-file "~/scratchlog/scratch-log-prev.org")
(setq sl-restore-scratch-p nil)
(setq sl-prohibit-kill-scratch-buffer-p nil)

;;endプラグイン
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;コーディング設定
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; コメントスタイル
(setq comment-style 'multi-line)

;; Zen Coding Mode (C-j)
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook (lambda () (zencoding-mode 1)))
(add-hook 'html-mode-hook (lambda () (zencoding-mode 1)))

;;スニペットプラグインyasnippet通常版
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "c:/emacs-23.3/site-lisp/yasnippet-0.6.1c/snippets")
(setq yas/prompt-functions '(yas/dropdown-prompt))
(set-face-background 'yas/field-highlight-face "#000000") ;;入力中の背景
;; yasnippetの絞込みをanythingインターフェースで
(defun my-yas/prompt (prompt choices &optional display-fn)
  (let* ((names (loop for choice in choices
                      collect (or (and display-fn (funcall display-fn choice))
                                  coice)))
         (selected (anything-other-buffer
                    `(((name . ,(format "%s" prompt))
                       (candidates . names)
                       (action . (("Insert snippet" . (lambda (arg) arg))))))
                    "*anything yas/prompt*")))
    (if selected
        (let ((n (position selected names :test 'equal)))
          (nth n choices))
      (signal 'quit "user quit!"))))
(custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))

;; オートコンプリート
(require 'auto-complete)
(global-auto-complete-mode t)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
;; 0.1秒後に自動で表示
(setq ac-auto-show-menu 0.1)
(define-key ac-completing-map (kbd "C-p") 'ac-previous) ;;M-pから変更
(define-key ac-completing-map (kbd "C-n") 'ac-next)	;;M-nから変更
(define-key ac-completing-map (kbd "C-i") nil)	        ;;C-iで決定されないよう設定（C-iでyasnippetを実行）
(add-to-list 'ac-modes 'html-mode)                      ;; html-modeでac-modeを有効に
(add-to-list 'ac-modes 'org-mode)                       ;; org-modeでac-modeを有効に
(set-face-attribute 'ac-completion-face nil :background "#0d5e56" :foreground "#ffffff") ;;保管時のカラーリング

;; dabbrev-expand-multiple
(require 'dabbrev-expand-multiple)
(global-set-key "\M-i" 'dabbrev-expand-multiple)
(setq dabbrev-expand-multiple-select-keys '("a" "s" "d" "f" "g"))
(add-to-list 'dabbrev-expand-multiple-multi-selection-keys "m")
(add-to-list 'dabbrev-expand-multiple-next-keys "n")
(add-to-list 'dabbrev-expand-multiple-previous-keys "p")
(setq dabbrev-expand-multiple-tooltip-timeout 2000)
(setq dabbrev-expand-multiple-tooltip-timeout 10)
(setq dabbrev-expand-multiple-tooltip-params
      '((foreground-color . "grey75")
        (background-color . "navy blue")
        (border-color . "black")))
(setq dabbrev-expand-multiple-highlight-face 'highlight)
(setq dabbrev-expand-multiple-inline-show-face 'underline)
(setq dabbrev-expand-multiple-inline-show-face nil)
(setq dabbrev-expand-multiple-use-tooltip nil)

;; js2-mode
(autoload 'js2-mode "js2" nil t)
(setq-default c-basic-offset 4)		;;オフセット（インデント）をSPACE×4に。
(when (load "js2" t)
  (setq js2-cleanup-whitespace nil   ;;行末の空白を削除しない
        js2-mirror-mode t            ;;開き括弧の入力の際に、閉じ括弧を自動で入力する
        js2-bounce-indent-flag nil))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . js2-mode))
(add-hook 'js2-mode-hook
          '(lambda ()
;;	     (ac-mode t)
	     (find-file-for-abbrev '("c:/emacs-23.3/site-lisp/complist/javascript+DOM"))
             (setq js2-bounce-indent-flag nil)
	     (define-key js2-mode-map "\C-m" nil)
             (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)
	     (skip-chars-forward "\s " point-of-indentation)
             ))
(defun indent-and-back-to-indentation ()
  (interactive)
  (indent-for-tab-command)
  (let ((point-of-indentation
         (save-excursion
           (back-to-indentation)
           (point))))
    (skip-chars-forward "\s " point-of-indentation)))

;; 補完候補とするファイルを読み込ませる
(defun find-file-for-abbrev (filename-for-abbrev)
  (progn
    (let ((list filename-for-abbrev) filename buf cbuf)
      (setq cbuf (current-buffer))
      (while list
	(setq filename (car list))
	(setq list (cdr list))
	(if (get-buffer filename)
	    ()
	  (progn
	    (setq buf (find-file-noselect filename))
	    (set-buffer buf)
	    (rename-buffer
	     (concat " *" (file-name-nondirectory filename) "*") t))))
      (set-buffer cbuf))))

;; css-modeの設定
(autoload 'css-mode "css-mode")
(setq auto-mode-alist
      (cons '("\\.css\\'" . css-mode) auto-mode-alist))
(setq cssm-indent-function #'cssm-c-style-indenter)

;;key-chordモードを利用したマークアップ補助(マイナーモード)
(require 'html-key-chord-mode)
(key-chord-define-global "hk" 'html-key-chord-mode)

;; イコールの両端にスペースを入れる/{ 1回で{ }と入力。2回で{ のみを入力/( 1回で( )と入力。2回で( のみを入力
(require 'smartchr)
(global-set-key (kbd "=") (smartchr '(" = " " == " "=")))
(global-set-key (kbd "{") (smartchr '("{ `!!' }" "{")))
(global-set-key (kbd "(") (smartchr '("( `!!' )" "(")))
(global-set-key (kbd "\"") (smartchr '("\"`!!'\"" "\"")))
(defvar my-smartchr-minor-mode nil)
(defun my-smartchr-minor-mode ()
  "指定した smartchr.el のキーバインドの有効/無効を切り替えるマイナーモード"
  (interactive)
  (setq my-smartchr-minor-mode (not my-smartchr-minor-mode))
  (cond (my-smartchr-minor-mode
         (global-set-key (kbd "{") 'self-insert-command)
         (global-set-key (kbd "(") 'self-insert-command)
         (global-set-key (kbd "\"") 'self-insert-command)
         (global-set-key (kbd "=") 'self-insert-command)
        )
        (t
         (global-set-key (kbd "{") (smartchr '("{ `!!' }" "{")))
	 (global-set-key (kbd "(") (smartchr '("( `!!' )" "(")))
	 (global-set-key (kbd "\"") (smartchr '("\"`!!'\"" "\"")))
         (global-set-key (kbd "=") (smartchr '(" = " " == " "=")))
         )))
(defadvice cua--deactivate-rectangle (before my-cua--deactivate-rectangle ())
  (my-smartchr-minor-mode))
(defadvice cua--activate-rectangle (before my-cua--activate-rectangle ())
  (my-smartchr-minor-mode))

;;endコーディング設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
