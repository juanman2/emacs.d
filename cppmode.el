;; Juan Tellez' CPPMODE - This files contains the hooks for C++ and C
;;
;; All of this is borrowed from others, particular credit to:
;; byuksel, atilaneves, syamajala, tuhdo
;;

;; Settings
(add-hook 'prog-mode-hook 'linum-mode)


; Fix iedit bug in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;; Hooks for Company
(add-hook 'c++-mode-hook
	  (lambda()
            (setq company-backends
		  '(company-rtags company-clang company-dabbrev-code
				  company-keywords company-yasnippet
				  company-files company-dabbrev
				  company-irony-c-headers))
            (company-mode 1)
            (global-set-key [C-return] 'company-complete-common)))

(add-hook 'c-mode-hook
	  (lambda()
            (setq company-backends
		  '(company-rtags company-clang company-dabbrev-code
				  company-keywords company-yasnippet
				  company-files company-dabbrev))
	    
            (company-mode 1)
            (global-set-key [C-return] 'company-complete-common)))

;; Flycheck 
(require 'flycheck-rtags)
(require 'flycheck-irony)

(defun my-flycheck-rtags-setup ()
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
  (setq-local flycheck-check-syntax-automatically nil))

(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; c-mode-common-hook is also called by c++-mode
(add-hook 'c-mode-common-hook #'my-flycheck-rtags-setup)

;; cmake-ide

;; CEDET provides the semantic function to pull header file paths
(require 'cedet)
(require 'semantic)
(semantic-gcc-setup)

;; These were added for coding on the MAC, specificall with OpenCPN
(setq project-include-paths
      '("/usr/Local/Cellar/wxmac/3.0.4_1/include/wx-3.0/wx/"
	"/System/Library/Frameworks/OpenGL.framework"
	"/usr/local/lib/wx/include/osx_cocoa-unicode-3.0;/usr/local/include/wx-3.0"))

(setq cmake-ide-flags-c++
      (append '("-std=c++11")
	      (mapcar (lambda (path) (concat "-I" path))
		      (append (semantic-gcc-get-include-paths "c++")
			      project-include-paths))))

(setq cmake-ide-flags-c
      (append (mapcar (lambda (path) (concat "-I" path))
		      (semantic-gcc-get-include-paths "c"))))

(cmake-ide-setup)

;;
;; Irony
;; See https://github.com/Sarcasm/irony-mode
;; for installation instructions to get irony-server installed.
;; I just did this: https://github.com/Sarcasm/irony-mode#usage
;;
;; and I ran this:
;; install_name_tool -change @rpath/libclang.dylib /usr/local/opt/llvm/lib/libclang.dylib /Users/juan/.emacs.d/irony/bin/irony-server
;;
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(setq company-backends (delete 'company-semantic company-backends))
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-irony))

(setq company-idle-delay 0)
(define-key c-mode-map [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)

