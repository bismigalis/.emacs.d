(defun bismi/html-mode-keys ()
  (local-set-key (kbd "C-M-<up>") (lambda () (interactive) (bismi/change-number-at-point t)))
  (local-set-key (kbd "C-M-<down>") (lambda () (interactive) (bismi/change-number-at-point nil)))

  (local-set-key (kbd "C-c <right>") 'hs-show-block)
  (local-set-key (kbd "C-c <left>")  'hs-hide-block)
  (local-set-key (kbd "C-c <up>")    'hs-hide-all)
  (local-set-key (kbd "C-c <down>")  'hs-show-all)
)

(add-hook 'sgml-mode-hook
          (lambda ()
            (bismi/html-mode-keys)
            ))
(add-hook 'web-mode-hook
          (lambda ()
            (bismi/html-mode-keys)
            (setq web-mode-markup-indent-offset 2)

            ))


(add-hook 'sgml-mode-hook 'emmet-mode)
;;(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . html-mode))
