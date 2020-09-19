;; org-conf.el  -*- lexical-binding: t -*-
;; Org-Mode Configuration file
;;
;; Notes: Many desktops intercept M-TAB to switch windows. Use C-M-i or ESC TAB instead.

;; can also customize using M-x customize-groups > org
(defvar org-export-backends '(ascii beamer html icalendar latex odt))

;; Org Mode Key Bindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)


(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)


;; LaTeX set-up notes:
;; The LaTeX back-end finds the compiler version to use from `org-latex-compiler' variable or the
;; '#+LATEX_COMPILER' keyword in the Org file. See the docstring for the `org-latex-default-packages-alist'
;; for loading packages with certain compilers. Also see `org-latex-bibtex-compiler' to set the
;; bibliography compiler.

