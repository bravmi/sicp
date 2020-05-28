#lang racket/base
(require "../utils.rkt")
(require "smallest-divisor.rkt")

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a)
           (iter (next a) (combiner result (term a))))
          (else
            (iter (next a) result))))
  (iter a null-value))

(define (sum term a next b)
  (define (pred x) true)
  (filtered-accumulate + 0 term a next b pred))

(define (sum-prime-squares a b)
  (filtered-accumulate + 0 square a inc b prime?))

(define (prod-rel-primes n)
  (define (pred k)
    (= (gcd k n) 1))
  (filtered-accumulate * 1 identity 1 inc n pred))

(module+ test
  (require rackunit)
  (check-equal? (sum identity 1 inc 10) 55)
  (check-equal? (sum-prime-squares 1 100) 65796)
  (check-equal? (prod-rel-primes 30) 215656441))
