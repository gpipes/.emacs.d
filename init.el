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
(use-package powerline
  :init (powerline-default-theme))

(use-package ctags-update
  :bind (("C-/" . ctags-update)))

;; Codesearch packages, set GOPATH and run
;; go get github.com/google/codesearch/cmd/...
(use-package codesearch)

;; brew install rtags
;; brew services start rtags
;; rc -J <compile database>
(use-package rtags
  :init
  (setq rtags-display-result-backend 'helm)
  (setq rtags-autostart-diagnostics t)
  (setq rtags-completions-enabled t)
  (push 'company-rtags company-backends)
  (rtags-enable-standard-keybindings)
  :bind (:map c++-mode-map
	      ("C-." . rtags-find-symbol-at-point)
	      ("C-," . rtags-find-references-at-point)
	      ("C-<left>" . rtags-location-stack-back)
	      ("C-<right>" . rtags-location-stack-forward)))

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
(use-package geiser
  :init
  (require 'geiser-racket))

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

;; select files in dired mode, add |\\.*\\' to add file types you want to
;; open in the alist below.
(defun open/start-file-handler (operation &rest args)
  "Open file using OS command ignoring OPERATION and using path from ARGS."
  (let ((file (car args))
	(open-cmd (if (string-equal system-type "windows-nt")
		      "start "
		    "open ")))
    (kill-buffer nil)
    (shell-command (concat open-cmd file))))
(put 'open/start-file-handler 'operations '(insert-file-contents))
(add-to-list 'file-name-handler-alist
	     '("\\.sln\\'" . open/start-file-handler))

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

(provide 'init)
;;; init.el ends here
