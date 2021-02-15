#lang racket/base
(require "interval.rkt")

(module+ test
  (require rackunit)
  (define x (make-interval 1 2))
  (check-equal? (center x) 3/2)
  (check-equal? (percent x) 1/3))
