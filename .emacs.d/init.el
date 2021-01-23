;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;; (package-refresh-contents)
;; Download Evil if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; Core setup

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
;; Highlight current line.
(global-hl-line-mode t)
;; Show matching "(" or "{"
(show-paren-mode 1)

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; tabs
(setq standard-indent 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; FONTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set the fall-back font
;; this is critical for displaying various unicode symbols,
;; such as those used in my
;; init-org.el settings
;; http://endlessparentheses.com/manually-choose-a-fallback-font-for-unicode.html
(set-fontset-font "fontset-default" nil
   (font-spec :size 20 :name "Symbola"))

;; Setting English Font
(set-face-attribute
 'default nil :stipple nil :height 130 :width 'normal
 :inverse-video nil :box nil :strike-through nil :overline nil
 :underline nil :slant 'normal :weight 'normal :foundry "outline"
 :family "DejaVu Sans Mono for Powerline")
;; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(setq utf-translate-cjk-mode nil)

(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)

;; set the default encoding system
(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp buffer-file-coding-system)
    (setq buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; PACKAGES

(use-package alect-themes
  :ensure t
  :config
(load-theme 'alect-black t t)
(enable-theme 'alect-black))
(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1))

(use-package powerline
  :ensure t
  :config
    (powerline-default-theme))
;; Key-chord lets you bind commands to combinations of key-strokes.
;; Here a “key chord” means two keys pressed simultaneously,
;; or a single key quickly pressed twice. (*)
(use-package key-chord
  :ensure t
  :config
    (key-chord-mode 1))

;; EVIL
;; Vim within emacs
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already
                                 ;; set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode t)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
      "s s" 'swiper
      "d w" 'delete-trailing-whitespace
      "f e" 'find-file
      "b" 'ivy-switch-buffer)

    (use-package all-the-icons
    :ensure t
    :config
    ;; (all-the-icons-install-fonts)
    (use-package page-break-lines
        :ensure t
        :config
        (global-page-break-lines-mode)
        (use-package projectile
        :ensure t
        :config
        (projectile-mode +1)
        :bind
        (:map evil-normal-state-map
                ("<SPC> p" . projectile-command-map)))
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
                                (agenda . 5))))))

    (use-package centaur-tabs
    :ensure t
    :demand
    :config
    (centaur-tabs-mode t)
    (centaur-tabs-headline-match)
    (setq centaur-tabs-style "slant")
    (setq centaur-tabs-set-icons t)
    (setq centaur-tabs-gray-out-icons 'buffer)
    (setq centaur-tabs-set-bar 'left)
    :bind
    (:map evil-normal-state-map
            ("g t" . centaur-tabs-forward)
            ("g T" . centaur-tabs-backward))))

    (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode 1))

    (use-package evil-indent-textobject
        :ensure t)

    (use-package evil-quickscope
      :ensure t
      :config
      (global-evil-quickscope-always-mode 1))
    ;; Vim keybinds for org-mode
    (use-package evil-org
    :ensure t
    :after org
    :hook (org-mode . (lambda () evil-org-mode))
    :config
    (require 'evil-org-agenda)
    (evil-org-agenda-set-keys))

    ;; Org Mode
    ;; use org-bullets-mode for utf8 symbols as org bullets
    (use-package org-bullets
    :ensure t
    :config
    ;; make available "org-bullet-face"
    ;; such that I can control the font size individually
        (setq org-bullets-face-name (quote org-bullet-face))
        (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
        (setq org-bullets-bullet-list '("○" "☉" "◎" "◉" "○" "◌" "◎" "●"
                        "◦" "◯" "⚪" "⚫" "⚬" "❍" "￮" "⊙"
                        "⊚" "⊛" "∙" "∘"))

        ;; org ellipsis options, other than the default Go to Node...
        ;; not supported in common font, but supported in Symbola
        ;; (my fall-back font) ⬎, ⤷, ⤵
        (setq org-ellipsis " ▼"))

    ;; This is a collection of Evil bindings for the parts of
    ;; Emacs that Evil does not cover properly by default,
    ;; such as help-mode, M-x calendar, Eshell and more.
    (use-package evil-collection
    :after evil
    :ensure t
    :config
    (evil-collection-init)))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
(setq search-default-mode #'char-fold-to-regexp))

;; Themes for the bottom bar that are compatible with evil
(use-package airline-themes
  :ensure t
  :config
    (load-theme 'airline-jet t))
;; EVIL keybinds
;; Exit insert mode by pressing j and then k quickly
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(setq key-chord-two-keys-delay 0.5)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lua-mode all-the-icons php-mode evil-quickscope smooth-scrolling swiper ivy evil-org-agenda use-package powerline-evil org-bullets key-chord evil-org evil-collection ample-theme airline-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
