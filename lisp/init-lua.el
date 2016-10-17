;;(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(add-hook 'lua-mode-hook 'flymake-lua-load)
(add-hook 'lua-mode-hook
          (lambda () (setq-local company-backends '(company-lua))))
(provide 'init-lua)