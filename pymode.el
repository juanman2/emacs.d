;; Python custom mode
;; https://realpython.com/emacs-the-best-python-editor/
;;
(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

;; Enable Flycheck
;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))
