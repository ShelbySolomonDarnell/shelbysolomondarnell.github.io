(define-module (ssd_github_pages)
  #:use-module (guix gexp) 
  #:use-module (guix git-download) 
  #:use-module (guix packages) 
  #:use-module (guix download) 
  #:use-module (guix build-system ruby)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages digest)
  #:use-module ((guix licenses) #:prefix license:))

(define-public ruby-jekyll-swiss
  (package
    (name "ruby-jekyll-swiss")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "jekyll-swiss" version))
              (sha256
               (base32
                "18w893f2snpbvgl80jnmq3xxsl5yi5a5qm11iy3gx0d8viasi6f2"))))
    (build-system ruby-build-system)
    (synopsis "A bold typographic theme for Jekyll, inspired by Swiss design.")
    (description
     "This package provides a bold typographic theme for Jekyll, inspired by Swiss
  design.")
    (home-page "http://broccolini.net/swiss")
    (license license:expat)))

(define-public ruby-bundler
  (package
    (name "ruby-bundler")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "bundle" version))
              (sha256
               (base32
                "1a8zl6rs4w4qs0ih733m3pw08lffsvv2blccwf60ghbx4qn009ls"))))
    (build-system ruby-build-system)
    (propagated-inputs (list bundler))
    (synopsis
     "You really mean `gem install bundler`. It's okay. I'll fix it for you this one last time...")
    (description
     "You really mean `gem install bundler`.  It's okay.  I'll fix it for you this one
  last time...")
    (home-page "http://gembundler.com")
    (license #f)))

(define-public ruby-unicode-display-width
  (package
    (name "ruby-unicode-display-width")
    (version "2.4.2")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "unicode-display_width" version))
              (sha256
               (base32
                "1gi82k102q7bkmfi7ggn9ciypn897ylln1jk9q67kjhr39fj043a"))))
    (build-system ruby-build-system)
    (synopsis
     "[Unicode 15.0.0] Determines the monospace display width of a string using EastAsianWidth.txt, Unicode general category, and other data.")
    (description
     "[Unicode 15.0.0] Determines the monospace display width of a string using
  @code{EastAsianWidth.txt,} Unicode general category, and other data.")
    (home-page "https://github.com/janlelis/unicode-display_width")
    (license license:expat)))

(define %source-dir (dirname (current-filename)))

(package 
  (name "ssd-github-pages")
  (version "0.1")
  (source (local-file %source-dir "ssd-github-pages-checkout"
                      #:recursive? #t
                      #:select? (git-predicate
                                  %source-dir)))
  (build-system pyproject-build-system)
  (arguments 
    `(#:tests? #f))
  (propagated-inputs (list ruby-bundler))
  (home-page "https://github.com/ShelbySolomonDarnell/ShelbySolomonDarnell.github.io")
  (synopsis "")
  (description "")
  (license license:expat))
