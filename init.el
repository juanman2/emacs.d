;; Juan Tellez' Custom Emacs
(setq default-directory "~/src/")

;; modes
(line-number-mode 1)
(column-number-mode 1)

;; keys
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(load-file "~/.emacs.d/package-init.el")

;; Shell mode
(load-file "~/.emacs.d/shell-mode.el")

;; cppmode
(load-file "~/.emacs.d/cppmode.el")

;; helm
(load-file "~/.emacs.d/helm-init.el")

;; rtags
(load-file "~/.emacs.d/rtags-init.el")

;; flycheck
(load-file "~/.emacs.d/flycheck-init.el")

;; Server
(server-start)


;; --------------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-google-cpplint-command "/usr/local/bin/cpplint")
 '(package-selected-packages
   (quote
    (iedit yasnippet-snippets ac-c-headers auto-complete yasnippet auto-complete-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
