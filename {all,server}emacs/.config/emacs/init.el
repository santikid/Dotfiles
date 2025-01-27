(defun start/org-babel-tangle-config ()
  "Automatically tangle our Emacs.org config file when we save it. Credit to Emacs From Scratch for this one!"
  (when (string-equal (file-name-directory (buffer-file-name))
                      (expand-file-name user-emacs-directory))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'start/org-babel-tangle-config)))

;; without this for some reason emacs breaks
(require 'package)
(package-initialize)

(require 'use-package-ensure) ;; Load use-package-always-ensure
(setq use-package-always-ensure t) ;; Always ensures that a package is installed
(setq package-archives '(("melpa" . "https://melpa.org/packages/") ;; Sets default package repositories
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/"))) ;; For Eat Terminal

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (evil-mode))
(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-mode-list '(dashboard dired ibuffer magit corfu vertico))
  (evil-collection-init))

;; FROM: https://github.com/doomemacs/doomemacs/issues/3952
(when (eq system-type 'darwin)
  (setq mac-command-modifier      'super
        ns-command-modifier       'super
        mac-option-modifier       'meta
        ns-option-modifier        'meta
        mac-right-option-modifier 'none
        ns-right-option-modifier  'none)
  )

(global-display-line-numbers-mode 1)
(setq display-line-numbers 'relative)

(use-package general
  :config
  (general-evil-setup)

  ;; set up 'SPC' as the global leader key
  (general-create-definer santi/leader
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC" ;; set leader
    :global-prefix "M-SPC") ;; access leader in insert mode

  (santi/leader
    "." '(find-file :wk "Find file")
    "f c" '((lambda () (interactive) (find-file "~/.config/emacs/config.org")) :wk "Edit emacs config")
    "f r" '(counsel-recentf :wk "Recent files")
    "TAB TAB" '(comment-line :wk "Comment lines"))

  (santi/leader
    "b" '(:ignore t :wk "buffer")
    "b i" '(ibuffer :wk "Ibuffer")
    "b b" '(switch-to-buffer :wk "Switch buffer")
    "b k" '(kill-this-buffer :wk "Kill this buffer")
    "b n" '(next-buffer :wk "Next buffer")
    "b p" '(previous-buffer :wk "Previous buffer")
    "b r" '(revert-buffer :wk "Reload buffer"))

  (santi/leader
    "e" '(:ignore t :wk "Show")
    "e t" '(eat :wk "Eat terminal"))


  (santi/leader
    "h" '(:ignore t :wk "Help")
    "h f" '(describe-function :wk "Describe function")
    "h v" '(describe-variable :wk "Describe variable")
    "h r r" '((lambda () (interactive) (load-file "~/.config/emacs/init.el")) :wk "Reload emacs config"))

  (santi/leader
    "t" '(:ignore t :wk "Toggle")
    "t l" '(display-line-numbers-mode :wk "Toggle line numbers")
    "t t" '(visual-line-mode :wk "Toggle truncated lines")
    "t v" '(vterm-toggle :wk "Toggle vterm"))

  (santi/leader
    "p" '(:ignore t :wk "Project")
    "p o" '(project-switch-project :wk "Switch Project"))

  (santi/leader
    "w" '(:ignore t :wk "Windows")
    ;; Window splits
    "w c" '(evil-window-delete :wk "Close window")
    "w n" '(evil-window-new :wk "New window")
    "w s" '(evil-window-split :wk "Horizontal split window")
    "w v" '(evil-window-vsplit :wk "Vertical split window")
    ;; Window motions
    "w h" '(evil-window-left :wk "Window left")
    "w j" '(evil-window-down :wk "Window down")
    "w k" '(evil-window-up :wk "Window up")
    "w l" '(evil-window-right :wk "Window right")
    "w w" '(evil-window-next :wk "Goto next window")
    ))

(set-face-attribute 'default nil
                    :font "JetBrains Mono"
                    :height 110
                    :weight 'medium)
(set-face-attribute 'variable-pitch nil
                    :font "Helvetica Neue"
                    :height 120
                    :weight 'medium)
(set-face-attribute 'fixed-pitch nil
                    :font "JetBrains Mono"
                    :height 110
                    :weight 'medium)
;; Makes commented text and keywords italics.
;; This is working in emacsclient but not emacs.
;; Your font must have an italic face available.
(set-face-attribute 'font-lock-comment-face nil
                    :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
                    :slant 'italic)

;; This sets the default font on all graphical frames created after restarting Emacs.
;; Does the same thing as 'set-face-attribute default' above, but emacsclient fonts
;; are not right unless I also add this method of setting the default font.
(add-to-list 'default-frame-alist '(font . "JetBrains Mono-11"))

;; Uncomment the following line if line spacing needs adjusting.
(setq-default line-spacing 0.12)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

(use-package monokai-pro-theme
  :ensure t
  :config
  (load-theme 'monokai-pro t))

(use-package nerd-icons
  :if (display-graphic-p))

(use-package nerd-icons-dired
  :hook (dired-mode . (lambda () (nerd-icons-dired-mode t))))

(use-package nerd-icons-ibuffer
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package vertico
    :init
    (vertico-mode))

  (savehist-mode) ;; Enables save history mode

  (use-package marginalia
    :after vertico
    :init
    (marginalia-mode))

  (use-package nerd-icons-completion
    :after marginalia
    :config
    (nerd-icons-completion-mode)
    :hook
    ('marginalia-mode-hook . 'nerd-icons-completion-marginalia-setup))

  (use-package corfu
    ;; Optional customizations
    :custom
    (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
    (corfu-auto t)                 ;; Enable auto completion
    (corfu-auto-prefix 2)          ;; Minimum length of prefix for auto completion.
    (corfu-popupinfo-mode t)       ;; Enable popup information
    (corfu-popupinfo-delay 0.5)    ;; Lower popupinfo delay to 0.5 seconds from 2 seconds
    ;; (corfu-separator ?\s)          ;; Orderless field separator, Use M-SPC to enter separator
    ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
    ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
    ;; (corfu-preview-current nil)    ;; Disable current candidate preview
    ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
    ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
    ;; (corfu-scroll-margin 5)        ;; Use scroll margin
    (completion-ignore-case t)
    ;; Enable indentation+completion using the TAB key.
    ;; `completion-at-point' is often bound to M-TAB.
    (tab-always-indent 'complete)
    (corfu-preview-current nil) ;; Don't insert completion without confirmation
    ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
    ;; be used globally (M-/).  See also the customization variable
    ;; `global-corfu-modes' to exclude certain modes.
    :init
    (global-corfu-mode))

  (use-package nerd-icons-corfu
    :after corfu
    :init (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))
  
(use-package consult
  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)
  :config
  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key "M-.")
  ;; (setq consult-preview-key '("S-<down>" "S-<up>"))

  (setq consult-project-function #'consult--default-project--function)
  )

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package toc-org
  :commands toc-org-enable
  :init (add-hook 'org-mode-hook 'toc-org-enable))

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(electric-indent-mode -1)

(require 'org-tempo)

(use-package which-key
  :init
  (which-key-mode 1)
  :config
  (setq which-key-side-window-location 'bottom
        which-key-sort-order #'which-key-key-order-alpha
        which-key-sort-uppercase-first nil
        which-key-add-column-padding 1
        which-key-max-display-columns nil
        which-key-min-display-lines 6
        which-key-side-window-slot -10
        which-key-side-window-max-height 0.25
        which-key-idle-delay 0.8
        which-key-max-description-length 25
        which-key-allow-imprecise-window-fit t
        which-key-separator " → " ))

(use-package eat
  :hook ('eshell-load-hook #'eat-eshell-mode))

;; TODO

(use-package eglot
  :ensure nil
  :hook ((rust-mode)
         . eglot-ensure)
  :custom
  ;; Good default
  (eglot-events-buffer-size 0)
  (eglot-autoshutdown t)
  (eglot-report-progress nil)
  ;; Manual lsp servers
  :config
  (add-to-list 'eglot-server-programs
               `(rust-ts-mode . ("rust-analyzer" :initializationOptions ( :procMacro (:enable t) :cargo (:buildScripts (:enable t) :features "all"))))
               `(svelte-ts-mode . ("svelte-language-server")) ;; Adds our lua lsp server to eglot's server list
  )
)

(use-package treesit-auto
:custom
(treesit-auto-install 'prompt)
:functions global-treesit-auto-mode
:defines global-treesit-auto-modes
:preface
(defun my/ts-mode-p (mode)
  (let* ((mode-name (symbol-name mode)))
    (cond
     ((string-suffix-p "ts-mode" mode-name) t)
     (t nil))))

(defun my/bring-previous-mode-hooks ()
  (let ((mode-name (symbol-name major-mode)))
    (if (not (my/ts-mode-p major-mode))
        (error "Current mode does not contain -ts suffix: %s" mode-name)
      (let* (
             (non-ts-mode-name      (concat (string-remove-suffix "-ts" (string-remove-suffix "-mode" mode-name)) "-mode"))
             (non-ts-mode-hook-name (concat non-ts-mode-name "-hook")))

        (if (not (intern non-ts-mode-hook-name))
            (message "There is no hook list named %s" non-ts-mode-hook-name)
          (run-hooks (intern non-ts-mode-hook-name))
          (message "Ran hook for %s" non-ts-mode-hook-name))))))

(defun my/get-treesit-auto-modes ()
  "Extracts all available treesit auto modes"
  (unless global-treesit-auto-modes
    (error "global-treesit-auto-modes vartable does not exist, can't transfer hooks from non treesit modes"))  
  (seq-filter 'my/ts-mode-p global-treesit-auto-modes))

:config

(add-to-list 'treesit-auto-langs 'svelte)

(add-to-list 'treesit-auto-recipe-list
             (make-treesit-auto-recipe
              :lang 'svelte
              :ts-mode 'svelte-ts-mode
              :remap 'svelte-mode
              :url "https://github.com/Himujjal/tree-sitter-svelte"
              :source-dir "./src"
              :ext "\\.svelte\\'"))

(treesit-auto-add-to-auto-mode-alist 'all)
(global-treesit-auto-mode)

;; add lambda function hook to list of emacs hooks
(dolist (mode (my/get-treesit-auto-modes))
  (let* ((mode-name (symbol-name mode))
         (hook-name (concat mode-name "-hook")))
    (add-hook (intern hook-name) #'my/bring-previous-mode-hooks))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(treesit-auto eat which-key org-bullets toc-org rainbow-delimiters consult nerd-icons-corfu corfu nerd-icons-completion marginalia vertico nerd-icons-ibuffer nerd-icons-dired nerd-icons monokai-pro-theme general evil-collection evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
