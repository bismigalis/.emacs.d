(global-set-key (kbd "<f12>") (lambda (char)
                                (interactive "cInsert Register:")
                                (insert-register char 't)))
(global-set-key  (kbd "<C-f12>") (lambda (char)
                                   (interactive "cCopy to Register:")
                                   (copy-to-register char (region-beginning) (region-end))
                                   ;;(cua-cancel)
                                   ))
(global-set-key (kbd "<C-S-f12>")  (lambda (char)
                                     (interactive "cCut to Register:")
                                     (copy-to-register char (region-beginning) (region-end))
                                     ;;(cua-delete-region)
                                     ))
