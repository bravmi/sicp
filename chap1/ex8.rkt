#lang racket/base
(require (prefix-in utils: "../utils.rkt"))

(provide (all-defined-out))

(define (cubert-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubert-iter (improve guess x)
                   x)))

(define (improve guess x)
  (approx x guess))

(define (approx x y)
  (/ (+ (/ x (utils:square y))
        (* 2 y))
     3))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (* guess 0.001)))

(define (cubert x)
  (cubert-iter 1.0 x))

(module+ test
  (require rackunit)
  (check-= (utils:cube (cubert 5)) 5 0.001)
  (check-= (utils:cube (cubert 1000)) 1000 1))
