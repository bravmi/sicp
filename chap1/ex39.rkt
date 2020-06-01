#lang racket/base
(require "../utils.rkt")
(require "cont-frac.rkt")

(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
        x
        (- (* x x))))
  (define (d i)
    (- (* 2 i) 1))
  (cont-frac n d k))

(module+ test
  (require rackunit)
  (let ((x 2.0))
    (check-within (tan-cf x 6)
                  (tan x)
                  0.0001)))
