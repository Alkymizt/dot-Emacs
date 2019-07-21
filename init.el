;; init.el
;; Created By: Erik P Almaraz 2019.05.10
;;

;;
;; Setup System Environment
;;

;;
;; Load Init Files
;;

;; There has to be a better way of loading files, i.e. just give it a directory
;; and have it autoload all *.el files?...

(let* ( ;; Define local variables here...
       (emacs-conf   "~/.emacs.d/conf/emacs-conf.el")
       (melpa-conf   "~/.emacs.d/conf/melpa-conf.el")
       (theme-conf   "~/.emacs.d/conf/theme-conf.el")
       (tidee-conf   "~/.emacs.d/conf/tidee-conf")
       (erc-conf     "~/.emacs.d/conf/erc-conf")
       (spell-conf   "~/.emacs.d/conf/spell-conf")

       ;; Custom programs
       (utils        "~/.emacs.d/lisp/utils.el")
       (pwshell      "~/.emacs.d/lisp/pwshell.el")
       ;; Docket: Delete speck, not functioning... unless I can get it functioning
       ;;(speck        "~/.emacs.d/lisp/speck.el")

       ;; load last
       )

  ;; Load packages here...
  (load utils)

  (load emacs-conf)
  (load melpa-conf)
  (load theme-conf)
  (load tidee-conf)
  (load erc-conf)
  (load spell-conf)

  (load pwshell)
  ;;(load speck)

  ;; load last
  )


;;
;; Tools
;;

;;this has to be loaded last for some reason, needs investigation...
(require 'aes)
(aes-enable-auto-decryption)
