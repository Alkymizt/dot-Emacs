;; init.el  -*- lexical-binding: t -*-
;; Created By: Erik P Almaraz 2019.05.10
;;

;;
;; Load Init Files/Libraries
;;

(let* (;; Define local variables here ...

       (conf "~/.emacs.d/etc/conf/")
       (lisp "~/.emacs.d/etc/lisp/")

       )
  ;; Add Paths to 'load-path
  (add-to-list 'load-path conf)
  (add-to-list 'load-path lisp)

  ;;
  ;; Load packages here...
  ;;

  ;; Emacs Configuration Files
  (load "emacs-conf")
  (load "theme-conf")
  (load "org-conf")
  (load "magit-conf")
  (load "melpa-conf")
  (load "tide-conf")
  (load "erc-conf")

  ;; Custom Lisp Files
  (load "controls")
  (load "utils")
  (load "powershell")

  )

;; EOL
