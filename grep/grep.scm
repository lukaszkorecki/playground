; This is the main "app" file, loads only needed functions
(load "grep-lib.scm")
; (for-each (lambda (l) (print l)) [argv])

(define args (get-pattern-and-file [argv]))
(define file-name (car args))
(define pattern (car (reverse args)))

(for-each (lambda (match) (print "> " match "\n"))
          (match-lines (file-to-list file-name) pattern))
