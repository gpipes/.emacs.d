(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(byte-compile-warnings 'nil)
 '(company-auto-commit ''company-explicit-action-p)
 '(company-idle-delay 1.0)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(elfeed-feeds '("https://www.gamespot.com/feeds/game-news/"))
 '(global-company-mode t)
 '(indent-tabs-mode nil)
 '(menu-bar-mode 'nil)
 '(mode-line-modes nil t)
 '(package-archives
   '(("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")))
 '(path-separator ":" t)
 '(pytest-cmd-flags
   "-svr fE --tb=short --basetemp=../automation_output --te_file test/te/my.json --te_cell 127.0.0.1 --env=dev --account=pro --junitxml=../automation_output/junitreports/pyTestResults.xml --instafail --log_level=debug")
 '(pytest-project-root-test
   (lambda
     (dirname)
     (string-suffix-p "automation/" dirname t)))
 '(show-paren-mode t)
 '(sql-sqlite-options '("-interactive"))
 '(tool-bar-mode 'nil)
 '(truncate-lines t)
 '(use-package-always-ensure t)
 '(which-function-mode t)
 '(which-key-mode t)
 '(which-key-popup-type 'side-window)
 '(xref-show-definitions-function #'ivy-xref-show-defs)
 '(xref-show-xrefs-function #'ivy-xref-show-xrefs))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:extend t :slant normal :weight bold :height 201 :width normal :family "Ubuntu Mono")))))
