#lang racket/base
(require "segment.rkt")

(module+ test
  (require rackunit)
  (define p1 (make-point 1 2))
  (define p2 (make-point 3 4))
  (define seg (make-segment p1 p2))
  (define p3 (midpoint-segment seg))
  (check-equal? (x-point p3) 2.)
  (check-equal? (y-point p3) 3.)
  (check-= (len-segment seg) (sqrt 8) 0e-3))
