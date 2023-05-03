(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq inhibit-startup-message t)
(setq gdb-many-windows 1)
(global-linum-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq cursor-type 'bar)

(require 'cl-lib)

(defun add-subdirs-to-load-path (search-dir)
  (interactive)
  (let* ((dir (file-name-as-directory search-dir)))
    (dolist (subdir
             
             (cl-remove-if
              #'(lambda (subdir)
                  (or
                   
                   (not (file-directory-p (concat dir subdir)))
                   
                   (member subdir '("." ".." 
                                    "dist" "node_modules" "__pycache__" 
                                    "RCS" "CVS" "rcs" "cvs" ".git" ".github")))) 
              (directory-files dir)))
      (let ((subdir-path (concat dir (file-name-as-directory subdir))))
        (when (cl-some #'(lambda (subdir-file)
                           (and (file-regular-p (concat subdir-path subdir-file))
                                ;; .so .dll 文件指非 Elisp 语言编写的 Emacs 动态库
                                (member (file-name-extension subdir-file) '("el" "so" "dll"))))
                       (directory-files subdir-path))
          
          (add-to-list 'load-path subdir-path t))

        (add-subdirs-to-load-path subdir-path)))))

(add-subdirs-to-load-path "~/.emacs.d/lisp")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(package-selected-packages
 ;  '(wgrep orderless magit embark-consult embark marginalia consult vertico popon yasnippet markdown-mode posframe))
 '(tool-bar-mode nil))
(require 'orderless)
(require 'consult)
(require 'vertico)
(require 'marginalia)
(require 'embark)
(require 'yasnippet)
(require 'posframe)

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

(require 'projectile)
(projectile-mode 1)

(require 'bazel)
(setq bazel-buildifier-before-save t)

(require 'cmake-mode)

(global-set-key (kbd "C-<tab>") 'awesome-tab-forward-tab)

(require 'vertico-posframe)
(vertico-posframe-mode 1)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(require 'find-file-in-project)

;;; brew install enchant
;;; echo "*:AppleSpell" >> ~/.config/enchant/enchant.ordering
(require 'jinx)
(add-hook 'emacs-startup-hook #'global-jinx-mode)

(require 'all-the-icons-dired)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(require 'all-the-icons-completion)
(all-the-icons-completion-mode)
(add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup)
