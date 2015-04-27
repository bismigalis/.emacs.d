(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default default default italic underline success warning error])
 '(ansi-color-names-vector ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(dired-dwim-target t)
 '(fci-rule-color "#383838")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors (quote (("#eee8d5" . 0) ("#B4C342" . 20) ("#69CABF" . 30) ("#69B7F0" . 50) ("#DEB542" . 60) ("#F2804F" . 70) ("#F771AC" . 85) ("#eee8d5" . 100))))
 '(js-enabled-frameworks (quote (javascript mochikit)))
 '(js-indent-level 2)
 '(jsx-indent-level 2)
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(show-paren-mode t)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map (quote ((20 . "#BC8383") (40 . "#CC9393") (60 . "#DFAF8F") (80 . "#D0BF8F") (100 . "#E0CF9F") (120 . "#F0DFAF") (140 . "#5F7F5F") (160 . "#7F9F7F") (180 . "#8FB28F") (200 . "#9FC59F") (220 . "#AFD8AF") (240 . "#BFEBBF") (260 . "#93E0E3") (280 . "#6CA0A3") (300 . "#7CB8BB") (320 . "#8CD0D3") (340 . "#94BFF3") (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(web-mode-code-indent-offset 2)
 '(web-mode-enable-auto-pairing nil)
 '(web-mode-enable-auto-quoting nil)
 '(weechat-color-list (quote (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496"))))
;;END

;;;; package system setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


(define-coding-system-alias 'UTF-8 'utf-8)
(setq vc-handled-backends (quote ()))
(setq tramp-default-method "ssh")


;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
;; (autoload 'jsx-mode "jsx-mode" "JSX mode" t)

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

;;(setq gud-pdb-command-name "python -m pdb")
;;(add-hook 'comint-output-filter-functions 'python-pdbtrack-comint-output-filter-function)

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
;;(menu-bar-mode -1)
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
(global-set-key (kbd "M-<down>") 'highlight-symbol-next)
(global-set-key (kbd "M-<up>") 'highlight-symbol-prev)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)

(defun load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t) (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath)))))))
(load-directory "~/.emacs.d/bismigalis")


(defvar bismigalis/packages '(;; ac-slime
			      ;; auto-complete
			      autopair
			      highlight-symbol
			      ;; clojure-mode
			      ;; clojure-test-mode
			      ;; coffee-mode
			      ;; csharp-mode
			      ;; deft
			      ;; erlang
			      ;; feature-mode
			      flycheck
			      ;; gist
			      ;; graphviz-dot-mode
			      ;; haml-mode
			      ;; htmlize
			      magit
			      ;; markdown-mode
			      ;; marmalade
			      nodejs-repl
			      ;; nrepl
			      ;; o-blog
			      ;; org
			      paredit
			      ;; php-mode
			      ;; puppet-mode
			      restclient
			      smex
			      bm
			      web-mode
			      ;; writegood-mode
			      yaml-mode
			      )
  "Default packages")

;;;;Install default packages
(defun bismigalis/packages-installed-p ()
  (loop for pkg in bismigalis/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (bismigalis/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg bismigalis/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))



;;;; hide hidden files
(require 'dired-x)
(setq dired-omit-files "^\\...+$")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))

;;;;display settings
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;;;; indentation
(setq-default tab-width 4
      indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 4 200 4))

;;;; misc
(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell nil)
(show-paren-mode t)

;;;;SMEX
(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)


;;;; temprorary files
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;;;;
(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")
;;(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(require 'autopair)

;;;;YAML mode
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;;;; theme switch
;;(if window-system
;;    (load-theme 'solarized-light t)
;;  (load-theme 'wombat t))

;;;; PROJECTILE
;; (projectile-global-mode)
;; (setq projectile-completion-system 'helm)
;; (helm-projectile-on)
;; (define-key key-translation-map "\M-p" (kbd "C-c p"))
;;(setq projectile-keymap-prefix (kbd "M-p"))

;;;;YASNIPPET
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)

;;;;HIGHLIGHT
(highlight-symbol-mode)
;; (global-set-key [f3] 'highlight-symbol-next)
;; (global-set-key [(shift f3)] 'highlight-symbol-prev)
;; (global-set-key [f3] 'highlight-symbol-next-in-defun)
;; (global-set-key [(shift f3)] 'highlight-symbol-prev-in-defun)
;;(highlight-symbol-nav-mode)
;;(global-set-key [(meta f3)] 'highlight-symbol-query-replace)



;;;;FLYCHECK
(require 'flycheck)
(add-hook 'js-mode-hook (lambda () (flycheck-mode t)))
(add-hook 'python-mode-hook (lambda () (flycheck-mode t)))

;;;;HOOKS
(add-hook 'nxml-mode-hook
          (lambda ()
            (setq tab-width 4)
            (setq nxml-child-indent 4)
            ))


;;(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;;(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
;;(add-hook 'clojure-mode-hook #'enable-paredit-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
