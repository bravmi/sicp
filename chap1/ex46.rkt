#lang racket/base
(require "../utils.rkt")
(require "iterative-improve.rkt")

(define tolerance 0.00001)
(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))

(define (fixed-point f first-guess)
  ((iterative-improve close-enough? f) first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))
(define (sqrt x)
  ((iterative-improve close-enough?
                      (average-damp (lambda (y) (/ x y))))
   1.0))

(define (test-func x)
  (/ (log 1000)
     (log x)))

(module+ test
  (require rackunit)
  ; x**x = 1000
  (check-within (fixed-point (average-damp test-func) 2.0)
                4.555
                0.001)
  (check-within (sqrt 225) 15 0.001))
