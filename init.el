;;; init.el -- Gerry Pipes' init file
;;; Commentary:
;;; Code:
(custom-set-variables
 '(epg-pinentry-mode 'loopback)
 '(fill-column 80)
 '(global-display-fill-column-indicator-mode t)
 '(global-font-lock-mode nil)
 '(indent-tabs-mode nil)
 '(menu-bar-mode 'nil)
 '(org-agenda-files '("~/notes"))
 '(org-agenda-include-diary t)
 '(org-log-note-clock-out t)
 '(org-log-done 'note)
 '(org-clock-mode-line-total 'current)
 '(package-archives
   '(("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")))
 '(package-selected-packages
   '(clang-format pass pinentry powershell groovy-mode csharp-mode racket-mode
                  markdown-mode cmake-mode ws-butler))
 '(password-store-password-length 10)
 '(tool-bar-mode 'nil)
 '(tramp-remote-path '(tramp-own-remote-path))
 '(tramp-sh-extra-args nil)
 '(file-mode-list
   '(("\\.sj\\'" . javascript-mode) ("Jenkinsfile\\'" . groovy-mode)
     ("\\.h\\'" . c++-mode))))

(load-theme 'wheatgrass)
(package-install-selected-packages)
(mapc 'require package-selected-packages)
(ws-butler-global-mode)

(defcustom file-mode-list nil "ASSOC list of filenames and modes")
(defun add-to-auto-mode (element)
  (add-to-list 'auto-mode-alist element))
(mapc 'add-to-auto-mode file-mode-list)

(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)

(provide 'init)
;;; init.el ends here
