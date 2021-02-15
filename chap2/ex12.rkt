#lang racket/base
(require "interval.rkt")

(module+ test
  (require rackunit)
  (define x (make-interval 1 2))
  (define eps 1e-3)
  (check-= (center x) 1.5 eps)
  (check-= (percent x) 0.333 eps))
