;; theme-conf.el
;;

;; ALL THE ICONS THEME PACKAGE
;; https://github.com/domtronn/all-the-icons.el
;;(require 'all-the-icons)
;; or
;;(use-package all-the-icons)

;;
;; mood-one-theme
;;
(load-theme 'mood-one t)
;; custom Neotree configuration
(eval-after-load 'neotree #'mood-one-theme-neotree-configuration-enable)
;; custom Fringe Bitmaps
;;to replace default line continuation/line wrap fringe bitmaps:
(mood-one-theme-arrow-fringe-bmp-enable)
;;to enable custom fringe bitmaps for diff-hl
(setq diff-hl-fringe-bmp-function #'mood-one-theme-flycheck-fringe-bmp-enable)
;;to enable custom fringe bitmaps for flycheck:
(eval-after-load 'flycheck #'mood-one-theme-flycheck-fringe-bmp-enable)
;;to enable custom fringe bitmaps for flymake:
(eval-after-load 'flymake #'mood-one-theme-flymake-fringe-bmp-enable)

;; mood-line - A minimal modeline inspired by doom-modeline
(mood-line-mode)
