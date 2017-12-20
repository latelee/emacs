;;; the basic configure for emacs
;;; by Late Lee
;;; 

;; 显示行号
;;;(require 'line-num)
;; 据说emacs自带了
(global-linum-mode t)

;; 主题
(require 'color-theme)
(color-theme-classic)

;; 字体及大小
;;  m-x describe-font查看
(set-default-font "-outline-Courier New-normal-normal-normal-mono-16-*-*-*-c-*-iso8859-1")

;; copy all
(defun my_copy_buffer()
	"copy the whole buffer to clipboard."
	(interactive)
	(beginning-of-buffer)
	(setq start (point))
	(end-of-buffer)
	(setq end (point))
	(clipboard-kill-ring-save start end)
)
(global-set-key (kbd "C-c a") 'my_copy_buffer)

;; 时间显示
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 1)

;; (setq backup-by-copying t)
;; 保存时不保存为“~”文件
(setq make-backup-files nil)

(show-paren-mode 1)
(setq show-paren-style 'parentheses)
(setq visible-bell nil)
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)
(setq inhibit-startup-message t)

(setq-default ispell-program-name "aspell")

;; switch buffers
;;; okay shift/meta+left/right(cursor),etc.
(windmove-default-keybindings)
(setq windwove-wrap-around t)

;; cursor -> bar
(setq-default cursor-type 'bar)

;; 光标不闪烁
(blink-cursor-mode nil)

;; 鼠标躲避光标
(mouse-avoidance-mode 'animate)

;; Emacs与其它程序之间的拷贝
(setq x-select-enable-clipboard t)

;; 状态栏中显示行号、列号
(column-number-mode t)

;;;(setq frame-tillte-format "latelee@%b")


;;(setq default-fill-column 60)

(transient-mark-mode t)

;;; it is useful when using doxymacs
(setq user-full-name "Late Lee")
(setq user-mail-address "li@latelee.org")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 其它乱来的
(require 'highlight-tail)
;; 使用方法：颜色，进度
;(setq highlight-tail-colors
;          '(("#c1e156" . 0)
;            ("#b8ff07" . 25)
;            ("#00c377" . 60)))

(setq highlight-tail-colors
          '(("#556b50" . 0)
            ("#556b40" . 25)
            ("#556b30" . 50)
            ("#556b20" . 80)))

(setq highlight-tail-steps 14
      highlight-tail-timer 1)
(setq highlight-tail-posterior-type 'const)
(highlight-tail-mode)
