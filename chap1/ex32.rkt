#lang racket/base
(require "../utils.rkt")

; foldl
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner result (term a)))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(module+ test
  (require rackunit)
  (check-equal? (sum id 1 inc 10) 55)
  (check-equal? (product id 1 inc 10) 3628800))
