(setq default-frame-alist (append (list 
  '(width  . 100)  ; Width set to 81 characters 
  '(height . 35)) ; Height set to 60 lines 
  default-frame-alist)) 

(setq inhibit-startup-message   t)   ; Don't want any startup message 
(setq make-backup-files         nil) ; Don't want any backup files 
(setq auto-save-list-file-name  nil) ; Don't want any .saves files 
(setq auto-save-default         nil) ; Don't want any auto saving 

(setq search-highlight           t) ; Highlight search object 
(setq query-replace-highlight    t) ; Highlight query object 
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening 

;; (set-face-background 'region "yellow") ; Set region background color 
;; (set-background-color        "wheat3") ; Set emacs bg color 

;; (global-set-key "\C-l" 'goto-line) ; [Ctrl]-[L]

;;; Lisp (SLIME) interaction 
(setq inferior-lisp-program "clisp") 
(add-to-list 'load-path "~/.slime") 
(require 'slime) 
(slime-setup)

; syntax highlighting
(global-font-lock-mode t)
; highlight open parenthesis
(show-paren-mode 1)
; return will ident when return hit (just for lisp)
(add-hook 'lisp-mode-hook '(lambda ()
      (local-set-key (kbd "RET") 'newline-and-indent)))
