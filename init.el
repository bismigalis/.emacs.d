(toggle-uniquify-buffer-names)
(setq stack-trace-on-error t)
(setq make-backup-files nil)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(load "~/.emacs.d/bismigalis/window-managment.el")
(load "~/.emacs.d/bismigalis/keybindings.el")


;;;; делаем чтоб при открытии emacs'а не было мусора, а был открыт только один буфер *scratch*
(setq inhibit-splash-screen t)

;;;; Не надо набирать 'yes' или 'no'. Теперь 'y' либо 'n'
(fset 'yes-or-no-p 'y-or-n-p)

;;;; навигация между окнами при помощи M-`Arrow keys`
(windmove-default-keybindings 'meta)

(put 'dired-find-alternate-file 'disabled nil)

;;;; hide hidden files
(require 'dired-x)
(setq dired-omit-files "^\\...+$")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))

;;;; 
(require 'iswitchb)

(require 'uniquify)
;;(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

