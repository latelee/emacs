;;; config for other plugin

;;; basic setting,such as time,etc.
(load "D:/emacs/.emacs.d/basic-conf.el")

;;; this contains ecedt ecb cscope and other setting
(load "D:/emacs/.emacs.d/code-config.el")

;;; c/c++ mode
(load "D:/emacs/.emacs.d/c-mode.el")

;; git for emacs 
(add-to-list 'load-path "D:/emacs/site-lisp/git-emacs/")
(require 'git-emacs)

;; mark down
(autoload 'markdown-mode "markdown-mode.el"  
"Major mode for editing Markdown files" t)  
(setq auto-mode-alist  
(cons '(".markdown" . markdown-mode) auto-mode-alist))

;; yaml support
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  ;; ecb save options here!!!!!!
  '(ecb-options-version "2.40")
)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

