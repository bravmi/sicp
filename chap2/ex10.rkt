#lang racket/base
(require "interval.rkt")

(module+ test
  (require rackunit)
  (define x (make-interval 1 2))
  (define y (make-interval -1 1))
  (check-exn exn:fail? (lambda ()
                         (div-interval x y))))
