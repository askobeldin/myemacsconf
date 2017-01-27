;; try to config common lisp system
;;
;;

(use-package lisp-mode
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))
    (add-to-list 'auto-mode-alist '("\\.lisp\\'" . lisp-mode)))
  :config
  (setq common-lisp-style-default "modern")
  (add-hook 'lisp-mode-hook 'electric-pair-mode)
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

(provide 'my-cl)

