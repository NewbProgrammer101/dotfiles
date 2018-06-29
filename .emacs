
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
;;(add-to-list 'load-path "~/.emacs.d/settings")
(server-start)
(load-library "mailcrypt")
(mc-setversion "gpg")
(setq read-mail-command 'rmail)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-list (quote (("fbpdf" ("0") "/usr/bin/fbpdf"))))
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(ede-project-directories (quote ("/home/dell00")))
 '(initial-major-mode (quote lisp-interaction-mode))
 '(initial-scratch-message
   ";; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with \\[find-file] and enter text in its buffer.
;; Lisp sucks!
")
 '(package-selected-packages (quote (mines cobol-mode ztree json-mode gnugo))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;(include-plugin "magit")
;;(require 'magit)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cd" 'zeal-at-point)
(setq explicit-shell-file-name "/bin/bash")
(setq shell-file-name "/bin/bash")
(setq TeX-view-program-selection "/usr/bin/fbpdf")
(setenv "SHELL" shell-file-name)
(global-set-key [f2] 'term)
(global-set-key [f3] 'org-mode)
(setq org-agenda-files (list "~/Documents/Personal/TODO.org"))
(global-set-key "\C-xc" 'close)
(setq make-backup-files nil)
(global-undo-tree-mode)
(require 'evil)
(evil-mode 1)
