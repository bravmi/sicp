#lang racket/base
(require "interval.rkt")

(module+ test
  (require rackunit)
  (define eps 1e-2)
  (define a (make-center-percent 10 2))
  (define b (make-center-percent 10 4))
  (check-within (percent (div-interval a a)) 4 eps)
  (check-within (percent (div-interval a b)) 6 eps))
