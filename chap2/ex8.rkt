#lang racket/base
(require "interval.rkt")

(module+ test
  (require rackunit)
  (define x (make-interval 1 2))
  (define y (make-interval 3 4))
  (check-equal? (bounds (sub-interval x y)) (cons -3 -1)))
