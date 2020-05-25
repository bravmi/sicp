#lang racket/base
(require "../utils.rkt")
(require "miller-rabin.rkt")

(module+ test
  (require rackunit)
  ; Carmichael
  (check-false (prime? 561))
  (check-false (prime? 6601))
  ; just not prime
  (check-false (prime? 560))
  (check-false (prime? 987901))
  ; prime
  (check-true (prime? 5003))
  (check-true (prime? 10007)))
