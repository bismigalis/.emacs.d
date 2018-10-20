(defun get-string-from-file (filePath)
  "Return filePath's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

(defun rest (lst)
  (cdr lst))

(defun first (lst)
  (car lst))

(defun load-envs ()
  (-> (get-string-from-file "/home/user/workspace/tealnet/.env")
      (split-string "\n")
      (->> (mapcar (lambda (s) (split-string s " ")))
           (mapcar `rest)
           (mapcar `string-join)
           (mapcar (lambda (s)
                     (setenv
                      (first (split-string s "="))
                      (string-join (rest (split-string s "=")) "=")))))))

;;(load-envs)
