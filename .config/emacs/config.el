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
;; Use spaces instead of tabs
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

(defun tab-line-close-tab (&optional e)
  "Close the selected tab.
If tab is presented in another window, close the tab by using
`bury-buffer` function.
If tab is uniq to all existing windows, kill the buffer with
`kill-buffer` function.
Lastly, if no tabs left in the window, it is deleted with
`delete-window` function."
  (interactive "e")
  (let* ((posnp (event-start e))
         (window (posn-window posnp))
         (buffer (get-pos-property 1 'tab (car (posn-string posnp)))))
    (with-selected-window window
      (let ((tab-list (tab-line-tabs-window-buffers))
            (buffer-list (flatten-list
                          (seq-reduce (lambda (list window)
                                        (select-window window t)
                                        (cons (tab-line-tabs-window-buffers) list))
                                      (window-list) nil))))
        (select-window window)
        (if (> (seq-count (lambda (b) (eq b buffer)) buffer-list) 1)
            (progn
              (if (eq buffer (current-buffer))
                  (bury-buffer)
                (set-window-prev-buffers window (assq-delete-all buffer (window-prev-buffers)))
                (set-window-next-buffers window (delq buffer (window-next-buffers))))
              (unless (cdr tab-list)
                (ignore-errors (delete-window window))))
          (and (kill-buffer buffer)
               (unless (cdr tab-list)
                 (ignore-errors (delete-window window)))))))
    (force-mode-line-update)))

(setq save-place-file "~/config/emacs/saveplace")
(save-place-mode 1)

(if (member "Fira Code"
(font-family-list))(add-to-list 'default-frame-alist
'(font . "Fira Code-12")))

(global-set-key (kbd "C-M-u") 'universal-argument)

(defun open-horizontal-terminal ()
"Opens a horizontal split with a terminal buffer and focuses on it"
    (interactive)
    (split-and-follow-horizontally)
    (term "/bin/zsh"))

(use-package org
    :straight t
    :config
    (add-hook 'org-mode-hook 'org-indent-mode)
    (add-hook 'org-mode-hook
              '(lambda ()
                (visual-line-mode 1)))
    (add-hook 'org-mode-hook 'org-bullets-mode)
    (add-hook 'org-mode-hook 'evil-org-mode)
    ;; I'm commenting out the
    ;; pretty org-mode features
    ;; because it makes opening
    ;; org files take too long
    ;; (add-hook 'org-mode-hook 'variable-pitch-mode)

    (setq org-hide-emphasis-markers t)

    ;; Default directory for org files (not all are stored here).
    (setq org-directory "~/Nextcloud/Documents/Notes/Org")

    (setq org-log-done t)

  ;; (let* ((variable-tuple
  ;;         (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
  ;;               ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
  ;;               ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
  ;;               ((x-list-fonts "Verdana")         '(:font "Verdana"))
  ;;               ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
  ;;               (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
  ;;        (base-font-color     (face-foreground 'default nil 'default))
  ;;        (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  ;;   (custom-theme-set-faces
  ;;    'user
  ;;    `(org-level-8 ((t (,@headline ,@variable-tuple))))
  ;;    `(org-level-7 ((t (,@headline ,@variable-tuple))))
  ;;    `(org-level-6 ((t (,@headline ,@variable-tuple))))
  ;;    `(org-level-5 ((t (,@headline ,@variable-tuple))))
  ;;    `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
  ;;    `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
  ;;    `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
  ;;    `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
  ;;    `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))

  ;;     '(org-block ((t (:inherit fixed-pitch))))
  ;;     '(org-code ((t (:inherit (shadow fixed-pitch)))))
  ;;     '(org-document-info ((t (:foreground "dark orange"))))
  ;;     '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
  ;;     '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
  ;;     '(org-link ((t (:foreground "royal blue" :underline t))))
  ;;     '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  ;;     '(org-property-value ((t (:inherit fixed-pitch))) t)
  ;;     '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  ;;     '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
  ;;     '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
  ;;     '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))

  ;;  '(variable-pitch ((t (:family "Source Code Pro" :height 180 :weight thin))))
  ;;  '(fixed-pitch ((t ( :family "Source Code Pro" :height 160))))))
)


  (use-package org-indent
    :straight nil
    :diminish org-indent-mode)

  (use-package htmlize
    :straight t)

(use-package org-bullets
  :straight t
  :hook ('org-mode-hook . (lambda () org-bullets-mode))
  :hook ('org-mode-hook 'variable-pitch-mode)
  :config
  (require 'org-bullets))

(use-package async
  :straight t
  :init
  (dired-async-mode 1))

(use-package powerline
  :straight t
  :config
   (powerline-default-theme))

(use-package all-the-icons
  :straight t
  :config
    ;; (all-the-icons-install-fonts)

)

(use-package key-chord
  :straight t
  :config
    (key-chord-mode 1))

(use-package ivy
  :straight t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
 (setq enable-recursive-minibuffers t))

(use-package ivy-posframe
  :straight t
  :config
  ;; Different command can use different display function.
  (setq ivy-posframe-display-functions-alist
      '((swiper          . ivy-posframe-display-at-point)
        (complete-symbol . ivy-posframe-display-at-point)
        (counsel-M-x     . ivy-posframe-display-at-window-bottom-left)
        (t               . ivy-posframe-display)))
(ivy-posframe-mode 1)
)

(use-package undo-tree
  :straight t
  :init
  (global-undo-tree-mode 1))

(use-package evil
  :straight t
  :init
  (setq evil-want-integration t) ;; This is true by default
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-undo-system 'undo-tree)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :straight t
  :config
  (evil-collection-init))

(use-package evil-leader
  :after (evil)
  :straight t
  :config
  (global-evil-leader-mode t)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "f s" 'swiper
    "f e" 'find-file
    "d w" 'delete-trailing-whitespace
    "b s" 'ivy-switch-buffer
    "b k" 'kill-this-buffer
    "b n" 'evil-buffer-new
    "w"   'evil-window-map
    "s"   'evil-write
    "T"   'open-horizontal-terminal
    "q"   'evil-quit
    "x"   'evil-save-and-quit
    "eb"  'eval-buffer
    "el"  'eval-last-sexp
    "er"  'eval-region
    "ef"  'eval-defun))

(use-package evil-surround
  :after (evil)
  :straight t
  :config
(global-evil-surround-mode 1))

(use-package evil-indent-textobject
    :straight t)

(use-package evil-quickscope
  :straight t
  :config
;;  (global-evil-quickscope-always-mode 1)
)

(use-package evil-commentary
  :straight t
  :config
  (evil-commentary-mode))

(use-package evil-org
  :straight t
  :after org
  :hook ('org-mode-hook . (lambda () evil-org-mode))
  :config
    (require 'evil-org-agenda)
    (evil-org-agenda-set-keys))

(use-package page-break-lines
  :straight t
  :diminish (page-break-lines-mode visual-line-mode))

(use-package projectile
 :straight t
 :after evil
 :config
   (projectile-mode +1)
   :bind
   (:map evil-normal-state-map
              ("<SPC> p" . projectile-command-map)))

(use-package treemacs
  :straight t
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
    :straight t)

  (use-package treemacs-icons-dired
    :after treemacs dired
    :straight t
    :config (treemacs-icons-dired-mode))

(use-package dashboard
  :straight t
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
  ;; (setq dashboard-init-info (format "%d packages loaded in %s"
  ;;                                   (length package-activated-list) (emacs-init-time)))
  (setq dashboard-set-footer t)
  (setq dashboard-set-navigator t))

(use-package swiper
  :straight t
  :bind ("C-s" . 'swiper))

(use-package magit
  :straight t)

(use-package format-all
  :straight t)

(use-package doom-modeline
  :straight t
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
(setq doom-modeline-minor-modes nil)
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

(use-package rainbow-mode
  :straight t)

(use-package rainbow-delimiters
  :straight t)

(use-package which-key
  :straight t
  :config
  (which-key-mode))

(use-package fira-code-mode
  :custom (fira-code-mode-disabled-ligatures '("[]" "#{" "#(" "#_" "#_(" "x")) ;; List of ligatures to turn off
  :hook prog-mode) ;; Enables fira-code-mode automatically for programming major modes

(use-package eldoc
  :straight nil
  :diminish eldoc-mode)

(use-package abbrev
  :straight nil
  :diminish abbrev-mode)

(use-package bug-hunter
  :straight t)

(use-package yasnippet
  :straight t
  :diminish yas
  :config
  (yas-global-mode 1)
)
;; Bundled snippets
(use-package yasnippet-snippets
  :straight t
  :config
  (yas-global-mode 1)
)

(use-package lua-mode
:straight t)

(use-package flycheck
 :straight t
 :init (global-flycheck-mode))
 (use-package flycheck-color-mode-line
  :straight t
  :config
  (eval-after-load "flycheck"
   '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)))
   (use-package pos-tip
    :straight t)
    (use-package flycheck-pos-tip
     :straight t
     :config
     (with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode)))

(use-package company
 :straight t
 :config
 (global-company-mode)
 ;; Evil Collection sets this variable to use TAB
 ;; to insert completion.
 ;; It doesn't seem to be working though.
 (setq evil-collection-company-use-tng nil))

(use-package lsp-mode
  :straight t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-l")
  :hook (c++-mode . lsp)
  :commands lsp)

;; optionally
(use-package lsp-ui
 :straight t
 :init
 (setq lsp-ui-sideline-show-diagnostics nil)
 :commands lsp-ui-mode)
;; if you are ivy user
(use-package lsp-ivy
 :straight t
 :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs
 :straight t
 :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;; (use-package dap-mode
;;  :straight t)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(use-package racket-mode
  :straight t)

(use-package go-mode
  :straight t)

;; EVIL keybinds
;; Exit insert mode by pressing j and then k quickly
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

  ;; Moves up and down without skipping wrapped lines.
  ;; It's equivalent to gj and gk in (Neo)vim
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
