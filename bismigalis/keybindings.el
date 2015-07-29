;;;; UNSETTING
;;(global-unset-key (kbd "M-x"))
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x a"))
(global-unset-key (kbd "C-<next>"))
(global-unset-key (kbd "C-/"))
(global-unset-key (kbd "<insert>"))



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
;;(global-set-key (kbd "C-x k") 'kill-buffer-and-window)
;;(global-set-key (kbd "C-x x") 'execute-extended-command)
(global-set-key (kbd "C-x g") 'magit-status)


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
(global-set-key (kbd "M-p") 'list-packages)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LOCAL KEYS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)



(global-set-key (kbd "<f1>") (lambda() (interactive) (term "/bin/bash")))
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

;; CORRAL
;; (global-set-key (kbd "M-9") 'corral-parentheses-backward)
;; (global-set-key (kbd "M-0") 'corral-parentheses-forward)
;; (global-set-key (kbd "M-[") 'corral-brackets-backward)
;; (global-set-key (kbd "M-]") 'corral-brackets-forward)
;; (global-set-key (kbd "C-\"") 'corral-double-quotes-backward)

;;(global-set-key (kbd "C-a") 'beginning-or-indentation)
(global-set-key (kbd "C-a") 'smarter-move-beginning-of-line)

(global-set-key [remap delete-other-windows] 'zygospore-toggle-delete-other-windows)

;; keys for moving to prev/next code section (Form Feed; ^L)
(global-set-key (kbd "<C-M-prior>") 'backward-page) ; Ctrl+Alt+PageUp
(global-set-key (kbd "<C-M-next>") 'forward-page)   ; Ctrl+Alt+PageDown

(require 'loccur)
(define-key global-map [(control o)] 'loccur-current)
(define-key global-map [(control meta o)] 'loccur)
(define-key global-map [(control shift o)] 'loccur-previous-match)
