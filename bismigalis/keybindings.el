;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LOCAL KEYS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; UNSETTING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(global-unset-key (kbd "M-x"))
;(global-unset-key (kbd "C-w"))
(global-unset-key (kbd "<f2>"))
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x a"))
(global-unset-key (kbd "C-<next>"))
(global-unset-key (kbd "C-/"))
(global-unset-key (kbd "<insert>"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;SETTING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(windmove-default-keybindings 'shift)
;;(windmove-default-keybindings 'meta)
;;(windmove-default-keybindings 'ctrl)

;; (global-set-key (kbd "M-<up>") 'smart-up)
;; (global-set-key (kbd "M-<down>") 'smart-down)
(global-set-key (kbd "M-<left>") 'backward-word)
(global-set-key (kbd "M-<right>") 'forward-word)



(global-set-key (kbd "C-`") ctl-x-r-map)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;;(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;;;; BOOKMARKS
(global-set-key (kbd "C-6") 'bm-toggle)
(global-set-key (kbd "C-5") 'bm-show)
(global-set-key (kbd "C-%") 'bm-show-all)


(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x b") 'bs-show)
(global-set-key (kbd "C-x k") 'kill-buffer)
(global-set-key (kbd "C-x C-k") 'kill-buffer)
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
(global-set-key (kbd "C-x I") (lambda() (interactive) (find-file "~/.emacs.d/bismigalis")))
(global-set-key (kbd "C-x O") (lambda() (interactive) (find-file "~/org")))
(global-set-key (kbd "C-x A") (lambda() (interactive) (find-file "~/workspace/idea.azigo/2014/com.azigo.js.portal_v2016/src/main/resources/a.org")))
(global-set-key (kbd "C-x P") 'list-packages)
(global-set-key (kbd "C-x T") 'todotxt)

(global-set-key (kbd "M-e") 'move-end-of-line)




(require 'cycle-resize)
(global-set-key [C-pause] 'cycle-resize-window-vertically)
(global-set-key [M-pause] 'cycle-resize-window-horizontally)


;;;; prev/next buffer
(global-set-key (kbd "C-,") 'previous-buffer)
(global-set-key (kbd "C-.") 'next-buffer)
;; winner
(global-set-key (kbd "C-x <left>") 'winner-undo)
(global-set-key (kbd "C-x <right>") 'winner-redo)


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
(define-key global-map [(control o)] 'loccur-current)
(define-key global-map [(meta o)] 'loccur)
;;(define-key global-map [(control shift o)] 'loccur-previous-match)


(global-set-key [f8] 'neotree-toggle)

;;(global-set-key (kbd "S-<f10>") 'recompile)


;; (global-set-key (kbd "C-x C-k") '(lambda () (interactive)
;;                                    (kill-buffer)
;;                                    (delete-window)))


;; META

(global-set-key (kbd "M-X") 'helm-M-x)
(global-set-key (kbd "M-x") 'smex)

(global-set-key (kbd "M-f") 'find-name-dired)
(global-set-key (kbd "M-r") 'replace-string)


;;(global-set-key (kbd "M-o") (lambda () (interactive) (other-window -1)))

(global-set-key (kbd "<M-SPC>") (lambda ()
                                  (interactive)
                                  (just-one-space -1)
                                  (delete-backward-char 1)))


(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(global-set-key (kbd "C-x <left>") 'hs-hide-block)
(global-set-key (kbd "C-x <right>") 'hs-show-block)

(global-set-key (kbd "C-n") 'forward-line)

(global-set-key "\M-." 'etags-select-find-tag)

(global-set-key "\M-e" 'embrace-commander)

(global-set-key (kbd "C-c l") 'org-store-link)

;;(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-f") 'find-file)

(global-set-key [remap next-buffer] 'bismi/next-user-buffer)
(global-set-key [remap previous-buffer] 'bismi/previous-user-buffer)

;; move line up/down
(global-set-key (kbd "C-M-<up>") 'shift-text-up)
(global-set-key (kbd "C-M-<down>") 'shift-text-down)
(global-set-key (kbd "C-M-<left>") 'shift-text-left)
(global-set-key (kbd "C-M-<right>") 'shift-text-right)

(global-set-key (kbd "C-x C-j") (lambda () (interactive) (join-line)))
