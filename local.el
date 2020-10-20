;;; local.el -- Gerry Pipes' local load file list

;;; Commentary:
;; define a list of files on this local machine that should be loaded
;; on startup.  These may be in different spaces per machine so let
;; this be defined whenever initialize the variable for use (if a
;; parent does this this is ignored) then fill it with whatever.  setq
;; is required so parents can set their own defaults if this file is
;; absent

;;; Code:

(defvar local-el-files-list '())
(setq local-el-files-list '())
(provide 'local)

;;; local.el ends here
