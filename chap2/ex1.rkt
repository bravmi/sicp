#lang racket/base
(require "rat.rkt")

(module+ test
  (require rackunit)
  (define r1 (make-rat 2 4))
  (check-equal? (numer r1) 1)
  (check-equal? (denom r1) 2)
  (define r2 (make-rat 2 6))
  (define r3 (add-rat r1 r2))
  (check-equal? (numer r3) 5)
  (check-equal? (denom r3) 6)     
         
  (check-equal? (numer (make-rat -1 2)) -1)
  (check-equal? (numer (make-rat 1 -2)) -1)
  (check-equal? (numer (make-rat -1 -2)) 1))
