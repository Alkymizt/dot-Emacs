;; parser.el
;;
;; Author: Erik P Almaraz 2019.07.20
;;
;;
;; function eljson - Complexity Analysis:
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


;;...............................................................................

(eljson "")
