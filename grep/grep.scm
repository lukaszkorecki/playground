(use srfi-1)
(use regex)

(define (get-pattern-and-file argument-list)
  (list  (car(cdr (reverse argument-list))) (car(reverse argument-list))))

(define (file-to-list file-name)
  (read-lines file-name))

(define (match-lines contents r-pattern)
  (filter-map (lambda (line) (string-search (regexp r-pattern) line)) contents))

(match-lines '("lol" "wat") "wat")

; (get-arguments argv)
(print [argv])
