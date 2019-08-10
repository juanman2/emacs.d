;; Juan Tellez' CPPMODE
;;
;; All of this is borrowed from others, particular credit to:
;; byuksel, atilaneves, syamajala, tuhdo
;;

;; Settings
(add-hook 'prog-mode-hook 'linum-mode)


; Fix iedit bug in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;; Hooks for flycheck 

;; ; start google-c-style with emacs
;; (require 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)

