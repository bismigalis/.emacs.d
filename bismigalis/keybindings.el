;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LOCAL KEYS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)




;;;; UNSETTING
;;(global-unset-key (kbd "M-x"))
;(global-unset-key (kbd "C-w"))
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x a"))
(global-unset-key (kbd "C-<next>"))
(global-unset-key (kbd "C-/"))
(global-unset-key (kbd "<insert>"))



(global-set-key (kbd "C-`") ctl-x-r-map)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;;(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;;;; BOOKMARKS
(global-set-key (kbd "C-6") 'bm-toggle)
(global-set-key (kbd "C-5") 'bm-next)
(global-set-key (kbd "C-%") 'bm-previous)


;;;;SETTING
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x b") 'bs-show)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
;;(global-set-key (kbd "C-x k") 'kill-buffer-and-window)
;;(global-set-key (kbd "C-x x") 'execute-extended-command)
(global-set-key (kbd "C-x g") 'magit-status)


;(global-set-key (kbd "C-x z") 'zap-to-char)
;(global-set-key (kbd "C-x C-z") 'zap-to-char)
;;(global-set-key (kbd "M-z") 'repeat)

(global-set-key (kbd "C-<escape>") 'helm-mini)


(global-set-key (kbd "C-1") 'delete-other-windows)
(global-set-key (kbd "C-2") 'split-window-below)
(global-set-key (kbd "C-3") 'split-window-right)
(global-set-key (kbd "C-0") 'delete-window)

(global-set-key (kbd "C-<") 'beginning-of-buffer)
(global-set-key (kbd "C->") 'end-of-buffer)
(global-set-key (kbd "C-x C-d") 'dired)
(global-set-key (kbd "C-x C-u") 'undo)

(global-set-key (kbd "C-x S") (lambda () (interactive) (switch-to-buffer "*scratch*")))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x I") (lambda() (interactive) (find-file "~/.emacs.d/bismigalis")))
(global-set-key (kbd "C-x P") 'list-packages)
(global-set-key (kbd "C-x T") 'todotxt)

(global-set-key (kbd "M-e") 'move-end-of-line)

(global-set-key (kbd "C-w") 'whole-line-or-region-kill-region)
(global-set-key (kbd "M-w") 'whole-line-or-region-kill-ring-save)
(global-set-key (kbd "C-y") 'yank)



(require 'cycle-resize)
(global-set-key [C-pause] 'cycle-resize-window-vertically)
(global-set-key [M-pause] 'cycle-resize-window-horizontally)


;;;; prev/next buffer
(global-set-key [?\C-,] 'winner-undo)
(global-set-key [?\C-.] 'winner-redo)
(global-set-key (kbd "C-x .") 'next-buffer)
(global-set-key (kbd "C-x ,") 'previous-buffer)
;; (global-set-key (kbd "<C-next>") 'winner-redo)
;; (global-set-key (kbd "<C-prior>") 'winner-undo)


;; (setq swbuff-exclude-buffer-regexps '("^ .*" "^\\*.*\\*"))
;; (setq swbuff-exclude-mode-regexp "Dired")
;; (setq swbuff-clear-delay 0)

;; MULTIPLE-CURSORS
(global-set-key (kbd "C-=") 'mc/mark-next-like-this)


;;(global-set-key (kbd "C-a") 'beginning-or-indentation)
(global-set-key (kbd "C-a") 'smarter-move-beginning-of-line)

(global-set-key [remap delete-other-windows] 'zygospore-toggle-delete-other-windows)

;; keys for moving to prev/next code section (Form Feed; ^L)
(global-set-key (kbd "<C-M-prior>") 'backward-page) ; Ctrl+Alt+PageUp
(global-set-key (kbd "<C-M-next>") 'forward-page)   ; Ctrl+Alt+PageDown

(require 'loccur)
(define-key global-map [(meta o)] 'loccur-current)
;;(define-key global-map [(control meta o)] 'loccur)
;;(define-key global-map [(control shift o)] 'loccur-previous-match)


(global-set-key [f8] 'neotree-toggle)

;;(global-set-key (kbd "S-<f10>") 'recompile)


(global-set-key (kbd "C-x C-k") '(lambda () (interactive)
                                   (kill-buffer)
                                   (delete-window)))


;; META

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-X") 'smex)

(global-set-key (kbd "M-f") 'find-name-dired)
(global-set-key (kbd "M-r") 'rgrep)


;;(global-set-key (kbd "M-o") (lambda () (interactive) (other-window -1)))

(global-set-key (kbd "<M-SPC>") (lambda ()
                                  (interactive)
                                  (just-one-space -1)
                                  (delete-backward-char 1)))


(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(global-set-key (kbd "C-x <left>") 'hs-hide-block)
(global-set-key (kbd "C-x <right>") 'hs-show-block)



;;FASTNAV
(global-set-key "\M-z" 'fastnav-zap-up-to-char-forward)
(global-set-key "\M-Z" 'fastnav-zap-up-to-char-backward)
(global-set-key "\M-s" 'fastnav-jump-to-char-forward)
(global-set-key "\M-S" 'fastnav-jump-to-char-backward)
(global-set-key "\M-r" 'fastnav-replace-char-forward)
(global-set-key "\M-R" 'fastnav-replace-char-backward)
(global-set-key "\M-i" 'fastnav-insert-at-char-forward)
(global-set-key "\M-I" 'fastnav-insert-at-char-backward)
(global-set-key "\M-j" 'fastnav-execute-at-char-forward)
(global-set-key "\M-J" 'fastnav-execute-at-char-backward)
(global-set-key "\M-k" 'fastnav-delete-char-forward)
(global-set-key "\M-K" 'fastnav-delete-char-backward)
(global-set-key "\M-m" 'fastnav-mark-to-char-forward)
(global-set-key "\M-M" 'fastnav-mark-to-char-backward)
(global-set-key "\M-p" 'fastnav-sprint-forward)
(global-set-key "\M-P" 'fastnav-sprint-backward)


(global-set-key (kbd "M-<up>") 'smart-up)
(global-set-key (kbd "M-<down>") 'smart-down)
(global-set-key (kbd "M-<left>") 'smart-backward)
(global-set-key (kbd "M-<right>") 'smart-forward)
