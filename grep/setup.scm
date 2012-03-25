#!/usr/bin/env csi -script
; Simple setup script
; You can run it with:
;   csi setup.scm
;   or make it executable
;  once packages are installed it will run the tests
(define packages (list
                "srfi-78"   ; unit testing library
                "srfi-42")) ; additional package

(for-each (lambda (package)
            (print "Installing: " package "\n")
            (system (string-append "chicken-install " package )))
  packages)

(system "csi test.scm")
