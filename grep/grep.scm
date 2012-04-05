(use srfi-1)
(use regex)

(define (get-pattern-and-file argument-list)
  (list   (car(reverse argument-list)) (car(cdr (reverse argument-list)))))

(define (file-to-list file-name)
  (string-split (read-file file-name) "\n"))

(define (match-lines contents r-pattern)
  (filter-map (lambda (line) (string-search r-pattern line)) contents))

(for-each (lambda (l) (print l)) [argv])

;
;(define args (get-pattern-and-file [argv]))
;(define file-name (car args))
;(define pattern (car (reverse args)))
;
;(for-each (lambda (match) (print "> " match "\n"))
;(match-lines (file-to-list file-name) pattern))
