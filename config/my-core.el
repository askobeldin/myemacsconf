;; my-core.el
;;
;; core config
;;

;; Если не отменить make-backup-files, Emacs будет засорять
;; файловую систему бэкапами.
(setq-default make-backup-files nil)

;; Это включает автосохранение - пока вы работаете с файлом,
;; Emacs время от времени автоматически создает копию, и удаляет её
;; как только вы сохрание файл с которым работаете.
(setq-default auto-save-defaults t)

;; Это отключает табы. Как бы вы не относились к табам
;; в контексте кода других языков программирования,
;; в лиспе с ними работать совершенно невозможно.
(setq-default indent-tabs-mode nil)

;; lockfiles are evil.
(setq create-lockfiles nil)

;; require a trailing newline
(setq require-final-newline t)

;'Woman' > 'man'.
(defalias 'man 'woman)

;; Директория для автосохранения файлов
(defvar my-auto-save-folder "~/.emacs.d/.saves/"
  "Directory used for Emacs backups.")
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq auto-save-file-name-transforms
      `((".*" ,my-auto-save-folder t)))

(eval-when-compile (require 'cl))
(require 'cl-lib)

;; from <https://github.com/bling/dotemacs/>
(defmacro after (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))


(provide 'my-core)
