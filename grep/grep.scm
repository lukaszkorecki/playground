; (use irregex)
(use regex)

(define (get-pattern-and-file argument-list)
  (list  (car(cdr (reverse argument-list))) (car(reverse argument-list))))

(define (file-to-list file-name)
  (read-lines file-name))

(define (match-lines contents r-pattern)
  (filter (lambda (line) (string-search (regexp r-pattern))) contents))

; (get-arguments argv)
(print [argv])
