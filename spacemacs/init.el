(setq inhibit-startup-message t)

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

;;company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;;window number
(window-numbering-mode 1)
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))

;;theme
(load-theme 'nova t)
(require 'all-the-icons)
(setq inhibit-compacting-font-caches t)

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))



;;style
(tool-bar-mode 0) 
(menu-bar-mode 0) 
(scroll-bar-mode 0) 
(setq inhibit-startup-message t)
(display-time-mode 1) 
(setq display-time-24hr-format t) ;;time
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(global-linum-mode t);行号
(setq column-number-mode t)

;;font
(set-face-attribute 'default nil :height 140)
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
(setq org-startup-indented t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2beaaef4f47f22c89948fdb3859799f8f2b64c1282ec21d71d6df49d68e68862" default)))
 '(package-selected-packages
   (quote
    (evil-magit magit company neotree window-numbering all-the-icons-ivy doom-modeline nova-theme counsel ivy which-key use-package undo-tree try))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
