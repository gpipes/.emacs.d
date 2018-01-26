(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "d6922c974e8a78378eacb01414183ce32bc8dbf2de78aabcc6ad8172547cb074" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/"))))
 '(package-selected-packages
   (quote
    (cmake-mode ag flymd markdown-preview-eww markdown-mode clang-format projectile cyberpunk-theme rtags exec-path-from-shell which-key cmake-ide counsel ivy magit use-package)))
 '(projectile-mode t nil (projectile))
 '(safe-local-variable-values
   (quote
    ((eval setq jedi:server-args
	   (list "--sys-path"
		 (concat
		  (projectile-project-root)
		  "automation")
		 "--sys-path"
		 (concat
		  (projectile-project-root)
		  "automation/tools/framework_installer/automation_framework")
		 "--sys-path"
		 (concat
		  (projectile-project-root)
		  "automation/tools/framework_installer/report_util")
		 "--sys-path"
		 (concat
		  (projectile-project-root)
		  "automation/tools/framework_installer/suite_util")))
     (eval setq cmake-ide-build-dir
	   (concat
	    (projectile-project-root)
	    "build_debug")))))
 '(use-package-always-ensure t)
 '(which-function-mode t)
 '(which-key-mode t)
 '(which-key-popup-type (quote side-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
