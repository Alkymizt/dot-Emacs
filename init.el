;; init.el
;; Created By: Erik P Almaraz 2019.05.10
;;

;;
;; Setup System Environment
;;

;;
;; Load Init Files
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
;; Scratch Functions
;;

(defun set-frame-size-according-to-resolution ()
    (interactive)
    (if window-system
    (progn
      (if (> (x-display-pixel-width) 1500) ;; 1500 is the delimiter marging in px to consider the screen big
             (set-frame-width (selected-frame) 237) ;; on the big screen make the fram 237 columns big
             (set-frame-width (selected-frame) 177)) ;; on the small screen we use 177 columns
      (setq my-height (/ (- (x-display-pixel-height) 150) ;; cut 150 px of the screen height and use the rest as height for the frame
                               (frame-char-height)))
      (set-frame-height (selected-frame) my-height)
      (set-frame-position (selected-frame) 3 90) ;; position the frame 3 pixels left and 90 px down
  )))

  ;; (set-frame-size-according-to-resolution)
  (global-set-key (kbd "C-x 9") 'set-frame-size-according-to-resolution)
