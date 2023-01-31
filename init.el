;;; init.el -- Gerry Pipes' init file
;;; Commentary:
;;; Code:

(package-initialize)
(load (expand-file-name "custom.el" user-emacs-directory))
(load-theme 'wheatgrass)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(use-package clang-format)
(use-package astyle)
(use-package pass)
(use-package pinentry)
(use-package powershell)
(use-package groovy-mode)
(use-package csharp-mode)
(use-package racket-mode)
(use-package markdown-mode)
(use-package cmake-mode)
(use-package geiser)
(use-package geiser-guile)
(use-package geiser-racket)
(use-package ws-butler
  :init (ws-butler-global-mode))

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
