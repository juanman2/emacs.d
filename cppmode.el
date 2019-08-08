;; Juan Tellez' CPPMODE
;;
;; All of this is borrowed from others, particular credit to:
;; byuksel, atilaneves, syamajala
;;

;; Settings
(add-hook 'prog-mode-hook 'linum-mode)

;; package installs

;; start auto-complete with emacs
(package-install 'auto-complete-clang)
(package-install 'auto-complete-clang-async)

(require 'auto-complete)
(require 'auto-complete-clang)
(require 'auto-complete-clang-async)

(defun auto-complete-mode-maybe ()
  "Auto complete everywhere."
  (unless (minibufferp (current-buffer))
    (auto-complete-mode 1)))

;; do default config for auto-complete
(package-install 'auto-complete-c-headers)
(require 'auto-complete-c-headers)

(require 'auto-complete-config)
(ac-config-default)

;; start yasnippet with emacs
(package-install 'yasnippet-snippets)
(require 'yasnippet-snippets)
(yas-global-mode 1)

; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/usr/lib/llvm-gcc/4.2.1/include")
  (add-to-list 'achead:include-directories '"/usr/local/Cellar/wxmac/3.0.4_1/include/")
)
; Now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

; Fix iedit bug in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;; Package Installs for google cppmode
(package-install 'flymake-google-cpplint)
(package-install 'google-c-style)
(package-install 'flymake-cursor)


;; start flymake-google-cpplint-load
;; let's define a function for flymake initialization
(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint)
  (require 'flymake-cursor)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
  (flymake-google-cpplint-load)
  )

;; Hooks for flycheck 

;; Hooks for flymake
;;(add-hook 'c-mode-hook 'my:flymake-google-init)
;;(add-hook 'c++-mode-hook 'my:flymake-google-init)

; start google-c-style with emacs
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c-mode-common-hook 'my:flymake-google-init)
