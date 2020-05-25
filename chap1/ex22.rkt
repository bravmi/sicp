#lang racket/base
(require "../utils.rkt")
(require "timed-prime-test.rkt")

(define (prime? n)
  (= n (smallest-divisor n)))
; we need old smallest-divisor here
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(module+ main
  (search-for-primes (expt 10 11) 3 prime?) (newline)
  (search-for-primes (expt 10 12) 3 prime?) (newline)
  (search-for-primes (expt 10 13) 3 prime?) (newline))
