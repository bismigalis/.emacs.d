;;;; UNSETTING
;;(global-unset-key (kbd "M-x"))
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x a"))
(global-unset-key (kbd "C-<next>"))
(global-unset-key (kbd "C-/"))



(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;;(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;;;; BOOKMARKS
(global-set-key (kbd "C-6") 'bm-toggle)
(global-set-key (kbd "C-5")   'bm-next)
(global-set-key (kbd "C-%") 'bm-previous)


;;;;SETTING
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x b") 'previous-buffer)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
;;(global-set-key (kbd "C-x x") 'execute-extended-command)
(global-set-key (kbd "C-x m") 'magit-status)


;(global-set-key (kbd "C-x z") 'zap-to-char)
;(global-set-key (kbd "C-x C-z") 'zap-to-char)
;;(global-set-key (kbd "M-z") 'repeat)

;;(global-set-key (kbd "C-`") 'ibuffer)
(global-set-key (kbd "C-`") 'helm-mini)
(global-set-key (kbd "C-<escape>") 'helm-mini)


(global-set-key (kbd "C-1") 'delete-other-windows)
(global-set-key (kbd "C-2") 'split-window-below)
(global-set-key (kbd "C-3") 'split-window-right)
(global-set-key (kbd "C-0") 'delete-window)

(global-set-key (kbd "C-<") 'beginning-of-buffer)
(global-set-key (kbd "C->") 'end-of-buffer)

(global-set-key (kbd "C-x C-d") 'dired)
(global-set-key (kbd "C-x C-u") 'undo)



(global-set-key (kbd "M-i") (lambda() (interactive) (find-file "~/.emacs.d/init.el")))
;(global-set-key (kbd "M-p") 'repeat)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LOCAL KEYS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(define-key python-mode-map (kbd "<f12>") 'python-shell-switch-to-shell)
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)

(global-set-key (kbd "<f1>") 'shell)

(require 'cycle-resize)
(global-set-key [C-pause] 'cycle-resize-window-vertically)
(global-set-key [M-pause] 'cycle-resize-window-horizontally)


;;;; prev/next buffer
;; (global-set-key [?\C-,] 'swbuff-switch-to-next-buffer)
;; (global-set-key [?\C-.] 'swbuff-switch-to-previous-buffer)
;; (setq swbuff-exclude-buffer-regexps '("^ .*" "^\\*.*\\*"))
;; (setq swbuff-exclude-mode-regexp "Dired")
;; (setq swbuff-clear-delay 0)
