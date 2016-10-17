(eval-after-load 'php-mode
  '(require 'php-ext))
(add-hook 'php-mode-hook 'flymake-php-load)
(add-hook 'php-mode-hook 'flycheck-mode)
(add-hook 'php-mode-hook
            '(lambda ()
               ;;(auto-complete-mode t)
               (require 'ac-php)
               (setq ac-sources  '(ac-source-php ) )
	       (require 'company-php)
	       (auto-complete-mode -1)
	       (company-mode t)
	       ;;(add-to-list 'company-backends 'company-ac-php-backend )
               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back) ;go back
               ))
(defun my-php-mode-hook ()
  "My PHP mode configuration."
  (setq indent-tabs-mode 4
        tab-width 4
        c-basic-offset 4))
(add-hook 'php-mode-hook 'my-php-mode-hook)
(add-to-list 'company-etags-modes 'php-mode)
(add-hook 'php-mode-hook
	  (lambda ()
	    (set (make-local-variable 'company-backends) '(company-files company-ac-php-backend company-dabbrev company-keywords))))
(provide 'init-php)
