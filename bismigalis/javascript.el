
(require 'flycheck)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . fundamental-mode))
(add-to-list 'auto-mode-alist '("\\.soy\\'" . closure-template-html-mode))

(add-hook 'js2-mode-hook
          #'(lambda ()
              (flycheck-mode t)
              (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
              (define-key js2-mode-map "@" 'js-doc-insert-tag)))

(require 'flymake-json)
(add-hook 'json-mode 'flymake-json-load)

;; (require 'js2-refactor)
;; (add-hook 'js2-mode-hook #'js2-refactor-mode)
;; (js2r-add-keybindings-with-prefix "M-r")

(custom-set-variables  
 '(js2-basic-offset 2)  
 '(js2-bounce-indent-p t)  
)