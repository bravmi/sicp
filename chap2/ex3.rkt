#lang racket/base
(require "../utils.rkt")
(require "segment.rkt")
(require "rect.rkt")

(module+ test
  (require rackunit)
  (define p1 (make-point 0 0))
  (define p2 (make-point 3 0))
  (define p3 (make-point 3 4))
  (define seg1 (make-segment p1 p2))
  (define seg2 (make-segment p2 p3))
  (define rect (make-rect seg1 seg2))
  (check-equal? (perimeter rect) 14)
  (check-equal? (area rect) 12))
