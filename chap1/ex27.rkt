#lang racket/base
(require "../utils.rkt")
(require "fermat-test.rkt")

(define (test-congruent n)
  (define (iter a)
    (if (>= a n)
        true
        (and (= (expmod a n n) a) (iter (+ a 1)))))
  (iter 1))

(module+ test
  (require rackunit)
  ; Carmichael numbers
  (check-true (test-congruent 561))
  (check-true (test-congruent 1105))
  (check-true (test-congruent 1729))
  (check-true (test-congruent 2465))
  (check-true (test-congruent 2821))
  (check-true (test-congruent 6601)))
