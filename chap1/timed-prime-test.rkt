#lang racket/base
(require "../utils.rkt")

(provide (all-defined-out))

(define (timed-prime-test n prime?)
  (define (start-prime-test n start-time)
    (if (prime? n)
        (begin
          (display n)
          (report-prime (- (runtime) start-time))
          1)
        0))
  (define (report-prime elapsed-time)
    (display " *** ")
    (display-line elapsed-time))
  (start-prime-test n (runtime)))

; k smallest starting from n
(define (search-for-primes n k prime?)
  (cond ((even? n) (search-for-primes (+ n 1) k prime?))
        ((> k 0) (search-for-primes (+ n 2)
                                    (- k (timed-prime-test n prime?))
                                    prime?))
        (else null)))
