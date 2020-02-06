
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(byte-compile-warnings (quote nil))
 '(company-auto-complete (quote (quote company-explicit-action-p)))
 '(company-idle-delay 1.0)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(elfeed-feeds
   (quote
    ("https://www.reddit.com/r/NintendoSwitch.rss" "https://www.gamespot.com/feeds/game-news/")))
 '(geiser-repl-use-other-window nil)
 '(global-company-mode t)
 '(grep-command "grep  -nHI")
 '(grep-find-command (quote ("find . -type f -exec grep  -nHI  {} \\;" . 32)))
 '(grep-find-template "find <D> <X> -type f <F> -exec grep <C> -nHI <R> {} \\;")
 '(grep-highlight-matches (quote always))
 '(grep-template "grep <X> <C> -nHI <R> <F>")
 '(grep-use-null-device nil)
 '(helm-auto-resize-mode t)
 '(helm-completion-style (quote emacs))
 '(helm-ff-file-name-history-use-recentf t)
 '(helm-follow-mode-persistent t)
 '(helm-source-names-using-follow
   (quote
    ("Buffers" "RTags Helm" "Codesearch: Find pattern" "Helm Xref")))
 '(helm-split-window-in-side-p t)
 '(helm-split-window-inside-p t)
 '(indent-tabs-mode nil)
 '(initial-buffer-choice nil)
 '(jiralib-url "https://jira.carboniteinc.com")
 '(magit-git-executable "git")
 '(magit-pull-arguments nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/"))))
 '(package-selected-packages
   (quote
    (ssh ggtags org-jira racket-mode flycheck-rust racer rust-mode groovy-mode powershell helm-xref helm-rtags helm-projectile helm csharp-mode elfeed pytest paredit geiser flycheck company dumb-jump cmake-mode flymd markdown-mode which-key exec-path-from-shell clang-format projectile magit rtags codesearch ctags-update powerline ws-butler ag use-package)))
 '(path-separator ":" t)
 '(pytest-cmd-flags
   "-svr fE --tb=short --basetemp=../automation_output --te_file test/te/my.json --te_cell 127.0.0.1 --env=dev --account=pro --junitxml=../automation_output/junitreports/pyTestResults.xml --instafail --log_level=debug")
 '(pytest-project-root-test
   (lambda
     (dirname)
     (string-suffix-p "automation/" dirname t)))
 '(rtags-completing-read-behavior (quote insert-default))
 '(rtags-display-result-backend (quote ivy))
 '(rust-format-on-save t)
 '(safe-local-variable-values
   (quote
    ((eval setq jedi:server-args
           (if
               (fboundp
                (quote projectile-project-root))
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
                      "automation/tools/framework_installer/suite_util"))))
     (pytest-project-root-test lambda
                               (dirname)
                               (string-suffix-p "automation/" dirname t))
     (pytest-cmd-flags . "-svr fE --tb=short --basetemp=../automation_output --te_file test/te/te1.json --te_cell 127.0.0.1 --env=dev --account=personal --junitxml=../automation_output/junitreports/pyTestResults.xml --instafail --log_level=debug")
     (projectile-project-compilation-dir . "build_debug")
     (projectile-project-compilation-cmd . "make -j8"))))
 '(truncate-lines t)
 '(use-package-always-ensure t)
 '(which-function-mode t)
 '(which-key-mode t)
 '(which-key-popup-type (quote side-window))
 '(xref-show-xrefs-function (function helm-xref-show-xrefs) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
