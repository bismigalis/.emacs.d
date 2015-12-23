(add-hook 'compilation-mode-hook
          (lambda ()
            (define-key compilation-mode-map (kbd "C-o") 'other-window)
            ))
