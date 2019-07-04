;; pwshell.el, version 0.1
;;
;; Author: Erik Almaraz
;; Mon, 01 Jul 2019 5:00
;;
;; EDIT:
;; powershell.el => pwsh.el (not to interfere with powershell-mode, if installed)
;; runs PowerShell Core 6.2 (pwsh.exe)
;; Attempt to fix errors and improve this script
;;

(require 'shell)

;;erk - need to determine what functionality this provides...
(defgroup pwshell nil
  "Running pwshell from within Emacs buffers."
  :group 'processes
  )

;;;###autoload
(defun pwshell (&optional buffer)
  "Run an inferior powershell, by invoking the shell function. See the help for shell for more details.
\(Type \\[describe-mode] in the shell buffer for a list of commands.)"
  (interactive
   (list
    (and current-prefix-arg
	 (read-buffer "Shell buffer: "
		      (generate-new-buffer-name "*PowerShell Core*")))))

  ;; Get a name for the buffer
  (setq buffer (get-buffer-create (or buffer "*PowerShell Core*")))

  (let ((tmp-shellfile explicit-shell-file-name))
    ;; Set arguments for the powershell exe.
    ;; This needs to be tunable.
    (setq explicit-shell-file-name "c:\\Program Files\\PowerShell\\6\\pwsh.exe")
    ;; Launch the shell
    (shell buffer)
    ; Restore the original shell
    (if explicit-shell-file-name
        (setq explicit-shell-file-name tmp-shellfile)
      ))

  ;; Hook the kill-buffer action so we can kill the inferior process?
  (add-hook 'kill-buffer-hook 'pwshell-delete-process)

  buffer
  );;end function pwshell

(defun pwshell-delete-process (&optional proc)
  (or proc
      (setq proc (get-buffer-process (current-buffer)))
      )
  (and (processp proc)
       (delete-process proc)
       )
  )
