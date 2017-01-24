;;;; my config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;;

(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "elisp"))
(add-to-list 'load-path (concat user-emacs-directory "config" "/languages"))

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))
						 
(require 'cl)

;; =================================================================
;; Packages list
(defvar required-packages
                '(evil
                  evil-leader
                  evil-nerd-commenter
                  evil-matchit
                  evil-surround
                  evil-visualstar
                  evil-paredit
                  neotree
                  faff-theme
				  ace-jump-buffer
				  slime
				  elisp-slime-nav

				  company
				  slime-company
				  ))

(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(require 'use-package)

(defun packages-installed-p ()
    "Packages availability checking."
    (interactive)
    (loop for package in required-packages
          unless (package-installed-p package)
            do (return nil)
          finally (return t)))

;; Auto-install packages
(unless (packages-installed-p)
    (message "%s" "Emacs is now refreshing it's package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    (dolist (package required-packages)
        (unless (package-installed-p package)
            (package-install package))))

;; =================================================================
;; requires
;;

(require 'my-init)
(require 'my-env)
(require 'my-core)
(require 'my-functions)
(require 'my-ui)
(require 'my-interaction)
(require 'my-buffers)
(require 'my-ag)
(require 'my-autocomplete)
(require 'my-dired)
(require 'my-neotree)
(require 'my-ido)
(require 'my-languages)
(require 'my-evil)
(require 'my-help)
(require 'my-eshell)
(require 'my-package-list)
(require 'my-bookmarks)
(require 'my-paredit)
(require 'my-ielm)
(require 'my-slime)


(require 'my-leader-keys)

(provide 'init)
