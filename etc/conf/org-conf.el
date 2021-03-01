;; org-conf.el  -*- lexical-binding: t -*-
;; Org-Mode Configuration file
;;
;; Notes: Many desktops intercept M-TAB to switch windows. Use C-M-i or ESC TAB instead.


;; can also customize using M-x customize-groups > org
;;(defvar org-export-backends '(ascii beamer html icalendar latex odt))

;; Org Mode Key Bindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; Appearance Configuration

;; Ask org-mode to hide the emphasis markup (e.g. /.../ for italics, *...* for bold, etc)
(setq org-hide-emphasis-markers t)

;; Set up a font-lock substitution for list markers (I always use "-" for lists) by replacing them with
;; a centered-dot character
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\)"
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;;The org-bullets package replaces all headline markers with different Unicode bullets:
(use-package org-bullets
             :config
             (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;;(setq org-latex-compiler 'pdflatex)
(setq org-latex-create-formula-image-program 'imagemagick)

;; LaTeX set-up notes:
;; The LaTeX back-end finds the compiler version to use from `org-latex-compiler' variable or the
;; '#+LATEX_COMPILER' keyword in the Org file. See the docstring for the `org-latex-default-packages-alist'
;; for loading packages with certain compilers. Also see `org-latex-bibtex-compiler' to set the
;; bibliography compiler.
