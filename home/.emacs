
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)
(add-to-list 'load-path "~/.emacs.d/settings")
(server-start)
(setq read-mail-command 'rmail)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(compilation-scroll-output t)
 '(custom-enabled-themes (quote (afternoon)))
 '(custom-safe-themes
   (quote
    ("a23f169b7909feaa53a0e7c08041aae663ef074fd1618103c09bf022a2ec1ee4" "9cb2ce95b651ec5cad605bcd097366d72731e9e096943e7a04cba860eb898dff" "4da1e6c2c0b84e9805805e1226a9f5bdd86b0201ea7f150e33ead5249a85d066" "38908037082b9fc2e6762961026299d026963e57c726c3bc0b9e66cd0def0926" "d9aaff4db65a545989c0976c759a44a16439cac7717f4e58cc01efc771d90449" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "3edbdd0ad45cb8f7c2575c0ad8f6625540283c6e928713c328b0bacf4cfbb60f" "e269026ce4bbd5b236e1c2e27b0ca1b37f3d8a97f8a5a66c4da0c647826a6664" default)))
 '(ediff-split-window-function (quote split-window-horizontally))
;; '(erc-autojoin-channels-alist
;;   (quote
;;    (("freenode.net" "#NetHack" "##linux" "##programming" "#boardgames" "#roguelikes" "##roguelikedev" "##dcss-discord" "##nethack-discord"))))
 '(erc-nick "dell00")
 '(erc-user-full-name "Jalus Bilieyich")
 '(gdb-many-windows t)
 '(inhibit-startup-screen t)
 '(large-file-warning-threshold nil)
 '(make-backup-files nil)
 '(mouse-wheel-progressive-speed nil)
 '(package-selected-packages
   (quote
    (irony i3wm helm-youtube glsl-mode git gist fortune-cookie flymake-yaml flymd flymake-cppcheck flycheck-yamllint flycheck flappymacs fireplace exotica-theme eproject epresent empos emojify-logos emojify emacs-setup el2markdown eide ebib ducpel dmenu weechat x-dict yaml-mode dark-souls dakrone-theme dad-joke cycle-themes control-mode company-lua company-c-headers company-bibtex company-auctex company cmd-to-echo cmake-font-lock cmake-project chess cmake-ide cmake-mode cloc charmap cd-compile build-status buffer-utils biblio bibtex-utils auto-complete async anaconda-mode afternoon-theme)))
 '(revert-without-query (quote (".*")))
 '(scroll-bar-mode (quote right))
 '(scroll-conservatively 1)
 '(scroll-preserve-screen-position t)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(tags-case-fold-search nil)
 '(tags-revert-without-query t)
 '(which-function-mode t)
 '(window-divider-default-places (quote right-only)))
 '(TeX-view-program-list (quote (("fbpdf" ("0") "/usr/bin/fbpdf"))))
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(ede-project-directories (quote ("/home/dell00")))
 '(package-selected-packages (quote (mines cobol-mode ztree json-mode gnugo)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-to-list 'package-archives
    '("melpa" . "http://melpa.milkbox.net/packages/")
    '("marmalade" ." http://marmalade-repo.org/packages/"))

(setq inhibit-splash-screen t
      initial-scratch-message nil)

(defalias 'yes-or-no-p 'y-or-n-p)
(setq flyspell-issue-welcome-flag nil)
(setq-default ispell-program-name "/usr/bin/aspell")
(setq-default ispell-list-command "list")
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cd" 'zeal-at-point)
(require 'yaml-mode)
(require 'tex)
(require 'org-mode)
(setq org-mode 1)
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
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(TeX-PDF-mode t)
(setq-default tab-width 4)
(progn
  (setq-default indent-tabs-mode nil))
(require 'erc)
(erc :server "irc.freenode.net" :port 6667 :nick "NewbProgrammer10")
(require 'erc-services)
(setq erc-prompt-for-nickserv-password nil)
(setq erc-nickserv-passwords
      '((freenode     (("NewbProgrammer10" . "jayd3nismybf")
                       ("NewbProgrammer10_" . "jayd3nismybf")))))
(setq erc-autojoin-channels-alist
     '(("freenode.net" "#qub3d" "#qub3d-offtopic" "##linux")))

(progn
  ;; make buffer switch command do suggestions, also for find-file command
  (require 'ido)
  (ido-mode 1)

  ;; show choices vertically
  (if (version< emacs-version "25")
      (progn
        (make-local-variable 'ido-separator)
        (setq ido-separator "\n"))
    (progn
      (make-local-variable 'ido-decorations)
      (setf (nth 2 ido-decorations) "\n")))

  ;; show any name that has the chars you typed
  (setq ido-enable-flex-matching t)
  ;; use current pane for newly opened file
  (setq ido-default-file-method 'selected-window)
  ;; use current pane for newly switched buffer
  (setq ido-default-buffer-method 'selected-window)
  ;; stop ido from suggesting when naming new file
  (define-key (cdr ido-minor-mode-map-entry) [remap write-file] nil))
(global-set-key [f4] 'ido-switch-buffer)
(setq erc-hide-list '("JOIN" "PART" "QUIT"))
(setq initial-major-mode 'c++-mode)
