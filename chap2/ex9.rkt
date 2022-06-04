#lang racket/base
(require "interval.rkt")

(module+ test
  (require rackunit)
  ; TODO: refactor x to a or smth
  (define x (make-interval 1 2))
  (define y (make-interval 9 10))
  (check-equal? (width x) 0.5)
  (check-equal? (width y) 0.5)
  (check-equal? (width (mul-interval x x)) 1.5)
  (check-equal? (width (mul-interval x y)) 5.5))
