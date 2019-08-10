;; Juan Tellez Auto Complete
;; Borrowing Atila Neves and byuksel snippets
;;

;; Emacs has to Auto Complete frameworks, Auto-complete and Company
;; I'm going to setup both but favor Company.

(require 'auto-complete)
(require 'auto-complete-clang)
(require 'auto-complete-clang-async)
(require 'auto-complete-c-headers)
(require 'auto-complete-config)

(require 'company)
(require 'company-rtags)

(rtags-enable-standard-keybindings c-mode-base-map)
(setq rtags-completions-enabled t)

;; Remove semantic
(setq company-backends (delete 'company-semantic company-backends))
(setq company-idle-delay 0)

(ac-config-default)
;; 0.4 secs
(setq ac-quick-help-delay 0.4)
(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map [return] nil)
(define-key ac-complete-mode-map "\r" nil)
(define-key ac-mode-map [C-return] 'auto-complete)
(setq ac-candidate-limit 100) ;; do not stall with too many results

;; Magical function
(defun auto-complete-mode-maybe ()
  "Auto complete everywhere."
  (unless (minibufferp (current-buffer))
    (auto-complete-mode 1)))

;; do default config for auto-complete
(ac-config-default)

; autocomplete hooks, initialize both ac and company but default to company
(add-hook 'c++-mode-hook (lambda()
                           (setq company-backends '(company-rtags company-clang company-dabbrev-code company-keywords company-yasnippet company-files company-dabbrev))
                           (company-mode 1)
                           (global-set-key [C-return] 'company-complete-common)))

(add-hook 'c-mode-hook (lambda()
                         (setq company-backends '(company-rtags company-clang company-dabbrev-code company-keywords company-yasnippet company-files company-dabbrev))

                         (company-mode 1)
                         (global-set-key [C-return] 'company-complete-common)))



;; Select between AC and Company Mode
;;

(defun toggle-ac ()
  "Toggle between auto-complete and company."
  (interactive)
  (if (bound-and-true-p auto-complete-mode)
      (progn
        (auto-complete-mode 0)
        (company-mode 1)
        (global-set-key [C-return] 'company-complete-common))
    (progn
      (company-mode 0)
      (auto-complete-mode 1)
      (global-set-key [C-return] 'auto-complete))))

