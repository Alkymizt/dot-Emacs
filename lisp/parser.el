;; parser.el
;;
;; Author: Erik P Almaraz 2019.07.01
;;
;;
;; function isValid - Complexity Analysis:
;;    TO DO: Need to figure out how to evaluate ...sn...
;;
;;...............................................................................


;; "association list" or "alist" for short, records a mapping from keys
;; to values. It is a list of cons cells call "associations": the CAR of
;; eac cons cell is the "key", and the CDR is the "associated value".
;;
(defun add-to-alist (key value alist)
  "Created dotted-pair from KEY and VALUE and add to ALIST"
  (let ()
    (push (cons key value) alist)
    )
  alist)

(defun eljson (json)
  "Parse JSON and determine if it is of proper JSON format, eventually create
lisp data structure analoguous to JSON, ELJSON"
  ;; Need to impliment Hash Tables to make this function work effectively.
  (let* (
         ;; Make Hash table
         ;;(eljson (make-hash-table :test 'equal))
         (eljson '(("jsonObj" . "null")))
         (key)
         (brackets '(("{" . "}")
                     ("[" . "]")
                     ("(" . ")")))
         ;;(eljson (alist-add "obj" "{}" eljson))
         )
    (setq eljson (add-to-alist "obj" "{}" eljson))
    ;;    (cdr (assoc key brackets))

    eljson)
  )

;;; Code:
(defun is-valid (bstring)
  "Parse BSTRING for brackets and determine if they are properly closed"
  (interactive)

  (let* ((strung (split-string bstring "" t))
         (len (length strung))
         (bra "[[{(]")
         (ket "[]})]")
         ;; Association List "alist"
         ;; records a mapping from keys to values.
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
        ;;..else..
        (if (string-match-p ket cchar)
            (progn
              (push (pop stack) cache)
              (setq last (car cache))
              (if (not (equal (cdr (assoc last map)) cchar))
                  (setq flag "false")))
          ;;..else..
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
