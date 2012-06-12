(use regex)
(use utils)
(use srfi-1)

(define (get-pattern-and-file argument-list)
  (list   (car(reverse argument-list)) (car(cdr (reverse argument-list)))))

(define (file-to-list file-name) (string-split (read-all file-name) "\n"))

(define (match-lines contents r-pattern)
  (filter-map (lambda (line) (string-search r-pattern line)) contents))
