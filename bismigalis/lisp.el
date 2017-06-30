;; (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
;; (add-hook 'clojure-mode-hook (lambda () (lispy-mode 1)))

(use-package paredit
  :bind (
         ("M-q" . paredit-reindent-defun)
         ("("   . paredit-open-round)
         ("C-(" . paredit-wrap-round)
         ("M-(" . paredit-wrap-round)
         (")"   . paredit-close-round)
         ("["   . paredit-open-square)
         ("M-[" . paredit-wrap-square)
         ("]"   . paredit-close-square)
         ("{"   . paredit-open-curly)
         ("C-{" . paredit-wrap-curly)
         ("M-{" . paredit-wrap-curly)
         ("}"   . paredit-close-curly)
         ("C-k" . paredit-kill)
         ("M-k" . paredit-copy-as-kill)
         ("C-M-k" . paredit-splice-sexp-killing-forward)
         ("C-M-S-k" . paredit-splice-sexp-killing-backward)
         ))


(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(set-face-attribute 'rainbow-delimiters-unmatched-face nil
            :foreground "red"
            :inherit 'error
            :box t)
