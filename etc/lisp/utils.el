;; utils.el  -*- lexical-binding: t -*-
;;

;; source: Erik
;; TO-DO: (write-file) not sure if this should be a Function or a Macro
;; currently doesn't work as a Macro using defmacro, so using defun
;; TO-DO: expand utility and checks within, so that the programmer
;; doesn't have to do this every time this is called.

;; This function was overwriting a default emacs function used in org-export-to-file
;; need to rename to something else... Man this wasted a whole day of searching!
;; figured out Fri 2020.09.18

(defun write-too-file (file header)
  "Create a new file named FILENAME with HEADER (string)"
  (let* (
         (start header)
         (end nil)
         (filename file)
         (optional t)
         )

    ;; body
    (write-region start end filename optional)
    )
  )


;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file

(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let (
        (name (buffer-name))
        (filename (buffer-file-name))
        )

    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))
    )
  )

;; source:
