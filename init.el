(require 'cl)
(setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "chromium-browser")
(toggle-uniquify-buffer-names)
(setq stack-trace-on-error t)
(setq make-backup-files nil)
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

;;;; package system setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(require 'highlight-symbol)
(setq highlight-symbol-mode t)

(load "~/.emacs.d/bismigalis/utilities.el")
(load "~/.emacs.d/bismigalis/keybindings.el")
;;or
;; (defvar abedra/vendor-dir (expand-file-name "vendor" user-emacs-directory))
;; (add-to-list 'load-path abedra/vendor-dir)

;; (dolist (project (directory-files abedra/vendor-dir t "\\w+"))
;;   (when (file-directory-p project)
;;     (add-to-list 'load-path project)))


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
			      ;; flycheck
			      ;; gist
			      ;; go-mode
			      ;; graphviz-dot-mode
			      ;; haml-mode
			      ;; haskell-mode
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
			      ;; rvm
			      ;; scala-mode
			      smex
			      ;; sml-mode
			      ;; solarized-theme
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


(put 'dired-find-alternate-file 'disabled nil)

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
(setq tab-width 2
      indent-tabs-mode nil)

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
(require 'iswitchb)
(require 'uniquify)
(require 'autopair)
;;(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;;;YAML mode
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;;;; theme switch
;;(if window-system
;;    (load-theme 'solarized-light t)
;;  (load-theme 'wombat t))

;;;; PROJECTILE
(projectile-global-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (hc-zenburn)))
 '(custom-safe-themes (quote ("8fd393097ac6eabfcb172f656d781866beec05f27920a0691e8772aa2cdc7132" "25f330cb050c7e7ec402af1b60243e8185a7837b455af0fa026593d4f48a78b2" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(js-enabled-frameworks (quote (javascript mochikit)))
 '(js-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;;;HIGHLIGHT
(highlight-symbol-mode)
;; (global-set-key [f3] 'highlight-symbol-next)
;; (global-set-key [(shift f3)] 'highlight-symbol-prev)
;; (global-set-key [f3] 'highlight-symbol-next-in-defun)
;; (global-set-key [(shift f3)] 'highlight-symbol-prev-in-defun)
;;(highlight-symbol-nav-mode)
;;(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

