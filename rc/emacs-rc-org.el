;;; emacs-rc-org.el ---


(require 'org-install)

(setq org-log-done t
      org-hide-leading-stars t
      org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "STARTED(s)" "|" "DONE(d)"
                                    "CANCELED(c)"))
      org-directory (concat (getenv "HOME") "/docs/org/")
      org-default-notes-file (concat org-directory "journal.org")
      org-agenda-files (mapcar (lambda (fname) (concat org-directory fname))
                               '("work.org" "personal.org")))

(add-to-list 'org-link-abbrev-alist '("emacswiki" . "http://www.emacswiki.org/cgi-bin/wiki/"))
(add-to-list 'org-link-abbrev-alist '("google" . "http://www.google.com/search?q="))
(add-to-list 'org-link-abbrev-alist '("myspace" . "http://www.myspace.com/"))

;; Remember
(require 'remember)

(org-remember-insinuate)
(setq remember-annotation-functions '(org-remember-annotation)
      remember-handler-functions '(org-remember-handler)
      org-remember-templates
      '(("Todo" ?t "* TODO %^{Brief Description} %^g\n%?\nAdded: %U" "gtd.org" "Tasks")
        ("Music" ?m "* %^{Artist} %t :MUSIC:%^g
:PROPERTIES:
  :Artist: %?
  :Release:
  :Genre:
  :Country:
  :Website:
:END:

Comments:\n" nil "Music")
        ("Cd" ?c "* %^{Title} %t :CD:MUSIC:
:PROPERTIES:
  :Artist: %?
  :Release:
  :Label:
  :Genre:
  :Country:
  :Price:
:END:\n\n" nil "CD")
        ("Film" ?f "* %^{Film Title} %t :CINEMA:
:PROPERTIES:
  :Director: %?
  :Year:
  :Genre:
  :Country:
:END:

Comments: \n" nil "Movies")
        ("Idea" ?i "** %^{Idea} %U\n%? :IDEA:%^g \n" nil "Ideas")
        ("Word" ?w "** %^{Word} %U\n%? :WORD: \n" nil "Words")
        ("Buzz" ?b "** %^{Topic} %T %^g \n%i%?\n" nil "Buzz")
      ))

(add-hook 'remember-mode-hook 'org-remember-apply-template)

;; Bindings
(global-set-key (kbd "\C-cl") 'org-store-link)
(global-set-key (kbd "\C-ca") 'org-agenda)
(global-set-key (kbd "\C-cr") 'org-remember)


;;; emacs-rc-org.el ends here