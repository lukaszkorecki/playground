#!/usr/bin/env csi -script
; Simple setup script
; You can run it with:
;   csi setup.scm
; Once packages are installed it will run the tests
(define packages (list
                "regex"     ; regex egg
                "srfi-78"   ; unit testing library
                "srfi-42")) ; additional package

(for-each (lambda (package)
            (print "Installing: " package "\n")
            (system (string-append "chicken-install " package )))
  packages)

(system "csi test.scm")
