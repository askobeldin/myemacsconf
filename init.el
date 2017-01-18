;;;; my config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;;

(add-to-list 'load-path (concat user-emacs-directory "config"))


(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
						 ("melpa-stable" . "http://stable.melpa.org/packages/")
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
(require 'my-evil)
(require 'my-ui)
(require 'my-leader-keys)
(require 'my-buffers)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(nil nil t)
 '(package-selected-packages
   (quote
    (key-chord use-package evil-visualstar evil-surround evil-nerd-commenter evil-matchit evil-leader))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
