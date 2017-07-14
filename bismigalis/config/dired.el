(setq dired-listing-switches "--group-directories-first -lLh")
(setq dired-dwim-target t)
(setq wdired-allow-to-change-permissions t)
(setq dired-auto-revert-buffer t)

(put 'dired-find-alternate-file 'disabled nil)

;; (add-hook 'dired-mode-hook
;;           (lambda ()
;;             (define-key dired-mode-map (kbd "C-o") 'other-window)
;;             ))

(defun my-dired-init ()
  "Bunch of stuff to run for dired, either immediately or when it's
   loaded."
  ;; <add other stuff here>
  (define-key dired-mode-map (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)
  (define-key dired-mode-map (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)

  ;; (define-key dired-mode-map [return] 'dired-single-buffer)
  ;; (define-key dired-mode-map [mouse-1] 'dired-single-buffer-mouse)
  ;; (define-key dired-mode-map "^"
  ;;       (function
  ;;        (lambda nil (interactive) (dired-single-buffer ".."))))

  )

;; if dired's already loaded, then the keymap will be bound
(if (boundp 'dired-mode-map)
        ;; we're good to go; just add our bindings
        (my-dired-init)
  ;; it's not loaded yet, so add our bindings to the load-hook
  (add-hook 'dired-load-hook 'my-dired-init))

(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 2))

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))
