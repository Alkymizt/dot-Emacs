;; emacs-conf.el  -*- lexical-binding: t -*-
;; My concept here is this file pulls in from libraries, sets-up env vars for the most
;; part and possible do a little programatic magic, but should not define/impliment
;; functions (nothing too complex done here) keep is simple config set-up...

;; View Setup:
;;============

;; Defaults
;;==========

;; Disable Menue Modes:
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


;; Hide splash-screen and startup-message
;;(setq inhibit-splash-screen t)
;;(setq inhibit-startup-message t)

;; Start in full-screen mode and/or set custom window dimensions:
;; TO-DO:

;; Set frame default display:
(set-frame-position (selected-frame) 0 0)
(add-to-list 'default-frame-alist '(height . 42))
(add-to-list 'default-frame-alist '(width . 90))

;; Custom-File
(setq custom-file "~/.emacs.d/etc/conf/customs.el")
(if (file-exists-p custom-file)
    (load custom-file)
  (write-file custom-file ";; customs.el"))

;; Backups
(setq backup-by-copying t    ; stop shinanigans with links
      delete-old-versions t
      version-control t      ; use version backups
      backup-directory-alist '(("." . "~/.emacs.d/etc/backup")))
;; Creates directory if it doesn't already exist
(make-directory "~/.emacs.d/etc/backup/" t)
;; Creates auto directory if it doesn't already exist
(make-directory "~/.emacs.d/etc/backup/auto" t)
;; backup in one place. flat, no tree structure
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/etc/backup/auto/" t)))

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
(setq-default fill-column 108)

;; See: https://www.emacswiki.org/emacs/AutoFillMode
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; Let's make EMACS ask us whethere to use Auto Fill Mode when opening
;; a text file:
;; (add-hook 'text-mode-hook
;;           (lambda ()
;;             (when (y-or-n-p "Auto Fill Mode? ")
;;               (turn-on-auto-fill))))

;; https://www.emacswiki.org/emacs/RefillMode

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

(autoload 'powershell "powershell" "Run PowerShell as a shell within emacs." t)
;;(put 'dired-find-alternate-file 'disabled nil)




;; General Key Bindings
;;======================
;;


;; TODO items
;;

;; spell check
;; TO-DO:

;; Impliment custom themes
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")


;; Split window vertically by default (rather than horizontally)
;;(split-window-right)

;; Open frame vertically by default:
;; This is not working to my liking, maybe I should write a function that does
;; what I want
;;(setq split-height-threshold nil)
;;(setq split-width-threshold 0)
