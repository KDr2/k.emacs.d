;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KDr2's Emacs Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Language Modes Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;Erlang Mode Settings

(setq load-path (cons  "~/.emacs.d/3rdparties/erlang" load-path))
(setq erlang-root-dir "~/Developer/otp/R14B02")
(add-hook 'erlang-mode-hook 'my-erlang-hook-function)
(defun my-erlang-hook-function ()
  (imenu-add-to-menubar "Functions"))
(require 'erlang-start)

(defun erlang-mode-extras ()
  "extras settings for erlang-mode"
  (auto-complete-mode 1)
  (make-local-variable 'ac-sources)
  (setq ac-sources '(
                     ac-source-symbols
                     ac-source-abbrev
                     ac-source-words-in-buffer
                     ac-source-words-in-all-buffer
                     ac-source-files-in-current-dir
                     ac-source-filename
                     )))
(add-hook 'erlang-mode-hook 'erlang-mode-extras)

;; Common-Lisp and SLIME Settings
(add-to-list 'load-path "~/.emacs.d/3rdparties/slime")
(setq slime-path "~/.emacs.d/3rdparties/slime/")
(require 'slime)
(setq inferior-lisp-program "~/Developer/ecl/bin/ecl")
(set-language-environment "UTF-8")
(setq slime-net-coding-system 'utf-8-unix)
(slime-setup '(slime-fancy))
;;(slime-setup)
(defmacro def-slime (func-name lisp)
  `(defun ,func-name ()
     (interactive)
     (let ((inferior-lisp-program ,lisp))
       (slime))))
(def-slime ecl-slime "~/Developer/ecl/bin/ecl")
(def-slime ecl-dev-slime "/opt/kdr2/Hacking/ecl-dev/bin/ecl")
(def-slime sbcl-slime "~/Developer/bin/sbcl")
(def-slime ccl-slime "~/Developer/ccl/dx86cl64")

;; (O)Caml Settings

(add-to-list 'load-path "~/.emacs.d/3rdparties/tuareg")
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(dolist (ext '(".cmo" ".cmx" ".cma" ".cmxa" ".cmi"))
  (add-to-list 'completion-ignored-extensions ext))

;; R Settings
(add-to-list 'load-path "~/.emacs.d/3rdparties/ess/lisp")
(require 'ess-site)
(add-to-list 'auto-mode-alist '("\\.[Rr]\\'" . R-mode))

;;
(add-to-list 'load-path "~/Work/opensrc/go/misc/emacs" t)
(require 'go-mode-load)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; Objective-c Settings
(require 'objc-c-mode)

;; Perl and PDE Mode Settings
(add-to-list 'load-path "~/.emacs.d/3rdparties/pde")
(load "pde-load")
;;PDE的分号换行，取消之
(defun orignal-semicolon ()
  (interactive)
  (insert ";"))
(add-hook 'cperl-mode-hook
          '(lambda ()
             (local-set-key ";" 'orignal-semicolon)))

;; Ruby Mode Settings
(require 'ruby-mode)
(add-to-list 'auto-mode-alist '("\\.rbw?\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rjs\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml?\\'" . html-mode))
(add-hook 'ruby-mode-hook
          (lambda()
            (ruby-electric-mode nil)))

(require 'yaml-mode)
;; Systemtap Mode Settings
(autoload 'systemtap-mode "systemtap-mode")
(add-to-list 'auto-mode-alist '("\\.stp\\'" . systemtap-mode))

(add-to-list 'load-path "~/.emacs.d/3rdparties/scala")
(require 'scala-mode-auto)


;; Lua Mode Settings
(require 'lua-mode)
(setq lua-indent-level 4)
(add-to-list 'auto-mode-alist '("\\.lua?\\'" . lua-mode))
(add-hook 'lua-mode-hook
          (lambda ()
            (modify-syntax-entry ?. "." (syntax-table))))

;; C/C++ Mode Settings
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.mak$\\'" . makefile-mode))
(add-to-list 'auto-mode-alist '("[Mm]akefile" . makefile-mode))

;; PHP Mode Settings
(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.(php|inc).?\\'" . php-mode))

;; Javascript Settings
(load-file "~/.emacs.d/3rdparties/javascript.el")
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)
;;(autoload 'js2-mode "js2" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-to-list 'auto-mode-alist '("\\.pyx\\'" . python-mode))

;; gas-mode
(require 'gas-mode)
(add-to-list 'auto-mode-alist '("\\.[sS]\\'" . gas-mode))

;; graphviz-dot

(load-file "~/.emacs.d/3rdparties/graphviz-dot-mode.el")



