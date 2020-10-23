;;; local.el -- Gerry Pipes' local load file list

;;; Commentary:
;; Area for local code to this machine

;;; Code:

(defvar local-el-files-list '())
(mapc (lambda (file) (load file)) local-el-files-list)
(provide 'local)

;;; local.el ends here
