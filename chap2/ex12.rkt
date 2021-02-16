#lang racket/base
(require "interval.rkt")

(define (make-center-percent c p)
  (let ((width (* c (/ p 100))))
    (make-interval (- c width) (+ c width))))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2.0))
(define (percent i)
  (* (/ (width i) (center i)) 100.0))

(module+ test
  (require rackunit)
  (define eps 1e-1)
  (test-case
    "mine"
    (define i (make-interval 1 2))
    (check-within (center i) 1.5 eps)
    (check-within (width i) 0.5 eps)
    (check-within (percent i) 33.3 eps))
  (test-case
    "not mine"
    (define i (make-center-percent 10 50))
    (check-within (lower-bound i) 5 eps)
    (check-within (upper-bound i) 15 eps)
    (check-within (center i) 10 eps)
    (check-within (width i) 5 eps)
    (check-within (percent i) 50 eps)))
