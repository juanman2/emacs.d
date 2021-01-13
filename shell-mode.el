;; Shell mode custom changes

;; colorize shell mode
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; dirtrack-mode
;; Shell mode stuff. Set up cwd tracking using the PS1 prompt
;; Borrowed from Ryan Barret, with modifications from Juan Tellez
;;
;; Expects This prompt:
;; PS1="\w \$(git_branch)\$ "
;;
(defun my-dirtrack-mode ()
  "Add to shell-mode-hook to use dirtrack mode in my shell buffers."
  (shell-dirtrack-mode 0)
  (set-variable 'dirtrack-list '("^.* \\(~\\(/[^ \>\<\(\)\t\n,\'\";]+\\)*\\|\\(/[^ \>\<\(\)\t\n,\'\";]*\\)+\\) \$ " 1 nil))
  (dirtrack-mode 1))
(add-hook 'shell-mode-hook 'my-dirtrack-mode)

