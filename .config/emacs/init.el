;;; init.el --- Init -*- no-byte-compile: t; lexical-binding: t; -*-
(server-start)

(when (file-exists-p custom-file)
  (load custom-file))

(defvar elpaca-installer-version 0.12)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-sources-directory (expand-file-name "sources/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca-activate)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-sources-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

(elpaca compat)

;; Install use-package support
(elpaca elpaca-use-package
  ;; Enable use-package :ensure support for Elpaca.
  (elpaca-use-package-mode))

 (use-package doom-themes
   :ensure t
   :config
   ;;   ;; Global settings (defaults)
   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
         doom-themes-enable-italic t ; if nil, italics is universally disabled
         ;; doom-tokyo-night-brighter-comments t
         doom-gruvbox-dark-variant "hard"
         doom-gruvbox-brighter-comments t
         doom-manegarm-darker-background t
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
   ;; (load-theme 'doom-tokyo-night t)
   ;; (load-theme 'doom-manegarm t)
   (load-theme 'doom-pine t)
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
;; (use-package ef-themes
;;   :ensure t
;;   :custom ((ef-themes-mixed-fonts t)
;;            (ef-themes-variable-pitch-ui t))
;;   :config
;;   (load-theme 'ef-dark :no-confirm))

;; (use-package doric-themes
;;   :ensure t
;;   :demand t
;;   :config
;;   ;; These are the default values.
;;   (setq doric-themes-to-toggle '(doric-light doric-dark))
;;   (setq doric-themes-to-rotate doric-themes-collection)

;;   (doric-themes-select 'doric-dark)

;;   ;; ;; To load a random theme instead, use something like one of these:
;;   ;;
;;   ;; (doric-themes-load-random)
;;   ;; (doric-themes-load-random 'light)
;;   ;; (doric-themes-load-random 'dark)

;;   ;; ;; For optimal results, also define your preferred font family (or use my `fontaine' package):
;;   ;;
;;   ;; (set-face-attribute 'default nil :family "Aporetic Sans Mono" :height 160)
;;   ;; (set-face-attribute 'variable-pitch nil :family "Aporetic Sans" :height 1.0)
;;   ;; (set-face-attribute 'fixed-pitch nil :family "Aporetic Sans Mono" :height 1.0)

;;   :bind
;;   (("<f5>" . doric-themes-toggle)
;;    ("C-<f5>" . doric-themes-select)
;;    ("M-<f5>" . doric-themes-rotate)))

(use-package org
  :ensure nil
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
(let ((config-el (concat user-emacs-directory "config.el"))
      (config-org (concat user-emacs-directory "config.org")))
  (when (or (not (file-exists-p config-el))
            (file-newer-than-file-p config-org config-el))
    (require 'org)
    (org-babel-tangle-file config-org config-el))
  (load config-el nil 'nomessage))
;; (org-babel-load-file (concat user-emacs-directory "config.org"))

(put 'scroll-left 'disabled nil)
