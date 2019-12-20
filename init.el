;;; init.el -- Gerald Pipes' init file
;;; Commentary:
;;; Code:

(package-initialize)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(defconst debug-file (expand-file-name "gud" user-emacs-directory))
(defconst win-debug-file (expand-file-name "cdb-gud" user-emacs-directory))
(load custom-file)
(load debug-file)
(load win-debug-file)
(load-theme 'tango-dark)
(show-paren-mode)
(put 'narrow-to-region 'disabled nil)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.mm\\'" . c++-mode))
(global-set-key (kbd "M-<left>") 'xref-pop-marker-stack)
(global-set-key (kbd "<f5>") 'projectile-compile-project)
(put 'upcase-region 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Setup Packages               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(package-refresh-contents)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Require Packages              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package cl)
(use-package ag)
(use-package ws-butler
  :init (ws-butler-global-mode))

(use-package magit
  :bind
  (("C-x v d" . magit-status)
   ("C-x v l" . magit-log-buffer-file)))

(use-package projectile
  :init (projectile-mode +1)
  :bind
  (:map projectile-mode-map
	("C-c p" . projectile-command-map)))

(use-package clang-format)

(use-package exec-path-from-shell
  :init (unless (string-equal system-type "windows-nt")
          (exec-path-from-shell-initialize)))

(use-package which-key)
(use-package markdown-mode)
(use-package flymd)
(use-package cmake-mode)
(use-package dumb-jump
  :init
  (dumb-jump-mode)
  :bind
  (("C-<return>" . dumb-jump-go)))

(use-package company
  :init
  (global-company-mode)
  (delete 'company-clang company-backends)
  :bind (("M-<tab>" . 'company-complete-common-or-cycle)))

(use-package flycheck
  :init (global-flycheck-mode))

(use-package paredit
  :init
  (defun paredit-on () (paredit-mode 1))
  (add-hook 'scheme-mode-hook  'paredit-on)
  (add-hook 'emacs-lisp-mode-hook 'paredit-on))

(use-package pytest
  :bind
  (("C-c ." . pytest-one)
   ("C-c SPC" . pytest-all)))

(use-package elfeed)
(use-package csharp-mode)
(use-package flycheck-rust)
(use-package rust-mode
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
(use-package racer
  :init
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'company-mode))

(use-package racket-mode)

(use-package helm
  :init (helm-mode 1)
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b" . helm-mini)
	 (:map helm-map
	       ("<tab>" . helm-execute-persistent-action)
	       ("C-z" . helm-select-action))))

(use-package helm-projectile)
(use-package helm-rtags)
(use-package helm-xref)

(use-package powershell)
(use-package groovy-mode)
(use-package org-jira)
(use-package ggtags
  :init
  (defun ggtags-on () (ggtags-mode 1))
  (mapc (lambda (mode-name) (add-hook mode-name 'ggtags-on))
        '(c-mode-common-hook racket-mode-hook python-mode-hook
                             lisp-mode-hook scheme-mode-hook
                             java-mode-hook emacs-lisp-mode-hook
                             javascript-mode-hook))
  (setenv "GTAGSLABEL" "pygments")
  (if (not (string-equal system-type "windows-nt"))
      (setenv "GTAGSCONF" "/usr/local/share/gtags/gtags.conf")
    (setenv "GTAGSCONF" (concat (getenv "HOMEDRIVE") "/global/share/gtags/gtags.conf")))
  :bind
  (("C-M-." . ggtags-find-tag-regexp)
   (:map ggtags-mode-map
         ("C-M-<return>" . ggtags-create-tags)
         ("M->" . end-of-buffer)
         ("M-<" . beginning-of-buffer))))

(add-to-list 'auto-mode-alist
	     '("\\.sj\\'" . javascript-mode))

(add-to-list 'auto-mode-alist
             '("Jenkinsfile\\'" . groovy-mode))

(provide 'init)
;;; init.el ends here
