;;EXPIREMENT
;; trying ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


;;END


;;;; package system setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

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
(add-to-list 'auto-mode-alist '("\\.pt\\'" . html-mode))

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


;;rings
(require 'rings)
(global-set-key (kbd "<f1>")   (rings-generate-cycler 1))
(global-set-key (kbd "C-<f1>") (rings-generate-setter 1))
(global-set-key (kbd "<f2>")   (rings-generate-cycler 2))
(global-set-key (kbd "C-<f2>") (rings-generate-setter 2))
(global-set-key (kbd "<f3>")   (rings-generate-cycler 3))
(global-set-key (kbd "C-<f3>") (rings-generate-setter 3))
(global-set-key (kbd "<f4>")   (rings-generate-cycler 4))
(global-set-key (kbd "C-<f4>") (rings-generate-setter 4))

(require 'highlight-symbol)
;;(setq highlight-symbol-mode t)
(global-set-key (kbd "C-c h") 'highlight-symbol-at-point)
(global-set-key (kbd "M-<down>") 'highlight-symbol-next)
(global-set-key (kbd "M-<up>") 'highlight-symbol-prev)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)


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
			      flycheck
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
(projectile-global-mode)

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
(add-hook 'js-mode-hook
          (lambda () (flycheck-mode t)))
(add-hook 'python-mode-hook
          (lambda () (flycheck-mode t)))

;;;;HOOKS
(add-hook 'nxml-mode-hook
          (lambda ()
            (setq tab-width 4)
            (setq nxml-child-indent 4)
            ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (cyberpunk)))
 '(custom-safe-themes
   (quote
    ("8cec37df141fe51941e8922ea2691c7d3806bbf580474a5a0158b84b56d91987" "f0a99f53cbf7b004ba0c1760aa14fd70f2eabafe4e62a2b3cf5cabae8203113b" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8fd393097ac6eabfcb172f656d781866beec05f27920a0691e8772aa2cdc7132" "25f330cb050c7e7ec402af1b60243e8185a7837b455af0fa026593d4f48a78b2" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(dired-dwim-target t)
 '(fci-rule-color "#383838")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(js-enabled-frameworks (quote (javascript mochikit)))
 '(js-indent-level 2)
 '(magit-diff-use-overlays nil)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gray20" :foreground "#DCDCCC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "unknown" :family "Ubuntu Mono")))))
(put 'narrow-to-region 'disabled nil)
