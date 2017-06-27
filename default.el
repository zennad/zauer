;;; default -- @matthewbauer’s Emacs config

;;; Commentary:

;;; This should be used in conjunction with Nixpkgs in config.

;;; Code:

(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

;; (setenv "NIX_REMOTE" "daemon")
(setenv "NIX_SSL_CERT_FILE" "/etc/ssl/certs/ca-bundle.crt")
(setenv "EDITOR" "emacsclient -nw")
;; (setenv "PATH" "~/.nix-profile/bin")
;; (setenv "MANPATH" "~/.nix-profile/share/man")

(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "SHELL" "/bin/bash")

(custom-set-variables
 '(ad-redefinition-action (quote accept))
 '(ag-executable "@ag@/bin/ag")
 '(apropos-do-all t)
 '(async-shell-command-buffer (quote new-buffer))
 '(auth-source-save-behavior t)
 '(auto-revert-check-vc-info t)
 '(auto-revert-use-notify t)
 '(auto-revert-verbose nil)
 '(auto-save-visited-file-name t)
 '(async-shell-command-buffer 'new-buffer)
 '(backward-delete-char-untabify-method (quote hungry))
 '(bm-buffer-persistence t)
 '(bm-restore-repository-on-load t)
 '(bm-cycle-all-buffers t)
 '(c-eldoc-includes "" t)
 '(comint-scroll-show-maximum-output nil)
 '(company-auto-complete nil)
 '(company-continue-commands
   (quote
    (not save-buffer save-some-buffers save-buffers-kill-terminal save-buffers-kill-emacs comint-previous-matching-input-from-input comint-next-matching-input-from-input)))
 '(company-idle-delay 0.5)
 '(company-minimum-prefix-length 2)
 '(company-occurrence-weight-function (quote company-occurrence-prefer-any-closest))
 '(company-tooltip-align-annotations t)
 '(company-tooltip-flip-when-above t)
 '(company-tooltip-limit 10)
 '(compilation-always-kill t)
 '(compilation-ask-about-save nil)
 '(compilation-auto-jump-to-first-error nil)
 '(compilation-environment '("TERM=xterm-256color"))
 '(completions-format (quote vertical))
 '(counsel-find-file-at-point t)
 '(counsel-mode-override-describe-bindings t)
 '(cperl-clobber-lisp-bindings t)
 '(cperl-continued-statement-offset 8)
 '(cperl-electric-keywords nil)
 '(cperl-electric-lbrace-space t)
 '(cperl-electric-linefeed nil)
 '(cperl-electric-parens nil)
 '(cperl-font-lock t)
 '(cperl-indent-level 4)
 '(cperl-info-on-command-no-prompt t)
 '(cperl-invalid-face nil)
 '(cperl-lazy-help-time 3)
 '(create-lockfiles nil)
 '(css-indent-offset 2)
 '(custom-buffer-done-kill t)
 '(create-lockfiles nil)
 '(debug-ignored-errors
   (quote
    ("^Invalid face:? " search-failed beginning-of-line beginning-of-buffer end-of-line end-of-buffer end-of-file buffer-read-only file-supersession mark-inactive user-error void-variable)))
 '(debug-on-signal t)
 '(dired-omit-verbose nil)
 '(dired-dwim-target t)
 '(dired-recursive-copies (quote always))
 '(dired-recursive-deletes (quote top))
 '(display-buffer-alist
   (\`
    (((\,
       (rx bos
           (or "*Flycheck errors*" "*Backtrace" "*Warnings" "*compilation" "*Help" "*less-css-compilation" "*Packages" "*magit-process" "*SQL" "*tldr")))
      (display-buffer-reuse-window display-buffer-in-side-window)
      (side . bottom)
      (reusable-frames . visible)
      (window-height . 0.33))
     ("." nil
      (reusable-frames . visible)))))
 '(display-buffer-reuse-frames t)
 '(dumb-jump-quiet t)
 '(dumb-jump-selector (quote ivy))
 '(enable-recursive-minibuffers t)
 '(epg-gpg-program "@gpg@/bin/gpg")
 '(epg-gpgconf-program "@gpg@/bin/gpgconf")
 '(epg-gpgsm-program "@gpg@/bin/gpgsm")
 '(erc-autoaway-idle-seconds 600)
 '(erc-autoaway-use-emacs-idle t)
 '(erc-autojoin-timing (quote ident))
 '(erc-fill-prefix "          ")
 '(erc-insert-timestamp-function (quote erc-insert-timestamp-left))
 '(erc-interpret-mirc-color t)
 '(erc-kill-buffer-on-part t)
 '(erc-kill-queries-on-quit t)
 '(erc-kill-server-buffer-on-quit t)
 '(erc-prompt (lambda nil (concat "[" (buffer-name) "]")))
 '(erc-prompt-for-nickserv-password nil)
 '(erc-prompt-for-password nil)
 '(erc-query-display (quote buffer))
 '(erc-server-coding-system (quote (utf-8 . utf-8)))
 '(erc-timestamp-format "%H:%M ")
 '(erc-timestamp-only-if-changed-flag nil)
 '(erc-track-exclude-types
   (quote
    ("JOIN" "NICK" "PART" "QUIT" "MODE" "324" "329" "332" "333" "353" "477")))
 '(erc-try-new-nick-p nil)
 '(eshell-banner-message "")
 '(eshell-buffer-maximum-lines 20000)
 '(eshell-buffer-shorthand t)
 '(eshell-cd-on-directory t)
 '(eshell-cmpl-autolist t)
 '(eshell-cmpl-cycle-completions nil)
 '(eshell-cmpl-cycle-cutoff-length 2)
 '(eshell-cmpl-ignore-case t)
 '(eshell-cp-interactive-query t)
 '(eshell-cp-overwrite-files nil)
 '(eshell-default-target-is-dot t)
 '(eshell-destroy-buffer-when-process-dies t)
 '(eshell-highlight-prompt nil)
 '(eshell-hist-ignoredups t)
 '(eshell-history-size 10000)
 '(eshell-list-files-after-cd t)
 '(eshell-ln-interactive-query t)
 '(eshell-mv-interactive-query t)
 '(eshell-output-filter-functions
   (quote
    (eshell-handle-ansi-color eshell-handle-control-codes eshell-watch-for-password-prompt eshell-truncate-buffer)))
 '(eshell-plain-echo-behavior nil)
 '(eshell-prompt-function (quote epe-theme-lambda) t)
 '(eshell-review-quick-commands t)
 '(eshell-rm-interactive-query t)
 '(eshell-visual-commands
   (quote
    ("vi" "screen" "top" "less" "more" "lynx" "ncftp" "pine" "tin" "trn" "elm"
     "nano" "nethack" "telnet" "emacs" "emacsclient" "htop" "w3m" "links" "lynx"
     "elinks" "irrsi" "mutt" "finch" "newsbeuter" "pianobar")))
 '(eshell-visual-options (quote (("git" "--paginate"))))
 '(eshell-visual-subcommands (quote (("git" "log" "diff" "show"))))
 '(eval-expression-debug-on-error t)
 '(explicit-bash-args (quote ("-c" "export EMACS= INSIDE_EMACS=; stty echo; bash")))
 '(explicit-shell-file-name "bash")
 '(expand-region-contract-fast-key "j")
 '(fased-completing-read-function (quote nil))
 '(fill-column 80)
 '(flycheck-check-syntax-automatically (quote (save idle-change mode-enabled)))
 '(flycheck-global-modes
   (quote
    (not erc-mode message-mode git-commit-mode view-mode outline-mode text-mode org-mode)))
 '(flycheck-idle-change-delay 0.8)
 '(flyspell-abbrev-p nil)
 '(flyspell-auto-correct nil)
 '(flyspell-highlight-properties nil)
 '(flyspell-incorrect-hook nil)
 '(flyspell-issue-welcome-flag nil)
 '(flyspell-use-meta-tab nil)
 '(fortune-dir "@fortune@/share/games/fortunes")
 '(fortune-file "@fortune@/share/games/fortunes/food")
 '(frame-title-format
   (quote
    ((:eval
      (if
          (buffer-file-name)
          (abbreviate-file-name
           (buffer-file-name))
        "%b")))) t)
 '(gc-cons-threshold 100000000)
 '(global-auto-revert-non-file-buffers t)
 '(hideshowvis-ignore-same-line nil)
 '(history-delete-duplicates t)
 '(history-length 20000)
 '(iedit-toggle-key-default nil)
 '(imenu-auto-rescan t)
 '(imap-ssl-program '("@gnutls@/bin/gnutls-cli --tofu -p %p %s"))
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(initial-major-mode (quote fundamental-mode))
 '(initial-scratch-message "")
 '(ispell-extra-args (quote ("--sug-mode=ultra")))
 '(ispell-silently-savep t)
 '(ispell-quietly t)
 '(ispell-program-name "@aspell@/bin/aspell")
 '(ivy-count-format "\"\"")
 '(ivy-display-style nil)
 '(ivy-minibuffer-faces nil)
 '(ivy-use-virtual-buffers t)
 '(jdee-server-dir "@jdeeserver@")
 '(jdee-ant-home "@ant@/lib/ant")
 '(jdee-ant-program "@ant@/bin/ant")
 '(jdee-ant-enable-find t) '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p nil)
 '(js2-mode-show-parse-errors nil)
 '(js2-mode-show-strict-warnings nil)
 '(js2-strict-missing-semi-warning nil)
 '(kill-do-not-save-duplicates t)
 '(kill-whole-line t)
 '(load-prefer-newer t)
 '(mac-command-key-is-meta t)
 '(mac-command-modifier 'meta)
 '(mac-option-key-is-meta nil)
 '(mac-option-modifier 'super)
 '(mac-right-option-modifier nil)
 '(mac-frame-tabbing t)
 '(mac-system-move-file-to-trash-use-finder t)
 '(magit-clone-set-remote\.pushDefault t)
 '(magit-completing-read-function 'ivy-completing-read)
 '(magit-delete-by-moving-to-trash t)
 '(magit-diff-options nil)
 '(magit-ediff-dwim-show-on-hunks t)
 '(magit-fetch-arguments nil)
 '(magit-highlight-trailing-whitespace nil)
 '(magit-highlight-whitespace nil)
 '(magit-mode-hook
   (quote
    (magit-load-config-extensions magit-xref-setup bug-reference-mode)))
 '(magit-no-confirm t)
 '(magit-process-connection-type nil)
 '(magit-process-find-password-functions (quote (magit-process-password-auth-source)))
 '(magit-process-popup-time 15)
 '(magit-push-always-verify nil)
 '(magit-revision-mode-hook (quote (bug-reference-mode)))
 '(magit-revision-show-gravatars (quote ("^Author:     " . "^Commit:
  ")))
 '(magit-save-repository-buffers (quote dontask))
 '(magit-stage-all-confirm nil)
 '(magit-unstage-all-confirm nil)
 '(make-backup-files nil)
 '(max-mini-window-height 4)
 '(minibuffer-auto-raise t)
 '(minibuffer-depth-indicate-mode t)
 '(minibuffer-electric-default-mode t)
 '(minibuffer-prompt-properties
   (quote
    (read-only t cursor-intangible t face minibuffer-prompt)))
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 4) ((control)))))
 '(network-security-level (quote medium))
 '(neo-theme 'arrow)
 '(next-error-recenter (quote (4)))
 '(nrepl-log-messages t)
 '(nsm-save-host-names t)
 '(parens-require-spaces t)
 '(parse-sexp-ignore-comments t)
 '(projectile-completion-system (quote ivy))
 '(projectile-enable-caching t)
 '(projectile-enable-idle-timer t)
 '(projectile-mode-line
   '(:eval (if (and (not (file-remote-p default-directory)) (projectile-project-p))
               (format " Projectile[%s]"
                       (projectile-project-name))
             "")))
 '(projectile-idle-timer-hook nil)
 '(projectile-ignored-project-function (quote file-remote-p))
 '(projectile-switch-project-action (quote projectile-dired))
 '(projectile-verbose nil)
 '(reb-re-syntax (quote string))
 '(require-final-newline t)
 '(resize-mini-windows t)
 '(ring-bell-function (quote ignore))
 '(ripgrep-executable "@ripgrep@/bin/rg")
 '(rtags-path "@rtags@/bin")
 '(rtags-completions-enabled t)
 '(rtags-display-result-backend (quote ivy))
 '(rtags-imenu-syntax-highlighting 10)
 '(ruby-insert-encoding-magic-comment nil)
 '(safe-local-variable-values
   (quote
    ((eval c-set-offset
           (quote access-label)
           (quote -))
     (eval c-set-offset
           (quote substatement-open)
           0)
     (eval c-set-offset
           (quote arglist-cont-nonempty)
           (quote +))
     (eval c-set-offset
           (quote arglist-cont)
           0)
     (eval c-set-offset
           (quote arglist-intro)
           (quote +))
     (eval c-set-offset
           (quote inline-open)
           0)
     (eval c-set-offset
           (quote defun-open)
           0)
     (eval c-set-offset
           (quote innamespace)
           0)
     (indicate-empty-lines . t))))
 '(same-window-buffer-names
   (quote
    ("*eshell*" "*shell*" "*mail*" "*inferior-lisp*" "*ielm*" "*scheme*")))
 '(save-abbrevs (quote silently))
 '(savehist-additional-variables (quote (search-ring regexp-search-ring)))
 '(savehist-autosave-interval 60)
 '(send-mail-function (quote smtpmail-send-it))
 '(sentence-end-double-space nil)
 '(sh-learn-basic-offset t)
 '(shell-completion-execonly nil)
 '(shell-input-autoexpand nil)
 '(sp-autoskip-closing-pair (quote always))
 '(sp-base-key-bindings (quote paredit))
 '(sp-hybrid-kill-entire-symbol nil)
 '(term-input-autoexpand t)
 '(term-input-ignoredups t)
 '(term-input-ring-file-name t)
 '(tls-checktrust t)
 '(tls-program '("@gnutls@/bin/gnutls-cli --tofu -p %p %h"))
 '(undo-limit 800000)
 '(uniquify-after-kill-buffer-p t)
 '(uniquify-ignore-buffers-re "^\\*")
 '(uniquify-separator "/")
 '(use-dialog-box nil)
 '(use-file-dialog nil)
 '(use-package-always-defer t)
 '(use-package-always-ensure nil)
 '(use-package-ensure-function (quote ignore))
 '(use-package-enable-imenu-support t)
 '(use-package-expand-minimally t)
 '(use-package-verbose nil)
 '(vc-allow-async-revert t)
 '(vc-command-messages t)
 '(vc-git-diff-switches (quote ("-w" "-U3")))
 '(view-read-only t)
 '(visible-bell nil)
 '(visible-cursor nil)
 '(whitespace-line-column 80)
 '(whitespace-auto-cleanup t)
 '(whitespace-line-column 110)
 '(whitespace-rescan-timer-time nil)
 '(whitespace-silent t)
 '(whitespace-style '(face trailing lines space-before-tab empty))
 '(yas-prompt-functions
   (quote
    (yas-ido-prompt yas-completing-prompt yas-no-prompt)))
 '(yas-triggers-in-field t)
 '(yas-wrap-around-region t))

;;
;; builtins
;;
(electric-pair-mode t)
(electric-quote-mode t)
(electric-indent-mode t)
(show-paren-mode 1)
;; (winner-mode t)
(which-function-mode t)
(blink-cursor-mode 0)
(save-place-mode 1)
(delete-selection-mode t)
(savehist-mode 1)
(column-number-mode t)
(global-auto-revert-mode t)
(when (and (fboundp 'menu-bar-mode) (not (eq system-type 'darwin))) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(display-time)
(auto-compression-mode t)
(prefer-coding-system 'utf-8)
(when (fboundp 'global-prettify-symbols-mode)
  (global-prettify-symbols-mode))
(temp-buffer-resize-mode 0)

(require 'server)
(when (not server-process)
  (server-start))

;; Enable emoji, and stop the UI from freezing when trying to display them.
(when (fboundp 'set-fontset-font)
  (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend))

;; Show trailing whitespace
;; But don't show trailing whitespace in SQLi, inf-ruby etc.
(dolist (hook '(special-mode-hook
                eshell-mode-hook
                eww-mode
                term-mode-hook
                comint-mode-hook
                compilation-mode-hook
                twittering-mode-hook
                minibuffer-setup-hook))
  (add-hook hook (lambda () (setq show-trailing-whitespace nil))))

(defmacro with-region-or-buffer (func)
  "When called with no active region, call FUNC on current buffer."
  `(defadvice ,func (before with-region-or-buffer activate compile)
     (interactive
      (if mark-active
          (list (region-beginning) (region-end))
        (list (point-min) (point-max))))))

