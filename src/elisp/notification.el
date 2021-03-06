;;; notification.el --- notification settings

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;;; Notifications
(do-on-os "gnu/linux"
          (defvar notifications ())
          (defvar notifications-on t)
          (defun setup-notify ()
            (require 'init-notify)
            (run-with-timer 1 600 (lambda ()
                                    (if (and  window-system notifications-on)
                                        (notify "Go Back to Emacs Please!!!"
                                                "Is every thing done ???")))))
          (defun toggle-notification ()
            (interactive)
            (setq notifications-on (not notifications-on)))
          (setup-notify))
