(elpy-enable)
(elpy-use-ipython)
;;anaconda
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(add-hook 'python-mode-hook
	  (lambda ()
	    (set (make-local-variable 'company-backends) '(company-anaconda company-dabbrev company-files flycheck-mode))))

(add-hook 'python-mode-hook
	  '(lambda ()
	     (auto-complete-mode -1)
	     ))

(provide 'init-python)
