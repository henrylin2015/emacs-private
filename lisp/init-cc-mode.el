;;setting global key
;; (defun my:ac-c-headers-init ()
;;   (require 'auto-complete-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-c-headers)
;;   (add-to-list 'achead:include-directories '"/usr/include/c++/4.2.1")
;;   )
;;company-c-headers
(add-to-list 'company-backends 'company-c-headers)
(setq company-c-headers-path-system '("/usr/include/" "/usr/include/c++/4.2.1/"  "/usr/include/c++/5/"))
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'my-c-indent-tabs-hook)
(add-hook 'c-mode-hook 'my-c-indent-tabs-hook)
;;indent-tabs 4
(defun my-c-indent-tabs-hook()
  "my c/c++ mode configuration."
  (setq indent-tabs-mode nil
	tab-width 4
	c-basic-offset 4))

(add-to-list 'load-path "~/.emacs.d/code/irony-mode")
(add-hook 'c++-mode-hook
	  '(lambda ()
	     (require 'irony)
	     (require 'irony-cdb)
	     (irony-mode)
	     (require 'auto-complete)
	     (require 'auto-complete-config)
	     (ac-config-default)
	     (require 'yasnippet)
	     (yas-global-mode 1)
	     ))

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; (add-to-list 'load-path "~/.emacs.d/code/el-get")
;; (require 'el-get)
;; (add-to-list 'el-get-recipe-path "~/.emacs.d/code/el-get/recipes")
;; (el-get 'sync)
;; ;; Simple package names
;; (el-get-bundle yasnippet)
;; (el-get-bundle color-moccur)

;; ;; Locally defined recipe
;; (el-get-bundle yaicomplete
;;   :url "https://github.com/tarao/elisp.git"
;;   :features yaicomplete)

;; ;; With initialization code
;; (el-get-bundle zenburn-theme
;;   :url "https://raw.githubusercontent.com/bbatsov/zenburn-emacs/master/zenburn-theme.el"
;;   (load-theme 'zenburn t))

(provide 'init-cc-mode)
