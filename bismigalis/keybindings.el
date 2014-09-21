;;;; UNSETTING
;;(global-unset-key (kbd "M-x"))






;;;;SETTING

;; prev/next buffer
(global-set-key [?\C-,] 'previous-buffer)
(global-set-key [?\C-.] 'next-buffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x b") 'previous-buffer)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-x x") 'execute-extended-command)
(global-set-key (kbd "C-x m") 'magit-status)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-`") 'ibuffer)

(global-set-key (kbd "C-1") 'delete-other-windows)
(global-set-key (kbd "C-2") 'split-window-below)
(global-set-key (kbd "C-3") 'split-window-right)

(global-set-key (kbd "C-<") 'beginning-of-buffer)
(global-set-key (kbd "C->") 'end-of-buffer)
