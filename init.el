(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq inhibit-startup-message t)
(setq gdb-many-windows 1)
(global-linum-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq cursor-type 'bar)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(wgrep orderless magit embark-consult embark marginalia consult vertico popon yasnippet markdown-mode posframe))
 '(tool-bar-mode nil))
(vertico-mode t)
(marginalia-mode t)
(setq wgrep-auto-save-buffer t)
(setq completion-styles '(orderless))
(eval-after-load 'consult
  '(eval-after-load 'embark
     '(progn
	(require 'embark-consult)
	(add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t
	     (:inherit nil :stipple nil :background "White"
		       :foreground "Black" :inverse-video nil :box nil :strike-through nil
		       :extend nil :overline nil :underline nil :slant normal :weight normal
		       :height 180 :width normal :foundry "nil"
		       :family "Menlo")))))

(add-to-list 'load-path "~/.emacs.d/lisp/lsp-bridge")
(add-to-list 'load-path "~/.emacs.d/lisp/acm-terminal")
(add-to-list 'load-path "~/.emacs.d/lisp/blink-search")
(add-to-list 'load-path "~/.emacs.d/lisp/sort-tab")
(add-to-list 'load-path "~/.emacs.d/lisp/color-rg")
(add-to-list 'load-path "~/.emacs.d/lisp/exec-path-from-shell")
(add-to-list 'load-path "~/.emacs.d/lisp/duplicate-line")
(add-to-list 'load-path "~/.emacs.d/lisp/awesome-tab")
(add-to-list 'load-path "~/.emacs.d/lisp/awesome-tray")
(add-to-list 'load-path "~/.emacs.d/lisp/all-the-icons.el")



(require 'yasnippet)
(yas-global-mode 1)
(require 'lsp-bridge)
(global-lsp-bridge-mode)
(setq acm-enable-icon 1)
(unless (display-graphic-p)
  (with-eval-after-load 'acm
    (require 'acm-terminal)))

(require 'blink-search)
;; (setq blink-search-enable-posframe t)
(global-set-key (kbd "s-b") 'lsp-bridge-find-def)

;; (require 'sort-tab)
;; (sort-tab-mode 1)
(require 'exec-path-from-shell)
(require 'color-rg)
(require 'duplicate-line)
(require 'awesome-tray)
(require 'awesome-tab)
(require 'all-the-icons)

(awesome-tab-mode 1)
(awesome-tray-mode 1)

(global-set-key (kbd "s-d") 'duplicate-line-or-region-below)

(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "s-f") 'consult-line)

(add-to-list 'load-path "~/.emacs.d/lisp/projectile")
(require 'projectile)
(projectile-mode 1)
