(package-initialize)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq debug-file (expand-file-name "gud.el" user-emacs-directory))
(load custom-file)
(load debug-file)
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
(use-package ivy
  :init (ivy-mode 1)
  :bind (("M-x" . counsel-M-x)
         ("C-x g" . counsel-git)
	 ("C-x C-f" . counsel-find-file)))

(use-package magit)

(use-package projectile
  :init (projectile-mode))

(use-package clang-format)

(use-package exec-path-from-shell
  :init (exec-path-from-shell-initialize))

(use-package rtags)
(use-package cmake-ide
  :init
  (require 'rtags)
  (cmake-ide-setup)
  :bind
  (("C-." . rtags-find-symbol-at-point)
   ("C-," . rtags-find-references-at-point)
   ("M-<left>" . rtags-location-stack-back)
   ("M-<right>" . rtags-location-stack-forward)))

(use-package which-key)

(use-package cyberpunk-theme)
(load-theme 'cyberpunk t)

(use-package cc-mode
  :bind
  (:map c++-mode-map
	("M-a" . c-beginning-of-defun)
	("C-M-a" . c-beginning-of-statement)))

(use-package markdown-mode)
(use-package flymd)
(use-package cmake-mode)
