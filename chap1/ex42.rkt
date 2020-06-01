#lang racket/base
(require "../utils.rkt")
(require "repeated.rkt")

(module+ test
  (require rackunit)
  (check-equal? ((compose square inc) 6)
                49))
