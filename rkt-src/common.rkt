#lang racket

(require racket/date)
(require html-writing)

(provide author
         container
         personal-template
         contact)

(define stylesheets
  `((link (@ (rel "stylesheet")
	     (href "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css")
	     (integrity "sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T")
	     (crossorigin "anonymous")))
    (link (@ (rel "stylesheet") (href "stylesheets/main.css")))
    ))
	     
(define favicons `(()))
(define scripts
  `((script (@ (src "https://code.jquery.com/jquery-3.3.1.slim.min.js")
	       (integrity "sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo")
	       (crossorigin "anonymous")))
    (script (@ (src "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js")
	       (integrity "sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1")
	       (crossorigin "anonymous")))
    (script (@ (src "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js")
	       (integrity "sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM")
	       (crossorigin "anonymous")))
    (script (@ (src "scripts/accordion.js")))
    ))

(define author "Forest Sweeney")
(define email "(forest dot sweeney at gmail dot com)")
(define contact
  `(div (@ (class "contact"))
        ,author
	" "
	,email))

(define (container content)
  `(div (@ (class "container"))
        ,content))

(define (head the-title)
   `(head
     (meta (@ (charset "utf-8")))
     (title ,the-title)
     (meta (@ (name "description") (content "Personal Website")))
     (meta (@ (name "author") (content ,author)))
     (meta (@ (name "viewport") (content "width=device-width, initial-scale=1, shrink-to-fit=no")))
     ,@stylesheets
     ,@favicons))

(define main-menu
  `(nav (a (@ (class "nav-item") (href "index.html")) "Home")
	(a (@ (class "nav-item") (href "resume.html")) "Resume")))

(define main-footer
  `(footer
    ,(container
      `(div (@ (class "copyright"))
            "© Copyright "
            ,(number->string (date-year (current-date)))
            " All rights reserved | "
            (a (@ (href "resume.html")) ,author)))))

(define (personal-template filename the-title the-header the-content)
  (let ([the-file (open-output-file filename #:exists 'replace)])
    (begin
      (void (write-bytes #"<!DOCTYPE HTML>\n" the-file))
      (write-html
       `((html (@ (lang "en"))
	       ,(head the-title)
               (body
                ,the-header
                ,main-menu
                ,the-content
                ,main-footer
                ,@scripts)))
       the-file)
      (close-output-port the-file))))
