;; Package Initialization
;;
;; Borrowed from Atila Neves
;; https://gist.github.com/atilaneves
;;

;; Packages
; start package.el with emacs
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/") 
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")))

;; initialize package.el
(package-initialize)

(eval-when-compile
  (require 'use-package))

(require 'cl-lib)

(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

(unless package-activated-list (package-refresh-contents)) ;get list of packages
(let ((mypackages '(ac-c-headers
		    auto-complete auto-complete-clang auto-complete-c-headers
		    iedit
		    yasnippet-snippets yasnippet
		    async
		    auto-complete-clang auto-complete-c-headers
		    dash
		    epl
		    google-c-style
		    helm helm-core helm-rtags helm-smex
		    pkg-info
		    popup
		    company 
		    rtags company-rtags
		    irony company-irony company-irony-c-headers
		    flycheck flycheck-rtags flycheck-irony 
		    cmake-ide cmake-mode
		    smex
		    smartparens 
		    )))
  (when (or (null package-activated-list) (cl-set-difference package-activated-list mypackages))
    (mapc
     (lambda (package) (or (package-installed-p package)
                           (package-install package)))
     mypackages)))

(eval-and-compile
  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
  (let ((default-directory "~/.emacs.d/elpa/"))
    (normal-top-level-add-subdirs-to-load-path)))

;; Atila's packages:
;; ac-dcd ace-jump-mode ace-window ag
                           ;; aggressive-indent auto-complete-clang
                           ;; auto-complete-c-headers change-inner
                           ;; cmake-ide cmake-mode
                           ;; color-theme-solarized color-theme
                           ;; column-enforce-mode company d-mode
                           ;; elisp-slime-nav elpy auto-complete epc
                           ;; ctable concurrent deferred
                           ;; expand-region find-file-in-project
                           ;; flycheck flycheck-cask
                           ;; flycheck-haskell flycheck-dmd-dub
                           ;; feature-mode fuzzy go-mode
                           ;; haskell-mode highlight-indentation
                           ;; htmlize idomenu key-chord
                           ;; markdown-mode multiple-cursors
                           ;; ninja-mode nose pkg-info dash popup
                           ;; rsense rtags smart-mode-line
                           ;; smartparens smartscan smex
                           ;; solarized-theme switch-window
                           ;; virtualenvwrapper
                           ;; whole-line-or-region xcscope yaml-mode
                           ;; yasnippet jedi
