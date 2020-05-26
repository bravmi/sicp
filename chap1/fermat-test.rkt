#lang racket/base
(require "../utils.rkt")

(provide (all-defined-out))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (prime? n)
  (cond ((= n 1) true)
        ((= n 2) true)
        ((even? n) false)
        (else
          (fast-prime? n 100))))

(module+ test
  (require rackunit)
  (check-true (prime? 11))
  (check-true (prime? 101))
  (check-true (prime? 1009)))