(add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)

(defadvice ffap-file-at-point (after ffap-file-at-point-after-advice ())
  (if (string= ad-return-value "/")
      (setq ad-return-value nil)))
(ad-activate 'ffap-file-at-point)

(defvar ffap-file-at-point-line-number nil
  "Variable to hold line number from the last `ffap-file-at-point' call.")

(defadvice ffap-file-at-point (after ffap-store-line-number activate)
  "Search `ffap-string-at-point' for a line number pattern and
save it in `ffap-file-at-point-line-number' variable."
  (let* ((string (ffap-string-at-point)) ;; string/name definition copied from `ffap-string-at-point'
         (name
          (or (condition-case nil
                  (and (not (string-match "//" string)) ; foo.com://bar
                       (substitute-in-file-name string))
                (error nil))
              string))
         (line-number-string
          (and (string-match ":[0-9]+" name)
               (substring name (1+ (match-beginning 0)) (match-end 0))))
         (line-number
          (and line-number-string
               (string-to-number line-number-string))))
    (if (and line-number (> line-number 0))
        (setq ffap-file-at-point-line-number line-number)
      (setq ffap-file-at-point-line-number nil))))

(defadvice find-file-at-point (after ffap-goto-line-number activate)
  "If `ffap-file-at-point-line-number' is non-nil goto this line."
  (when ffap-file-at-point-line-number
    (with-no-warnings
      (goto-line ffap-file-at-point-line-number))
    (setq ffap-file-at-point-line-number nil)))

