;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
(setq require-final-newline 'query)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; for Late Lee
;;; 环境变量设置，参考Windows的
;;(setenv "PATH" "D:/emacs-23.4/bin")
;;(setenv "PATH" "D:/MinGW/msys/1.0/bin")
;; D:\\emacs-23.4\\bin;d:\\minGW/\\bin;D:\\MinGW\\msys\\1.0\\bin;
;;(setenv "PATH" "D:\\emacs\\bin;d:\\minGW\\bin;D:\\MinGW\\msys\\1.0\\bin;C:\\Program Files\\Microsoft Visual Studio .NET 2003\\Vc7\\bin")

(setq default-directory "D:/emacs/")
(setq load-path (cons (expand-file-name "D:/emacs/.emacs.d") load-path))

;; 第三方插件均放于此目录
(add-to-list 'load-path (expand-file-name "D:/emacs/site-lisp"))

;; 二级配置文件，这样不要修改.emacs文件
(load "D:/emacs/.emacs.d/myconf.el")

