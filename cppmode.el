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

(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)

(require 'flycheck-rtags)

(defun my-flycheck-rtags-setup ()
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
  (setq-local flycheck-check-syntax-automatically nil))

;; c-mode-common-hook is also called by c++-mode
(add-hook 'c-mode-common-hook #'my-flycheck-rtags-setup)

;; cmake-ide

;; provides the semantic function to pull header file paths
(require 'cedet)
(require 'semantic)
(semantic-gcc-setup)

(setq project-include-paths '("/usr/Local/Cellar/wxmac/3.0.4_1/include/wx-3.0/wx/"
      "/System/Library/Frameworks/OpenGL.framework"
      "/usr/local/lib/wx/include/osx_cocoa-unicode-3.0;/usr/local/include/wx-3.0"))


(setq cmake-ide-flags-c++ (append '("-std=c++11")
				  (mapcar (lambda (path) (concat "-I" path))
					  (append (semantic-gcc-get-include-paths "c++")
						  project-include-paths))))

(setq cmake-ide-flags-c (append (mapcar (lambda (path) (concat "-I" path))
					(semantic-gcc-get-include-paths "c"))))

(cmake-ide-setup)

