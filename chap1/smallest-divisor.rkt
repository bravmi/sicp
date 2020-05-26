#lang racket/base
(require "../utils.rkt")

(provide (all-defined-out))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))
(define (next test-divisor)
  (if (= test-divisor 2)
      3
      (+ test-divisor 2)))

(define (prime? n)
  (if (<= n 1)
      false
      (= n (smallest-divisor n))))

(module+ test
  (require rackunit)
  (check-true (prime? 11))
  (check-true (prime? 101))
  (check-true (prime? 1009)))
