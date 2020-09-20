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

;; Appearance Configuration

;; Ask org-mode to hide the emphasis markup (e.g. /.../ for italics, *...* for bold, etc)
(setq org-hide-emphasis-markers t)

;; Set up a font-lock substitution for list markers (I always use "-" for lists) by replacing them with
;; a centered-dot character
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\)"
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;;The org-bullets package replaces all headline markers with different Unicode bullets:
;; (use-package org-bullets
;;              :config
;;              (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; ;; Font set up:
;; (let* ((variable-tuple
;;         (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
;;               ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
;;               ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
;;               ((x-list-fonts "Verdana")         '(:font "Verdana"))
;;               ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
;;               (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
;;        (base-font-color     (face-foreground 'default nil 'default))
;;        (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

;;   (custom-theme-set-faces
;;    'user
;;    `(org-level-8 ((t (,@headline ,@variable-tuple))))
;;    `(org-level-7 ((t (,@headline ,@variable-tuple))))
;;    `(org-level-6 ((t (,@headline ,@variable-tuple))))
;;    `(org-level-5 ((t (,@headline ,@variable-tuple))))
;;    `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
;;    `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
;;    `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
;;    `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
;;    `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

;; (custom-theme-set-faces
;;  'user
;;  '(variable-pitch ((t (:family "ETBembo" :height 180 :weight thin))))
;;  '(fixed-pitch ((t ( :family "Fira Code Retina" :height 160)))))

;; LaTeX set-up notes:
;; The LaTeX back-end finds the compiler version to use from `org-latex-compiler' variable or the
;; '#+LATEX_COMPILER' keyword in the Org file. See the docstring for the `org-latex-default-packages-alist'
;; for loading packages with certain compilers. Also see `org-latex-bibtex-compiler' to set the
;; bibliography compiler.
