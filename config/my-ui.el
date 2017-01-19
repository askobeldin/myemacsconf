;; my-ui.el
;; user interface
;;
;; 

;; Disable GUI components
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(tooltip-mode      -1)
; (menu-bar-mode     -1)
; (blink-cursor-mode -1)
(blink-cursor-mode t)
(setq use-dialog-box     nil)
(setq redisplay-dont-pause t)

;; Syntax highlighting
(require 'font-lock)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

; (global-hl-line-mode t)                     ; global Highlight current textline

;; Window size. Set font
(add-to-list 'default-frame-alist '(width . 100))
(add-to-list 'default-frame-alist '(height . 70))
(when (member "DejaVu Sans Mono" (font-family-list))
    (set-frame-font "DejaVu Sans Mono-10:antialias=natural" nil t))

;; maximize main window when emacs starts
; (add-to-list 'default-frame-alist
             ; '(fullscreen . maximized))


; Reconfigure highlight line's color
; (set-face-background 'hl-line "#dcdcdc")
(set-face-foreground 'highlight nil)

;; Hide startup messages
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

;; Ediff with horizontal splits.
(setq ediff-split-window-function 'split-window-horizontally)

;; Scrolling
(setq scroll-conservatively 9999
      scroll-preserve-screen-position t
      scroll-step 1
      scroll-margin 2)

;; Let me write `y` or `n` even for important stuff that would normally require
;; me to fully type `yes` or `no`.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Flash the frame to represent a bell.
(setq visible-bell t)

;; nevermind that's annoying
(setq ring-bell-function 'ignore)

;; Это настраивает подсветку парных скобок
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)

;; Electric-mode
(electric-pair-mode   -1)
(electric-indent-mode -1)

;; break long lines at word boundaries
(visual-line-mode 1)

;; number columns in the status bar
(column-number-mode)

;; Fringe 
(set-fringe-style '(8 . 0))
; (setq-default indicate-empty-lines t)
; (setq-default indicate-buffer-boundaries 'left)

;; don't put intitial text in scratch buffer
(setq initial-scratch-message nil)

;; Global clipboard
(setq x-select-enable-clipboard t)

;; Highlight search results
(setq search-highlight t
      query-replace-highlight t)

;; =================================================================
;; Cursor for evil mode
;; =================================================================

;; cursor: red
;;
;; (setq evil-emacs-state-cursor   '("#cd0000" hollow))
;; (setq evil-normal-state-cursor  '("#cd0000" box))
;; (setq evil-insert-state-cursor  '("#cd0000" (hbar . 3)))
;; (setq evil-replace-state-cursor '("#cd0000" box))

;; theme: classic
; (setq evil-emacs-state-cursor   '("#ffff00" hollow))
; (setq evil-normal-state-cursor  '("#ffff00" box))
; (setq evil-insert-state-cursor  '("#ffff00" (hbar . 3)))
; (setq evil-replace-state-cursor '("#ffff00" box))

;; theme: gnome2
; (setq evil-emacs-state-cursor   '("#ffff00" hollow))
; (setq evil-normal-state-cursor  '("#ffff00" box))
; (setq evil-insert-state-cursor  '("#ffff00" (hbar . 3)))
; (setq evil-replace-state-cursor '("#ffff00" box))
;



;; cursor
(setq evil-emacs-state-cursor   '("#00008b" hollow))
(setq evil-normal-state-cursor  '("#00008b" box))
(setq evil-insert-state-cursor  '("#00008b" (hbar . 3)))
(setq evil-replace-state-cursor '("#008b8b" box))


;; theme
(load-theme 'faff t)


;; ===========================================================
;; Evil mode
(require 'evil)
(evil-mode 1)


(provide 'my-ui)
