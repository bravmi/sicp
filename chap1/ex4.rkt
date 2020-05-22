#lang racket/base
(require "../utils.rkt")

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(module+ test
  (require rackunit)
  (check-equal? (a-plus-abs-b 1 2) 3)
  (check-equal? (a-plus-abs-b 1 -2) 3))
