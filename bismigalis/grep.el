(add-hook 'grep-mode-hook
          (lambda ()
            (local-set-key (kbd "C-o") 'other-window)
            ))
