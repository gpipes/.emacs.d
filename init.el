;;; init.el -- Gerry Pipes' init file
;;; Commentary:
;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(epg-pinentry-mode 'loopback)
 '(file-mode-list
   '(("\\.sj\\'" . javascript-mode)
     ("Jenkinsfile\\'" . groovy-mode)
     ("\\.h\\'" . c++-mode)))
 '(fill-column 80)
 '(global-display-fill-column-indicator-mode t)
 '(global-font-lock-mode nil)
 '(indent-tabs-mode nil)
 '(menu-bar-mode 'nil)
 '(org-agenda-files '("~/notes"))
 '(org-agenda-include-diary t)
 '(org-clock-mode-line-total 'current)
 '(org-log-done 'note)
 '(org-log-note-clock-out t)
 '(package-archives
   '(("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")))
 '(package-selected-packages
   '(clang-format pass pinentry powershell groovy-mode csharp-mode racket-mode
                  markdown-mode cmake-mode))
 '(password-store-password-length 10)
 '(tool-bar-mode 'nil)
 '(tramp-remote-path '(tramp-own-remote-path))
 '(tramp-sh-extra-args nil))

(load-theme 'wheatgrass)
(package-install-selected-packages)
(mapc 'require package-selected-packages)

(defcustom file-mode-list nil "ASSOC list of filenames and modes")
(defun add-to-auto-mode (element)
  (add-to-list 'auto-mode-alist element))
(mapc 'add-to-auto-mode file-mode-list)

(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)

(provide 'init)
;;; init.el ends here
