;; Juan Tellez' Custom Emacs
(setq default-directory "~")

;; modes
(line-number-mode 1)
(column-number-mode 1)

;; keys
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Packages
; start package.el with emacs
(require 'package)
; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
; initialize package.el
(package-initialize)


;; Shell mode
(load-file "~/.emacs.d/shell-mode.el")

;; Server
(server-start)

