#lang racket/base
(require "../utils.rkt")
(require "fixed-point.rkt")

(module+ test
  (require rackunit)
  (check-within (fixed-point (lambda (x)
                               (+ 1 (/ 1 x)))
                             1.0)
                golden-ratio
                0.001))
