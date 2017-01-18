;; my-leader-keys.el
;; <leader> keybindings for evil-leader
;;
;; last change: 02 авг 2015 16:13:28


(evil-leader/set-key
		  "qq"         'kill-this-buffer
		  "qw"         'evil-window-delete
		  "Q"          'kill-buffer-and-window
		  ">"          'find-file-at-point
		  "b"          'ibuffer
		  "\\"         'split-window-horizontally
		  "-"          'split-window-vertically
		  "w"          'save-buffer
		  ","          'other-window

		  ;; evil-nerd-commenter config
		  "cc"         'evilnc-comment-or-uncomment-lines

)


(provide 'my-leader-keys)
