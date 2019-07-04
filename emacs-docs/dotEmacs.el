;;;.emacs.el ----------------------------------------------------------------------
;; Created by: Erik P. Almaraz (2013.05.09)
;; Updated: (2018.08.09)


;;; Setup System Environment

(unless (require 'cl-lib nil t)
  (require 'cl))

(defvar *emacs-lisp-path* "~/.emacs/elisp")

(defvar system-type-as-string (prin1-to-string system-type))
(defvar on-gnu-linux (string-match "linux" system-type-as-string))
(defvar on-darwin (string-match "darwin" system-type-as-string))
(defvar on-windows-nt (string-match "windows-nt" system-type-as-string))

(add-to-list 'load-path *emacs-lisp-path*)

;; Backup files:
(setq backup-directory-alist '(("." . "~/.emacs.d/.saves")))
(setq backup-by-copying t)

;; Load Emacs customizations (defaul customizations):
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

;;; Global Key-bindings:

;; Steve Yegge key bindings: Use instead of M-x
;;(global-set-key "\C-x\C-m" 'execute-extended-command)
;;(global-set-key "\C-c\C-m" 'execute-extended-command)
;;(global-set-key "\C-w" 'backward-kill-word)
;;(global-set-key "\C-x\C-k" 'kill-region)
;;(global-set-key "\C-c\C-k" 'kill-region)

;;; General Settings:

;;; Disable Splashscreen:
;;(setq inhibit-splash-screen t)

;;; Set intial height and width of frame:
(cond
 (on-gnu-linux
  (add-to-list 'default-frame-alist '(height . 81))
  (add-to-list 'default-frame-alist '(width  . 274)))
 (on-darwin
  (add-to-list 'default-frame-alist '(height . 60))
  (add-to-list 'default-frame-alist '(width  . 80)))
 (on-windows-nt
  (add-to-list 'default-frame-alist '(height . 60))
  (add-to-list 'default-frame-alist '(width  . 100))))

;;; Display Line numbers
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
;; Display Column number is modeline
(column-number-mode t)

;;; Highlight parenthesis completion
(show-paren-mode t)

;;; Indent with spaces:
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq-default truncate-lines t)
;; Remove trailing whitespaces upon save:
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; Refresh All Buffers:
(global-auto-revert-mode t)

;;; Disable menue modes:
;; see: http://list.x.org/archives/xorg/2008-January/032245.html
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;---------------------------------------------------------------------------------

(require 'package)

;;; Add MELPA repository:
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA
  ;; and MELPA Stable as desired
  (add-to-list 'package-archives
               (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives
  ;;(cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives
                 '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;;; Appearance/Theme:
(require 'doom-themes)
;; Global settings (defaults)
(setq doom-themes-enable-bold   t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t)   ; if nil, italics is universally disabled
;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each
;; theme may have their own settings
(load-theme 'doom-one t)
;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)
;; Enable custom neotree theme
(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

;;; Highlight current line; set a custome face:
;; Only works with dark-themes
(defface hl-line '((t (:background "Gray10")))
  "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
(global-hl-line-mode t)

;;---------------------------------------------------------------------------------
