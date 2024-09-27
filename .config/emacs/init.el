;;; init.el --- Init -*- no-byte-compile: t; lexical-binding: t; -*-
(server-start)

(setq custom-file (concat user-emacs-directory "custom.el"))

(when (file-exists-p custom-file)
  (load custom-file))

;; (toggle-frame-fullscreen)

(setq straight-repository-branch "master")
(setq straight-use-package-by-default t)
;; This fixes an issue I was having where a dependency loads
;; the built-in version of project, and another dependency
;; declares project as a dependency, which causes straight to
;; install and load both versions of project (the built-in and newest versions)
(setq straight-built-in-pseudo-packages '(project))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package doom-themes
  :straight t
  :config
  ;;   ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t ; if nil, italics is universally disabled
        doom-tokyo-night-brighter-comments t
        ;; doom-gruvbox-dark-variant "hard"
        ;; doom-ayu-dark-brighter-comments t
        ;; doom-ayu-dark-comment-bg nil
        )
  ;; (load-theme 'doom-acario-dark t)
  ;; (load-theme 'doom-tomorrow-night t)
  ;; (load-theme 'doom-molokai t)
  ;; (load-theme 'doom-snazzy t)
  ;; (load-theme 'doom-horizon t)
  ;; (load-theme 'doom-one t)
  ;; (load-theme 'doom-sourcerer t)
  ;; (load-theme 'doom-dark+ t)
  ;; (load-theme 'doom-gruvbox t)
  ;; (load-theme 'doom-ayu-dark t)
  (load-theme 'doom-tokyo-night t)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

;;   ;; Enable custom neotree theme (all-the-icons must be installed!)
;;   ;; (doom-themes-neotree-config)
;;   ;; or for treemacs users
;;   (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
;;   (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; This causes straight.el to download
;; and load the latest version of Org mode,
;; and use the newer version, instead of
;; Emacs' build in version
(use-package org
  :straight nil
  :config
  (progn
    (setq org-hide-emphasis-markers t)
    ;; Default directory for org files (not all are stored here).
    (setq org-directory "~/Nextcloud/Documents/Notes/Org")

    (setq org-log-done t
          org-return-follows-link t
          org-src-fontify-natively t   ;; Pretty code blocks
          org-src-tab-acts-natively t
          org-confirm-babel-evaluate nil
          org-list-allow-alphabetical t ;; Make lists using Roman alphabetical characters
          org-adapt-indentation t ;; Aligns text to headings by inserting tabs or spaces accordingly
          ))
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((shell . t)
                                 (python . t)
                                 (C . t)
                                 (ruby . t)
                                 (makefile . t)
                                 (sql . t)
                                 (sqlite . t))))

;; Load config.org for init.el configuration
(org-babel-load-file (concat user-emacs-directory "config.org"))

