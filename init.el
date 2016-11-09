;; (package-initialize)
;;nimei
(require 'cask "~/.cask/cask.el")
(cask-initialize)


(require 'pallet)
(pallet-mode t)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; (require 'init-func.el)
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(let ((file-name-handler-alist nil))
  (require 'init-utils)
  (require 'init-elisp)
  (require 'init-company)
  (require 'init-python)
  (require 'init-cc-mode)
  (require 'init-php)
  (require 'init-gtags)
  (require 'init-ctags)
  (require 'init-web-mode)
  (require 'init-yas)
  (require 'init-lua)
  (require 'init-yaml)
  ;;(require 'init-ggtags)
  
  )

(require 'init-keybindings)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

(load-file custom-file)
