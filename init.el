;; init.el
;; Created By: Erik P Almaraz 2019.05.10
;;

;;
;; Load Init Files/Libraries
;;

(let* (;; Define local variables here ...

       (conf "~/.emacs.d/conf/")
       (lisp "~/.emacs.d/lisp/")

       )
  ;; Add Paths to 'load-path
  (add-to-list 'load-path conf)
  (add-to-list 'load-path lisp)

  ;;
  ;; Load packages here...
  ;;

  ;; Emacs Configuration Files
  (load "emacs-conf")
  (load "melpa-conf")
  (load "theme-conf")
  (load "tide-conf")
  (load "erc-conf")

  ;; Custom Lisp Files
  (load "controls")
  (load "utils")
  (load "pwshell")

  )

;;
;; Scratch Functions Here
;;

;; TO DO:: INVESTIGATE

;; Open frame vertically by default:
;; This is not working to my liking, maybe I should write a function that does
;; what I want
;;(setq split-height-threshold nil)
;;(setq split-width-threshold 0)

;; Hide splash-screen and startup-message
;;(setq inhibit-splash-screen t)
;;(setq inhibit-startup-message t)
