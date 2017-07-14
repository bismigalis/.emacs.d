;;(setq gud-pdb-command-name "python -m pdb")
;;(add-hook 'comint-output-filter-functions 'python-pdbtrack-comint-output-filter-function)

(require 'flycheck)

;; (defun bismi/python-mode-keys ()
;;   (define-key python-mode-map (kbd "C-o") 'occur-python)
;; )

(add-hook 'python-mode-hook
          (lambda ()
            (flycheck-mode t)
            (bismi/python-mode-keys)
            ))

;;; Occur Definitions
(defun occur-python ()
  "Display an occur buffer of all definitions in the current buffer.
Also, switch to that buffer."
  (interactive)
  (let ((list-matching-lines-face nil))
    (occur "^ *\\(def\\|class\\) "))
  (let ((window (get-buffer-window "*Occur*")))
    (if window
	(select-window window)
      (switch-to-buffer "*Occur*"))))

(defun goto-python-trace-file-num ()
  "When invoked, parses line under cursor to get file and line, then go to it"
  (interactive)
					;(buffer-substring-no-properties (line-beginning-position) (line-end-position))
  (save-match-data
    (let* ((line (thing-at-point 'line))
	   (_ (string-match "\"\\([^\"]+\\)\", line \\([[:digit:]]+\\)" line))
	   (filename (match-string 1 line))
	   (linenum (match-string 2 line)))
      (progn
	(find-file filename)
	(beginning-of-buffer)
	(forward-line (1- (string-to-number linenum)))
	;;(message "%s %s" filename linenum)
      ))))
