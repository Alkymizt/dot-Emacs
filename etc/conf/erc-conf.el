;; erc-conf.el  -*- lexical-binding: t -*-
;;

;;
;; My erc settings are pretty basic. I have the fill column
;; recalculate on window resize and I put the scroll margin
;; back to default so that my scrolloff settings don’t mess
;; with it.
;;
;; (use-package erc
;;   :ensure nil
;;   :defer t
;;   :config
;;   (add-hook 'window-configuration-change-hook
;;             (lambda ()
;;               (setq erc-fill-column (- (window-width) 2))))
;;   (add-hook 'erc-mode-hook
;;             (lambda ()
;;               (setq-local scroll-margin 1)))

;;   (setq erc-rename-buffers t
;;         erc-interpret-mirc-color t
;;         erc-lurker-hide-list '("JOIN" "PART" "QUIT")
;;         erc-autojoin-channels-alist '(("freenode.net" "#emacs"))))

;;
;; Simple function that pulls my credentials from a GPG encrypted
;; file and connects to freenode providing a nick and password to
;; verify my user.
;;
;; (defun wolfe/irc ()
;;       (interactive)
;;       (let* ((tupple (wolfe/get-user-pass wolfe/irc-info-path))
;;              (user (car tupple))
;;              (pass (cadr tupple)))
;;         (erc
;;          :server "irc.freenode.net"
;;          :port 6667
;;          :nick user
;;          :password pass)))
