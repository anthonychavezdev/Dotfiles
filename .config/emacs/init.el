;; Make emacs startup faster

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
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

;; Load theme
;; (use-package alect-themes
;   :straight t
;;   :config
;;   (load-theme 'alect-black t))
 (use-package doom-themes
   :straight t
   :config
;;   ;; Global settings (defaults)
   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
         doom-themes-enable-italic t) ; if nil, italics is universally disabled
     (load-theme 'doom-acario-dark t)
  ;;  (load-theme 'doom-molokai t)
   ;; (load-theme 'doom-snazzy t)
   ;; (load-theme 'doom-horizon t)

  ;; Enable flashing mode-line on errors
  ;; (doom-themes-visual-bell-config)
  
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
  :straight t
  :config
  (progn
  (setq org-hide-emphasis-markers t)
  ;; Default directory for org files (not all are stored here).
  (setq org-directory "~/Nextcloud/Documents/Notes/Org")

  (setq org-log-done t)
  (setq org-return-follows-link t)
  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook
            '(lambda ()
              (visual-line-mode 1)))
  (add-hook 'org-mode-hook 'org-bullets-mode)))

;; Load config.org for init.el configuration
(org-babel-load-file (expand-file-name "~/.config/emacs/config.org"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("9687f29504a36c0b6b46cf654117f2f2ab3e73b909476ccb14cdde2bf990fa3e" "52498cb107fb252e92ac35b8a5eba466fede7f03bebcf50412190c452ed7329e" "e6a2832325900ae153fd88db2111afac2e20e85278368f76f36da1f4d5a8151e" "1a52e224f2e09af1084db19333eb817c23bceab5e742bf93caacbfea5de6b4f6" "6c386d159853b0ee6695b45e64f598ed45bd67c47f671f69100817d7db64724d" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "77113617a0642d74767295c4408e17da3bfd9aa80aaa2b4eeb34680f6172d71a" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "0fe24de6d37ea5a7724c56f0bb01efcbb3fe999a6e461ec1392f3c3b105cc5ac" "5b809c3eae60da2af8a8cfba4e9e04b4d608cb49584cb5998f6e4a1c87c057c4" "fce3524887a0994f8b9b047aef9cc4cc017c5a93a5fb1f84d300391fba313743" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "c086fe46209696a2d01752c0216ed72fd6faeabaaaa40db9fc1518abebaf700d" "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "01cf34eca93938925143f402c2e6141f03abb341f27d1c2dba3d50af9357ce70" "5036346b7b232c57f76e8fb72a9c0558174f87760113546d3a9838130f1cdb74" "d6603a129c32b716b3d3541fc0b6bfe83d0e07f1954ee64517aa62c9405a3441" "6c9cbcdfd0e373dc30197c5059f79c25c07035ff5d0cc42aa045614d3919dab4" "3df5335c36b40e417fec0392532c1b82b79114a05d5ade62cfe3de63a59bc5c6" "0a41da554c41c9169bdaba5745468608706c9046231bbbc0d155af1a12f32271" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "2c49d6ac8c0bf19648c9d2eabec9b246d46cb94d83713eaae4f26b49a8183fc4" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" default))
 '(package-selected-packages
   '(rainbow-delimiters rainbow-delimeters which-key format-all bug-hunter use-package treemacs-icons-dired treemacs-evil swiper projectile php-mode org-bullets magit lua-mode key-chord htmlize evil-surround evil-quickscope evil-org evil-leader evil-indent-textobject evil-collection elscreen dashboard centaur-tabs async ample-theme all-the-icons alect-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
