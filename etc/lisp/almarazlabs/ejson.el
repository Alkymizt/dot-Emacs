;; ejson.el  --- Experimental E(macs)JSON container / generator -*- lexical-binding: t -*-
;;
;; Author: Erik P Almaraz 2019.07.27
;;
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

(defun ejson (json)
  "Parse JSON and determine if it is of proper JSON format, eventually create
lisp data structure analoguous to JSON, ELJSON"
  ;; Need to impliment Hash Tables to make this function work effectively.
  (let  (
         ;; Make Hash table
         ;;(eljson (make-hash-table :test 'equal))
         (ejson)
         ;;
         )
    (setq  ejson (add-to-alist "key" "value" ejson))

    ejson)
  )
