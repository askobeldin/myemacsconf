;; my-sly.el
;;

(require 'sly)
(require 'sly-autoloads)

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
          (setq common-lisp-hyperspec-root "file:///usr/share/doc/hyperspec/"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; testing
(if (my-system-is-windows)
    (progn
      (message "%s" "my-sly: system is windows.")))

(if (my-system-is-linux)
    (progn
      (message "%s" "my-sly: system is linux.")))
;; --------------------------------------------

; electric mode
(add-hook 'sly-mrepl-mode-hook 'electric-pair-mode)

(setq sly-net-coding-system 'utf-8-unix)

;; ?????
(setq sly-contribs '(sly-autodoc sly-fancy))
(setq inferior-lisp-program (executable-find "sbcl"))
(font-lock-mode 1)
; (sly-company-mode)
(rainbow-delimiters-mode)
;; ?????

(provide 'my-sly)
