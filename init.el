;;; init.el -- Gerry Pipes' init file
;;; Commentary:
;;; Code:

(package-initialize)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
(load-theme 'wheatgrass)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(use-package clang-format)
(use-package astyle)
(use-package which-key)

(use-package pass)
(use-package pinentry)

(use-package powershell)
(use-package groovy-mode)
(use-package csharp-mode)
(use-package racket-mode)
(use-package lua-mode)
(use-package markdown-mode)
(use-package cmake-mode)

(use-package org
  :hook
  (org-mode . turn-on-auto-fill)
  (text-mode . turn-on-auto-fill))

(use-package geiser)
(use-package geiser-guile)
(use-package geiser-racket)
(use-package pytest)

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
(show-paren-mode)

(provide 'init)
;;; init.el ends here
