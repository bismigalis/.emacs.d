(defun bismi/html-mode-keys ()
  (local-set-key (kbd "C-<up>") (lambda () (interactive) (bismi/change-number-at-point t)))
  (local-set-key (kbd "C-<down>") (lambda () (interactive) (bismi/change-number-at-point nil)))
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
(add-hook 'css-mode-hook  'emmet-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
