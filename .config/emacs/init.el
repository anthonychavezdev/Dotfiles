;; Make emacs startup faster

(server-start)

(toggle-frame-fullscreen)

(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))

(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
        gc-cons-percentage 0.1))

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)


(setq straight-repository-branch "master")
(setq straight-use-package-by-default t)

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


;; Load theme
;; (use-package alect-themes
;;  :straight t
;;   :config
;;   (load-theme 'alect-black t))

(use-package modus-themes
  :straight t
  :init
  ;; Add all your customizations prior to loading the themes
(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs nil
      modus-themes-mixed-fonts t
      modus-themes-subtle-line-numbers t
      modus-themes-deuteranopia t
      modus-themes-tabs-accented t
      modus-themes-inhibit-reload t ; only applies to `customize-set-variable' and related

      modus-themes-fringes nil ; {nil,'subtle,'intense}

      ;; Options for `modus-themes-lang-checkers' are either nil (the
      ;; default), or a list of properties that may include any of those
      ;; symbols: `straight-underline', `text-also', `background',
      ;; `intense' OR `faint'.
      modus-themes-lang-checkers nil

      ;; Options for `modus-themes-mode-line' are either nil, or a list
      ;; that can combine any of `3d' OR `moody', `borderless',
      ;; `accented', `padded'.
      modus-themes-mode-line '(borderless accented)

      ;; Options for `modus-themes-syntax' are either nil (the default),
      ;; or a list of properties that may include any of those symbols:
      ;; `faint', `yellow-comments', `green-strings', `alt-syntax'
      modus-themes-syntax nil

      ;; Options for `modus-themes-hl-line' are either nil (the default),
      ;; or a list of properties that may include any of those symbols:
      ;; `accented', `underline', `intense'
      modus-themes-hl-line nil

      ;; Options for `modus-themes-paren-match' are either nil (the
      ;; default), or a list of properties that may include any of those
      ;; symbols: `bold', `intense', `underline'
      modus-themes-paren-match '(bold intense)

      ;; Options for `modus-themes-links' are either nil (the default),
      ;; or a list of properties that may include any of those symbols:
      ;; `neutral-underline' OR `no-underline', `faint' OR `no-color',
      ;; `bold', `italic', `background'
      modus-themes-links '(background)

      ;; Options for `modus-themes-prompts' are either nil (the
      ;; default), or a list of properties that may include any of those
      ;; symbols: `background', `bold', `gray', `intense', `italic'
      modus-themes-prompts nil
      ;; Options for `modus-themes-links' are either nil (the default),
      ;; or a list of properties that may include any of those symbols:
      ;; `neutral-underline' OR `no-underline', `faint' OR `no-color',
      ;; `bold', `italic', `background'
      modus-themes-links '(background)

      modus-themes-completions '((matches . (extrabold))
                                 (selection . (semibold accented))
                                 (popup . (accented intense)))

      modus-themes-mail-citations nil ; {nil,'faint,'monochrome}

      ;; Options for `modus-themes-region' are either nil (the default),
      ;; or a list of properties that may include any of those symbols:
      ;; `no-extend', `bg-only', `accented'
      modus-themes-region '(accented no-extend)

      ;; Options for `modus-themes-diffs': nil, 'desaturated,
      ;; 'bg-only, 'deuteranopia, 'fg-only-deuteranopia
      modus-themes-diffs 'fg-only-deuteranopia

      modus-themes-org-blocks nil ; {nil,'gray-background,'tinted-background}

      modus-themes-org-agenda ; this is an alist: read the manual or its doc string
      '((header-block . (variable-pitch scale-title))
        (header-date . (grayscale workaholic bold-today))
        (event . (accented scale-small))
        (scheduled . uniform)
        (habit . traffic-light-deuteranopia)))

  ;; Load the theme of your choice:
  (modus-themes-select 'modus-vivendi) ;; OR (modus-themes-load-vivendi)
  :config
  :bind ("<f5>" . modus-themes-toggle)
  )
(use-package ef-themes
  :straight (:host github :repo "protesilaos/ef-themes")
  :config
  ;; (load-theme 'ef-bio t)
  )

(use-package doom-themes
   :straight t
   :config
;;   ;; Global settings (defaults)
   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
         doom-themes-enable-italic t) ; if nil, italics is universally disabled
   ;; (load-theme 'doom-acario-dark t)
   ;; (load-theme 'doom-tomorrow-night t)
   ;; (load-theme 'doom-molokai t)
   ;; (load-theme 'doom-snazzy t)
   ;; (load-theme 'doom-horizon t)
   ;; (load-theme 'doom-one t)
   ;; (load-theme 'doom-sourcerer t)
   ;; (load-theme 'doom-dark+ t)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  ;; (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

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

(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ignored-local-variable-values '((vc-prepare-patches-separately))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
