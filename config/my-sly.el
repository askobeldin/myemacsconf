;; my-sly.el
;;
;;

(require 'sly)
(require 'sly-autoloads)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; using slime-company package
;
; (slime-setup '(slime-repl 
               ; slime-fuzzy
               ; slime-fancy 
               ; slime-asdf 
               ; slime-indentation
               ; slime-company))





;; Это включает алгоритмы выравнивания лиспового кода из SLIME,
;; в противоположность стандартным из Emacs
; (setq lisp-indent-function 'common-lisp-indent-function)


;; may be it is not so elegant?
;;
(if (or 
     (file-exists-p unix-sbcl-bin) 
     (file-exists-p windows-sbcl-bin))
    (if (my-system-is-windows)
        (progn
          (setq inferior-lisp-program windows-sbcl-bin)
          (setq common-lisp-hyperspec-root "file:///c:/myinfo/HyperSpec/"))
        (progn
          (setq inferior-lisp-program unix-sbcl-bin)
          (setq common-lisp-hyperspec-root "file:///usr/share/doc/hyperspec/"))
    (message "%s" "SBCL not found...")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; testing
(if (my-system-is-windows)
    (progn
      (message "%s" "my-sly: system is windows.")))

(if (my-system-is-linux)
    (progn
      (message "%s" "my-sly: system is linux.")))
;; --------------------------------------------


(add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))

; electric mode
(add-hook 'sly-mrepl-mode-hook 'electric-pair-mode)

(setq sly-net-coding-system 'utf-8-unix)


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

(provide 'my-sly)
