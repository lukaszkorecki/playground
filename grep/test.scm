(require-extension srfi-78)
(require-extension srfi-42)
(load "grep.scm")

(check
  (get-pattern-and-file (list "csi" "-script" "test.scm" "regex" "path")) => (list "regex" "path"))

(check-report)
(exit)
