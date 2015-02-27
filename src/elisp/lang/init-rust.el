;;; init-rust.el 

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load Rust Mode

(require 'init-elpa)

(condition-case nil
    (require 'misc)
  (error (provide 'misc)))

(require-package 'rust-mode)
 
(provide 'init-rust)
