(specifications->manifest
  (list "github-pages-basic"
        ;; base packages
        "bash"
        "zsh"
        ;; Common command line tools lest the container is too empty
        "coreutils"
        "grep"
        "which"
        "wget"
        "sed"
        "vim"
        "emacs"
        ;; Tool chain and common libraries))
