(require-extension srfi-78)
(require-extension srfi-42)
(load "grep.scm")

(check
  (get-pattern-and-file '("csi" "-script" "test.scm" "regex" "path")) => '("regex" "path"))

(check
  (match-lines '("ab" "bc" "cd") "\\wb") => '(("ab")))

(check-report)
(exit)
