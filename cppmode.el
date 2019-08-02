;; Juan Tellez' CPPMODE
;;
;; All of this is borrowed from others, particular credit to:
;; byuksel
;;
;; package installs

;; start auto-complete with emacs
(package-install 'auto-complete)
(require 'auto-complete)

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
