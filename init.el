;;; init.el -- Gerry Pipes' init file
;;; Commentary:
;;; Code:

(package-initialize)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(defconst win-debug-file (expand-file-name "cdb-gud" user-emacs-directory))
(load custom-file)
(load win-debug-file)
(load (expand-file-name "local.el" user-emacs-directory) t t)

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
(use-package astyle)

(use-package exec-path-from-shell
  :init
  (setenv "PS1" "\\[\\e[34m\\]\\u@\\h \\[\\e[43m\\]\\w\\[\\e[0m\\]\\n$ ")
  (unless (equal system-type 'windows-nt)
    (exec-path-from-shell-initialize)))

(use-package which-key)
(use-package markdown-mode)
(use-package flymd)
(use-package cmake-mode)

(use-package company
  :init
  (global-company-mode))

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
(use-package racket-mode)

(use-package helm
  :init (helm-mode 1)
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b" . helm-mini)))
(use-package helm-projectile)
(use-package helm-xref)
(use-package powershell)
(use-package groovy-mode)

(use-package realgud
  :bind
  (:map realgud:shortkey-mode-map
        ("n" . realgud:cmd-next-no-arg)))
(use-package realgud-lldb)

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
