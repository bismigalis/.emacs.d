;; ----------------------------------------------------------------
;; helper functions

(defun list-insert-before (l n x)
  (if (<= n 0) (cons x l)
    (cons (car l) (list-insert-before (cdr l) (- n 1) x))))

(defun list-prepend-nth (l n)
  (if (<= n 0) l
    (let* ((lx (list-prepend-nth (cdr l) (- n 1))))
      (cons (car lx) (cons (car l) (cdr lx))))))

(defun list-insert-car-at (l n)
  (list-insert-before (cdr l) n (car l)))


;; ----------------------------------------------------------------
;; overriding current-kill

(defvar kill-ring-yank-index 0
  "Index into kill-ring of last yank-pop. The item yank-popped
  will be at the head of the kill ring, but if the next command
  is also yank-pop, it will be returned here first before this
  variable is incremented.")

(defun current-kill (n)
  "Replaces standard 'current-kill' function. This version tries
to fix the increasing yank-pop problem.

TODO:
- respect second argument of original function
- deal with 'interprogram-{cut,paste}-function'
"
  (if (eq 0 n) ;; looks like we're doing a yank; reset
               ;; kill-ring-yank-index to 0 to indicate that the
               ;; current head of the list is useful to the user
      (progn (setq kill-ring-yank-index 0)
             (car kill-ring))

    ;; otherwise put the head of kill-ring back where we had
    ;; previously found it, and fetch the next element
    (setq kill-ring
        (list-insert-car-at kill-ring kill-ring-yank-index))
    (setq kill-ring-yank-index (+ kill-ring-yank-index n))
    (when (>= kill-ring-yank-index (- (length kill-ring) 1))
      (setq kill-ring-yank-index (- (length kill-ring) 1))
      (message "Reached end of kill-ring"))
    (when (< kill-ring-yank-index 0)
      (setq kill-ring-yank-index 0)
      (message "Reached beginning of kill-ring"))
    (setq kill-ring (list-prepend-nth kill-ring kill-ring-yank-index))
    (car kill-ring)))

;; ----------------------------------------------------------------
;; new key binding

;; Here's an auxiliary function and key binding that makes it easy to
;; go back and forth in the kill-ring while we're yank-popping
(defun yank-pop-back () "" (interactive "*")
       (yank-pop -1))

(global-set-key "\C-\M-y" 'yank-pop-back)
