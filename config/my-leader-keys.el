;; my-leader-keys.el
;; <leader> keybindings for evil-leader
;;


(evil-leader/set-key
        "qq"         'kill-this-buffer
        "qw"         'evil-window-delete
        "Q"          'kill-buffer-and-window
        ">"          'find-file-at-point
        "\\"         'split-window-horizontally
        "-"          'split-window-vertically
        "w"          'save-buffer
        ","          'other-window
        "#"          'linum-mode
        "x"          'smex
        ;; evil-nerd-commenter config
        "cc"         'evilnc-comment-or-uncomment-lines
        ;; dired
        "d"          'dired
        ;; buffers
        "TAB"        'my-hop-around-buffers
        "b"          'ibuffer
        "B"          'switch-to-buffer
        "jb"         'ace-jump-buffer
)

; (evil-leader/set-key-for-mode 'git-commit-mode "qq" 'git-commit-abort)
; (evil-leader/set-key-for-mode 'emacs-lisp-mode "." 'elisp-slime-nav-find-elisp-thing-at-point)

(provide 'my-leader-keys)
