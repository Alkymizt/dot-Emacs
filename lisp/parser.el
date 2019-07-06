;; parser.el
;;
;; Author: Erik P Almaraz 2019.07.01
;;
;;
;; function isValid - Complexity Analysis:
;;    TO DO: Need to figure out how to evaluate ...sn...
;;
;;...............................................................................

;;; Code:
(defun is-valid (bstring)
  "Parse BSTRING for brackets and determine if they are properly closed"
  (interactive)

  (let* ((strung (split-string bstring "" t))
         (len (length strung))
         (bra "[[{(]")
         (ket "[]})]")
         (map '(("{" . "}")
                ("[" . "]")
                ("(" . ")")))
         (flag "true")
         (count 0)
         cchar
         stack
         last
         cache
         )

    (if (or (equal bstring "") (equal bstring " "))
        (setq flag "Empty String")
      )

    ;; sn - scales and N ~ len of input string
    ;; sn - need to determine how the following intrinsic functions scale:
    ;; sn - string-match-p, pop, push, setq, equal, not, or, car.
    ;; sn - map O(1) (I'll have to get this checked)
    (while (< count len)
      (setq cchar (pop strung))
      (if (string-match-p bra cchar)
          (progn
            (push cchar stack)
            )
        ;; else...
        (if (string-match-p ket cchar)
            (progn
              (push (pop stack) cache)
              (setq last (car cache))
              (if (not (equal (cdr (assoc last map)) cchar))
                  (setq flag "false")))
          ;; else...
          ))
      (setq count (1+ count)))
    flag)
  )

;;-----------------------------------------
;; Tests                   Restult
;;-----------------------------------------
(is-valid "([)]")          ;"false"
(is-valid "(e){p}[a]")     ;"true"
(is-valid "{[()]}")        ;"true"
(is-valid "")              ;"Empty String"
(is-valid " ")             ;"Empty String"
(is-valid "()[]{}[{(}])")  ;"false"
;;-----------------------------------------



;;-------------------------------------------------------------------------------

(defun eljson (json)
  "Parse JSON and determine if it is of proper JSON format, eventually create
lisp data structure analoguous to JSON, ELJSON"
  ;; Need to impliment Hash Tables to make this function work effectively.
  (let* (
         (key)
         (brackets '(("{" . "}")
                     ("[" . "]")
                     ("(" . ")")))

         )
    (cdr (assoc key brackets))

    )
  )
;;-------------------------------------------------------------------------------
;; Hash Tables

;;-------------------------------------------------------------------------------
;; A Simple Example of a Macro
;;
;; Suppose we would like to define a Lisp construct to increment a variable
;; value, much like the '++' operator in C. We would like to write
;; '(inc x)' and have the effect of '(setq x (1+ x))'. Here's a macro
;; definition that does the job:

(defmacro inc (var)
  (list 'setq var (list '1+ var))
  )
;; when this is called with '(inc x)', the argument VAR is the symbol 'x', not
;; the value of 'x', as it would be in a function.
