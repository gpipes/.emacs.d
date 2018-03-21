;;; init.el -- Gerald Pipes' init file
;;; Commentary:
;;; Code:

(package-initialize)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(defconst debug-file (expand-file-name "gud.el" user-emacs-directory))
(load custom-file)
(load debug-file)
(load-theme 'tango-dark)
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

(use-package helm
  :init (helm-mode 1)
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 (:map helm-map
	       ("<tab>" . helm-execute-persistent-action)
	       ("C-z" . helm-select-action))
	 (:map helm-find-files-map
	       ("<backspace>" . helm-find-files-up-one-level))))
(use-package helm-projectile)
(use-package helm-gtags
  :bind (("C-." . helm-gtags-dwim)))

(use-package magit
  :bind
  (("C-c C-g" . magit-status)))

(use-package projectile
  :init (projectile-mode))

(use-package clang-format)

(use-package exec-path-from-shell
  :init (exec-path-from-shell-initialize))

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

(global-linum-mode t)

(use-package company
  :init (global-company-mode)
  :bind (("M-/" . 'company-complete-common-or-cycle)))

(use-package flycheck
  :init (global-flycheck-mode))

(use-package ggtags)

;; brew install racket
(use-package geiser
  :init
  (unless (get-buffer "* Racket REPL *")
    (run-racket)))

(use-package paredit
  :init
  (defun paredit-on () (paredit-mode 1))
  (add-hook 'scheme-mode-hook  'paredit-on)
  (add-hook 'emacs-lisp-mode-hook 'paredit-on))

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

(provide 'init)
;;; init.el ends here
