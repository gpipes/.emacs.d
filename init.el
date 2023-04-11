;;; init.el -- Gerry Pipes' init file
;;; Commentary:
;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(allow-func-list '(narrow-to-region))
 '(epg-pinentry-mode 'loopback)
 '(file-mode-list '(("Jenkinsfile\\'" . groovy-mode)))
 '(global-font-lock-mode nil)
 '(indent-tabs-mode nil)
 '(menu-bar-mode 'nil)
 '(org-agenda-files '("~/notes/log.org"))
 '(org-log-done 'note)
 '(org-log-note-clock-out t)
 '(package-archives
   '(("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")))
 '(package-selected-packages '(password-store powershell groovy-mode
                                              csharp-mode))
 '(password-store-password-length 10)
 '(tool-bar-mode 'nil)
 '(tramp-remote-path '(tramp-own-remote-path))
 '(tramp-sh-extra-args nil)
 '(view-read-only t))

(package-install-selected-packages)
(mapc 'require package-selected-packages)

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
 '(default ((t (:height 160)))))

(provide 'init)
;;; init.el ends here
