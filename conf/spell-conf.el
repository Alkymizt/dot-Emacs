;;spell-conf.el

;; 'ac-ispell.el' provides ispell/aspell completion source for auto-complete.
;;  You can use English word completion with it.
;;  https://github.com/syohex/emacs-ac-ispell

;; Completion words longer than 4 characters
;; (custom-set-variables
;;  '(ac-ispell-requires 4)
;;  '(ac-ispell-fuzzy-limit 4))

;; (eval-after-load "auto-complete"
;;   '(progn
;;      (ac-ispell-setup)))

;; (add-hook 'git-commiit-mode-hook 'ac-ispell-ac-setup)
;; (add-hook 'mail-mode-hook 'ac-ispell-ac-setup)

;; speck.el
(setq speck-hunspell-program "C:~/.emacs.d/bin/hunspell-1.3.2-3-w32-bin/bin")
(setq speck-hunspell-library-directory "")
;;(setq speck-hunspell-dictionary-alist (("en" . "en_US") ("es" . "es_ES")))
