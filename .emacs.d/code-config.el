;;; for cedet and other setting
;;; new add 2010-4-11 night
;;; latelee
;;; 2012-02-24
;;; 迁移到Windows平台，emacs版本为23.4

;;;================================================================
;;; for cedet
(load-file "D:/emacs/site-lisp/cedet/common/cedet.el")
(global-ede-mode 1)
(global-srecode-minor-mode 1)

;;;  choose one
(semantic-load-enable-code-helpers)
;;; (semantic-load-enable-guady-code-helpers)
;;; (semantic-load-enable-excessive-code-helpers)

;;; search path
(setq semanticdb-project-roots
	(list
	(expand-file-name "/")))

(require 'semanticdb)

(setq semanticdb-default-save-directory
;;; i do not put it in .emacs.d dir!
(expand-file-name "D:/emacs/semanticdb"))

(global-semanticdb-minor-mode 1)

(setq-default semantic-idle-scheduler-idle-time 432000)
(setq semanticdb-search-system-databases t)

;;;(eval-after-load "semantic-c"
;;;  '(dolist (d(list
;;; 		/usr/include
;;;		/usr/local/Trolltech/Qt-4.5.0/include/QtGui
;;;		/usr/local/Trolltech/Qt-4.5.0/include/QtCore
;;;              ))
;;;    (semantic-add-system-include d))
;;;)


;;; what's wrong here?
;;;(semantic-add-system-include "/usr/include" 'c-mode)
;;;(semantic-add-system-include "/usr/local/include" 'c-mode)

;;;(semantic-add-system-include "/usr/include" 'c++-mode)
;;;(semantic-add-system-include "/usr/local/include" 'c++-mode)
(semantic-add-system-include "/usr/local/Trolltech/Qt-4.5.0/include/QtGui" 'c++-mode)
(semantic-add-system-include "/usr/local/Trolltech/Qt-4.5.0/include/QtCore" 'c++-mode)
;;;(semantic-add-system-include "/usr/local/Trolltech/Qt-4.5.0/include" 'c++-mode)

;;; add more
;;;(semantic-add-system-include "" 'c-mode)

;;; some key map for code complete
;;(global-set-key "." 'semantic-complete-self-insert)
;;(global-set-key ">" 'semantic-complete-self-insert)

(global-set-key [(control return)] 'semantic-ia-complete-symbol)
(global-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
(global-set-key "\C-c>" 'semantic-complete-analyze-inline)
(global-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)

;;;(global-set-key [(control tab)] 'senator-completion-menu-popup)
;;;(global-set-key [(meta ?/)] 'semantic-ia-complete-symbol-menu)
;;; this will be fine!!
(global-set-key [(meta ?/)] 'semantic-ia-complete-symbol-menu)

;;;================================================================
;;; for ecb
;;; new 2010-4-13 afternoon
(add-to-list 'load-path "D:/emacs/site-lisp/ecb")
(require 'ecb)
;;;(require 'ecb-autoloads)
;;; do not want the tip
(setq ecb-tip-of-the-day nil)
(setq ecb-version-check nil)

;;; used in ecb,you can press M+(cursor)
;;; to enter the window
(global-set-key [(meta left)] 'windmove-left)
(global-set-key [(meta right)] 'windmove-right)
(global-set-key [(meta up)] 'windmove-up)
(global-set-key [(meta down)] 'windmove-down)

;;;=================================================================
;;; for cscope (you must install it)
;;; usage:"cscope -bq" in the project dir,
;;; it will generate some files
;;; new: 16.0 win32
(add-to-list 'load-path "D:/emacs/site-lisp/cscope")
(require 'xcscope)

;;;================================================================
;;; for doxymacs
(add-to-list 'load-path "D:/emacs/site-lisp/doxymacs")
(require 'doxymacs)
(defun my-doxymacs-font-lock-hook ()
    (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
        (doxymacs-font-lock)))

(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

(add-hook 'c-mode-common-hook 'doxymacs-mode)
(add-hook 'c++-mode-common-hook 'doxymacs-mode)

;;; ========================================================
;;; other setting

;;; activate ecb
(global-set-key [(f12)] 'ecb-activate)

;;; deactivate ecb
(global-set-key [(f11)] 'ecb-deactivate)

;;; emacs menu
;;;(global-set-key [(f10)] ')

;;; book mark
(setq bookmark-default-file "D:/emacs/.emacs.d/.emacs.bmk")

;;; list the bookmark which you set
(global-set-key [(f9)] 'list-bookmarks)

;; set bookmark
(global-set-key [(f8)] 'bookmark-set)

;;; F7 ==> compile!!

;;; go to shell
(global-set-key [(f6)] 'shell)

;;; speedbar(left or right)--part of cedet
;;; press again when you don't need it
(global-set-key [(f5)] 'speedbar)

;;; start doxymacs-mode
(global-set-key [(f4)] 'doxymacs-mode)

;;; enable gdb-many-windows
;;; okay here
(setq gdb-many-windows t)

;;; I put hide-region.el in .emacs.d
;;; do not work here
;;; (require 'hide-region)
;;; (setq hide-region-before-string "=======the region has been hiden=======")
;;; (global-set-key (kbd "C-,") 'hide-region-hide)
;;; (global-set-key (kbd "C-.") 'hide-region-unhide)

;;hide region
(require 'hide-region)
(global-set-key (kbd "C-c r") 'hide-region-hide)
(global-set-key (kbd "C-c R") 'hide-region-unhide)


;; hide lines
(require 'hide-lines)
(global-set-key (kbd "C-c l") 'hide-lines)
(global-set-key (kbd "C-c L") 'show-all-invisible)

