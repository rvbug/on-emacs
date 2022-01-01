(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	'("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(use-package which-key
  :ensure t
  :config (which-key-mode))

;;all org mode package
(use-package org)
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
 
;;just to try a package without installing
(use package try
     :ensure t)

;;ido mode for completions
;;other options are help, ivy
(setq ido-enable-flex-matching t)
(setq ido-everwhere t)
(ido-mode 1)

(defalias 'list-buffer 'ibuffer-other-window)

;;company
(add-hook 'after-init-hook 'global-company-mode)

