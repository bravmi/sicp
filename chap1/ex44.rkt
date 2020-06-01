#lang racket/base
(require "../utils.rkt")
(require "repeated.rkt")

(define (smoothed f)
  (lambda (x)
    (/ (+ (f (+ x dx))
          (f x)
          (f (- x dx)))
       3.0)))
(define dx 0.00001)

; f would be x in repeated
(define (repeated-smoothed f n)
  ((repeated smoothed n) f))

(module+ test
  (require rackunit)
  (check-within ((repeated-smoothed square 2) 5)
                25.000
                0.001))

(module+ main
  (displayln ((repeated-smoothed square 2) 5)))
