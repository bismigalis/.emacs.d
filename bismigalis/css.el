(defun bismi/change-number-at-point (up)
  (save-excursion
    (let* ((x (bismi/get-left-point))
           (y (bismi/get-right-point))
           (n (string-to-number (buffer-substring-no-properties x y))))
      ;;(message "%s %s" x y)
      (when (not (= x y))
        (delete-region x y)
        (insert (number-to-string (if up (1+ n) (1- n)))))
      )))

(defun bismi/change-number-at-point-up ()
  (interactive)
  (bismi/change-number-at-point t))

(defun bismi/change-number-at-point-down ()
  (interactive)
  (bismi/change-number-at-point nil))

(defun bismi/get-left-point ()
  (save-excursion
    (while (looking-back "[-0-9]")
      (backward-char))
    (point)))

(defun bismi/get-right-point ()
  (save-excursion
    (while (looking-at-p "[-0-9]")
      (forward-char))
    (point)))


(defun bismi/css-mode-keys ()
  (local-set-key (kbd "C-M-<up>") 'bismi/change-number-at-point-up)
  (local-set-key (kbd "C-M-<down>") 'bismi/change-number-at-point-down)
)

(add-hook 'css-mode-hook
          (lambda ()
            (rainbow-mode)
            (bismi/css-mode-keys)
            ))
(setq css-indent-offset 2)
