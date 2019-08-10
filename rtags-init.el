;; Setup rtags

(require 'rtags)
(require 'helm-rtags)
(require 'company-rtags)

(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-rtags))
(setq rtags-autostart-diagnostics t)
(rtags-enable-standard-keybindings)

(setq rtags-use-helm t)

(rtags-enable-standard-keybindings c-mode-base-map)
(setq rtags-completions-enabled t)

;; cmake-ide
;; (cmake-ide-setup)
;;(setq cmake-ide-flags-c++ (append '("-std=c++1y")
;;                                 (mapcar (lambda (path) (concat "-I" path)) (c++-include-paths))))
;; (setq cmake-ide-flags-c '("-I/usr/include"))


