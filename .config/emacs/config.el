(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)

(show-paren-mode 1)

(setq inhibit-startup-message t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq x-select-enable-clipboard t)

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq scroll-conservatively 100)

(setq ring-bell-function 'ignore)

(setq-default tab-width 4)
(setq-default standard-indent 4)
(setq c-basic-offset tab-width)
(setq-default electric-indent-inhibit t)
(setq-default indent-tabs-mode nil)
(setq backward-delete-char-untabify-method 'nil)

(global-prettify-symbols-mode t)

(setq electric-pair-pairs '(
                            (?\{ . ?\})
                            (?\( . ?\))
                            (?\[ . ?\])
                            (?\" . ?\")
                            ))
(electric-pair-mode t)

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(defalias 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "s-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "s-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "s-C-<down>") 'shrink-window)
(global-set-key (kbd "s-C-<up>") 'enlarge-window)

(global-hl-line-mode t)

(use-package org
    :config
    (add-hook 'org-mode-hook 'org-indent-mode)
    (add-hook 'org-mode-hook
              '(lambda ()
                 (visual-line-mode 1)))
    (add-hook 'org-mode-hook 'org-bullets-mode)
    (add-hook 'org-mode-hook 'evil-org-mode))

  (use-package org-indent
    :diminish org-indent-mode)

  (use-package htmlize
    :ensure t)

(use-package org-bullets
  :ensure t
  :hook ('org-mode-hook . (lambda () org-bullets-mode))  
  :config
  (require 'org-bullets))

(use-package async
  :ensure t
  :init
  (dired-async-mode 1))

(use-package all-the-icons
  :ensure t
  :config
    ;; (all-the-icons-install-fonts)

)

(use-package powerline
  :ensure t
  :config
    (powerline-default-theme))

(use-package airline-themes
  :ensure t
  :config
    (load-theme 'airline-jet t))

(use-package key-chord
  :ensure t
  :config
    (key-chord-mode 1))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
 (setq enable-recursive-minibuffers t))

(use-package evil
    :ensure t
    :after (key-chord)
    :init
    (setq evil-want-integration t) ;; This is true by default
    (setq evil-want-keybinding nil)
    (setq evil-want-C-u-scroll t)
    :config
    (evil-mode 1))
;; EVIL keybinds
;; Exit insert mode by pressing j and then k quickly
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(setq key-chord-two-keys-delay 0.5)


  (use-package evil-collection
    :after evil
    :ensure t
    :config
    (evil-collection-init))

(use-package evil-leader
  :after (evil)
  :ensure t
  :config
  (global-evil-leader-mode t)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "s s" 'swiper
    "d w" 'delete-trailing-whitespace
    "f e" 'find-file
    "b" 'ivy-switch-buffer))

(use-package evil-surround
  :after (evil)
  :ensure t
  :config
(global-evil-surround-mode 1))

(use-package evil-indent-textobject
    :ensure t)

(use-package evil-quickscope
  :ensure t
  :config
;;  (global-evil-quickscope-always-mode 1)
)

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode))

(use-package evil-org
  :ensure t
  :after org
  :hook ('org-mode-hook . (lambda () evil-org-mode))
  :config
    (require 'evil-org-agenda)
    (evil-org-agenda-set-keys))

(use-package diminish
  :ensure t)

(use-package page-break-lines
  :ensure t
  :diminish (page-break-lines-mode visual-line-mode))

(use-package projectile
 :ensure t
 :after evil
 :config
   (projectile-mode +1)
   :bind
   (:map evil-normal-state-map
              ("<SPC> p" . projectile-command-map)))

(use-package treemacs
  :ensure t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if (executable-find "python3") 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-follow-delay             0.2
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-desc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         30)
    (treemacs-resize-icons 11)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
    :ensure t)

  (use-package treemacs-icons-dired
    :after treemacs dired
    :ensure t
    :config (treemacs-icons-dired-mode))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
      (setq dashboard-set-heading-icons t)
      (setq dashboard-set-file-icons t)
      (setq dashboard-projects-backend 'projectile)
      (setq dashboard-items '((projects . 5)
                              (recents . 5)
                              (bookmarks . 5)
                              (agenda . 5)))
  (setq dashboard-banner-logo-title "E M A C S - The worst text editor!")
  (setq dashboard-startup-banner "~/.config/emacs/emacs-logo.png")
  (setq dashboard-center-content t)
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-set-init-info t)
  (setq dashboard-init-info (format "%d packages loaded in %s"
                                    (length package-activated-list) (emacs-init-time)))
  (setq dashboard-set-footer t)
  (setq dashboard-set-navigator t))

(use-package swiper
  :ensure t
  :bind ("C-s" . 'swiper))

(use-package magit
  :ensure t)

(use-package smooth-scrolling
 :ensure t
 :config
   (smooth-scrolling-mode 1))

(use-package format-all
  :ensure t)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
;; How tall the mode-line should be. It's only respected in GUI.
;; If the actual char height is larger, it respects the actual height.
(setq doom-modeline-height 35)
;; How to detect the project root.
;; The default priority of detection is `ffip' > `projectile' > `project'.
;; nil means to use `default-directory'.
;; The project management packages have some issues on detecting project root.
;; e.g. `projectile' doesn't handle symlink folders well, while `project' is unable
;; to hanle sub-projects.
;; You can specify one if you encounter the issue.
(setq doom-modeline-project-detection 'projectile)
;; Whether display icons in the mode-line.
;; While using the server mode in GUI, should set the value explicitly.
(setq doom-modeline-icon (display-graphic-p))
;; Whether display icons in the mode-line.
;; While using the server mode in GUI, should set the value explicitly.
(setq doom-modeline-icon (display-graphic-p))
;; Whether display the colorful icon for `major-mode'.
;; It respects `all-the-icons-color-icons'.
(setq doom-modeline-major-mode-color-icon t)
;; Whether display the icon for the buffer state. It respects `doom-modeline-icon'.
(setq doom-modeline-buffer-state-icon t)
;; Whether display the modification icon for the buffer.
;; It respects `doom-modeline-icon' and `doom-modeline-buffer-state-icon'.
(setq doom-modeline-buffer-modification-icon t)
;; Whether to use unicode as a fallback (instead of ASCII) when not using icons.
(setq doom-modeline-unicode-fallback t)
;; Whether display the minor modes in the mode-line.
(setq doom-modeline-minor-modes t)
;; If non-nil, a word count will be added to the selection-info modeline segment.
(setq doom-modeline-enable-word-count t)
;; Major modes in which to display word count continuously.
;; Also applies to any derived modes. Respects `doom-modeline-enable-word-count'.
;; If it brings the sluggish issue, disable `doom-modeline-enable-word-count' or
;; remove the modes from `doom-modeline-continuous-word-count-modes'.
(setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))

;; Whether display the buffer encoding.
(setq doom-modeline-buffer-encoding t)

;; Whether display the indentation information.
(setq doom-modeline-indent-info nil)

;; If non-nil, only display one number for checker information if applicable.
(setq doom-modeline-checker-simple-format t)

;; The maximum number displayed for notifications.
(setq doom-modeline-number-limit 99)

;; The maximum displayed length of the branch name of version control.
(setq doom-modeline-vcs-max-length 12)

;; Whether display the workspace name. Non-nil to display in the mode-line.
(setq doom-modeline-workspace-name t)

;; Whether display the perspective name. Non-nil to display in the mode-line.
(setq doom-modeline-persp-name t)

;; If non nil the default perspective name is displayed in the mode-line.
(setq doom-modeline-display-default-persp-name nil)

;; If non nil the perspective name is displayed alongside a folder icon.
(setq doom-modeline-persp-icon t)

;; Whether display the `lsp' state. Non-nil to display in the mode-line.
(setq doom-modeline-lsp t)

;; Whether display the GitHub notifications. It requires `ghub' package.
(setq doom-modeline-github nil)

;; The interval of checking GitHub.
(setq doom-modeline-github-interval (* 30 60))

;; Whether display the modal state icon.
;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
(setq doom-modeline-modal-icon t)

;; Whether display the mu4e notifications. It requires `mu4e-alert' package.
(setq doom-modeline-mu4e nil)

;; Whether display the gnus notifications.
(setq doom-modeline-gnus t)

;; Wheter gnus should automatically be updated and how often (set to 0 or smaller than 0 to disable)
(setq doom-modeline-gnus-timer 2)

;; Wheter groups should be excludede when gnus automatically being updated.
(setq doom-modeline-gnus-excluded-groups '("dummy.group"))

;; Whether display the IRC notifications. It requires `circe' or `erc' package.
(setq doom-modeline-irc t)

;; Function to stylize the irc buffer names.
(setq doom-modeline-irc-stylize 'identity)

;; Whether display the environment version.
(setq doom-modeline-env-version t)
;; Or for individual languages
(setq doom-modeline-env-enable-python t)
(setq doom-modeline-env-enable-ruby t)
(setq doom-modeline-env-enable-perl t)
(setq doom-modeline-env-enable-go t)
(setq doom-modeline-env-enable-elixir t)
(setq doom-modeline-env-enable-rust t)

;; Change the executables to use for the language version string
(setq doom-modeline-env-python-executable "python") ; or `python-shell-interpreter'
(setq doom-modeline-env-ruby-executable "ruby")
(setq doom-modeline-env-perl-executable "perl")
(setq doom-modeline-env-go-executable "go")
(setq doom-modeline-env-elixir-executable "iex")
(setq doom-modeline-env-rust-executable "rustc")

;; What to dispaly as the version while a new one is being loaded
(setq doom-modeline-env-load-string "...")

;; Hooks that run before/after the modeline version string is updated
(setq doom-modeline-before-update-env-hook nil)
(setq doom-modeline-after-update-env-hook nil)
)

(use-package eldoc
  :diminish eldoc-mode)

(use-package abbrev
  :diminish abbrev-mode)

(use-package bug-hunter
  :ensure t)

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
)
;; Bundled snippets
(use-package yasnippet-snippets
  :ensure t
  :config
  (yas-global-mode 1)
)

(use-package lua-mode
:ensure t)

(use-package flycheck
 :ensure t
 :init (global-flycheck-mode))

(use-package company
 :ensure t
 :config
 (global-company-mode))

(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-l")
  :hook (c++-mode . lsp)
  :commands lsp)

;; optionally
(use-package lsp-ui
 :ensure t
 :commands lsp-ui-mode)
;; if you are ivy user
(use-package lsp-ivy
 :ensure t
 :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs
 :ensure t
 :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;; (use-package dap-mode
;;  :ensure t)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language
