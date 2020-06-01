#lang racket/base
(require "../utils.rkt")
(require "cont-frac.rkt")

(module+ test
  (require rackunit)
  (check-within (cont-frac (lambda (i) 1.0)
                           (lambda (i) 1.0)
                           10) ; steps
                (/ 1 golden-ratio)
                0.0001)
  (check-within (cont-frac-iter (lambda (i) 1.0)
                                (lambda (i) 1.0)
                                10) ; steps
                (/ 1 golden-ratio)
                0.0001))
