;; let emacs could find the execuable

(use-package exec-path-from-shell
  :if (and (eq system-type 'darwin) (display-graphic-p))
  :ensure t
  :pin melpa-stable
  :config
  (progn
     (when (string-match-p "/zsh$" (getenv "SHELL"))
      ;; Use a non-interactive login shell.  A login shell, because my
      ;; environment variables are mostly set in `.zprofile'.
       (setq exec-path-from-shell-arguments '("-l")))

     (exec-path-from-shell-initialize)
    )
  )

(global-hungry-delete-mode)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)



(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
;; (require 'evil)
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(global-evil-leader-mode)

(evil-leader/set-key
  "ff" 'find-file
  "fr" 'recentf-open-files
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer
  "pf" 'counsel-git
  "ps" 'helm-do-ag-project-root
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "fj" 'dired-jump
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":" 'counsel-M-x
  "wm" 'delete-other-windows
  "qq" 'save-buffers-kill-terminal
  "sj" 'counsel-imenu
  "sp" 'counsel-git-grep
  )

(window-numbering-mode 1)


(global-evil-surround-mode 1)

(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

(evilnc-default-hotkeys)

(dolist (mode '(ag-mode
		flycheck-error-list-mode
		occur-mode
		git-rebase-mode))
  (add-to-list 'evil-emacs-state-modes mode))


(add-hook 'occur-mode-hook
	  (lambda ()
	    (evil-add-hjkl-bindings occur-mode-map 'emacs
	      (kbd "/")       'evil-search-forward
	      (kbd "n")       'evil-search-next
	      (kbd "N")       'evil-search-previous
	      (kbd "C-d")     'evil-scroll-down
	      (kbd "C-u")     'evil-scroll-up
	      )))

(which-key-mode 1)
(setq which-key-side-window-location 'right)

(require 'popwin)    ;;when require, wh(setq company-minimum-prefix-length 1)en not require
(popwin-mode t)
(require 'org-pomodoro)
;;load theme
;;(load-theme 'monokai t)

;;start load all mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode)
	 ("\\.php\\'" . php-mode)
	 )
       auto-mode-alist))
;;start load all mode

;;start config markdown mode
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . markdown-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
;;end   config markdown mode 

;;all company mode
(global-company-mode t)
;;(add-hook 'after-init-hook 'global-company-mode)
;;start config js2-mode for js files
;; config for js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(defun js2-imenu-make-index ()
  (interactive)
  (save-excursion
    ;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
    (imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
			       ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
			       ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
	  (lambda ()
	    (setq imenu-create-index-function 'js2-imenu-make-index)))
(add-hook 'js2-mode-hook 'flycheck-mode)
;;test
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (add-to-list (make-local-variable 'company-keywords)
;;                          'company-anaconda)))
;;test
;;end config js2-mode for js files


;;start git mode
;;git 显示修改文件状态
(global-git-gutter-mode 1)
(require 'git-gutter-fringe)
(set-face-foreground 'git-gutter-fr:modified "purple")
(set-face-foreground 'git-gutter-fr:added    "green")
(set-face-foreground 'git-gutter-fr:deleted  "red")
(setq-default left-fringe-width  20)
(setq-default right-fringe-width 20)
(setq git-gutter-fr:side 'right-fringe)
;;end  git mode

;;test ....
;;test ....
;;(auto-indent-global-mode t)
(provide 'init-packages)
