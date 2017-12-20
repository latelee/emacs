;;; the basic configure for emacs
;;; by Late Lee
;;; 

;; ��ʾ�к�
;;;(require 'line-num)
;; ��˵emacs�Դ���
(global-linum-mode t)

;; ����
(require 'color-theme)
(color-theme-classic)

;; ���弰��С
;;  m-x describe-font�鿴
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

;; ʱ����ʾ
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 1)

;; (setq backup-by-copying t)
;; ����ʱ������Ϊ��~���ļ�
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

;; ��겻��˸
(blink-cursor-mode nil)

;; ����ܹ��
(mouse-avoidance-mode 'animate)

;; Emacs����������֮��Ŀ���
(setq x-select-enable-clipboard t)

;; ״̬������ʾ�кš��к�
(column-number-mode t)

;;;(setq frame-tillte-format "latelee@%b")


;;(setq default-fill-column 60)

(transient-mark-mode t)

;;; it is useful when using doxymacs
(setq user-full-name "Late Lee")
(setq user-mail-address "li@latelee.org")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ����������
(require 'highlight-tail)
;; ʹ�÷�������ɫ������
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
