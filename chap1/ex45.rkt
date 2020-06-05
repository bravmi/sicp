#lang racket/base
(require "../utils.rkt")
(require "fixed-point.rkt")
(require "repeated.rkt")

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

(define (repeated-damp f n)
  ((repeated average-damp n) f))
(define (nth-root x n)
  (fixed-point (repeated-damp (lambda (y) (/ x (pow y (- n 1))))
                              (floor (log2 n))) ; damping times
               1.0))

(module+ test
  (require rackunit)
  (check-within (sqrt 25) 5 0.001)
  (check-within (cube-root 100) 4.642 0.001)
  (check-within (nth-root 100 100) 1.047 0.001)
  (check-within (nth-root 32 5) 2 0.001))
