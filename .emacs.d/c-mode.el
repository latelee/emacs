;;; 设置C/C++语言风格
;;; by Late Lee

;;;;;;;;;;;;;; 一些其它设置，需要移到其它文件


;; 高亮符号
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)

;; 高亮括号
;;(require 'highlight-parentheses)

;;; auto complete
(defun my-indent-or-complete()
	(interactive)
	(if (looking-at "\\>")
		(hippie-expand nil)
		(indent-for-tab-command))
)
(global-set-key [(control tab)] 'my-indent-or-complete)

(autoload 'senator-try-expand-semantic "senator")

;;; NOTE:i put xxx-dabbrev first
;;; i think it will be fine
(setq hippie-expand-try-functions-list
 	  '(
	;;;senator-try-expand-semantic
	try-expand-dabbrev
	try-expand-dabbrev-visible
	senator-try-expand-semantic
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-expand-list
	try-expand-list-all-buffers
	try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        )
)

;;; cc-mode
;;; what does it mean?puzzle
(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

(defun my-c-mode-common-hook()
	;; c style,this will be good
	(c-set-style "stroustrup")
	;; tab is 4 NOT 8
	(setq-default tab-width 4)
	;; this is better than the next line! so i choose this one
	(global-set-key(kbd "RET") 'newline-and-indent)
	;; OK here replace "make -k" to "gcc"
	(setq compile-command "gcc")
	
	;;; some  key map
	(define-key c-mode-base-map [(f7)] 'compile)
	(define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
	(define-key c-mode-base-map [(meta \`)] 'c-indent-command)
	(define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
	;;;(define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol)
	;;; pre process
	(setq c-macro-shrink-window-flag t)
	(setq c-macro-preprocessor "cpp")
	(setq c-macro-cppflags " ")
	(setq c-macro-prompt-flag t)
	(setq hs-minor-mode t)
	(setq abbrev-mode t)
	(setq tab-width 4 indent-tabs-mode nil)
	
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;; I know it is not very good ,bu I have no good idea
(defun my-c++-mode-hook()
	;; c++ style,this will be good
	(c-set-style "stroustrup")
	;; tab is 4 NOT 8
	(setq-default tab-width 4)
	;; OK here replace "make -k" to "g++"
	(setq compile-command "g++")
	
	;;; some  key map
	(define-key c-mode-base-map [(f7)] 'compile)
	(define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
	(define-key c-mode-base-map [(meta \`)] 'c-indent-command)
	(define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
	;;;(define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
	;;; pre process
	(setq c-macro-shrink-window-flag t)
	(setq c-macro-preprocessor "cpp")
	(setq c-macro-cppflags " ")
	(setq c-macro-prompt-flag t)
	(setq hs-minor-mode t)
	(setq abbrev-mode t)
	(setq tab-width 4 indent-tabs-mode nil)
)
(add-hook 'c++-mode-hook 'my-c++-mode-hook)


;;; auto pair seetings
(defun my-c-mode-auto-pair ()
	(interactive)
	(make-local-variable 'skeleton-pair-alist)
	(setq skeleton-pair-alist '(
	(?`?` _ "''")
	(?\(? _ ")")
	(?\[? _ "]")
	(?{ \n > _ \n ?} >)))
	(setq skeleton-pair t)
	(local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
	(local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
	(local-set-key (kbd "`")  'skeleton-pair-insert-maybe)
	(local-set-key (kbd "[") 'skeleton-pair-insert-maybe))

;;;(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
;;;(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)


(defun smart-compile()
  ;; c-mode:gcc -Wall
  ;; c++-mode:g++ -Wall
  (interactive)
  ;; find Makefile
  (let ((candidate-make-file-name '("makefile" "Makefile" "GNUmakefile"))
        (command nil))
    (if (not (null
              (find t candidate-make-file-name :key
                    '(lambda (f) (file-readable-p f)))))
        (setq command "make -k ")
      ;; 没有找到 Makefile ，查看当前 mode 是否是已知的可编译的模式
      (if (null (buffer-file-name (current-buffer)))
          (message "Buffer not attached to a file, won't compile!")
        (if (eq major-mode 'c-mode)
            (setq command
                  (concat "gcc -g -Wall -o "
                          (file-name-sans-extension
                           (file-name-nondirectory buffer-file-name))
                          " "
                          (file-name-nondirectory buffer-file-name)
                          ;;               " -lm "
                          ))
          (if (eq major-mode 'c++-mode)
              (setq command
                    (concat "g++ -g -Wall -o "
                            (file-name-sans-extension
                             (file-name-nondirectory buffer-file-name))
                            " "
                            (file-name-nondirectory buffer-file-name)
                            ;;             " -lm "
                            ))
            (if (eq major-mode 'fortran-mode)
                (setq command
                      (concat "ifort "
                              ;;                (file-name-nondirectory buffer-file-name))
                              ;;                (file-name-sans-extension
                              (file-name-nondirectory buffer-file-name)
                              " -o "
                              ))
              (message "Unknow mode, won't compile!"))))))
    (if (not (null command))
        (let ((command (read-from-minibuffer "Compile command: " command)))
          (compile command)))))
;;(add-hook 'c-mode-hook 'smart-compile)
;;(add-hook 'c++-mode-hook 'smart-compile)
