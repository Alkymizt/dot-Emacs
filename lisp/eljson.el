;; parser.el
;;
;; Author: Erik P Almaraz 2019.07.20
;;
;;
;; function eljson - Complexity Analysis:
;;    TO DO: Need to figure out how to evaluate ...sn...
;;
; ;...............................................................................
(defun eljson (json)
  "Parse JSON and determine if it is of proper JSON format, eventually create
lisp data structure analoguous to JSON, ELJSON"
  ;; Need to impliment Hash Tables to make this function work effectively.
  (let* (
         (eljson '(("baseObj" . "nil")))
         (key)
         (brackets '(("{" . "}")
                     ("[" . "]")
                     ("(" . ")")))

         )

    ;;    (cdr (assoc key brackets))
   (setq eljson (assoc-add "newObj" "null" eljson))

    eljson)
  )

;; "association list" or "alist" for short, records a mapping from keys
;; to values. It is a list of cons cells call "associations": the CAR of
;; eac cons cell is the "key", and the CDR is the "associated value".
;;

(defun assoc-add (key value alist)
  "Created dotted-pair from KEY and VALUE and add to ALIST"
  (let* ()
    (setq alist (cons '(key . value) alist))
    alist)
  )


(eljson "")
