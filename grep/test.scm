(require-extension srfi-78)
(require-extension srfi-42)
(load "grep-lib.scm")

(check
  (get-pattern-and-file '("csi" "-script" "test.scm" "regex" "path")) => '("path" "regex"))

(check
  (match-lines '("ab" "bc" "cd") "\\wb") => '(("ab")))

(check
  (car (file-to-list "grep-lib.scm")) => "(use regex)")

(check-report)
(exit)
