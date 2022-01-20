
(defun es-presentacion-p (filename)
  (let* ((contents (org-file-contents filename)))
    (string-match-p "/common/footer.org" contents)))

(defun lista-de-orgs (directory)
  (directory-files-recursively directory ".*\.org$" ))


(defun lista-de-presentaciones ()
  (let* ( (all-orgs (lista-de-orgs))
           (presentations (seq-filter #'es-presentacion-p all-orgs)) )
    presentations))


(defun recrea-presentacion (orgfile)
  (dolist (orgfile (lista-de-orgs default-directory))
    (message "%s" orgfile)
    (save-window-excursion
      (find-file orgfile)
      (reveal-y-pdf)
      (kill-buffer orgfile))))



