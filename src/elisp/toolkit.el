(defun space-p (c) (equal c 32))

(defun string-remove-leading-spaces (text)
  (apply 'concat (seq-map #'(lambda (x) (concat x "\n"))
                          (split-string text "\n" t "[[:space:]]+"))))

(defun string-fix-indentation (text)
  (let ((lines (split-string text "\n" t)))
    (if (= (length lines) 1)
        (setq text (concat text "\n"))
      (let* ((indention (seq-map (lambda (x) (seq-take-while 'space-p x)) lines))
             (trimed (seq-map (lambda (x) (seq-drop-while 'space-p x)) lines))
             (space-count (seq-map 'length indention))
             (space-count-tmp (seq-take space-count (- (length space-count) 1)))
             (space-count2 (cons (car space-count-tmp) space-count-tmp))
             (space-delta (seq-mapn #'(lambda (x y) (- x y)) space-count space-count2))
             (new-indention (seq-map #'(lambda (x) (cond ((< x 0) "\b")
                                                         ((> x 0) "    ")
                                                         (t ""))) space-delta))
             (new-lines (seq-mapn #'(lambda (x y) (concat x y)) new-indention trimed)))
        (setq text (apply 'concat (seq-map #'(lambda (x) (concat x "\n")) new-lines)))))
    text))

(defun send-to-terminal ()
  (interactive)
  (let* ((text (buffer-substring-no-properties (region-beginning) (region-end)))
         (text-end-clean (string-trim-right text))
         ;; (indented-code (string-fix-indentation text))
         (indented-code (concat text-end-clean "\n")))
    (process-send-string "terminal<1>" indented-code)))


(defun kill-ring-save-without-linewraps ()
  (interactive)
  (let ((text (buffer-substring (region-beginning) (region-end))))
    (with-temp-buffer
      (insert text)
      (let ((fill-column (+ 1 (point-max))))
        (fill-region (point-min) (point-max))
        (kill-ring-save (point-min) (point-max))))))

(global-set-key (kbd "M-W") 'kill-ring-save-without-linewraps)
