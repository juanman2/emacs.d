;; Juan Tellez' Custom Emacs
;;
;; Much of this is borrowed from others, particular credit to:
;;
;; byuksel, atilaneves, syamajala, tuhdo

(setq default-directory "~/src/")

;; modes
(line-number-mode 1)
(column-number-mode 1)
(show-paren-mode t)

; CMake mode
(autoload 'cmake-mode "cmake-mode" "Major mode for editing Cmake files." t)
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))

;; keys
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; sexp Keys already defined, here for documentation
;; 
;; C-M-f runs forward-sexp, move forward over a balanced
;; expression that can be
;; a pair or a symbol.

;; C-M-b runs backward-sexp, move backward
;; over a balanced expression that can
;; be a pair or a symbol.

;; C-M-k runs kill-sexp, kill balanced expression forward that can be a pair
;; or a symbol.

;; C-M-<SPC> or C-M-@ runs mark-sexp, put mark after following expression that
;; can be a pair or a symbol.

;; C-M-a runs beginning-of-defun, which moves point to beginning of a function.
;; C-M-e runs end-of-defun, which moves point to end of a function.
;; C-M-h runs mark-defun, which put a region around whole current or
;; following functIon.

;; Symbols and References
;; C-c r . runs rtags-find-symbol-at-point, which jumps to the definition
;; of the symbol under the cursor.

;; C-c r < runs rtags-find-references, which prompts for the symbol name
;; and finds all references.

;; C-c r > runs rtags-find-symbol, which prompts for symbol name and finds
;; all references.


;; Find files in project
;; C-c r ; runs rtags-find-file, which prompts for file name to search
;; for out of currently indexed files.

;; Generic Hooks

;; Packages
(load-file "~/.emacs.d/package-init.el")

;; Shell mode
(load-file "~/.emacs.d/shell-mode.el")

;; Snippets
(load-file "~/.emacs.d/snippets-init.el")

;; rtags
(load-file "~/.emacs.d/rtags-init.el")

;; AUTO COMPLETE/COMPANY MODE
(load-file "~/.emacs.d/ac-init.el")

;; cppmode
(load-file "~/.emacs.d/cppmode.el")

;; go-mode
(load-file "~/.emacs.d/gomode.el")

;; lsp-mode (go)
(load-file "~/.emacs.d/lspmode.el")

;; helm
(load-file "~/.emacs.d/helm-init.el")

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
    (use-package flycheck-irony iedit yasnippet-snippets ac-c-headers auto-complete yasnippet auto-complete-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
