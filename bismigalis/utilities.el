(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-4") 'toggle-window-split)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; duplicate current line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun duplicate-current-line (&optional n)
  "duplicate current line, make more than 1 copy given a numeric argument"
  (interactive "p")
  (save-excursion
    (let ((nb (or n 1))
    	  (current-line (thing-at-point 'line)))
      ;; when on last line, insert a newline first
      (when (or (= 1 (forward-line 1)) (eq (point) (point-max)))
    	(insert "\n"))

      ;; now insert as many time as requested
      (while (> n 0)
    	(insert current-line)
    	(decf n)))))

(global-set-key (kbd "C-c d") 'duplicate-current-line)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; swap quotes of the string point is in
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun swap-quotes ()
  "Swaps the quote symbols in a \\[python-mode] string"
  (interactive)
  (save-excursion
    (let ((bos (save-excursion
                 (beginning-of-string)))
          (eos (save-excursion
                 (beginning-of-string)
                 (forward-sexp)
                 (point)))
          (replacement-char ?\'))
      (goto-char bos)
      ;; if the following character is a single quote then the
      ;; `replacement-char' should be a double quote.
      (when (eq (following-char) ?\')
          (setq replacement-char ?\"))
      (delete-char 1)
      (insert replacement-char)
      (goto-char eos)
      (delete-char -1)
      (insert replacement-char))))



;;;;;;;;;;;;;;;;;;;;;;;
;; NEXT/PREVIOUS BUFFER
;;;;;;;;;;;;;;;;;;;;;;;
(defvar bismi-switch-buffer-ignore-dired t
  "If t, ignore dired buffer when calling `bismi-next-user-buffer' or `bismi-previous-user-buffer'")
(setq bismi-switch-buffer-ignore-dired t)

(defun bismi-next-user-buffer ()
  "Switch to the next user buffer.
 “user buffer” is a buffer whose name does not start with “*”.
If `bismi-switch-buffer-ignore-dired' is true, also skip directory buffer.
2015-01-05 URL `http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html'"
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (or
           (string-equal "*" (substring (buffer-name) 0 1))
           (if (string-equal major-mode "dired-mode")
               bismi-switch-buffer-ignore-dired
             nil
             ))
          (progn (next-buffer)
                 (setq i (1+ i)))
        (progn (setq i 100))))))

(defun bismi-previous-user-buffer ()
  "Switch to the previous user buffer.
 “user buffer” is a buffer whose name does not start with “*”.
If `bismi-switch-buffer-ignore-dired' is true, also skip directory buffer.
2015-01-05 URL `http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html'"
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (or
           (string-equal "*" (substring (buffer-name) 0 1))
           (if (string-equal major-mode "dired-mode")
               bismi-switch-buffer-ignore-dired
             nil
             ))
          (progn (previous-buffer)
                 (setq i (1+ i)))
        (progn (setq i 100))))))


(defun bismi-convert-to-hiccup (start end)
  "Convert html markup into hiccup"
  (interactive "r")
  (save-excursion
    (replace-regexp "</\[^>\]+>" "]" nil start end)
    (replace-string "class=" "{:class " nil start end)
    (replace-string "<" "[:" nil start end)
    (replace-string ">" "]" nil start end)
    ))


;;;;;;;;;;;;;;;;;;;
;; dwim-compile
;;;;;;;;;;;;;;;;;;
(defvar get-buffer-compile-command (lambda (file) (cons file 1)))
(make-variable-buffer-local 'get-buffer-compile-command)

(setq-default compile-command "")

(defun compile-dwim (&optional arg)
  "Compile Do What I Mean.
    Compile using `compile-command'.
    When `compile-command' is empty prompt for its default value.
    With prefix C-u always prompt for the default value of
    `compile-command'.
    With prefix C-u C-u prompt for buffer local compile command with
    suggestion from `get-buffer-compile-command'.  An empty input removes
    the local compile command for the current buffer."
  (interactive "P")
  (cond
   ((and arg (> (car arg) 4))
    (let ((cmd (read-from-minibuffer
		"Buffer local compile command: "
		(funcall get-buffer-compile-command
			 (or (file-relative-name (buffer-file-name)) ""))
		nil nil 'compile-history)))
      (cond ((equal cmd "")
	     (kill-local-variable 'compile-command)
	     (kill-local-variable 'compilation-directory))
	    (t
	     (set (make-local-variable 'compile-command) cmd)
	     (set (make-local-variable 'compilation-directory)
		  default-directory))))
    (when (not (equal compile-command ""))
      ;; `compile' changes the default value of
      ;; compilation-directory but this is a buffer local
      ;; compilation
      (let ((dirbak (default-value 'compilation-directory)))
	(compile compile-command)
	(setq-default compilation-directory dirbak))))
   ((or (and arg (<= (car arg) 4))
	(equal compile-command ""))
    (setq-default compile-command (read-from-minibuffer
				   "Compile command: "
				   (if (equal compile-command "")
				       "make " compile-command)
				   nil nil 'compile-history))
    (setq-default compilation-directory default-directory)
    (when (not (equal (default-value 'compile-command) ""))
      (compile (default-value 'compile-command))))
   (t
    (recompile))))




(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))
(global-set-key (kbd "S-<f2>") 'copy-file-name-to-clipboard)

(defun url-encode-region (start end)
  "Replace a region with the same contents, only URL decoded."
  (interactive "r")
  (let ((text (url-hexify-string (buffer-substring start end))))
    (delete-region start end)
    (insert text)))

(defun url-decode-region (start end)
  "Replace a region with the same contents, only URL decoded."
  (interactive "r")
  (let ((text (url-unhex-string (buffer-substring start end))))
    (delete-region start end)
    (insert text)))
