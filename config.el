(setq doom-font (font-spec :family "Fira Code" :size 15 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 15 :weight 'bold))

(setq-default mac-command-modifier 'control)
(setq-default mac-option-modifier 'meta)
(setq-default mac-control-modifier 'command)

; mapping all the right side keys
(setq-default mac-right-command-modifier 'control)
(setq-default mac-right-option-modifier 'meta)

(setq doom-theme 'doom-fairy-floss)

(setq org-directory "~/Documents/org/")
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq display-line-numbers nil)
(setq display-line-numbers-type nil)

(display-time-mode 1)
(display-battery-mode 1)

(map!  "C-x v c" #'vc-find-conflicted-file)
(map!  "M-s n" #'isearch-repeat-forward)
(map!  "M-s p" #'isearch-repeat-backward)

(setq browse-url-browser-function 'eww-browse-url)

(defun prefer-horizontal-split ()
  (set-variable 'split-height-threshold nil t)
  (set-variable 'split-width-threshold 40 t)) ; make this as low as needed
(add-hook 'markdown-mode-hook 'prefer-horizontal-split)

(evil-define-key 'normal peep-dired-mode-map (kbd "j") 'peep-dired-next-file)
(map!
  (:after dired
    (:map dired-mode-map
     "C-x i" #'peep-dired
     )))
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

;; (use-package emms
;;   :ensure t
;;   :config
;;   (require 'emms-setup)
;;   (require 'emms-info)
;;   (require 'emms-cue)
;;   (require 'emms-mode-line)
;;   (require 'emms-playing-time)
;;   (setq emms-source-file-default-directory "~/Music/")
;;   (setq emms-playlist-buffer-name "*Music*")
;;   (setq emms-info-asynchronously t)
;;   (unless (eq system-type 'windows-nt)
;;     (setq emms-source-file-directory-tree-function
;;           'emms-source-file-directory-tree-find))
;;   (emms-all)
;;   (emms-default-players)
;;   (emms-mode-line 1)
;;   (emms-playing-time 1))

(setq mastodon-instance-url "https://mastodon.technology")

(setq md4rd-subs-active '(archlinux commandline DistroTube DoomEmacs emacs freesoftware lbry linux linux4noobs linuxmasterrace linnuxquestions orgmode qutebrowser suckless Ubuntu unixporn UsabilityPorn vim xmonad))

(custom-set-variables
 '(elfeed-feeds
   (quote
    (("https://www.reddit.com/r/linux.rss" reddit linux)
     ("https://www.gamingonlinux.com/article_rss.php" gaming linux)
     ("https://hackaday.com/blog/feed/" hackaday linux)
     ("https://opensource.com/feed" opensource linux)
     ("https://linux.softpedia.com/backend.xml" softpedia linux)
     ("https://itsfoss.com/feed/" itsfoss linux)
     ("https://www.zdnet.com/topic/linux/rss.xml" zdnet linux)
     ("https://www.phoronix.com/rss.php" phoronix linux)
     ("http://feeds.feedburner.com/d0od" omgubuntu linux)
     ("https://www.computerworld.com/index.rss" computerworld linux)
     ("https://www.networkworld.com/category/linux/index.rss" networkworld linux)
     ("https://www.techrepublic.com/rssfeeds/topic/open-source/" techrepublic linux)
     ("https://betanews.com/feed" betanews linux)
     ("http://lxer.com/module/newswire/headlines.rss" lxer linux)
     ("https://distrowatch.com/news/dwd.xml" distrowatch linux)))))

(custom-set-faces
 )

(setq org-gcal-client-id "928920761867-j314hfqcd7qoqgdfnan9iiecal6p1cos.apps.googleusercontent.com"
      org-gcal-client-secret "4WFGzA_pqMIQwZIiQN6aNJdC"
      org-gcal-file-alist '(("bikashd@ivypods.com" .  "~/Documents/org/schedule.org")
                            ("bikash@ivypods.com" .  "~/Documents/org/task.org")))

(setq math-additional-units '(
  (GiB "1024 * MiB" "Giga Byte")

  (MiB "1024 * KiB" "Mega Byte")
  (KiB "1024 * B" "Kilo Byte")
  (B nil "Byte")
  (Gib "1024 * Mib" "Giga Bit")
  (Mib "1024 * Kib" "Mega Bit")
  (Kib "1024 * b" "Kilo Bit")
  (b "B / 8" "Bit")))
;; This resets calc's cache
(setq math-units-table nil)

; adding global-prettier-mode minor mode to all the major mode to add the support for prettier.
(add-hook 'after-init-hook #'global-prettier-mode)

(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
(setq-default display-line-numbers nil)

(setq ispell-personal-dictionary "/Users/bikashdas/.ispell")

(setq-default diary-file "~/diary")

(use-package! slack
  :commands (slack-start)
  :init
  (setq slack-buffer-emojify t) ;; if you want to enable emoji, default nil
  (setq slack-prefer-current-team t)
  :config
  (slack-register-team
   :name "ivypods"
   :default t
   :token "xoxs-770859170898-1533166054085-1554215523668-7bbaa18d7a5e2bf1eae169dff22a5b702992228bdcedaf10f13f63e447a66d53"
   :subscribed-channels '(tech-web tech-frontend tech-all)
   :full-and-display-names t) ;; My colleagues workspace for chat.
 (evil-define-key 'normal slack-info-mode-map
    ",u" 'slack-room-update-messages)
  (evil-define-key 'normal slack-mode-map
    ",c" 'slack-buffer-kill
    ",ra" 'slack-message-add-reaction
    ",rr" 'slack-message-remove-reaction
    ",rs" 'slack-message-show-reaction-users
    ",pl" 'slack-room-pins-list
    ",pa" 'slack-message-pins-add
    ",pr" 'slack-message-pins-remove
    ",mm" 'slack-message-write-another-buffer
    ",me" 'slack-message-edit
    ",md" 'slack-message-delete
    ",u" 'slack-room-update-messages
    ",2" 'slack-message-embed-mention
    ",3" 'slack-message-embed-channel
    "\C-n" 'slack-buffer-goto-next-message
    "\C-p" 'slack-buffer-goto-prev-message)
   (evil-define-key 'normal slack-edit-message-mode-map
    ",k" 'slack-message-cancel-edit
    ",s" 'slack-message-send-from-buffer
    ",2" 'slack-message-embed-mention
    ",3" 'slack-message-embed-channel))

(use-package! alert
  :commands (alert)
  :init
  (setq alert-default-style 'notifier))

(defun my-open-calendar ()
  (interactive)
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    (cfw:org-create-source "Green")  ; org-agenda source
    (cfw:org-create-file-source "cal" "/path/to/cal.org" "Cyan")  ; other org source
    (cfw:cal-create-source "Orange") ; diary source
    (cfw:ical-create-source "gcal" "https://..../basic.ics" "IndianRed") ; google calendar ICS
   )))

(setq +lookup-provider-url-alist (append  +lookup-provider-url-alist '(("Thesaurus.com" "https://thesaurus.com/browse/%s")
                                                                       ("MDN" "https://developer.mozilla.org/en-US/search?q=%s")
                                                                       ("DistroWatch" "https://www.distroWatch.com/table.php?distribution=%s"))))

;; add a particular minor mode to a file on open
(defun add-rainbow-mode-if-theme-file ()
  "This funciton decides whether 'rainbow-mode' should be added."
  (if (string= buffer-file-name "/Users/bikashdas/workspace/yc-frontend/src/styleguide/theme.ts")
      (rainbow-mode +1)))

(add-hook! 'typescript-mode-hook #'add-rainbow-mode-if-theme-file)

(setq browse-url-secondary-browser-function 'browse-url-default-macosx-browser)

(setq spotify-oauth2-client-secret "0a8c28bf834a4830b8afbd37f5a1ddc5")
(setq spotify-oauth2-client-id "7b61fb87fa1843f2897641fdd66aed83")

(map! :after neotree-mode
      :leader
      :n "z s" #'neotree-enter-vertical-split
      :n "z v" #'neotree-enter-horizontal-split)

(map! :leader
      :n "w N" #'+hydra/window-nav/body)

(add-hook 'writeroom-mode-enable-hook #'menu-bar--display-line-numbers-mode-relative)
(add-hook 'writeroom-mode-disable-hook #'menu-bar--display-line-numbers-mode-none)
