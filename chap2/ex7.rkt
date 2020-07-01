#lang racket/base
(require "interval.rkt")

(module+ test
  (require rackunit)
  (define x (make-interval 1 2))
  (check-equal? (bounds x) (cons 1 2))
  (define y (make-interval 2 1))
  (check-equal? (bounds y) (cons 1 2)))
