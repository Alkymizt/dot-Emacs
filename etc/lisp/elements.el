;;; elements.el --- Periodic Table of Elements -*- lexical-binding: t -*-

;;
;; Author: Erik P. Almaraz
;; Date: Saturday July 06, 2019 (Inception)
;;

;;
;; Description:
;;
;; &rest ob

;;; Code:

(defgroup elements nil
  "Periodic Table & history management support."
  :prefix "elements-"
  :group 'applications)

(defgroup elements-hooks nil
  "Elements hooks."
  :prefix "elements-"
  :group 'elements)

(defgroup elements-faces nil
  "Elements faces."
  :prefix "elements-"
  :group 'elements

(defun elements-basic-setup (&optional arg nodisplay)
  "Create the Periodic Table of Elements display.
If optional prefix argument ARG is non-nil, prompts for the element
and atomic number, else uses the default Hydrogen. If NODISPLAY is
non-nill, don't display the gerated periodic table of elments."
  (interactive "P")

  (let ()

    )

  )
