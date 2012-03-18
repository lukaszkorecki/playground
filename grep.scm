(require "irregex")


(define (get-arguments argument-list)
  ; remove 'csi'
  (define arg-list (cdr argument-list))
  ; check the position of the file name
  (define arg-list (cond
      [ (first arg-list) (cdr arg-list)]
      [ else (cdr (cdr arg-list))] ))
  (for-each (lambda (x) (print x) arg-list)))

; (get-arguments argv)
(print [argv])
