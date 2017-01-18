;; my-env.el
;;
;; Environment settings.
;;
;;============================================================================== 

;; User name and e-mail
(setq user-full-name   "askobeldin")
(setq user-mail-adress "askobeldin@gmail.com")


;; Paths (for Common Lisp compiler - SBCL)
(setq unix-sbcl-bin    "/usr/bin/sbcl")
(setq windows-sbcl-bin "C:/sbcl/sbcl.exe")


;; Настройка кодировок и окружения.
;; Мы хотим чтобы наши файлы с кодом сохранялись в UTF-8,
;; пока прямо не укажем другое.
; (set-language-environment 'UTF-8)
; (setq default-buffer-file-coding-system 'utf-8)
; (setq-default coding-system-for-read 'utf-8)
; (setq file-name-coding-system 'utf-8)
; (set-selection-coding-system 'utf-8)
; (set-keyboard-coding-system 'utf-8-unix)
; (set-terminal-coding-system 'utf-8)
; (prefer-coding-system 'utf-8)

;; Coding-system
(set-language-environment 'UTF-8)
(if (or (system-is-linux) (system-is-mac))
    (progn
        (setq default-buffer-file-coding-system 'utf-8)
        (setq-default coding-system-for-read    'utf-8)
        (setq file-name-coding-system           'utf-8)
        (set-selection-coding-system            'utf-8)
        (set-keyboard-coding-system        'utf-8-unix)
        (set-terminal-coding-system             'utf-8)
        (prefer-coding-system                   'utf-8))
    (progn
        ; (setq default-buffer-file-coding-system 'windows-1251)
        (setq default-buffer-file-coding-system 'utf-8)
        ; (setq-default coding-system-for-read    'windows-1251)
        (setq file-name-coding-system           'windows-1251)
        (set-selection-coding-system            'windows-1251)
        (set-keyboard-coding-system        'windows-1251-unix)
        (set-terminal-coding-system             'windows-1251)
	; (prefer-coding-system                   'windows-1251)
	(prefer-coding-system                   'utf-8)
        ;
        ; (setq default-buffer-file-coding-system 'utf-8)
        ; (setq-default coding-system-for-read    'utf-8)
        ; (set-selection-coding-system            'utf-8)
        ; (set-keyboard-coding-system        'utf-8-unix)
	; (prefer-coding-system                   'utf-8)
))

;; eww browser
(setq browse-url-browser-function 'eww-browse-url)

(provide 'my-env)
