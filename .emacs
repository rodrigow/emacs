(package-initialize)
(add-to-list 'load-path "~/.emacs.d/el/")

(setq default-frame-alist (append (list 
  '(width  . 120)  ; Width set to 81 characters 
  '(height . 40)) ; Height set to 60 lines 
  default-frame-alist)) 

; (ido-ubiquitous 1)
(when (display-graphic-p)
  (scroll-bar-mode -1))

(load-theme 'tango-dark t)
(setq ring-bell-function 'ignore) ; Don't want beep or bell sound

(setq inhibit-startup-message   t)   ; Don't want any startup message 
(setq make-backup-files         nil) ; Don't want any backup files 
(setq auto-save-list-file-name  nil) ; Don't want any .saves files 
(setq auto-save-list-file-prefix nil) ; Don't want any session .saves files 
(setq auto-save-default         nil) ; Don't want any auto saving 

(setq search-highlight           t) ; Highlight search object 
(setq query-replace-highlight    t) ; Highlight query object 
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening 

; syntax highlighting
(global-font-lock-mode t)
; highlight open parenthesis
(show-paren-mode 1)
; return will ident when return hit (just for lisp)
(add-hook 'lisp-mode-hook '(lambda ()
      (local-set-key (kbd "RET") 'newline-and-indent)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-mode (quote both) nil (ido))
 '(speedbar-show-unknown-files t)
 '(tool-bar-mode nil)
 '(x-select-enable-clipboard t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; default shell ansi mode
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; comment/uncomment lines
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-logical-line)))

;; key binding
(global-set-key (quote [s-tab]) (quote slime-complete-symbol)) ; slime
(global-set-key (kbd "s-/") (quote comment-or-uncomment-region-or-line)) ; comment/uncomment

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; Speedbar
(require 'sr-speedbar)
(global-set-key (kbd "M-s") 'sr-speedbar-toggle)
