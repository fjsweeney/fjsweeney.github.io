#lang racket

(require "common.rkt")

(define index-content
   `(main (p "Just a wee developer!")))

(personal-template
 "../index.html"
 (string-append author " | Home")
 `(header (h1 ,author))
 index-content)
