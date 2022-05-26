;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Memyr")
(setq org-directory "~/Dropbox/org/")

(setq doom-theme 'doom-solarized-dark)
(custom-set-faces! '(region :background "#0a4959"))

(setq display-line-numbers-type t)
(setq scroll-margin 4)
(setq confirm-kill-emacs nil)
(setq evil-ex-substitute-global t)

;; spc spc to M-x
(map! :leader
      :desc "M-x"
      "SPC" 'execute-extended-command)


;; font
(setq doom-font (font-spec :family "Fira Code" :size 14)
      doom-big-font (font-spec :family "Fira Code" :size 24)
      doom-variable-pitch-font (font-spec :family "Overpass" :size 16)
      )

;; Treesitter
(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(add-hook! org-mode (mixed-pitch-mode 1))

(after! org
  (add-to-list 'org-file-apps '("\\.docx\\'" . default))
  (add-to-list 'org-file-apps '("\\.xlsx\\'" . default))
  (add-to-list 'org-file-apps '("\\.pdf\\'" . default))
  )

(after! org
  (setq org-babel-default-header-args:jupyter-python '((:kernel . "python3")
                                                       (:session . "py")
                                                       (:async . "yes")
                                                       (:exports . "none")
                                                       (:eval . "no-export")
                                                       ))

  ; images are set at 500 px
  (setq org-image-actual-width '(500))
  ; we like nesting
  (setq org-export-headline-levels 5)
  ; use _{sub} and ^{super} for sub/superscripts. _ and ^ is literal.
  (setq org-export-with-sub-superscripts nil)
  ; mark broken links in the export, but don't stop it
  (setq org-export-with-broken-links "mark")
  ; don't use toc
  (setq org-export-with-toc nil)
  ; don't create hidden auctex folders (keep a clean directory)
  (setq TeX-auto-save nil)

  (require 'ox-extra)
  (ox-extras-activate '(ignore-headlines))
  )

(use-package! org-make-toc
  :after org)
