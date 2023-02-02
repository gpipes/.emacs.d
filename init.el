;;; init.el -- Gerry Pipes' init file
;;; Commentary:
;;; Code:


(load (expand-file-name "custom.el" user-emacs-directory))
(load-theme 'wheatgrass)
(package-install-selected-packages)
(mapc 'require package-selected-packages)
(ws-butler-global-mode)
(add-to-list 'auto-mode-alist '("\\.sj\\'" . javascript-mode))
(add-to-list 'auto-mode-alist '("Jenkinsfile\\'" . groovy-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'semantic-symref-filepattern-alist
             '(dired-mode "*.*"))
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)

(provide 'init)
;;; init.el ends here
