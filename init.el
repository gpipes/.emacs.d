;;; init.el -- Gerry Pipes' init file
;;; Commentary:
;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(allow-func-list '(narrow-to-region))
 '(global-font-lock-mode nil)
 '(org-log-note-clock-out t)
 '(python-shell-interpreter "python")
 '(read-buffer-completion-ignore-case t)
 '(tab-width 4)
 '(tramp-remote-path '(tramp-own-remote-path))
 '(tramp-sh-extra-args nil)
 '(view-read-only t)
 '(warning-suppress-log-types '((comp))))

(defcustom file-mode-list nil "ASSOC list of filenames and modes")
(defun add-to-auto-mode (element)
  (add-to-list 'auto-mode-alist element))
(mapc 'add-to-auto-mode file-mode-list)

(defcustom allow-func-list nil "List of allowed disabled functions")
(defun allow-func (func-sym)
  (put func-sym 'disabled nil))
(mapc 'allow-func allow-func-list)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
