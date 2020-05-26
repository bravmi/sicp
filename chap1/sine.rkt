#lang racket/base

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(module+ test
  (require rackunit)
  (check-= (sine 0.5) 0.48 0.01))
