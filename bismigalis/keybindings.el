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
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)



(global-set-key (kbd "<f1>") (lambda() (interactive) (shell "*shell1*")))
(global-set-key (kbd "<f2>") (lambda() (interactive) (shell "*shell2*")))
(global-set-key (kbd "<f3>") (lambda() (interactive) (shell "*shell3*")))
(global-set-key (kbd "<f4>") (lambda() (interactive) (shell "*shell4*")))

(require 'cycle-resize)
(global-set-key [C-pause] 'cycle-resize-window-vertically)
(global-set-key [M-pause] 'cycle-resize-window-horizontally)


;;;; prev/next buffer
(global-set-key [?\C-,] 'bismi-next-user-buffer)
(global-set-key [?\C-.] 'bismi-previous-user-buffer)
;; (setq swbuff-exclude-buffer-regexps '("^ .*" "^\\*.*\\*"))
;; (setq swbuff-exclude-mode-regexp "Dired")
;; (setq swbuff-clear-delay 0)

;; MULTIPLE-CURSORS
(global-set-key (kbd "C-=") 'mc/mark-next-like-this)


;; misc-cmds.el
;;   The first two of these are needed to remove the default remappings.
(require 'misc-cmds)
(define-key visual-line-mode-map [remap move-beginning-of-line] nil)
(define-key visual-line-mode-map [remap move-end-of-line] nil)
(define-key visual-line-mode-map [home] 'beginning-of-line+)
(define-key visual-line-mode-map [end]  'end-of-line+)
(define-key visual-line-mode-map "\C-a" 'beginning-of-visual-line+)
(define-key visual-line-mode-map "\C-e" 'end-of-visual-line+)

(global-set-key [remap previous-buffer] 'previous-buffer-repeat)
(global-set-key [remap next-buffer]     'next-buffer-repeat)
(global-set-key [remap undo]            'undo-repeat)

;; CORRAL
(global-set-key (kbd "M-9") 'corral-parentheses-backward)
(global-set-key (kbd "M-0") 'corral-parentheses-forward)
(global-set-key (kbd "M-[") 'corral-brackets-backward)
(global-set-key (kbd "M-]") 'corral-brackets-forward)
(global-set-key (kbd "C-\"") 'corral-double-quotes-backward)

(global-set-key (kbd "C-a") 'beginning-or-indentation)

(global-set-key [remap delete-other-windows] 'zygospore-toggle-delete-other-windows)
