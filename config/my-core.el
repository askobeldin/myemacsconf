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
(setq auto-save-interval 500
      auto-save-timeout 0)

;; Директория для автосохранения файлов
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

;; Это отключает табы
(setq-default indent-tabs-mode nil)

(defun my-update-emacs-title ()
  "Update the Emacs title based on the current buffer.

If the current buffer is associated with a filename, that filename will be
used to tile the window. Otherwise, the window will be titled based upon the
name of the buffer."
  (if (buffer-file-name (current-buffer))
      (setq frame-title-format "Emacs - %f")
      (setq frame-title-format "Emacs - %b")))

(cl-dolist (hook '(buffer-list-update-hook
                   change-major-mode-hook
                   find-file-hook))
  (add-hook hook 'my-update-emacs-title))

;; lockfiles are evil.
(setq create-lockfiles nil)

;; require a trailing newline
(setq require-final-newline t)

;'Woman' > 'man'.
(defalias 'man 'woman)

(eval-when-compile (require 'cl))
(require 'cl-lib)

;; from <https://github.com/bling/dotemacs/>
(defmacro after (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))


(provide 'my-core)
