(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defvar my-packages '(better-defaults
		      projectile
                      auto-complete
		      paredit
                      popup
                      rainbow-delimiters
                      rainbow-mode
                      clojure-mode
		      cider
;;                      ac-nrepl
))
                      
(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/lib/noctilux-theme")
(load-theme 'noctilux t)

(require 'paredit)
(add-hook 'clojure-mode-hook 'paredit-mode)    ;enable paredit for clojure
(add-hook 'clojure-mode-hook 'subword-mode)    ;camel case working

;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

(require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; General Auto-Complete
(require 'auto-complete-config)
(setq ac-delay 0.0)
(setq ac-quick-help-delay 0.5)
(ac-config-default)

;; ac-nrepl (Auto-complete for the nREPL)
;;(require 'ac-nrepl)
;;(add-hook 'cider-mode-hook 'ac-nrepl-setup)
;;(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
;;(add-to-list 'ac-modes 'cider-mode)
;;(add-to-list 'ac-modes 'cider-repl-mode)

;; Poping-up contextual documentation
(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))

;; Show parenthesis mode
(show-paren-mode 1)

;; key bindings
(global-set-key [f8] 'other-frame)
(global-set-key [f7] 'paredit-mode)
(global-set-key [f9] 'cider-jack-in)
(global-set-key [f11] 'speedbar)
