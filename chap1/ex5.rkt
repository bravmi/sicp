#lang racket/base

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(module* main #f
  (test 0 (p))) ; infinite loop
