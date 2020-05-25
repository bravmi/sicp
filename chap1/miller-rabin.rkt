#lang racket/base
(require "../utils.rkt")

(provide (all-defined-out))

; Miller-Rabin
(define (square-check x m)
  (define r (remainder (square x) m))
  (if (and (= r 1)
           (not (or (= x 1)
                    (= x (- m 1)))))
      0
      r))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (define x (expmod base (/ exp 2) m))
         (square-check x m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
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
  (check-true (prime? 1009))
  (check-false (prime? 561))
  (check-false (prime? 1105))
  (check-false (prime? 1729)))
