#lang racket/base
(require "interval.rkt")

(module+ test
  (require rackunit)
  (define eps 1e-2)
  (define a (make-center-percent 10 2))
  (define b (make-center-percent 10 4))
  (define c (div-interval a a))
  (define d (div-interval a b))
  (check-within (percent c) 4 eps)
  (check-within (percent d) 6 eps))
