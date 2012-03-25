(require "irregex")
(define (get-pattern-and-file argument-list)
  ; remove 'csi'
  (list  (car(cdr (reverse argument-list))) (car(reverse argument-list))))

; (get-arguments argv)
(print [argv])
