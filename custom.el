(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(byte-compile-warnings 'nil)
 '(c-default-style "stroustrup")
 '(c-basic-offset 2)
 '(tab-width 2)
 '(company-auto-commit ''company-explicit-action-p)
 '(company-idle-delay 1.0)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(elfeed-feeds '("https://www.gamespot.com/feeds/game-news/"))
 '(flycheck-check-syntax-automatically '(save mode-enable))
 '(geiser-repl-use-other-window nil)
 '(global-company-mode t)
 '(helm-auto-resize-mode t)
 '(helm-completion-style 'emacs)
 '(helm-ff-file-name-history-use-recentf t)
 '(helm-follow-mode-persistent t)
 '(helm-source-names-using-follow '("Buffers" "Helm Xref"))
 '(helm-split-window-in-side-p t)
 '(helm-split-window-inside-p t)
 '(indent-tabs-mode nil)
 '(initial-buffer-choice nil)
 '(jiralib-url "https://jira.carboniteinc.com")
 '(magit-git-executable "git")
 '(magit-pull-arguments nil)
 '(menu-bar-mode 'nil)
 '(mode-line-modes nil t)
 '(ns-command-modifier 'control)
 '(ns-control-modifier 'command)
 '(org-agenda-files '("d:/devcenter/Gengine/TODO.org"))
 '(package-archives
   '(("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/")))
 '(path-separator ":" t)
 '(pytest-cmd-flags
   "-svr fE --tb=short --basetemp=../automation_output --te_file test/te/my.json --te_cell 127.0.0.1 --env=dev --account=pro --junitxml=../automation_output/junitreports/pyTestResults.xml --instafail --log_level=debug")
 '(pytest-project-root-test
   (lambda
     (dirname)
     (string-suffix-p "automation/" dirname t)))
 '(realgud-safe-mode nil)
 '(rust-format-on-save t)
 '(show-paren-mode t)
 '(tool-bar-mode 'nil)
 '(truncate-lines t)
 '(use-package-always-ensure t)
 '(which-function-mode t)
 '(which-key-mode t)
 '(which-key-popup-type 'side-window)
 '(xref-show-xrefs-function #'helm-xref-show-xrefs))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:extend t :slant normal :weight bold :height 151 :width normal :family "Ubuntu Mono")))))
