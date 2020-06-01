#lang racket/base
(require "../utils.rkt")
(require "cont-frac.rkt")

(define (euler k)
  (define (d i)
    (if (= (remainder i 3) 2)
        (/ (+ i 1) 1.5)
        1))
  (cont-frac (lambda (i) 1) d k))

(module+ test
  (require rackunit)
  (check-within (+ 2.0 (euler 7))
                (exp 1)
                0.0001))
