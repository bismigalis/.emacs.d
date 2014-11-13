;;;; UNSETTING
;;(global-unset-key (kbd "M-x"))
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x a"))
(global-unset-key (kbd "C-<next>"))
(global-unset-key (kbd "C-/"))


;;;; BOOKMARKS
(global-set-key (kbd "C-6") 'bm-toggle)
(global-set-key (kbd "C-5")   'bm-next)
(global-set-key (kbd "C-%") 'bm-previous)


;;;;SETTING

;; prev/next buffer
(global-set-key [?\C-,] 'iflipb-previous-buffer)
(global-set-key [?\C-.] 'iflipb-next-buffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x b") 'previous-buffer)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
;;(global-set-key (kbd "C-x x") 'execute-extended-command)
(global-set-key (kbd "C-x m") 'magit-status)


;(global-set-key (kbd "C-x z") 'zap-to-char)
;(global-set-key (kbd "C-x C-z") 'zap-to-char)
;;(global-set-key (kbd "M-z") 'repeat)

(global-set-key (kbd "C-`") 'ibuffer)

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
