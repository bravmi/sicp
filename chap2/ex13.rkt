#lang racket/base
(require "interval.rkt")

(define (percent-tolerance i)
  (let ((center (/ (+ (upper-bound i) (lower-bound i)) 2.0))
        (width (/ (- (upper-bound i) (lower-bound i)) 2.0)))
    (* (/ width center) 100)))

(module+ test
  (require rackunit)
  (define eps 1e-3)
  (define i1 (make-center-percent 10 0.4))
  (define i2 (make-center-percent 10 0.5))
  (define i3 (mul-interval i1 i2))
  (check-within (percent-tolerance i3) 0.9 eps))
