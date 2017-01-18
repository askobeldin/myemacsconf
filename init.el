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

	faff-theme
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
 '(ansi-color-names-vector
   ["#ecf0f1" "#e74c3c" "#2ecc71" "#f1c40f" "#2492db" "#9b59b6" "#1abc9c" "#2c3e50"])
 '(custom-safe-themes
   (quote
    ("3a69621a68c2d3550a4c777ffc000e1ea66f5bc2f61112814c591e1bda3f5704" "12b7ed9b0e990f6d41827c343467d2a6c464094cbcc6d0844df32837b50655f9" "4d80487632a0a5a72737a7fc690f1f30266668211b17ba836602a8da890c2118" "15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" "4bf9b00abab609ecc2a405aa25cc5e1fb5829102cf13f05af6a7831d968c59de" default)))
 '(fci-rule-color "#f1c40f")
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(nil nil t)
 '(package-selected-packages
   (quote
    (key-chord use-package evil-visualstar evil-surround evil-nerd-commenter evil-matchit evil-leader)))
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(vc-annotate-background "#ecf0f1")
 '(vc-annotate-color-map
   (quote
    ((30 . "#e74c3c")
     (60 . "#c0392b")
     (90 . "#e67e22")
     (120 . "#d35400")
     (150 . "#f1c40f")
     (180 . "#d98c10")
     (210 . "#2ecc71")
     (240 . "#27ae60")
     (270 . "#1abc9c")
     (300 . "#16a085")
     (330 . "#2492db")
     (360 . "#0a74b9"))))
 '(vc-annotate-very-old-color "#0a74b9"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
