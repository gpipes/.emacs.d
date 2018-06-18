
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.0)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(elfeed-feeds (quote nil))
 '(geiser-repl-use-other-window nil)
 '(global-company-mode t)
 '(helm-auto-resize-mode t)
 '(helm-ff-file-name-history-use-recentf t)
 '(helm-follow-mode-persistent t)
 '(helm-source-names-using-follow (quote ("Find tag from here")))
 '(helm-split-window-in-side-p t)
 '(helm-split-window-inside-p t)
 '(initial-buffer-choice nil)
 '(magit-pull-arguments nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/"))))
 '(package-selected-packages
   (quote
    (offlineimap elfeed edbi-sqlite pytest paredit geiser ggtags flycheck company dumb-jump cmake-mode flymd markdown-mode which-key exec-path-from-shell clang-format magit helm-gtags helm-projectile helm powerline ws-butler ag use-package)))
 '(pytest-cmd-flags
   "-svr fE --tb=short --basetemp=../automation_output --te_file test/te/my.json --te_cell 127.0.0.1 --env=dev --account=personal --junitxml=../automation_output/junitreports/pyTestResults.xml --instafail --log_level=debug")
 '(pytest-project-root-test
   (lambda
     (dirname)
     (string-suffix-p "automation/" dirname t)))
 '(rtags-completing-read-behavior (quote insert-default))
 '(rtags-display-result-backend (quote ivy))
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
