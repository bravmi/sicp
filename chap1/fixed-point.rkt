#lang racket/base

(provide (all-defined-out))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (define next (f guess))
    (if (close-enough? guess next)
        next
        (try next)))
  (try first-guess))
