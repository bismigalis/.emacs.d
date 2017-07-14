(add-hook 'compilation-mode-hook
          (lambda ()
            (define-key compilation-mode-map (kbd "C-o") 'other-window)
            ))
(global-set-key (kbd "<f9>") 'recompile)
