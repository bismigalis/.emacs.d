(setq ag-highlight-search t
      save-interprogram-paste-before-kill t
      org-return-follows-link t
      jit-lock-defer-time 0.05

      recenter-positions '(top middle bottom)
      mark-even-if-inactive nil
      set-mark-command-repeat-pop t

      helm-full-frame t
      ;;tags-table-list '("~/workspace/idea.azigo/adminka")
      etags-table-search-up-depth 10
      )
(require 'etags-table)
;;;; temprorary files
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
(setq browse-url-browser-function 'eww-browse-url)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

(setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "chromium-browser")
(setq stack-trace-on-error t)
;;(setq make-backup-files t)
(setq inhibit-splash-screen t
      initial-scratch-message nil
      ;;initial-major-mode 'org-mode
      )

(delete-selection-mode)
;;(setq x-select-enable-primary t)
;;(setq x-select-enable-clipboard t)
;;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


(load-theme 'liso t)

(global-undo-tree-mode)

(ido-mode t)
(setenv "PAGER" "/bin/cat")

(add-hook 'after-init-hook 'session-initialize)
(add-hook 'prog-mode-hook 'ws-butler-mode) ;;Unobtrusively whitespace deletion
(add-hook 'text-mode-hook 'whole-line-or-region-mode)

(windmove-default-keybindings 'shift)
(windmove-default-keybindings 'ctrl)
;;(require 'git-gutter-fringe)
;;(global-git-gutter-mode t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

(require 'todotxt)

(global-auto-revert-mode 1)
(setq auto-revert-check-vc-info t)

(setq compilation-scroll-output t)

(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell nil)

;;;; indentation
(setq-default tab-width 4
      indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 4 200 4))

;;;;SMEX
(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)



;;;;YASNIPPET
(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/bismigalis/snippets"))
(yas-global-mode -1)
(yas-reload-all)
(add-hook 'prog-mode-hook 'yas-minor-mode)


(winner-mode 1)
(add-hook 'after-init-hook 'global-company-mode)

;;show buffer filename in the title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(when (fboundp 'winner-mode)
      (winner-mode 1))
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))

(show-paren-mode 1)
(setq-default show-paren-delay 0)
(setq shell-file-name "/bin/bash")
(setq explicit-shell-file-name "/bin/bash")
;;(global-page-break-lines-mode)
;; keys for moving to prev/next code section (Form Feed; ^L)
(global-set-key (kbd "<C-M-prior>") 'backward-page) ; Ctrl+Alt+PageUp
(global-set-key (kbd "<C-M-next>") 'forward-page)   ; Ctrl+Alt+PageDown

(define-coding-system-alias 'UTF-8 'utf-8)
(setq vc-handled-backends (quote ()))
(setq tramp-default-method "ssh")
(setq venv-location "/home/user/.env") ;;;VIRTUALENVWRAPPER
;;(desktop-save-mode 1)

(setq browse-url-browser-function 'w3m-goto-url-new-session)
(setq w3m-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.")

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; (add-hook 'before-save-hook
;;           'delete-trailing-whitespace) 

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))


(require 'cl)
;;(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)

(setq make-backup-files nil)
(setq column-number-mode t)
;;;;MARKING TEXT
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)


(require 'highlight-symbol)
;;(setq highlight-symbol-mode t)
;;(highlight-symbol-mode)
(global-set-key (kbd "C-c h") 'highlight-symbol-at-point)
(global-set-key (kbd "C-c H") 'highlight-symbol-remove-all)
(global-set-key (kbd "M-<down>") 'highlight-symbol-next)
(global-set-key (kbd "M-<up>") 'highlight-symbol-prev)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)

(put 'narrow-to-region 'disabled nil)


(when (require 'browse-kill-ring nil 'noerror)
  (browse-kill-ring-default-keybindings))
(setq browse-kill-ring-quit-action 'save-and-restore)

;; (add-to-list 'display-buffer-alist
;;                     `(,(rx bos "*helm" (* not-newline) "*" eos)
;;                          (display-buffer-in-side-window)
;;                          (inhibit-same-window . t)
;;                          (window-height . 0.4)))


(global-set-key (kbd "C-x n n") (lambda ()
                                  (interactive)
                                      (narrow-to-region (region-beginning) (region-end))
                                      (goto-char 0)
                                      (keyboard-quit)
                                      ))


;; (require 'eproject-extras)
;; (define-project-type azigo (generic)
;;   (look-for "pom.xml")
;;   ;;:relevant-files ("\\.pm$" "\\.t$")
;;   )

;; BIG FILES
(defun my-find-file-check-make-large-file-read-only-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 1024 1024))
    ;;(setq buffer-read-only t)
    (buffer-disable-undo)
    (linum-mode -1)
    (font-lock-mode -1)
    ;;(fundamental-mode)
    ))

(add-hook 'find-file-hook 'my-find-file-check-make-large-file-read-only-hook)
