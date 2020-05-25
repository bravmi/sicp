#lang racket/base
(require "smallest-divisor.rkt")

(module+ test
  (require rackunit)
  (check-equal? (smallest-divisor 199) 199)
  (check-equal? (smallest-divisor 1999) 1999)
  (check-equal? (smallest-divisor 19999) 7))
