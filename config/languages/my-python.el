;; my python config
;;

(setq python-indent-offset 4
      python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")

(setq py-electric-comment-p nil)
(setq py-max-help-buffer-p nil)
(setq py-electric-comment-add-space-p nil)
(setq py-tab-indent nil)
(setq py-smart-indentation t)
(setq py-return-key 'newline-and-indent)
(setq py-complete-function nil)
(setq py-empty-line-closes-p nil)
(evil-define-key 'insert python-mode-map (kbd "RET") 'newline-and-indent)


(elpy-enable)
(elpy-use-ipython)


; (after 'evil
    ; (evil-define-key 'normal python-mode-map (kbd "K") 'my-jump-to-python-docs))

; (after 'evil-leader
    ; (evil-leader/set-key-for-mode 'python-mode "." 'jedi:goto-definition))

(provide 'my-python)
