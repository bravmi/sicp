#lang racket/base
(require "sqrt.rkt")

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(module+ main
  (sqrt-iter 1.0 5)) ; blows up
