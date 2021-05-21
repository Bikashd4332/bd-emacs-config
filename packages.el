;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)

;; -*- no-byte-compile: t; -*-
;;; packages.el


; TODO: willing to add support for jira.
;; (package! ejira
;;   :recipe (:host github :repo "nyyManni/ejira"
;;            :files ("*.el" "LICENSE" "README.org")))

; for displaying a unicode charachter to mark start of bullet.
(package! org-bullets
  :recipe (:host github :repo "sabof/org-bullets"
           :files ("org-bullets.el")))

; For code formating.
(package! prettier
  :recipe (:host github :repo "jscheid/prettier.el"))

;; for ease access of channels/ threads/ DMs.
;; below are all the dependencies for emacs-slack. Hence they are installed first.
(package! helm-slack
  :recipe (:host github :repo "yuya373/helm-slack"
           :files ("helm-slack.el")))

(package! alert
  :recipe (:host github :repo "jwiegley/alert"
           :files ("alert.el")))

(package! oauth2
  :recipe (:host github :repo "emacsmirror/oauth2"
           :files ("oauth2.el")))

(package! emacs-websocket
  :recipe (:host github :repo "ahyatt/emacs-websocket"))

(package! emojify
  :recipe (:host github :repo "iqbalansari/emacs-emojify"))

(package! circe
  :recipe (:host github :repo "jorgenschaefer/circe"))

(package! emacs-slack
  :recipe (:host github :repo "yuya373/emacs-slack"))
;; dependency ends for emacs-slack

(package! org-gcal
  :recipe (:host github :repo "myuhe/org-gcal.el")
  :disable t)

(if IS-MAC
    (package! osx-dictionary
      :recipe (:host github :repo "xuchunyang/osx-dictionary.el")))

(package! powerthesaurus
  :recipe (:host github :repo "SavchenkoValeriy/emacs-powerthesaurus"
           :files ("powerthesaurus.el")))

(package! spotify.el
  :recipe (:host github :repo "danielfm/spotify.el"))

(package! oauth2
  :recipe (:host github :repo "emacsmirror/oauth2"
           :files ("oauth2.el")))

(package! window-numbering.el
  :recipe (:host github :repo "nschum/window-numbering.el"))

(package! forge
  :recipe (:host github :repo "magit/forge"))

(package! emacs-lorem-ipsum
  :recipe (:host github :repo "jschaf/emacs-lorem-ipsum"))

(package! cheat-sh.el
  :recipe (:host github :repo "davep/cheat-sh.el"))

;; (package! magit-gh-pulls
;;   :recipe (:host github :repo "sigma/magit-gh-pulls"))
