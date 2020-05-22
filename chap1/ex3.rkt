#lang racket/base
(require "../utils.rkt")

(define (square x)
  (* x x))

(define (sum-largest-squares a b c)
  (+ (square (max a b c))
     (square (- (+ a b c)
                (max a b c)
                (min a b c)))))

(module+ test
  (require rackunit)
  (check-equal? (sum-largest-squares 1 2 3) 13)
  (check-equal? (sum-largest-squares -3 -2 -1) 5)
  (check-equal? (sum-largest-squares 1 51 100) 12601))
