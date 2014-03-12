;; For Ctrl-Tab cycling of buffers
(defun next-line-cycle ()
  "Go to next line. Go to first line if end is reached."
  (interactive)
  (revert-buffer)
  (if (= (line-number-at-pos) (count-lines (window-start) (window-end)))
      (backward-page)
    (forward-line)))
(defun ctrltab ()
  "List buffers and give it focus"
  (interactive)
  (if (string= "*Buffer List*" (buffer-name))
      (next-line-cycle)
    (progn (list-buffers)
       (switch-to-buffer "*Buffer List*")
       (delete-other-windows)
       (forward-line))))
(global-set-key [C-tab] 'ctrltab)

;; For backword word delete
(global-set-key (kbd "C-M-h") 'backward-kill-word)

;; Offset the number by two spaces to work around some weird fringe 
(setq linum-format " %3d ")

;; I hate tabs!
(setq-default indent-tabs-mode nil)
(add-hook 'after-change-major-mode-hook 
          '(lambda () 
             (setq-default indent-tabs-mode nil)
             (setq c-basic-indent 4)
             (setq tab-width 4)))

;; Disable toolbar
(tool-bar-mode 0)

;; Disabling bold fonts
(set-face-bold-p 'bold nil)

;; Disable the menubar for terminal
;;(menu-bar-mode -1)

;; Setting up Marmalade and gny and melpa
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; On enter new line and indent
(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'c-mode 'set-newline-and-indent)

;; Python Settings
(setq
 python-check-command "epylint"
 python-shell-interpreter "/usr/bin/ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "[0-9]+ > "
 python-shell-prompt-output-regexp "[0-9]+ < "
 python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; try to automagically figure out indentation
(setq py-smart-indentation t)

;; Automatically indent code after RET
(electric-indent-mode +1)

;; Have those awesome matching pairs
;;(electric-pair-mode t)

;; IDO mode.
(require 'ido)
(ido-mode t)
(ido-vertical-mode 1)

; Settings for enforcing to use UNIX endlines
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default default-buffer-file-coding-system 'utf-8-unix)

;; Keybinding to start the shell
(global-set-key (kbd "C-z") 'shell)

;; Open terminal in the current directory
(global-set-key (kbd "C-M-;")
                '(lambda ()
                   (interactive)
                   (shell-command
                    (format "open -a /Applications/iTerm.app --args %s"
                            default-directory))))

;; My Shortcuts
(global-set-key (kbd "C-S-f") 'speedbar-get-focus)

(require 'fill-column-indicator)
(setq-default fci-rule-column 80)
(setq-default fci-rule-color "#555555")

;; Eldoc mode for C
(setq c-eldoc-includes "`pkg-config glib-2.0 tokyocabinet --cflags` -I./ -I../ ")
(load "c-eldoc")
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

;; Line number
(require 'linum)
(line-number-mode 1)
(column-number-mode 1)
(global-linum-mode 1)

;; GUI specific settings
;; Load the customizations after an emacsclient startsup.
(defun disable-crappy-frames (&optional frame)
  "Disables scrollbars, toolbars and fringe while in graphical mode."
  (when (or window-system frame)
    ;; Setting the color scheme.
    ;; (load-theme 'oceanic t)

    ;; Highlighting current line
    (global-hl-line-mode 1)

    (set-face-italic-p 'italic nil)

    ;; Disabling the fringe
    (set-fringe-mode '(0 . 0))

    ;; Disable the scrollbar
    ;;(scroll-bar-mode -1)

    ;; Setting the default font
    ;;(set-default-font "Menlo-12")
    ;;(add-to-list 'default-frame-alist '(font . "Source Code Pro-14"))
    ;;(set-face-attribute 'default nil :height 150)
    ;;(set-face-attribute 'default nil :font "Liberation Mono 9")
    ))

(disable-crappy-frames)

;;(color-theme-select 'charcoal-black t t)
;;(enable-theme 'charcoal-black)

(Custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; If there is more than one, they won't work right.
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 305 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(default-frame-alist
    (quote
     ((menu-bar-lines . 0)
      (tool-bar-lines . 0)
      (foreground-color . "Black")
      (background-color . "White")
      (cursor-type . box)
      (cursor-color . "Red")
      (internal-border-width . 0)
      (fringe)
      (left-fringe . 0)
      (right-fringe . 0)
      (vertical-scroll-bars))))
 '(global-hl-line-mode t)
 '(ns-tool-bar-display-mode nil t)
 '(ns-tool-bar-size-mode nil t)
 '(visual-line-mode nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 305 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(default-frame-alist
    (quote
     ((tool-bar-lines . 0)
      (menu-bar-lines . 1)
      (foreground-color . "Black")
      (background-color . "White")
      (cursor-type . box)
      (cursor-color . "Red")
      (vertical-scroll-bars . right)
      (internal-border-width . 0)
      (fringe)
      (left-fringe . 0)
      (right-fringe . 0))))
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(ns-tool-bar-display-mode nil t)
 '(ns-tool-bar-size-mode nil t)
 '(visual-line-mode nil t))

