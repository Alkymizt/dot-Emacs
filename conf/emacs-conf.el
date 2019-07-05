;; emacs-conf.el
;;

;; Disable Menue Modes:
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Set Initial Height and Width of frame:
(add-to-list 'default-frame-alist '(height . 52))
(add-to-list 'default-frame-alist '(width . 117))

;; Custom-File
(setq custom-file "~/.emacs.d/customs.el")
(if (file-exists-p custom-file)
    (load custom-file)
  (write-file custom-file ";; customs.el"))

;; Backups
(setq backup-by-copying t    ; stop shinanigans with links
      delete-old-versions t
      version-control t      ; use version backups
      backup-directory-alist '(("." . "~/.emacs.d/backup")))
;; Creates directory if it doesn't already exist
(make-directory "~/.emacs.d/backup/" t)
;; Creates auto directory if it doesn't already exist
(make-directory "~/.emacs.d/backup/auto" t)
;; backup in one place. flat, no tree structure
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/backup/auto/" t)))

;; Set-font
(add-to-list 'default-frame-alist
             '(font . "consolas-10.5"))

;; Display Line numbers
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;; Highlight parenthesis completion
(show-paren-mode t)

;; Indent with spaces:
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq-default truncate-lines t)
;; Remove trailing whitespaces upon save:
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Auto Fill Mode

;;Paragraph Filling / Word Wrapping
;;https://www.emacswiki.org/emacs/FillParagraph
;;The default value for fill-column is 70
(setq-default fill-column 80)

;; See: https://www.emacswiki.org/emacs/AutoFillMode
;;(add-hook 'text-mode-hook 'turn-on-auto fill)
;; Let's make EMACS ask us whethere to use Auto Fill Mode when opening
;; a text file:
(add-hook 'text-mode-hook
          (lambda ()
            (when (y-or-n-p "Auto Fill Mode? ")
              (turn-on-auto-fill))))


;; Globally Change the Default Font
;; see: https://www.emacswiki.org/emacs/SetFonts
;;
;;(add-to-list 'default-frame-alist '(font . FONT))
;;(set-face-attribute 'default t :font FONT)

;;
;;
;; Tools
;;
;;

(eval-after-load "shell"
  '(define-key shell-mode-map "\M-#" 'shells-dynamic-spell))

(autoload 'pwsh "pwsh" "Run PowerShell as a shell within emacs." t)
;;(put 'dired-find-alternate-file 'disabled nil)