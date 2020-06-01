#lang racket/base
(require "../utils.rkt")
(require "repeated.rkt")

(module+ test
  (require rackunit)
  (check-equal? ((repeated square 2) 5)
                625)
  (check-equal? ((repeated square 4) 5)
                152587890625))
