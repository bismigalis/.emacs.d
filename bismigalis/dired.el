(setq dired-listing-switches "--group-directories-first -lLh")
(setq dired-dwim-target t)
(setq wdired-allow-to-change-permissions t)
(setq dired-auto-revert-buffer t)

(put 'dired-find-alternate-file 'disabled nil)

;; (add-hook 'dired-mode-hook
;;           (lambda ()
;;             (define-key dired-mode-map (kbd "C-o") 'other-window)
;;             ))
