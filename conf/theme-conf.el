;; theme-conf.el
;;

;; ALL THE ICONS THEME PACKAGE
;; https://github.com/domtronn/all-the-icons.el
;;(require 'all-the-icons)
;; or
;;(use-package all-the-icons)

;; ZERODARK THEME CONFIGURATION
;;
(load-theme 'zerodark t)
;; Optionally setup the modeline
;; This modeline implementation greatly reduces the speed of Emacs
;; not exactly sure why, maybe I could investigate this...
;;(zerodark-setup-modeline-format)


;; DOOM THEME CONFIGURATION
;;(require 'doom-themes)

;; Global settings (defaults)
;;(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each
;; theme may have their own settings.
;;(load-theme 'doom-one t)

;; Enable flashing mode-line on errors
;;(doom-themes-visual-bell-config)

;; Enable custom neotree theme
;; (doom-themes-neotree-config)  ; all-the-icons fonts must be installed!


;; mood-line - A minimal modeline inspired by doom-modeline
(mood-line-mode)
