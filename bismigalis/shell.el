(global-set-key (kbd "<f1>") (lambda() (interactive)
                               (ansi-term "/bin/bash" "*term*")
                               (term-line-mode)))
(global-set-key (kbd "<f2>") (lambda() (interactive) (shell "*shell2*")))

(defun bismi-shell-mode-keys ()
  (define-key shell-mode-map (kbd "<C-up>") 'windmove-up)
  (define-key shell-mode-map (kbd "<C-down>") 'windmove-down)
  (define-key shell-mode-map (kbd "C-p") 'comint-previous-input)
  (define-key shell-mode-map (kbd "C-n") 'comint-next-input)
  (define-key shell-mode-map (kbd "C-c g") 'goto-python-trace-file-num)
  (define-key shell-mode-map (kbd "C-x t") 'goto-python-trace-file-num)
)


(add-hook 'shell-mode-hook 'bismi-shell-mode-keys)


(defun bismi-term-mode-keys ()
  (define-key shell-mode-map (kbd "C-o") 'other-window)
  )
(add-hook 'term-mode-hook 'bismi-term-mode-keys)
