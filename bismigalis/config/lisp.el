(use-package paredit
  :init
  (define-minor-mode bismi-paredit-mode
  "Toggle bismi-paredit-mode"
  nil nil
  `((,(kbd "M-q")     . paredit-reindent-defun)
    (,(kbd "(")       . paredit-open-round)
    (,(kbd "C-(")     . paredit-wrap-round)
    (,(kbd "M-(")     . paredit-wrap-round)
    (,(kbd ")")       . paredit-close-round)
    (,(kbd "[")       . paredit-open-square)
    (,(kbd "M-[")     . paredit-wrap-square)
    (,(kbd "]")       . paredit-close-square)
    (,(kbd "{")       . paredit-open-curly)
    (,(kbd "C-{")     . paredit-wrap-curly)
    (,(kbd "M-{")     . paredit-wrap-curly)
    (,(kbd "}")       . paredit-close-curly)
    (,(kbd "C-k")     . paredit-kill)
    (,(kbd "M-k")     . paredit-copy-as-kill)
    (,(kbd "C-M-k")   . paredit-splice-sexp-killing-forward)
    (,(kbd "C-M-S-k") . paredit-splice-sexp-killing-backward))
  ))

(add-hook 'clojure-mode-hook 'bismi-paredit-mode)
(add-hook 'clojurescript-mode-hook 'bismi-paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'bismi-paredit-mode)


(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(set-face-attribute 'rainbow-delimiters-unmatched-face nil
                    :foreground "red"
                    :inherit 'error
                    :box t)

;;(add-hook 'clojure-mode-hook
;;          #'(lambda ()
;;              (hs-minor-mode t)))

(add-hook 'clojure-mode-hook #'hs-minor-mode)
(add-hook 'clojurescript-mode-hook #'hs-minor-mode)
(add-hook 'restclient-mode-hook #'hs-minor-mode)
