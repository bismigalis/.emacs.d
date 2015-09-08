(global-set-key (kbd "<f1>") (lambda() (interactive) (shell "*shell1*")))
(global-set-key (kbd "<f2>") (lambda() (interactive) (shell "*shell2*")))

(defun bismi-shell-mode-keys ()
  (define-key shell-mode-map (kbd "<C-up>") 'windmove-up)
  (define-key shell-mode-map (kbd "<C-down>") 'windmove-down)
  (define-key shell-mode-map (kbd "C-c g") 'goto-python-trace-file-num)
  (define-key shell-mode-map (kbd "C-x t") 'goto-python-trace-file-num)
)


(add-hook 'shell-mode-hook 'bismi-shell-mode-keys)
