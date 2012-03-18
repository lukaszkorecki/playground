(require-extension srfi-78)
(require-extension srfi-42)
(load "grep.scm")

(check
  (get-arguments (list "csi" "-script" "test.scm" "regex" "path")) (=> eq?) (cons "regex" "path"))

(check-report)
