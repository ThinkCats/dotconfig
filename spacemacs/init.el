(setq inhibit-startup-message t)
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin"))
(setq exec-path (append exec-path '("/usr/local/bin" "/Library/TeX/texbin")))

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
 	     '(("melpa" . "http://elpa.zilongshanren.com/melpa/")
 	       ("org-cn"   . "http://elpa.zilongshanren.com/org/")
                ("gnu-cn"   . "http://elpa.zilongshanren.com/gnu/")
 	     ))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(unless (package-installed-p 'undo-tree)
  (package-install 'undo-tree))
(unless (package-installed-p 'evil)
  (package-install 'evil))
(unless (package-installed-p 'ivy)
  (package-install 'ivy))
(unless (package-installed-p 'company)
  (package-install 'company))
(unless (package-installed-p 'window-numbering)
  (package-install 'window-numbering))
(unless (package-installed-p 'doom-themes)
  (package-install 'doom-themes))
(unless (package-installed-p 'doom-modeline)
  (package-install 'doom-modeline))
(unless (package-installed-p 'neotree)
  (package-install 'neotree))
(unless (package-installed-p 'projectile)
  (package-install 'projectile))
(unless (package-installed-p 'tide)
  (package-install 'tide))

(use-package try
	:ensure t)

(use-package which-key
	:ensure t
	:config
	(which-key-mode))

;;evil
(require 'undo-tree)
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

;;ivy
(ivy-mode 1)

;;projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)

;;company
(require 'company)
(global-company-mode)
(add-hook 'after-init-hook 'global-company-mode)

;;window number
(window-numbering-mode 1)
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))

(require 'doom-themes)

;;Theme
;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
;; Enable flashing mode-line on errors
;;(doom-themes-visual-bell-config)
;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;; or for treemacs users
(doom-themes-treemacs-config)
;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;;theme
(load-theme 'doom-nova t)
(require 'all-the-icons)
(setq inhibit-compacting-font-caches t)

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;;style
(if (display-graphic-p)
  (progn
    (tool-bar-mode 0)
    (scroll-bar-mode 0)
    (setq inhibit-startup-message t)
    (display-time-mode 1)
    (setq display-time-24hr-format t) ;;time
    )
  )
(menu-bar-mode 0)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(global-linum-mode t);行号
(setq linum-format "%3d ")
(setq column-number-mode t)
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;;font
(set-face-attribute 'default nil
		    :family "Hack"
		    :height 135)
(setq-default line-spacing 3)

;;mode line
(require 'doom-modeline)
(doom-modeline-init)

;;neo tree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq projectile-switch-project-action 'neotree-projectile-action)
(add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;;magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;;org
(setq org-html-validation-link nil)
(setq org-html-postamble nil)
(setq org-startup-indented t)
(setq org-startup-with-inline-images t)
(setq org-image-actual-width '(300))
(setq truncate-lines t)
(add-hook 'org-mode-hook 'toggle-truncate-lines)
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )

;; other
(show-paren-mode 1)
(electric-pair-mode 1)

;; clojure
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)
(setq cider-save-file-on-load t)
(setq cider-repl-pop-to-buffer-on-connect nil)

;; js
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))
;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
;; js mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-to-list 'interpreter-mode-alist '("node" . js-mode))
;;(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-hook 'js-mode-hook #'setup-tide-mode)
(add-hook 'js-mode-hook (lambda ()
                           (company-mode)))
;; ==============================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(package-selected-packages
   (quote
    (doom-themes window-numbering which-key web-beautify use-package try tern skewer-mode popup pfuture paredit org-bullets neotree js2-refactor inflections hydra htmlize ht evil-magit edn doom-modeline dash-functional counsel company cider all-the-icons-ivy ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
