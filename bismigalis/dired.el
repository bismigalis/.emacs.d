(setq dired-listing-switches "--group-directories-first -lLh")
(setq dired-dwim-target t)
(put 'dired-find-alternate-file 'disabled nil)

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "C-o") 'other-window)
            ))
