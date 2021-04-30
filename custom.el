(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(astyle-style "gnu")
 '(byte-compile-warnings 'nil)
 '(clang-format-fallback-style "gnu")
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(elfeed-feeds '("https://www.gamespot.com/feeds/game-news/"))
 '(epg-pinentry-mode 'loopback)
 '(ido-mode 'both nil (ido))
 '(indent-tabs-mode nil)
 '(menu-bar-mode 'nil)
 '(mode-line-modes nil t)
 '(org-agenda-files '("~/notes"))
 '(org-log-note-headings
   '((done . "CLOSING NOTE %D")
     (state . "State %-12s from %-12S %D")
     (note . "Note taken on %D")
     (reschedule . "Rescheduled from %S on %t")
     (delschedule . "Not scheduled, was %S on %t")
     (redeadline . "New deadline from %S on %t")
     (deldeadline . "Removed deadline, was %S on %t")
     (refile . "Refiled on %t")
     (clock-out . "")))
 '(org-show-notification-handler '(lambda (notif) (message (concat "Org Timer " notif))))
 '(package-archives
   '(("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")))
 '(path-separator ":" t)
 '(show-paren-mode t)
 '(sql-ms-program "sqlcmd")
 '(sql-sqlite-options '("-interactive"))
 '(tab-width 4)
 '(tool-bar-mode 'nil)
 '(truncate-lines t)
 '(use-package-always-ensure t)
 '(which-function-mode t)
 '(which-key-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
