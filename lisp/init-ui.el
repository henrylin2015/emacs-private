(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-splash-screen t)

(setq-default cursor-type 'bar)

(setq  initial-frame-alist (quote ((fullscreen . maximized))))

(global-hl-line-mode t)

;;theme setting
(require 'powerline)

;; Moe-theme setting
;; Moe-theme
(require 'moe-theme)

;; Show highlighted buffer-id as decoration. (Default: nil)
;;(sietq moe-theme-highlight-buffer-id t)

;; Resize titles (optional).
;;(setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0))
;;(setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
;;(setq moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))

;; Choose a color for mode-line.(Default: blue)
(moe-theme-set-color 'cyan)

;; Finally, apply moe-theme now.
;; Choose what you like, (moe-light) or (moe-dark)
;;(moe-light)
;; Moe-theme setting

;;load-theme railscasts
(load-theme 'railscasts t)

(provide 'init-ui)
