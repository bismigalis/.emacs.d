;; package system setup
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defun load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t) (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath)))))))
(load-directory "~/.emacs.d/bismigalis")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (cyberpunk)))
 '(custom-safe-themes (quote ("3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "8fd393097ac6eabfcb172f656d781866beec05f27920a0691e8772aa2cdc7132" "f0a99f53cbf7b004ba0c1760aa14fd70f2eabafe4e62a2b3cf5cabae8203113b" default)))
 '(fci-rule-color "#2D2D2D")
 '(vc-annotate-background "#202020")
 '(vc-annotate-color-map (quote ((20 . "#C99090") (40 . "#D9A0A0") (60 . "#ECBC9C") (80 . "#DDCC9C") (100 . "#EDDCAC") (120 . "#FDECBC") (140 . "#6C8C6C") (160 . "#8CAC8C") (180 . "#9CBF9C") (200 . "#ACD2AC") (220 . "#BCE5BC") (240 . "#CCF8CC") (260 . "#A0EDF0") (280 . "#79ADB0") (300 . "#89C5C8") (320 . "#99DDE0") (340 . "#9CC7FB") (360 . "#E090C7"))))
 '(vc-annotate-very-old-color "#E090C7"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
