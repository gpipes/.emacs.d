;;; init.el -- Gerry Pipes' init file
;;; Commentary:
;;; Code:

(package-initialize)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(defconst win-debug-file (expand-file-name "cdb-gud" user-emacs-directory))
(load custom-file)
(load win-debug-file)
(load-theme 'whiteboard)

;; load local.el which sets local-el-files-list to load
;; ex: (setq local-el-files-list '("path1" "path2"))
(defvar local-el-files-list '())
(load (expand-file-name "local.el" user-emacs-directory) t t)
(mapc (lambda (file) (load file)) local-el-files-list)

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
  (add-hook 'emacs-lisp-mode-hook 'paredit-on)
  (add-hook 'racket-mode-hook 'paredit-on))

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
(use-package helm-xref)
(use-package ssh)
(use-package powershell)
(use-package groovy-mode)
(use-package org-jira)

(use-package realgud
  :bind
  (:map realgud:shortkey-mode-map
        ("n" . realgud:cmd-next-no-arg)))

(use-package realgud-lldb)

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

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.mm\\'" . c++-mode))

(global-set-key (kbd "M-<left>") 'xref-pop-marker-stack)
(global-set-key (kbd "<f5>") 'projectile-compile-project)

(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(show-paren-mode)

(provide 'init)
;;; init.el ends here
