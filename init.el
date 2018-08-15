;;; init.el -- Gerald Pipes' init file
;;; Commentary:
;;; Code:

(package-initialize)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(defconst debug-file (expand-file-name "gud.el" user-emacs-directory))
(load custom-file)
(load debug-file)
(load-theme 'tango-dark)
(show-paren-mode)

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
(use-package powerline
  :init (powerline-default-theme))

(use-package helm
  :init (helm-mode 1)
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b" . helm-mini)
	 (:map helm-map
	       ("<tab>" . helm-execute-persistent-action)
	       ("C-z" . helm-select-action))))
(use-package helm-projectile)

(use-package ctags-update
  :bind (("C-/" . ctags-update)))
(use-package helm-xref)


;; Codesearch packages, set GOPATH and run
;; go get github.com/google/codesearch/cmd/...
(use-package codesearch)
(use-package helm-codesearch
  :bind (("C-." . helm-codesearch-find-pattern)
	 ("C-c c /" . helm-codesearch-create-csearchindex)))
(use-package projectile-codesearch)


(use-package magit
  :bind
  (("C-x g" . magit-status)))

(use-package projectile
  :init (projectile-mode +1)
  :bind
  (:map projectile-mode-map
	("C-c p" . projectile-command-map)))

(use-package clang-format)

(use-package exec-path-from-shell
  :init (exec-path-from-shell-initialize)
  (when (string-equal system-type "windows-nt")
    (setq exec-path
	  (mapcar
	   ;;for everything on the path convert it to
	   ;;a windows path and take of the trailing
	   ;;newline and backslash
	   (lambda (path) (replace-regexp-in-string
			   "\n"
			   " "
			   (substring
			    (shell-command-to-string
			     (concat "cygpath -w " path))
			    0 -2)))
	   exec-path))))

(use-package which-key)

(use-package cc-mode
  :bind
  (:map c++-mode-map
	("M-a" . c-beginning-of-defun)
	("C-M-a" . c-beginning-of-statement)))

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

;; brew install racket
(use-package geiser)

(use-package paredit
  :init
  (defun paredit-on () (paredit-mode 1))
  (add-hook 'scheme-mode-hook  'paredit-on)
  (add-hook 'emacs-lisp-mode-hook 'paredit-on))

(use-package pytest
  :bind
  (("C-c ." . pytest-one)
   ("C-c SPC" . pytest-all)))

;;sqlite modes
;; brew install perl
;; sudo cpan RPC::EPC::Service DBI DBD::SQLite
(use-package edbi-sqlite
  :init
  (defun sqlite-handler (operation &rest args)
    "An open hook that will invoke ebdi when opening sqlite files."
    (let ((sql-database (car args)))
      (kill-buffer nil)
      (edbi-sqlite sql-database)))
  (put 'sqlite-handler 'operations '(insert-file-contents))
  (add-to-list 'file-name-handler-alist
	       '("\\.sqlite\\|\\.db\\'" . sqlite-handler)))
(use-package elfeed)
(use-package csharp-mode)
(provide 'init)
;;; init.el ends hereq