(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

(global-set-key (kbd "C-c D") 'delete-file-and-buffer)

;; unbind unused keys
(global-unset-key "\C-z") ; don’t suspend on C-z
(global-unset-key [?\s-p]) ; printing crashes occasionally

(windmove-default-keybindings 'meta) ; move using meta
(fset 'yes-or-no-p 'y-or-n-p) ; shorten y or n confirm

;; enable narrowing commands
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;; enabled change region case commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; enable erase-buffer command
(put 'erase-buffer 'disabled nil)

;; dired - reuse current buffer by pressing 'a'
(put 'dired-find-alternate-file 'disabled nil)

;; make executable after save
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(add-hook 'makefile-mode-hook 'indent-tabs-mode)

(defun run-command-in-new-frame (dir cmd &rest args)
  "Run inside DIR the command CMD with ARGS."
  (let* ((default-directory dir)
         (buffer (get-buffer-create (concat "*" cmd "*")))
         (proc (apply #'start-file-process cmd buffer
                      cmd args))
         (comint-mode-hook nil)
         (comint-scroll-show-maximum-output nil)
         )
    ;; (makunbound 'my-frame)
    ;; (set 'my-frame (make-frame))
    (set-process-query-on-exit-flag proc nil)
    ;; (switch-to-buffer buffer)
    ;; (display-buffer buffer '(nil (allow-no-window . t)))
    (pop-to-buffer buffer)
    (with-current-buffer buffer
      ;; (require 'shell)
      ;; (shell-mode)
      (comint-mode)
      (defun my-sentinel (process signal)
        (when (memq (process-status process) '(exit signal))
          ;; (kill-buffer (process-buffer process))
          (delete-frame my-frame)))
      ;; (set-process-sentinel proc 'my-sentinel)
      (set-process-filter proc 'comint-output-filter))))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(global-set-key (kbd "C-c C-e") 'eval-and-replace)


(defun window-toggle-split-direction ()
  "Switch window split from horizontally to vertically, or vice versa.

i.e. change right window to bottom, or change bottom window to right."
  (interactive)
  (let ((done))
    (dolist (dirs '((right . down) (down . right)))
      (unless done
        (let* ((win (selected-window))
               (nextdir (car dirs))
               (neighbour-dir (cdr dirs))
               (next-win (windmove-find-other-window nextdir win))
               (neighbour1 (windmove-find-other-window neighbour-dir win))
               (neighbour2 (if next-win (with-selected-window next-win
                                          (windmove-find-other-window neighbour-dir next-win)))))
          ;;(message "win: %s\nnext-win: %s\nneighbour1: %s\nneighbour2:%s" win next-win neighbour1 neighbour2)
          (setq done (and (eq neighbour1 neighbour2)
                          (not (eq (minibuffer-window) next-win))))
          (if done
              (let* ((other-buf (window-buffer next-win)))
                (delete-window next-win)
                (if (eq nextdir 'right)
                    (split-window-vertically)
                  (split-window-horizontally))
                (set-window-buffer (windmove-find-other-window neighbour-dir) other-buf))))))))

(defun kill-this-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(defalias 'eldoc-get-fnsym-args-string 'elisp-get-fnsym-args-string)

(global-set-key (kbd "C-x ~") (lambda () (interactive) (find-file "~")))
(global-set-key (kbd "C-x /") (lambda () (interactive) (find-file "/")))
(global-set-key (kbd "C-c l") 'browse-url-at-point)

(defun sort-package-declarations ()
  "Sort following package declarations alphabetically."
  (interactive)
  (cl-flet ((next-use-package
             () (if (re-search-forward "^(use-package " nil t)
                    (goto-char (match-beginning 0))
                  (goto-char (point-max)))))
    (sort-subr
     nil
     #'next-use-package
     #'(lambda ()
         (goto-char (line-end-position))
         (next-use-package))
     #'(lambda ()
         (re-search-forward "(use-package \\([A-Za-z0-9_+-]+\\)")
         (match-string 1)))))

(defun kill-matching-lines (regexp &optional rstart rend interactive)
  "Kill lines containing matches for REGEXP.

See `flush-lines' or `keep-lines' for behavior of this command.

If the buffer is read-only, Emacs will beep and refrain from deleting
the line, but put the line in the kill ring anyway.  This means that
you can use this command to copy text from a read-only buffer.
\(If the variable `kill-read-only-ok' is non-nil, then this won't
 even beep.)"
  (interactive
   (keep-lines-read-args "Kill lines containing match for regexp"))
  (let ((buffer-file-name nil)) ;; HACK for `clone-buffer'
    (with-current-buffer (clone-buffer nil nil)
      (let ((inhibit-read-only t))
        (keep-lines regexp rstart rend interactive)
        (kill-region (or rstart (line-beginning-position))
                     (or rend (point-max))))
      (kill-buffer)))
  (unless (and buffer-read-only kill-read-only-ok)
    ;; Delete lines or make the "Buffer is read-only" error.
    (flush-lines regexp rstart rend interactive)))

(defun toggle-window-split ()
  "Toggle window split from vertically to horizontally and vice versa."
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(define-key ctl-x-4-map "t" 'toggle-window-split)

(global-set-key (kbd "C-x 5 3") 'iconify-frame)

(add-hook 'comint-mode-hook (lambda ()
                              ;; (toggle-truncate-lines 1)
                              (make-local-variable 'jit-lock-defer-timer)
                              (set (make-local-variable 'jit-lock-defer-time) 0.25)
                              ))

(defun toggle-fullscreen ()
  "Toggle full screen."
  (interactive)
  (set-frame-parameter
   nil 'fullscreen
   (when (not (frame-parameter nil 'fullscreen)) 'maximized)))

(defvar get-buffer-compile-command (lambda (file) (cons file 1)))
(make-variable-buffer-local 'get-buffer-compile-command)

(setq-default compile-command "")

(defun compile-dwim (&optional arg)
  "Compile Do What I Mean.
    Compile using `compile-command'.
    When `compile-command' is empty prompt for its default value.
    With prefix C-u always prompt for the default value of
    `compile-command'.
    With prefix C-u C-u prompt for buffer local compile command with
    suggestion from `get-buffer-compile-command'.  An empty input removes
    the local compile command for the current buffer."
  (interactive "P")
  (cond
   ((and arg (> (car arg) 4))
    (let ((cmd (read-from-minibuffer
                "Buffer local compile command: "
                (funcall get-buffer-compile-command
                         (or (file-relative-name (buffer-file-name)) ""))
                nil nil 'compile-history)))
      (cond ((equal cmd "")
             (kill-local-variable 'compile-command)
             (kill-local-variable 'compilation-directory))
            (t
             (set (make-local-variable 'compile-command) cmd)
             (set (make-local-variable 'compilation-directory)
                  default-directory))))
    (when (not (equal compile-command ""))
      ;; `compile' changes the default value of
      ;; compilation-directory but this is a buffer local
      ;; compilation
      (let ((dirbak (default-value 'compilation-directory)))
        (compile compile-command)
        (setq-default compilation-directory dirbak))))
   ((or (and arg (<= (car arg) 4))
        (equal compile-command ""))
    (setq-default compile-command (read-from-minibuffer
                                   "Compile command: "
                                   (if (equal compile-command "")
                                       "make " compile-command)
                                   nil nil 'compile-history))
    (setq-default compilation-directory default-directory)
    (when (not (equal (default-value 'compile-command) ""))
      (compile (default-value 'compile-command))))
   (t
    (recompile))))

(global-set-key (kbd "<f5>") 'compile-dwim)

(require 'thingatpt)

(defun thing-at-point-goto-end-of-integer ()
  "Go to end of integer at point."
  (let ((inhibit-changing-match-data t))
    ;; Skip over optional sign
    (when (looking-at "[+-]")
      (forward-char 1))
    ;; Skip over digits
    (skip-chars-forward "[[:digit:]]")
    ;; Check for at least one digit
    (unless (looking-back "[[:digit:]]")
      (error "No integer here"))))
(put 'integer 'beginning-op 'thing-at-point-goto-end-of-integer)

(defun thing-at-point-goto-beginning-of-integer ()
  "Go to end of integer at point."
  (let ((inhibit-changing-match-data t))
    ;; Skip backward over digits
    (skip-chars-backward "[[:digit:]]")
    ;; Check for digits and optional sign
    (unless (looking-at "[+-]?[[:digit:]]")
      (error "No integer here"))
    ;; Skip backward over optional sign
    (when (looking-back "[+-]")
      (backward-char 1))))
(put 'integer 'beginning-op 'thing-at-point-goto-beginning-of-integer)

(defun thing-at-point-bounds-of-integer-at-point ()
  "Get boundaries of integer at point."
  (save-excursion
    (let (beg end)
      (thing-at-point-goto-beginning-of-integer)
      (setq beg (point))
      (thing-at-point-goto-end-of-integer)
      (setq end (point))
      (cons beg end))))
(put 'integer 'bounds-of-thing-at-point 'thing-at-point-bounds-of-integer-at-point)

(defun thing-at-point-integer-at-point ()
  "Get integer at point."
  (let ((bounds (bounds-of-thing-at-point 'integer)))
    (string-to-number (buffer-substring (car bounds) (cdr bounds)))))
(put 'integer 'thing-at-point 'thing-at-point-integer-at-point)

(defun increment-integer-at-point (&optional inc)
  "Increment integer at point by one.

With numeric prefix arg INC, increment the integer by INC amount."
  (interactive "p")
  (let ((inc (or inc 1))
        (n (thing-at-point 'integer))
        (bounds (bounds-of-thing-at-point 'integer)))
    (delete-region (car bounds) (cdr bounds))
    (insert (int-to-string (+ n inc)))))

(defun decrement-integer-at-point (&optional dec)
  "Decrement integer at point by one.

With numeric prefix arg DEC, decrement the integer by DEC amount."
  (interactive "p")
  (increment-integer-at-point (- (or dec 1))))

(global-set-key (kbd "C-c +") 'increment-integer-at-point)
(global-set-key (kbd "C-c =") 'increment-integer-at-point)
(global-set-key (kbd "C-c -") 'decrement-integer-at-point)

(defun font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.

This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'font-lock-comment-annotations)

(defconst pcmpl-git-commands
  '("add" "bisect" "branch" "checkout" "clone"
    "commit" "diff" "fetch" "grep"
    "init" "log" "merge" "mv" "pull" "push" "rebase"
    "reset" "rm" "show" "status" "tag" )
  "List of `git' commands")

(defvar pcmpl-git-ref-list-cmd "git for-each-ref refs/ --format='%(refname)'"
  "The `git' command to run to get a list of refs")

(defun pcmpl-git-get-refs (type)
  "Return a list of `git' refs filtered by TYPE"
  (with-temp-buffer
    (insert (shell-command-to-string pcmpl-git-ref-list-cmd))
    (goto-char (point-min))
    (let ((ref-list))
      (while (re-search-forward (concat "^refs/" type "/\\(.+\\)$") nil t)
        (add-to-list 'ref-list (match-string 1)))
      ref-list)))

(defun pcomplete/git ()
  "Completion for `git'"
  ;; Completion for the command argument.
  (pcomplete-here* pcmpl-git-commands)
  ;; complete files/dirs forever if the command is `add' or `rm'
  (cond
   ((pcomplete-match (regexp-opt '("add" "rm")) 1)
    (while (pcomplete-here (pcomplete-entries))))
   ;; provide branch completion for the command `checkout'.
   ((pcomplete-match "checkout" 1)
    (pcomplete-here* (pcmpl-git-get-refs "heads")))))

(defun endless/apostrophe (opening)
  "Insert ’ in prose or `self-insert-command' in code.
With prefix argument OPENING, insert ‘’ instead and
leave point in the middle.
Inside a code-block, just call `self-insert-command'."
  (interactive "P")
  (if (and (derived-mode-p 'org-mode)
           (org-in-block-p '("src" "latex" "html")))
      (call-interactively #'self-insert-command)
    (if (looking-at "['’][=_/\\*]?")
        (goto-char (match-end 0))
      (if (null opening)
          (insert "’")
        (insert "‘’")
        (forward-char -1)))))

(defvar lisp-modes '(emacs-lisp-mode
                     inferior-emacs-lisp-mode
                     ielm-mode
                     lisp-mode
                     inferior-lisp-mode
                     lisp-interaction-mode
                     slime-repl-mode))

(defvar lisp-mode-hooks
  (mapcar (function
           (lambda (mode)
             (intern
              (concat (symbol-name mode) "-hook"))))
          lisp-modes))

(defsubst hook-into-modes (func &rest modes)
  "Add hook to modes.
FUNC is run when MODES are loaded."
  (dolist (mode-hook modes) (add-hook mode-hook func)))

(use-package ace-jump-mode
  :bind ("C-c SPC" . ace-jump-mode))

(use-package ace-window
  :bind ("M-o" . ace-window))

(use-package ag
  :commands ag
  :bind ("C-?" . ag-project)
  )

(use-package aggressive-indent
  :commands aggressive-indent-mode
  :init
  (apply #'hook-into-modes 'aggressive-indent-mode lisp-mode-hooks))

(use-package align
  :bind (("M-["   . align-code)
         ("C-c [" . align-regexp))
  :commands align
  :preface
  (defun align-code (beg end &optional arg)
    (interactive "rP")
    (if (null arg)
        (align beg end)
      (let ((end-mark (copy-marker end)))
        (indent-region beg end-mark nil)
        (align beg end-mark)))))

(use-package ansi-color
  :preface
  ;; Compilation from Emacs
  (defun colorize-compilation-buffer ()
    "Colorize a compilation mode buffer."
    (interactive)
    ;; we don't want to mess with child modes such as grep-mode, ack, ag, etc
    (when (eq major-mode 'compilation-mode)
      (let ((inhibit-read-only t))
        (ansi-color-apply-on-region (point-min) (point-max)))))
  :init
  (add-hook 'compilation-filter-hook 'colorize-compilation-buffer))

(use-package apropospriate-theme
  :demand
  :config
  (load-theme 'apropospriate-dark t))

(use-package autodisass-java-bytecode)

(use-package bm
  :demand

  :config
  ;; Loading the repository from file when on start up.
  (add-hook' after-init-hook 'bm-repository-load)

  ;; Restoring bookmarks when on file find.
  (add-hook 'find-file-hooks 'bm-buffer-restore)

  ;; Saving bookmarks
  (add-hook 'kill-buffer-hook #'bm-buffer-save)

  ;; Saving the repository to file when on exit.
  ;; kill-buffer-hook is not called when Emacs is killed, so we
  ;; must save all bookmarks first.
  (add-hook 'kill-emacs-hook #'(lambda nil
                                 (bm-buffer-save-all)
                                 (bm-repository-save)))

  ;; The `after-save-hook' is not necessary to use to achieve persistence,
  ;; but it makes the bookmark data in repository more in sync with the file
  ;; state.
  (add-hook 'after-save-hook #'bm-buffer-save)

  ;; Restoring bookmarks
  (add-hook 'find-file-hooks   #'bm-buffer-restore)
  (add-hook 'after-revert-hook #'bm-buffer-restore)

  ;; The `after-revert-hook' is not necessary to use to achieve persistence,
  ;; but it makes the bookmark data in repository more in sync with the file
  ;; state. This hook might cause trouble when using packages
  ;; that automatically reverts the buffer (like vc after a check-in).
  ;; This can easily be avoided if the package provides a hook that is
  ;; called before the buffer is reverted (like `vc-before-checkin-hook').
  ;; Then new bookmarks can be saved before the buffer is reverted.
  ;; Make sure bookmarks is saved before check-in (and revert-buffer)
  (add-hook 'vc-before-checkin-hook #'bm-buffer-save)


  :bind (("<f2>" . bm-next)
         ("S-<f2>" . bm-previous)
         ("C-<f2>" . bm-toggle))
  )

(use-package buffer-move
  :bind
  (("<M-S-up>" . buf-move-up)
   ("<M-S-down>" . buf-move-down)
   ("<M-S-left>" . buf-move-left)
   ("<M-S-right>" . buf-move-right)))

(use-package cc-mode
  :mode (("\\.h\\(h?\\|xx\\|pp\\)\\'" . c++-mode)
         ("\\.m\\'"                   . c-mode)
         ("\\.c\\'"                   . c-mode)
         ("\\.cpp\\'"                 . c++-mode)
         ("\\.c++\\'"                 . c++-mode)
         ("\\.mm\\'"                  . c++-mode))
  :preface
  (defun my-paste-as-check ()
    (interactive)
    (save-excursion
      (insert "/*\n")
      (let ((beg (point)) end)
        (yank)
        (setq end (point-marker))
        (goto-char beg)
        (while (< (point) end)
          (forward-char 2)
          (insert "CHECK: ")
          (forward-line 1)))
      (insert "*/\n")))

  (defvar printf-index 0)

  (defun insert-counting-printf (arg)
    (interactive "P")
    (if arg
        (setq printf-index 0))
    (if t
        (insert (format "std::cerr << \"step %d..\" << std::endl;\n"
                        (setq printf-index (1+ printf-index))))
      (insert (format "printf(\"step %d..\\n\");\n"
                      (setq printf-index (1+ printf-index)))))
    (forward-line -1)
    (indent-according-to-mode)
    (forward-line))

  (defun my-c-mode-common-hook ()
    ;; (ggtags-mode 1)
    (hs-minor-mode 1)
    (hide-ifdef-mode 1)
    ;; (whitespace-mode 1)
    (which-function-mode 1)
    (company-mode 1)
    (bug-reference-prog-mode 1)

    (bind-key "<return>" #'newline-and-indent c-mode-base-map)

    (unbind-key "M-j" c-mode-base-map)
    (bind-key "C-c C-i" #'c-includes-current-file c-mode-base-map)
    (bind-key "C-c C-y" #'my-paste-as-check c-mode-base-map)

    (set (make-local-variable 'parens-require-spaces) nil)
    (setq indicate-empty-lines t)
    (setq fill-column 72)

    (bind-key "M-q" #'c-fill-paragraph c-mode-base-map)

    (let ((bufname (buffer-file-name)))
      (when bufname
        (cond
         ((string-match "/ledger/" bufname)
          (c-set-style "ledger"))
         ((string-match "/edg/" bufname)
          (c-set-style "edg"))
         (t
          (c-set-style "clang")))))

    (font-lock-add-keywords 'c++-mode '(("\\<\\(assert\\|DEBUG\\)("
                                         1 font-lock-warning-face t))))

  :config

  (use-package c-eldoc
    :commands c-turn-on-eldoc-mode
    :init
    (add-hook 'c-mode-common-hook 'c-turn-on-eldoc-mode)
    )

  (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

  (setq c-syntactic-indentation nil)

  (bind-key "#" #'self-insert-command c-mode-base-map)
  (bind-key "{" #'self-insert-command c-mode-base-map)
  (bind-key "}" #'self-insert-command c-mode-base-map)
  (bind-key "/" #'self-insert-command c-mode-base-map)
  (bind-key "*" #'self-insert-command c-mode-base-map)
  (bind-key ";" #'self-insert-command c-mode-base-map)
  (bind-key "," #'self-insert-command c-mode-base-map)
  (bind-key ":" #'self-insert-command c-mode-base-map)
  (bind-key "(" #'self-insert-command c-mode-base-map)
  (bind-key ")" #'self-insert-command c-mode-base-map)
  (bind-key "<" #'self-insert-command c++-mode-map)
  (bind-key ">" #'self-insert-command c++-mode-map)

  (add-to-list 'c-style-alist
               '("edg"
                 (indent-tabs-mode . nil)
                 (c-basic-offset . 2)
                 (c-comment-only-line-offset . (0 . 0))
                 (c-hanging-braces-alist
                  . ((substatement-open before after)
                     (arglist-cont-nonempty)))
                 (c-offsets-alist
                  . ((statement-block-intro . +)
                     (knr-argdecl-intro . 5)
                     (substatement-open . 0)
                     (substatement-label . 0)
                     (label . 0)
                     (case-label . +)
                     (statement-case-open . 0)
                     (statement-cont . +)
                     (arglist-intro . +)
                     (arglist-close . +)
                     (inline-open . 0)
                     (brace-list-open . 0)
                     (topmost-intro-cont
                      . (first c-lineup-topmost-intro-cont
                               c-lineup-gnu-DEFUN-intro-cont))))
                 (c-special-indent-hook . c-gnu-impose-minimum)
                 (c-block-comment-prefix . "")))

  (add-to-list 'c-style-alist
               '("ledger"
                 (indent-tabs-mode . nil)
                 (c-basic-offset . 2)
                 (c-comment-only-line-offset . (0 . 0))
                 (c-hanging-braces-alist
                  . ((substatement-open before after)
                     (arglist-cont-nonempty)))
                 (c-offsets-alist
                  . ((statement-block-intro . +)
                     (knr-argdecl-intro . 5)
                     (substatement-open . 0)
                     (substatement-label . 0)
                     (label . 0)
                     (case-label . 0)
                     (statement-case-open . 0)
                     (statement-cont . +)
                     (arglist-intro . +)
                     (arglist-close . +)
                     (inline-open . 0)
                     (brace-list-open . 0)
                     (topmost-intro-cont
                      . (first c-lineup-topmost-intro-cont
                               c-lineup-gnu-DEFUN-intro-cont))))
                 (c-special-indent-hook . c-gnu-impose-minimum)
                 (c-block-comment-prefix . "")))

  (add-to-list 'c-style-alist
               '("clang"
                 (indent-tabs-mode . nil)
                 (c-basic-offset . 2)
                 (c-comment-only-line-offset . (0 . 0))
                 (c-hanging-braces-alist
                  . ((substatement-open before after)
                     (arglist-cont-nonempty)))
                 (c-offsets-alist
                  . ((statement-block-intro . +)
                     (knr-argdecl-intro . 5)
                     (substatement-open . 0)
                     (substatement-label . 0)
                     (label . 0)
                     (case-label . 0)
                     (statement-case-open . 0)
                     (statement-cont . +)
                     (arglist-intro . +)
                     (arglist-close . +)
                     (inline-open . 0)
                     (brace-list-open . 0)
                     (topmost-intro-cont
                      . (first c-lineup-topmost-intro-cont
                               c-lineup-gnu-DEFUN-intro-cont))))
                 (c-special-indent-hook . c-gnu-impose-minimum)
                 (c-block-comment-prefix . ""))))

(use-package coffee-mode
  :mode (("\\.coffee\\'" . coffee-mode)))

(use-package company
  :bind ("<C-tab>" . company-complete)
  :diminish company-mode
  :commands (company-mode global-company-mode)
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-flx
  :after company
  :config
  (company-flx-mode +1))

(use-package compile
  :bind (("C-c c" . compile)
         ("M-O"   . show-compilation))
  :preface
  (defun show-compilation ()
    (interactive)
    (let ((compile-buf
           (catch 'found
             (dolist (buf (buffer-list))
               (if (string-match "\\*compilation\\*" (buffer-name buf))
                   (throw 'found buf))))))
      (if compile-buf
          (switch-to-buffer-other-window compile-buf)
        (call-interactively 'compile))))

  (defun compilation-ansi-color-process-output ()
    (ansi-color-process-output nil)
    (set (make-local-variable 'comint-last-output-start)
         (point-marker)))

  :config
  (add-hook 'compilation-filter-hook #'compilation-ansi-color-process-output))

(use-package counsel
  :commands (counsel-descbinds)
  :bind (([remap execute-extended-command] . counsel-M-x)
         ("<f1> f" . counsel-describe-function)
         ("<f1> v" . counsel-describe-variable)
         ("C-x C-f" . counsel-find-file)
         ("<f1> l" . counsel-find-library)
         ("C-c g" . counsel-git)
         ("C-c j" . counsel-git-grep)
         ("C-c k" . counsel-ag)
         ("C-x l" . counsel-locate)
	 ("M-y" . counsel-yank-pop)))

(use-package counsel-projectile
  :after projectile
  :config
  (counsel-projectile-toggle 1))

(use-package css-mode
  :mode "\\.css\\'"
  :commands css-mode
  :config
  (use-package rainbow-mode
    :commands rainbow-mode
    :init
    (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
      (add-hook hook 'rainbow-mode)))
  (use-package css-eldoc))

(use-package diff-hl
  :demand
  :commands global-diff-hl-mode
  :init (global-diff-hl-mode t)
  :config
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  )

(use-package diffview
  :commands (diffview-current diffview-region diffview-message))

(use-package dired
  :bind (("C-c J" . dired-double-jump))
  :preface
  (defvar mark-files-cache (make-hash-table :test #'equal))

  (defun mark-similar-versions (name)
    (let ((pat name))
      (if (string-match "^\\(.+?\\)-[0-9._-]+$" pat)
          (setq pat (match-string 1 pat)))
      (or (gethash pat mark-files-cache)
          (ignore (puthash pat t mark-files-cache)))))

  (defun dired-mark-similar-version ()
    (interactive)
    (setq mark-files-cache (make-hash-table :test #'equal))
    (dired-mark-sexp '(mark-similar-versions name)))

  (defun dired-double-jump (first-dir second-dir)
    (interactive
     (list (read-directory-name "First directory: "
                                (expand-file-name "~")
                                nil nil "dl/")
           (read-directory-name "Second directory: "
                                (expand-file-name "~")
                                nil nil "Archives/")))
    (dired first-dir)
    (dired-other-window second-dir))

  (defun my-dired-switch-window ()
    (interactive)
    (if (eq major-mode 'sr-mode)
        (call-interactively #'sr-change-window)
      (call-interactively #'other-window)))

  :config
  (define-key dired-mode-map (kbd "C-c C-c") 'compile)

  (bind-key "r" #'browse-url-of-dired-file dired-mode-map)

  (bind-key "l" #'dired-up-directory dired-mode-map)

  (bind-key "<tab>" #'my-dired-switch-window dired-mode-map)

  (bind-key "M-!" #'async-shell-command dired-mode-map)
  (unbind-key "M-G" dired-mode-map)

  (defadvice dired-next-line (around dired-next-line+ activate)
    "Replace current buffer if file is a directory."
    ad-do-it
    (while (and  (not  (eobp)) (not ad-return-value))
      (forward-line)
      (setq ad-return-value(dired-move-to-filename)))
    (when (eobp)
      (forward-line -1)
      (setq ad-return-value(dired-move-to-filename))))

  (defadvice dired-previous-line (around dired-previous-line+ activate)
    "Replace current buffer if file is a directory."
    ad-do-it
    (while (and  (not  (bobp)) (not ad-return-value))
      (forward-line -1)
      (setq ad-return-value(dired-move-to-filename)))
    (when (bobp)
      (call-interactively 'dired-next-line)))

  (defvar dired-omit-regexp-orig (symbol-function 'dired-omit-regexp))

  ;; Omit files that Git would ignore
  (defun dired-omit-regexp ()
    (let ((file (expand-file-name ".git"))
          parent-dir)
      (while (and (not (file-exists-p file))
                  (progn
                    (setq parent-dir
                          (file-name-directory
                           (directory-file-name
                            (file-name-directory file))))
                    ;; Give up if we are already at the root dir.
                    (not (string= (file-name-directory file)
                                  parent-dir))))
        ;; Move up to the parent dir and try again.
        (setq file (expand-file-name ".git" parent-dir)))
      ;; If we found a change log in a parent, use that.
      (if (file-exists-p file)
          (let ((regexp (funcall dired-omit-regexp-orig))
                (omitted-files
                 (shell-command-to-string "git clean -d -x -n")))
            (if (= 0 (length omitted-files))
                regexp
              (concat
               regexp
               (if (> (length regexp) 0)
                   "\\|" "")
               "\\("
               (mapconcat
                #'(lambda (str)
                    (concat
                     "^"
                     (regexp-quote
                      (substring str 13
                                 (if (= ?/ (aref str (1- (length str))))
                                     (1- (length str))
                                   nil)))
                     "$"))
                (split-string omitted-files "\n" t)
                "\\|")
               "\\)")))
        (funcall dired-omit-regexp-orig)))))

(use-package dired-x
  :commands dired-omit-mode
  :disabled
  :init
  ;; toggle `dired-omit-mode' with C-x M-o
  (add-hook 'dired-mode-hook 'dired-omit-mode)
  )

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config
  (dumb-jump-mode))

(use-package edebug
  :preface
  (defvar modi/fns-in-edebug nil
    "List of functions for which `edebug' is instrumented.")

  (defconst modi/fns-regexp
    (concat "(\\s-*"
            "\\(defun\\|defmacro\\)\\s-+"
            "\\(?1:\\(\\w\\|\\s_\\)+\\)\\_>") ; word or symbol char
    "Regexp to find defun or defmacro definition.")

  (defun modi/toggle-edebug-defun ()
    (interactive)
    (let (fn)
      (save-excursion
        (search-backward-regexp modi/fns-regexp)
        (setq fn (match-string 1))
        (mark-sexp)
        (narrow-to-region (point) (mark))
        (if (member fn modi/fns-in-edebug)
            ;; If the function is already being edebugged, uninstrument it
            (progn
              (setq modi/fns-in-edebug (delete fn modi/fns-in-edebug))
              (eval-region (point) (mark))
              (setq-default eval-expression-print-length 12)
              (setq-default eval-expression-print-level  4)
              (message "Edebug disabled: %s" fn))
          ;; If the function is not being edebugged, instrument it
          (progn
            (add-to-list 'modi/fns-in-edebug fn)
            (setq-default eval-expression-print-length nil)
            (setq-default eval-expression-print-level  nil)
            (edebug-defun)
            (message "Edebug: %s" fn)))
        (widen)))))

(use-package elpy
  :mode ("\\.py\\’" . elpy-mode)
  :config
  (elpy-enable)
  (elpy-use-ipython))

(use-package eldoc
  :init (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode))

(use-package emacs-lisp-mode
  :config
  (setq tab-always-indent 'complete)
  (add-to-list 'completion-styles 'initials t)
  :bind (("M-." . find-function-at-point)
         ("M-&" . complete-symbol))
  :interpreter (("emacs" . emacs-lisp-mode)))

(use-package erc
  :bind ("C-x r c" . erc)
  :defines (erc-timestamp-only-if-changed-flag
            erc-timestamp-format
            erc-fill-prefix
            erc-fill-column
            erc-insert-timestamp-function
            erc-modified-channels-alist))

(use-package esh-help
  :commands esh-help-eldoc-command
  :init
  (add-hook 'eshell-mode-hook 'eldoc-mode)
  (add-hook 'eshell-mode-hook
            (lambda ()
              (make-local-variable 'eldoc-documentation-function)
              (setq eldoc-documentation-function
                    'esh-help-eldoc-command))))

(use-package eshell
  :bind (("C-c s" . eshell-new))
  :commands (eshell eshell-command)
  :preface
  (defun eshell-new (&optional arg)
    (interactive)
    (setq-local eshell-buffer-name (concat "*eshell<" (expand-file-name default-directory) ">*"))
    (eshell arg))

  (defun eshell/emacs (&rest args)
    "Open a file in Emacs.  Some habits die hard.
ARGS unused"
    (if (null args)
        ;; If I just ran "emacs", I probably expect to be launching
        ;; Emacs, which is rather silly since I'm already in Emacs.
        ;; So just pretend to do what I ask.
        (bury-buffer)
      ;; We have to expand the file names or else weird stuff happens
      ;; when you try to open a bunch of different files in wildly
      ;; different places in the filesystem.
      (mapc #'find-file (mapcar #'expand-file-name args))))

  (defalias 'eshell/emacsclient 'eshell/emacs)

  (defun eshell/vi (&rest args)
    "Invoke `find-file' on the file.
\"vi +42 foo\" also goes to line 42 in the buffer.
ARGS unused"
    (while args
      (if (string-match "\\`\\+\\([0-9]+\\)\\'" (car args))
          (let* ((line (string-to-number (match-string 1 (pop args))))
                 (file (pop args)))
            (find-file file)
            (forward-line line))
        (find-file (pop args)))))

  ;; This is an eshell alias
  (defun eshell/clear ()
    (interactive)
    (let ((inhibit-read-only t))
      (erase-buffer))
    (eshell-send-input))

  (defun eshell-ls-find-file-at-point (point)
    "RET on Eshell's `ls' output to open files.
POINT ?"
    (interactive "d")
    (find-file (buffer-substring-no-properties
                (previous-single-property-change point 'help-echo)
                (next-single-property-change point 'help-echo))))

  (defvar eshell-isearch-map
    (let ((map (copy-keymap isearch-mode-map)))
      (define-key map [(control ?m)] 'eshell-isearch-return)
      (define-key map [return]       'eshell-isearch-return)
      (define-key map [(control ?r)] 'eshell-isearch-repeat-backward)
      (define-key map [(control ?s)] 'eshell-isearch-repeat-forward)
      (define-key map [(control ?g)] 'eshell-isearch-abort)
      (define-key map [backspace]    'eshell-isearch-delete-char)
      (define-key map [delete]       'eshell-isearch-delete-char)
      map)
    "Keymap used in isearch in Eshell.")

  :config
  (add-hook 'eshell-mode-hook
            (lambda ()
              (setenv "EDITOR" (concat "emacsclient -c -s " server-name))))

  (add-hook 'eshell-mode-hook (lambda ()
                                (defun eshell/cd (&optional dir)
                                  "Make cd just open dired."
                                  (interactive)
                                  (let* ((dir (if dir dir "~"))
                                         (default-directory (expand-file-name
                                                             (concat dir "/") default-directory))
                                         (buffer (get-buffer-create (concat "*eshell<" (expand-file-name default-directory) ">*"))))
                                    (pop-to-buffer-same-window buffer)
                                    (unless (derived-mode-p 'eshell-mode)
                                      (eshell-mode))))
                                ))

  (with-eval-after-load "esh-opt"
    (autoload 'epe-theme-lambda "eshell-prompt-extras")
    (setq eshell-prompt-function 'epe-theme-lambda))

  (setenv "PAGER" "cat")
  (setenv "EDITOR" "emacsclient -nq")

  ;; (defadvice eshell (before dotemacs activate)
  ;;   (setq eshell-banner-message (concat (shell-command-to-string "@fortune@/bin/fortune") "\n")))

  (add-hook 'eshell-mode-hook
            (lambda ()
              (define-key eshell-mode-map [(control ?u)] nil))))

(use-package expand-region
  :commands er/expand-region
  :config
  :bind (("C-c k" . er/expand-region)))

(use-package flycheck
  :demand
  :config (global-flycheck-mode))

(use-package flyspell
  :commands flyspell-mode
  :init
  (add-hook 'text-mode-hook 'flyspell-mode))

(use-package ghc)

(use-package gist
  :commands (gist-list gist-region gist-region-private gist-buffer
                       gist-buffer-private gist-region-or-buffer gist-region-or-buffer-private))

(use-package gnus
  :commands gnus
  :bind (("C-M-g" . gnus) ("C-x n u" . gnus))
  :init
  (add-hook 'kill-emacs-hook (lambda ()
                               (when (boundp 'gnus-group-exit)
				 (gnus-group-exit))))
  (add-hook 'gnus-group-mode-hook 'gnus-topic-mode))

(use-package go-eldoc
  :commands go-eldoc-setup
  :init
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package go-mode
  :mode "\\.go\\'")

(use-package grep
  :bind (("M-s d" . find-grep-dired)
         ("M-s F" . find-grep)
         ("M-s G" . grep))
  :config
  (grep-apply-setting 'grep-command "egrep -nH -e ")
  (grep-apply-setting
   'grep-find-command
   '("find . -type f -print0 | xargs -P4 -0 egrep -nH " . 49)))

(use-package gud
  :commands gud-gdb
  :bind ("C-. g" . show-debugger)
  :init
  (defun show-debugger ()
    (interactive)
    (let ((gud-buf
           (catch 'found
             (dolist (buf (buffer-list))
               (if (string-match "\\*gud-" (buffer-name buf))
                   (throw 'found buf))))))
      (if gud-buf
          (switch-to-buffer-other-window gud-buf)
        (call-interactively 'gud-gdb))))
  :config
  (bind-key "<f9>" #'gud-cont)
  (bind-key "<f10>" #'gud-next)
  (bind-key "<f11>" #'gud-step)
  (bind-key "S-<f11>" #'gud-finish))

(use-package haml-mode
  :mode "\\.haml\\'")

(use-package haskell-mode
  :mode "\\.hs\\'")

(use-package hideshow
  :commands (hs-minor-mode)
  :init
  (add-hook 'prog-mode-hook 'hs-minor-mode))

(use-package hideshowvis
  :commands (hideshowvis-minor-mode hideshowvis-symbols)
  :init
  ;; (add-hook 'prog-mode-hook 'hideshowvis-minor-mode)
  )

(use-package hydra
  :disabled
  :bind (("s-f" . hydra-projectile/body)
         ("C-x t" . hydra-toggle/body)
         ("C-M-o" . hydra-window/body))
  :config
  (hydra-add-font-lock)
  )

(use-package ibuffer
  :bind ("C-x b" . ibuffer))

(use-package iedit
  :bind (("C-;" . iedit-mode)
         :map help-map ("C-;" . iedit-mode-toggle-on-function)
         :map esc-map ("C-;" . iedit-mode-toggle-on-function)
         :map isearch-mode-map ("C-;" . iedit-mode-toggle-on-function)))

(use-package imenu-anywhere
  :init
  (bind-key "M"
            (if (featurep 'ivy) #'ivy-imenu-anywhere
              #'imenu-anywhere)
            search-map))

(use-package imenu-list
  :commands imenu-list)

(use-package indium
  :commands (indium-mode indium-interaction-mode indium-scratch))

(use-package intero
  :commands intero-mode
  :init (add-hook 'haskell-mode-hook 'intero-mode))

(use-package ispell)

(use-package ivy
  :demand
  :bind (("C-c C-r" . ivy-resume)
         ("<f6>" . ivy-resume)
         ("C-x C-b" . ivy-switch-buffer))
  :diminish ivy-mode
  :commands ivy-mode
  :config
  (bind-key "C-j" #'ivy-call ivy-minibuffer-map)
  (ivy-mode 1))

(use-package jdee)

(use-package realgud)

(use-package kill-or-bury-alive
  :bind (("C-x k" . kill-or-bury-alive)
         ("C-c r" . kill-or-bury-alive-purge-buffers)))

(use-package less-css-mode
  :mode "\\.json\\'"
  :commands less-css-mode)

(use-package lisp-mode
  :preface
  (defface esk-paren-face
    '((((class color) (background dark))
       (:foreground "grey50"))
      (((class color) (background light))
       (:foreground "grey55")))
    "Face used to dim parentheses."
    :group 'starter-kit-faces)

  (defvar slime-mode nil)
  (defvar lisp-mode-initialized nil)

  (defun my-lisp-mode-hook ()
    (unless lisp-mode-initialized
      (setq lisp-mode-initialized t)

      (use-package edebug
        :demand)

      (use-package eldoc
        :commands eldoc-mode
        :demand
        )

      (use-package elint
        :commands 'elint-initialize
        :preface
        (defun elint-current-buffer ()
          (interactive)
          (elint-initialize)
          (elint-current-buffer))

        :config
        (add-to-list 'elint-standard-variables 'current-prefix-arg)
        (add-to-list 'elint-standard-variables 'command-line-args-left)
        (add-to-list 'elint-standard-variables 'buffer-file-coding-system)
        (add-to-list 'elint-standard-variables 'emacs-major-version)
        (add-to-list 'elint-standard-variables 'window-system))

      (defun my-elisp-indent-or-complete (&optional arg)
        (interactive "p")
        (call-interactively 'lisp-indent-line)
        (unless (or (looking-back "^\\s-*")
                    (bolp)
                    (not (looking-back "[-A-Za-z0-9_*+/=<>!?]+")))
          (call-interactively 'lisp-complete-symbol)))

      (defun my-lisp-indent-or-complete (&optional arg)
        (interactive "p")
        (if (or (looking-back "^\\s-*") (bolp))
            (call-interactively 'lisp-indent-line)
          (call-interactively 'slime-indent-and-complete-symbol)))

      (defun my-byte-recompile-file ()
        (save-excursion
          (byte-recompile-file buffer-file-name))))

    (auto-fill-mode 1)
    (bind-key "<tab>" #'my-elisp-indent-or-complete emacs-lisp-mode-map)

    (add-hook 'after-save-hook 'check-parens nil t)

    (unless (memq major-mode
                  '(emacs-lisp-mode inferior-emacs-lisp-mode ielm-mode))
      (bind-key "M-q" #'slime-reindent-defun lisp-mode-map)
      (bind-key "M-l" #'slime-selector lisp-mode-map)))

  ;; Change lambda to an actual lambda symbol
  :init
  (mapc
   (lambda (major-mode)
     (font-lock-add-keywords
      major-mode
      '(("(\\(lambda\\)\\>"
         (0 (ignore
             (compose-region (match-beginning 1)
                             (match-end 1) ?λ))))
        ("(\\|)" . 'esk-paren-face)
        ("(\\(ert-deftest\\)\\>[         '(]*\\(setf[    ]+\\sw+\\|\\sw+\\)?"
         (1 font-lock-keyword-face)
         (2 font-lock-function-name-face
            nil t)))))
   lisp-modes)

  (apply #'hook-into-modes 'my-lisp-mode-hook lisp-mode-hooks))

(use-package lua-mode
  :mode "\\.lua\\'")

(use-package magit
  :commands (magit-clone)
  :bind (("C-x g" . magit-status)
         ("C-x G" . magit-dispatch-popup))
  )

(use-package markdown-mode
  :mode "\\.\\(md\\|markdown\\)\\'"
  :commands markdown-mode)

(use-package meghanada
  :disabled
  :init
  (add-hook 'java-mode-hook
            (lambda ()
              (meghanada-mode t)
              (smartparens-mode t)
              (rainbow-delimiters-mode t)
              ;; (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)
              ))

  :bind
  (:map meghanada-mode-map
        ("C-S-t" . meghanada-switch-testcase)
        ("M-RET" . meghanada-local-variable))

  :commands (meghanada-mode))

(use-package minimap
  :commands minimap-mode)

(use-package multi-line
  :bind (("C-c m" . multi-line)))

(use-package multiple-cursors
  :commands (mc/mark-next-like-this mc/mark-previous-like-this)
  :init
  (global-unset-key (kbd "M-<down-mouse-1>"))

  :bind
  (("<C-S-down>" . mc/mark-next-like-this) ;; broken by macOS
   ("<C-S-up>" . mc/mark-previous-like-this) ;; keybinds
   ("C->" . mc/mark-next-like-this)
   ("C-<" . mc/mark-previous-like-this)
   ("M-<mouse-1>" . mc/add-cursor-on-click)))

(use-package mwim
  :commands (mwim-beginning-of-code-or-line mwim-end-of-code-or-line)
  ;; :bind (("C-a" . mwim-beginning-of-code-or-line)
  ;;        ("C-e" . mwim-end-of-code-or-line))
  :init
  (global-set-key [remap move-beginning-of-line] #'mwim-beginning-of-code-or-line)
  (global-set-key [remap move-end-of-line] #'mwim-end-of-code-or-line)
  )

(use-package neotree
  :commands (neotree-show neotree-hide)
  :preface
  (defun neotree-project-dir-toggle ()
    "Open NeoTree using the project root, using find-file-in-project,
or the current buffer directory."
    (interactive)
    (let ((project-dir
           (ignore-errors
           ;;; Pick one: projectile or find-file-in-project
                                        ; (projectile-project-root)
             (ffip-project-root)))
          (file-name (buffer-file-name))
          (neo-smart-open t))
      (if (and (fboundp 'neo-global--window-exists-p)
               (neo-global--window-exists-p))
          (neotree-hide)
        (progn
          (neotree-show)
          (if project-dir
              (neotree-dir project-dir))
          (if file-name
              (neotree-find file-name))))))
  :bind (("<f8>" . neotree-project-dir-toggle))
  )

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package noflet
  :commands noflet
  :preface
  (defadvice org-capture-finalize
      (after delete-capture-frame activate)
    "Advise capture-finalize to close the frame"
    (if (equal "capture" (frame-parameter nil 'name))
        (delete-frame)))

  (defadvice org-capture-destroy
      (after delete-capture-frame activate)
    "Advise capture-destroy to close the frame"
    (if (equal "capture" (frame-parameter nil 'name))
        (delete-frame)))

  (defun make-capture-frame ()
    "Create a new frame and run org-capture."
    (interactive)
    (make-frame '((name . "capture")))
    (select-frame-by-name "capture")
    (delete-other-windows)
    (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
            (org-capture)))
  )

(use-package org
  ;; :mode "\\.\\(org\\)\\'"
  :commands org-capture
  :init
  (add-hook 'org-mode-hook 'auto-fill-mode)
  (global-set-key (kbd "C-c c")
                  'org-capture)
  )

(use-package org-bullets
  :commands org-bullets-mode
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package origami
  :disabled
  :commands origami-mode
  :init
  (add-hook 'prog-mode-hook 'origami-mode))

(use-package page-break-lines
  :commands page-break-lines-mode
  :init
  (add-hook 'doc-mode-hook 'page-break-lines-mode)
  (add-hook 'help-mode-hook 'page-break-lines-mode)
  (add-hook 'help-mode-hook 'emacs-lisp-mode))

(use-package php-mode
  :mode "\\.php\\'")

(use-package projectile
  :demand
  :bind-keymap ("C-c p" . projectile-command-map)
  :config

  (projectile-global-mode)

  (require 'easymenu)

  (easy-menu-define projectile-menu projectile-mode-map "Projectile"
    '("Projectile"
      :active projectile-project-p
      :visible projectile-project-p
      ["Find file" projectile-find-file]
      ["Find file in known projects" projectile-find-file-in-known-projects]
      ["Find test file" projectile-find-test-file]
      ["Find directory" projectile-find-dir]
      ["Find file in directory" projectile-find-file-in-directory]
      ["Find other file" projectile-find-other-file]
      ["Switch to buffer" projectile-switch-to-buffer]
      ["Jump between implementation file and test file" projectile-toggle-between-implementation-and-test]
      ["Kill project buffers" projectile-kill-buffers]
      ["Recent files" projectile-recentf]
      ["Edit .dir-locals.el" projectile-edit-dir-locals]
      "--"
      ["Open project in dired" projectile-dired]
      ["Switch to project" projectile-switch-project]
      ["Switch to open project" projectile-switch-open-project]
      ["Discover projects in directory" projectile-discover-projects-in-directory]
      ["Search in project (grep)" projectile-grep]
      ["Search in project (ag)" projectile-ag]
      ["Replace in project" projectile-replace]
      ["Multi-occur in project" projectile-multi-occur]
      ["Browse dirty projects" projectile-browse-dirty-projects]
      "--"
      ["Run shell" projectile-run-shell]
      ["Run eshell" projectile-run-eshell]
      ["Run term" projectile-run-term]
      "--"
      ["Cache current file" projectile-cache-current-file]
      ["Invalidate cache" projectile-invalidate-cache]
      ["Regenerate [e|g]tags" projectile-regenerate-tags]
      "--"
      ["Compile project" projectile-compile-project]
      ["Test project" projectile-test-project]
      ["Run project" projectile-run-project]
      "--"
      ["Project info" projectile-project-info]
      ["About" projectile-version]
      )
    )
  )

(use-package python-mode
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :config
  (defvar python-mode-initialized nil)

  (defun my-python-mode-hook ()
    (setq indicate-empty-lines t)
    (set (make-local-variable 'parens-require-spaces) nil)
    (setq indent-tabs-mode nil)

    (bind-key "C-c C-z" #'python-shell python-mode-map)
    (unbind-key "C-c c" python-mode-map))

  (add-hook 'python-mode-hook 'my-python-mode-hook))

(use-package rainbow-delimiters
  :commands rainbow-delimiters-mode
  :init
  (apply #'hook-into-modes 'rainbow-delimiters-mode lisp-mode-hooks))

(use-package restart-emacs
  :commands restart-emacs)

(use-package rg
  :commands rg)

(use-package rtags
  :commands (rtags-start-process-unless-running rtags-enable-standard-keybindings)
  :init

  ;; Start rtags upon entering a C/C++ file
  (add-hook
   'c-mode-common-hook
   (lambda () (if (not (is-current-file-tramp))
             (rtags-start-process-unless-running))))
  (add-hook
   'c++-mode-common-hook
   (lambda () (if (not (is-current-file-tramp))
             (rtags-start-process-unless-running))))

  :config
  ;; Keybindings
  (rtags-enable-standard-keybindings c-mode-base-map "\C-cr"))

(use-package ruby-mode
  :mode ("\\.rb\\'" . ruby-mode)
  :interpreter ("ruby" . ruby-mode)
  :config
  (defun my-ruby-smart-return ()
    (interactive)
    (when (memq (char-after) '(?\| ?\" ?\'))
      (forward-char))
    (call-interactively 'newline-and-indent))

  (defun my-ruby-mode-hook ()
    (require 'inf-ruby)
    (inf-ruby-keys)
    (bind-key "<return>" #'my-ruby-smart-return ruby-mode-map)
    (bind-key "C-h C-i" #'helm-yari ruby-mode-map))

  (add-hook 'ruby-mode-hook 'my-ruby-mode-hook))

(use-package rust-mode
  :mode "\\.rs\\'")

(use-package sass-mode
  :mode "\\.sass\\'")

(use-package scss-mode
  :mode "\\.scss\\'")

(use-package sh-script
  :mode (("\\.*bashrc$" . sh-mode)
         ("\\.*bash_profile" . sh-mode)))

(use-package shell
  :commands (shell shell-mode)
  :bind ("C-c C-s" . shell)
  :init
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  (setenv "PAGER" "cat")
  (setenv "TERM" "xterm-256color")

  (setenv "EDITOR" "emacsclient -nq")
  (setenv "LC_ALL" "C")
  (setenv "LANG" "en")

  :config
  (defun make-shell-command-behave-interactively (orig-fun &rest args)
    (let ((shell-command-switch "-ic"))
      (apply orig-fun args)))
  (advice-add 'shell-command :around #'make-shell-command-behave-interactively)
  (advice-add 'start-process-shell-command :around #'make-shell-command-behave-interactively))

(use-package shell-script-mode
  :commands shell-script-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode)))

(use-package smart-hungry-delete
  :commands smart-hungry-delete-add-default-hooks
  :bind (:map prog-mode-map
              ("<backspace>" . smart-hungry-delete-backward-char)
              ("C-d" . smart-hungry-delete-forward-char))
  :init (smart-hungry-delete-add-default-hooks)
  )

(use-package smart-tabs-mode
  :init
  (add-hook 'prog-mode-hook 'smart-tabs-mode)
  :commands smart-tabs-mode)

(use-package smartparens
  :commands smartparens-mode
  :init
  (apply #'hook-into-modes 'smartparens-mode lisp-mode-hooks)
  (add-hook 'eval-expression-minibuffer-setup-hook #'smartparens-mode)
  :config
  (require 'smartparens-config)
  (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)
  (show-smartparens-mode +1))

(use-package swiper
  :bind (("\C-s" . swiper)
         ("\C-r" . swiper)))

(use-package term
  :preface
  (defun my-term ()
    (interactive)
    (set-buffer (make-term "my-term" "bash"))
    (term-mode)
    (term-line-mode)
    (term-set-escape-char ?\C-x)
    (switch-to-buffer "*my-term*"))
  :bind ("C-c t" . my-term)
  :init
  (defadvice ansi-term (before force-bash)
    (interactive (list explicit-shell-file-name)))
  (ad-activate 'ansi-term)

  (defadvice term (before force-bash)
    (interactive (list explicit-shell-file-name)))
  (ad-activate 'term)

  (defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
    (if (memq (process-status proc) '(signal exit))
        (let ((buffer (process-buffer proc)))
          ad-do-it
          (kill-buffer buffer))
      ad-do-it))
  (ad-activate 'term-sentinel)

  (defun my-term-paste (&optional string)
    (interactive)
    (process-send-string
     (get-buffer-process (current-buffer))
     (if string string (current-kill 0))))

  (defun remote-term (new-buffer-name cmd &rest switches)
    (setq term-ansi-buffer-name (concat "*" new-buffer-name "*"))
    (setq term-ansi-buffer-name (generate-new-buffer-name term-ansi-buffer-name))
    (setq term-ansi-buffer-name (apply 'make-term term-ansi-buffer-name cmd nil switches))
    (set-buffer term-ansi-buffer-name)
    (term-mode)
    (term-char-mode)
    (term-set-escape-char ?\C-x)
    (switch-to-buffer term-ansi-buffer-name))

  (defun nethack ()
    (interactive)
    (set-buffer (make-term "nethack" "@nethack@/bin/nethack"))
    (term-mode)
    (term-char-mode)
    (term-set-escape-char ?\C-x)
    (switch-to-buffer "*nethack*"))

  (defun my-term-hook ()
    (goto-address-mode)
    (define-key term-raw-map "\C-y" 'my-term-paste))
  (add-hook 'term-mode-hook 'my-term-hook))

(use-package tern
  :commands tern-mode
  :init
  (add-hook 'term-mode-hook (lambda () (linum-mode -1)))
  (add-hook 'js2-mode-hook 'tern-mode))

(use-package toc-org
  :commands toc-org-enable
  :init
  (add-hook 'org-mode-hook 'toc-org-enable))

(use-package tramp
  :demand
  :config
  (defadvice pcomplete (around avoid-remote-connections activate)
    (let ((file-name-handler-alist (copy-alist file-name-handler-alist)))
      (setq file-name-handler-alist
            (delete (rassoc 'tramp-completion-file-name-handler
                            file-name-handler-alist) file-name-handler-alist))
      ad-do-it))

  (add-to-list 'tramp-default-proxies-alist
               '(nil "\\`root\\'" "/ssh:%h:"))
  (add-to-list 'tramp-default-proxies-alist
               '((regexp-quote (system-name)) nil nil))
  (set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))
  (defvar sudo-tramp-prefix
    "/sudo:"
    (concat "Prefix to be used by sudo commands when building tramp path "))
  (defun sudo-file-name (filename)
    (set 'splitname (split-string filename ":"))
    (if (> (length splitname) 1)
        (progn (set 'final-split (cdr splitname))
               (set 'sudo-tramp-prefix "/sudo:")
               )
      (progn (set 'final-split splitname)
             (set 'sudo-tramp-prefix (concat sudo-tramp-prefix "root@localhost:")))
      )
    (set 'final-fn (concat sudo-tramp-prefix (mapconcat (lambda (e) e) final-split ":")))
    (message "splitname is %s" splitname)
    (message "sudo-tramp-prefix is %s" sudo-tramp-prefix)
    (message "final-split is %s" final-split)
    (message "final-fn is %s" final-fn)
    (message "%s" final-fn)
    )

  (defun sudo-find-file (filename &optional wildcards)
    "Calls find-file with filename with sudo-tramp-prefix prepended"
    (interactive "fFind file with sudo ")
    (let ((sudo-name (sudo-file-name filename)))
      (apply 'find-file
             (cons sudo-name (if (boundp 'wildcards) '(wildcards))))))

  (defun sudo-reopen-file ()
    "Reopen file as root by prefixing its name with sudo-tramp-prefix and by clearing buffer-read-only"
    (interactive)
    (let*
        ((file-name (expand-file-name buffer-file-name))
         (sudo-name (sudo-file-name file-name)))
      (setq buffer-file-name sudo-name)
      (rename-buffer sudo-name)
      (setq buffer-read-only nil)
      (message (concat "File name set to " sudo-name))))

  ;;(global-set-key (kbd "C-c o") 'sudo-find-file)
  (global-set-key (kbd "C-c o s") 'sudo-reopen-file)

  (defun sudo-edit-current-file ()
    (interactive)
    (let ((position (point)))
      (find-alternate-file
       (if (file-remote-p (buffer-file-name))
           (let ((vec (tramp-dissect-file-name (buffer-file-name))))
             (tramp-make-tramp-file-name
              "sudo"
              (tramp-file-name-user vec)
              (tramp-file-name-host vec)
              (tramp-file-name-localname vec)))
         (concat "/sudo:root@localhost:" (buffer-file-name))))
      (goto-char position)))

  (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
  (defun is-current-file-tramp ()
    "Is the current file in a tramp remote setup?"
    (tramp-tramp-file-p (buffer-file-name (current-buffer))))
  )

(use-package transpose-frame
  :bind ("C-x t" . transpose-frame))

(use-package web-mode
  :mode ("\\.html\\'" "\\.jsp\\'"))

(use-package which-key
  :demand
  :diminish which-key-mode
  :config (which-key-mode))

(use-package whitespace
  :defines (whitespace-auto-cleanup
            whitespace-rescan-timer-time
            whitespace-silent)
  :preface
  (defun normalize-file ()
    (interactive)
    (save-excursion
      (goto-char (point-min))
      (whitespace-cleanup)
      (delete-trailing-whitespace)
      (goto-char (point-max))
      (delete-blank-lines)
      (set-buffer-file-coding-system 'unix)
      (goto-char (point-min))
      (while (re-search-forward "\r$" nil t)
        (replace-match ""))
      (set-buffer-file-coding-system 'utf-8)
      (let ((require-final-newline t))
        (save-buffer))))

  (defun maybe-turn-on-whitespace ()
    "Depending on the file, maybe clean up whitespace."
    (let ((file (expand-file-name ".clean"))
          parent-dir)
      (while (and (not (file-exists-p file))
                  (progn
                    (setq parent-dir
                          (file-name-directory
                           (directory-file-name
                            (file-name-directory file))))
                    ;; Give up if we are already at the root dir.
                    (not (string= (file-name-directory file)
                                  parent-dir))))
        ;; Move up to the parent dir and try again.
        (setq file (expand-file-name ".clean" parent-dir)))
      ;; If we found a change log in a parent, use that.
      (when (and (file-exists-p file)
                 (not (file-exists-p ".noclean"))
                 (not (and buffer-file-name
                           (string-match "\\.texi\\'" buffer-file-name))))
        (add-hook 'write-contents-hooks
                  #'(lambda () (ignore (whitespace-cleanup))) nil t)
        (whitespace-cleanup))))

  :init
  (add-hook 'find-file-hooks 'maybe-turn-on-whitespace t)

  :config
  (remove-hook 'find-file-hooks 'whitespace-buffer)
  (remove-hook 'kill-buffer-hook 'whitespace-buffer)
  )

(use-package whitespace-cleanup-mode
  :commands whitespace-cleanup-mode
  :init
  (add-hook 'prog-mode-hook 'whitespace-cleanup-mode))

(use-package wrap-region
  :disabled
  :diminish wrap-region-mode
  :commands wrap-region-mode
  :init
  (add-hook 'prog-mode-hook 'wrap-region-mode)
  :config
  (wrap-region-add-wrappers
   '(("$" "$")
     ("/" "/" nil ruby-mode)
     ("/* " " */" "#" (java-mode javascript-mode css-mode c-mode c++-mode))
     ("`" "`" nil (markdown-mode ruby-mode shell-script-mode)))))

(use-package xterm-color
  :demand
  :config
  (setenv "TERM" "xterm-256color")
  ;; Comint and Shell
  (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
  (setq comint-output-filter-functions (remove 'ansi-color-process-output comint-output-filter-functions))

  (add-hook 'compilation-start-hook
            (lambda (proc)
              ;; We need to differentiate between compilation-mode buffers
              ;; and running as part of comint (which at this point we assume
              ;; has been configured separately for xterm-color)
              (when (eq (process-filter proc) 'compilation-filter)
                ;; This is a process associated with a compilation-mode buffer.
                ;; We may call `xterm-color-filter' before its own filter function.
                (set-process-filter
                 proc
                 (lambda (proc string)
                   (funcall 'compilation-filter proc
                            (xterm-color-filter string)))))))
  )

(use-package yafolding
  :disabled
  :commands (yafolding-mode)
  :init (add-hook 'prog-mode-hook 'yafolding-mode))

(use-package yaml-mode
  :mode "\\.yaml\\'")

(use-package try)

(use-package counsel-dash)

(provide 'default)
;;; default.el ends here
