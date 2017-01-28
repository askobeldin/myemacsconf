;; try to config common lisp system
;;
;;

;; (require 'rainbow-delimiters)
;; (require 'rainbow-blocks)

(use-package lisp-mode
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))
    (add-to-list 'auto-mode-alist '("\\.lisp\\'" . lisp-mode)))
  :config
  (setq common-lisp-style-default "modern")
  (add-hook 'lisp-mode-hook 'electric-pair-mode)
  ;; (add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
  ;; (add-hook 'lisp-mode-hook 'rainbow-blocks-mode)
  (add-hook 'lisp-mode-hook (lambda () (set-fill-column 100))))

(defun my-electric-lisp-comment ()
    "Autocomment things for lisp."
  (interactive)
  ;; we can get away with autocommenting on empty lines.
  ;; not so much on regular ones - that's more likely to be a mistake.
  (if (my-is-this-line-empty)
      (insert ";; ")
    (insert "; ")))

(after 'evil
  (evil-define-key 'insert lisp-mode-map (kbd "RET") 'electric-newline-and-maybe-indent)
  (evil-define-key 'insert lisp-mode-map ";" 'my-electric-lisp-comment))

;; Немного настроим выравнивание отступов под себя
;; Более подробно о кастомизации этого дела можно почитать
;; в сорцах SLIME, а именно
;; в %путь_к_slime%/contrib/slime-cl-indent.el
; (define-common-lisp-style "my-indent-style"
  ; "My custom indent style."
  ; (:inherit "modern")
  ; (:variables
	; (lisp-loop-indent-subclauses t))    
  ; (:indentation
	; (if (4 2 2))
	; (define (&lambda 2))
	; (with-gensyms ((&whole 4 &rest 1) &body))
	; (once-only (as with-gensyms))))

; (setq common-lisp-style-default "my-indent-style")
(provide 'my-cl)

