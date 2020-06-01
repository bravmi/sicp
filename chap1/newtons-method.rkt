#lang racket/base
(require "fixed-point.rkt")
(require "../utils.rkt")

(provide (all-defined-out))

(define dx 0.00001)
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x) 
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))

(module+ test
  (require rackunit)
  (check-within (sqrt 1000) 31.623 0.001))