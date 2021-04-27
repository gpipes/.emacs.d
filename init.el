;;; init.el -- Gerry Pipes' init file
;;; Commentary:
;;; Code:

(package-initialize)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
(load-theme 'wheatgrass)

(add-hook 'dired-load-hook
          (lambda () (load "dired-x")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Setup Packages               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Require Packages              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package clang-format)
(use-package astyle)
(use-package which-key)
(use-package ivy-xref)
(use-package pinentry)
(use-package powershell)
(use-package groovy-mode)
(use-package csharp-mode)
(use-package racket-mode)
(use-package lua-mode)
(use-package markdown-mode)
(use-package cmake-mode)
(use-package ssh)
(use-package geiser)
(use-package geiser-guile)

(use-package org
  :bind ("C-c a" . org-agenda)
  :hook ;; turn on auto fill for text/organization modes
  (org-mode . turn-on-auto-fill)
  (text-mode . turn-on-auto-fill))

(use-package ws-butler
  :init (ws-butler-global-mode))

(use-package exec-path-from-shell
  :init
  (setenv "PS1" "\\[\\e[34m\\]\\u@\\h \\[\\e[43m\\]\\w\\[\\e[0m\\]\\n$ ")
  (unless (equal system-type 'windows-nt)
    (exec-path-from-shell-initialize)))

(use-package pytest
  :bind
  (:map python-mode-map
        ("C-c ." . pytest-one)
        ("C-c M-." . pytest-all)))

(use-package ivy-pass
  :bind ("C-c M-p" . ivy-pass))

(use-package counsel
  :init
  (ivy-mode 1)
  (counsel-mode 1))

(add-to-list 'auto-mode-alist '("\\.sj\\'" . javascript-mode))
(add-to-list 'auto-mode-alist '("Jenkinsfile\\'" . groovy-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.mm\\'" . c++-mode))
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(show-paren-mode)

(provide 'init)
;;; init.el ends here
