;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Abishek Goda"
      user-mail-address "abishek.goda@hey.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-variable-pitch-font (font-spec :family "Helvetica" :size 14)
      doom-font (font-spec :family "JetBrains Mono" :size 13))
;;      doom-variable-pitch-font (font-spec :family "Roboto Mono" :size 13))
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-vibrant)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Notes/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; start maximized
(doom-load-envvars-file "~/.emacs.d/.local/env")
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-hook 'org-mode-hook #'+org-pretty-mode #'mixed-pitch-mode)
(setq global-org-pretty-table-mode t)

;; (setq exec-path (append exec-path '("/usr/local/bin" "/Users/abishek/.pyenv/shims" "/Applications/Emacs.app/Contents/MacOS" "/Library/TeX/texbin/" "/Users/abishek/.nvm/versions/node/v14.15.1/bin/")))
(add-hook 'python-mode-hook 'pyenv-mode)
(add-hook 'python-mode-hook 'poetry-tracking-mode)
(add-hook 'python-mode-hook 'blacken-mode)
(setq blacken-only-if-project-is-blackened t)
(setq projectile-project-search-path '("~/Projects/"))
(setq projectile-switch-project-action #'treemacs)
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq lsp-python-ms-executable
      "~/scratch/python-language-server/output/bin/Release/osx-x64/publish/Microsoft.Python.LanguageServer")
(add-hook 'hack-local-variables-hook
          (lambda()
            (when (derived-mode-p 'python-mode)
              (require 'lsp-pyright)
              (lsp))))
;(use-package! lsp-jedi
;  :ensure t
;  :config
;  (with-eval-after-load "lsp-mode"
;    (add-to-list 'lsp-disabled-clients 'pyls)
;    (add-to-list 'lsp-enabled-clients '
