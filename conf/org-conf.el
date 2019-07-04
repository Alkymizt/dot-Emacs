;; Org Mode Activation
;; Source:
;; https://www.gnu.org/software/emacs/manual/html_node/org/Activation.html#Activation
;;
;; Org mode buffers need font-lock to be turned on: this is the default in Emacs*

;; Org Mode Commands
;; The four Org commands org-store-link, org-capture, org-agenda, and org-switchb
;; should be accessible through global keys (i.e., anywhere in Emacs, not just in
;; Org buffers). Here are suggested bindings for these keys, please modify the
;; keys to your own liking.

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)


;; Files with the .org extension use Org mode by default. To turn on Org mode in
;; a file that does not have the extension .org, make the first line of a file
;; look like this:

;;
;; MY PROJECTS    -*- mode: org; -*-
;;

;; which will select Org mode for this buffer no matter what the file's name is.
;; See also the variable org-insert-mode-line-in-empty-file.

;; Many commands in Org work on the region if the region is active. To make use
;; of this, you need to have transient-mark-mode turned on, which is the
;; default. If you do not like transient-mark-mode, you can create an active
;; region by using the mouse to select a region, or pressing C-<SPC> twice
;; before moving the cursor.

;; Footnotes
;;
;; * If you don't use font-lock globally, turn it on in Org buffer with
;;   (add-hook 'org-mode-hook 'turn-on-font-lock)



;; Document Structure
;;
;; * Top level headline
;; ** Second level
;; *** 3rd level
;; some text
;; *** 3rd level
;; more text
;; * Another top level headline
