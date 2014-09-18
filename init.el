(require 'cl)

(toggle-uniquify-buffer-names)
(setq stack-trace-on-error t)
(setq make-backup-files nil)
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)
;;(scroll-bar-mode -1)
;;(tool-bar-mode -1)
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

(load "~/.emacs.d/bismigalis/window-managment.el")
(load "~/.emacs.d/bismigalis/keybindings.el")
;;or
;; (defvar abedra/vendor-dir (expand-file-name "vendor" user-emacs-directory))
;; (add-to-list 'load-path abedra/vendor-dir)

;; (dolist (project (directory-files abedra/vendor-dir t "\\w+"))
;;   (when (file-directory-p project)
;;     (add-to-list 'load-path project)))


(defvar bismigalis/packages '(;; ac-slime
			      ;; auto-complete
			      ;; autopair
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
