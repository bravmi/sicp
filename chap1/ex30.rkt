#lang racket/base

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(module+ test
  (require rackunit)
  (check-equal? (sum (lambda (x) x)
                     0
                     (lambda (x) (+ x 1))
                     5)
                15))
