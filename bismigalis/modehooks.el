(defun bismi-shell-mode-keys ()
  "my keys for `shell-mode'."
  (interactive)
  (define-key shell-mode-map (kbd "<C-up>") 'windmove-up)
  (define-key shell-mode-map (kbd "<C-down>") 'windmove-down)
)


(defun bismi-jsx-compile-file (&optional options dst async)
  "Compile the JSX script of the current buffer
and make a JS script in the same directory."
  (interactive)
  (if (jsx--some-buffers-modified-p)
      (save-some-buffers nil t))
  ;; FIXME: file-name-nondirectory needs temporarily
  (let* ((jsx-file (file-name-nondirectory (buffer-file-name)))
         (js-file (or dst (substring jsx-file 0 -1)))
         cmd)
    (setq options (append jsx-cmd-options options))
    (setq cmd (concat "jsx " jsx-file " > " js-file))
    (if async
        (setq cmd (concat cmd " &")))
    (message "Compiling...: %s" cmd)
    ;;(if (eq (shell-command cmd) 0) js-file nil)
    (shell-command cmd)
    )
  )

(defun bismi-jsx-compile ()
  ""
  (interactive)

  (when (equal (file-name-extension (buffer-file-name)) "jsx")
      (bismi-jsx-compile-file))
  )

(add-hook 'shell-mode-hook 'bismi-shell-mode-keys)
(add-hook 'after-save-hook 'bismi-jsx-compile)
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
