;; controls.el  -*- lexical-binding: t -*-

(defun toggle-bars-on ()
  "Toggles bars on."
  (interactive)
  (menu-bar-mode)
  (tool-bar-mode)
  (scroll-bar-mode))

(defun toggle-bars-off ()
  "Toggles bars off."
  (interactive)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(defun toggle-full-screen-on ()
  "Toggle on full screen mode."
  (interactive)
  (toggle-frame-fullscreen))

(defun toggle-full-screen-off ()
  "Toggle off full screen mode."
  (interactive)
  (toggle-frame-fullscreen -1))
