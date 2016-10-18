(setq js-indent-width 2)

(require 'flycheck)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))
;;(add-to-list 'auto-mode-alist '("\\.json\\'" . fundamental-mode))
(add-to-list 'auto-mode-alist '("\\.soy\\'" . closure-template-html-mode))

(add-hook 'js2-mode-hook
          #'(lambda ()
              (flycheck-mode t)
              (electric-indent-local-mode -1)
              (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
              (define-key js2-mode-map "@" 'js-doc-insert-tag)))

(require 'flymake-json)
;;(add-hook 'json-mode 'flymake-json-load)
(add-hook 'json-mode-hook #'(lambda ()
                         (js-indent-level 2)
                         (setq tab-width 2)
                         ))

;;(require 'js2-refactor)
;(add-hook 'js2-mode-hook #'js2-refactor-mode)
;;(js2r-add-keybindings-with-prefix "C-x M-r")

;; (custom-set-variables
;;  '(js2-basic-offset 2)
;;  '(js2-bounce-indent-p t)
;; )


(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)))
