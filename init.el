(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(defvar my-packages '(better-defaults
		      projectile
		      clojure-mode
		      cider))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))