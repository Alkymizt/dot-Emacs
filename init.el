;; init.el  -*- lexical-binding: t -*-
;; Created By: Erik P Almaraz 2019.05.10
;; Emacs Initialization File: Where all the magic begins!
;;

;; Avoid garbage collection during startup, since the GC consumes quite a bit of time, easily doubling
;; (need to verify this) the start-up time. The trick is to increase the memory threshold in order to
;; prevent it from running during startup.
(setq gc-cons-threshold most-positive-fixnum ; 2^16 bytes
      gc-cons-percentage 0.6)
;; Every file opened and loaded by Emacs will run through this list to check for a proper handler for
;; the file, but during startup, it won't need any of them.
(defvar file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)

;; After Emacs startup has been completed, set `gc-cons-threshold' to
;; 16 MB and reset `gc-cons-percentage' to its original value.
;; Also reset `file-name-handler-alist'
(add-hook 'emacs-startup-hook
          '(lambda ()
             (setq gc-cons-threshold (* 16 1024 1024)
                   gc-cons-percentage 0.1
                   file-name-handler-alist file-name-handler-alist-original)
             (makunbound 'file-name-handler-alist-original)))

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
