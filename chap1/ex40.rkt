#lang racket/base
(require "../utils.rkt")
(require "newtons-method.rkt")

(define (cube x) (* x x x))

(define (cubic a b c)
  (lambda (x)
    (+ (cube x)
       (* a (square x))
       (* b x)
       c)))

(module+ test
  (require rackunit)
  (check-within (newtons-method (cubic 2 3 4) 1)
                -1.651
                0.001))
