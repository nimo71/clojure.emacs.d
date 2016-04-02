(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(defvar my-packages '(better-defaults
		      projectile
		      paredit
                      rainbow-delimiters
                      clojure-mode
		      cider
                      magit))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/lib/noctilux-theme")
(load-theme 'noctilux t)

(add-hook 'clojure-mode-hook 'enable-paredit-mode) ;enable paredit for clojure
(add-hook 'clojure-mode-hook 'subword-mode)        ;camel case working
;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))
