#lang racket/base
(require "interval.rkt")

(module+ test
  (require rackunit)
  (define x (make-interval 1 2))
  (define y (make-interval 9 10))
  (check-equal? (width-interval x) 0.5)
  (check-equal? (width-interval y) 0.5)
  (check-equal? (width-interval (mul-interval x x)) 1.5)
  (check-equal? (width-interval (mul-interval x y)) 5.5))
