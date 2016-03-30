;; (global-set-key (kbd "<f1>") (lambda() (interactive)
;;                                (ansi-term "/bin/bash" "*term*")
;;                                (term-line-mode)))
;; (global-set-key (kbd "<f2>") (lambda() (interactive) (shell "*shell2*")))
(global-set-key (kbd "<f1>") (lambda() (interactive) (eshell)))

(defun bismi-shell-mode-keys ()
  (define-key shell-mode-map (kbd "<C-up>") 'windmove-up)
  (define-key shell-mode-map (kbd "<C-down>") 'windmove-down)
  (define-key shell-mode-map (kbd "C-p") 'comint-previous-input)
  (define-key shell-mode-map (kbd "C-n") 'comint-next-input)
  (define-key shell-mode-map (kbd "C-c g") 'goto-python-trace-file-num)
  (define-key shell-mode-map (kbd "C-x t") 'goto-python-trace-file-num)
)


(add-hook 'shell-mode-hook 'bismi-shell-mode-keys)

(defun my-term-switch-line-char ()
   "Switch `term-in-line-mode' and `term-in-char-mode' in `ansi-term'"
   (interactive)
   (cond
    ((term-in-line-mode)
     (term-char-mode)
     (hl-line-mode -1))
    ((term-in-char-mode)
     (term-line-mode)
     (hl-line-mode 1))))

(defun bismi-term-mode-keys ()
  (define-key shell-mode-map (kbd "C-o") 'other-window)
  (yas-minor-mode -1)
  (setq term-buffer-maximum-size 1000)
  (toggle-truncate-lines 1)
  (define-key term-raw-map (kbd "C-t") 'my-term-switch-line-char)
  (define-key term-mode-map (kbd "C-t") 'my-term-switch-line-char)
  (define-key term-raw-map (kbd "M-x") 'execute-extended-command)
  (define-key term-raw-map (kbd "C-y") 'term-paste)
  (define-key term-raw-map (kbd "C-c l") 'org-store-link)
  (define-key term-raw-map (kbd "C-c c") 'org-capture)
  (define-key term-raw-map (kbd "C-c a") 'org-agenda)
  (define-key term-raw-map (kbd "C-c C-e") 'term-send-esc)
  )
(add-hook 'term-mode-hook 'bismi-term-mode-keys)




(require 'eshell)
(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)



(add-hook 'eshell-mode-hook 'eshell-smart-initialize)
(add-hook 'eshell-mode-hook #'eshell-fringe-status-mode)
