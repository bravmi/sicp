#lang racket/base
(require (prefix-in utils: "../utils.rkt"))
(require "repeated.rkt")

(module+ test
  (require rackunit)
  (check-equal? ((repeated utils:square 2) 5)
                625)
  (check-equal? ((repeated utils:square 4) 5)
                152587890625))
