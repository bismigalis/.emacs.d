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
(desktop-save-mode 1)

;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
;; (autoload 'jsx-mode "jsx-mode" "JSX mode" t)

(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "M-r")

(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.pt\\'" . web-mode))

(setq browse-url-browser-function 'w3m-goto-url-new-session)
(setq w3m-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.")

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

(add-hook 'before-save-hook
          'delete-trailing-whitespace)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))


(require 'cl)
(setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "chromium-browser")
(toggle-uniquify-buffer-names)
(setq stack-trace-on-error t)
;;(setq make-backup-files t)
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)
;;(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(windmove-default-keybindings 'control)
(setq make-backup-files nil)
(setq column-number-mode t)
;;;;MARKING TEXT
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)


(require 'highlight-symbol)
;;(setq highlight-symbol-mode t)
(global-set-key (kbd "C-c h") 'highlight-symbol-at-point)
(global-set-key (kbd "C-c H") 'highlight-symbol-remove-all)
(global-set-key (kbd "M-<down>") 'highlight-symbol-next)
(global-set-key (kbd "M-<up>") 'highlight-symbol-prev)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)


(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(setq browse-url-browser-function 'eww-browse-url)
