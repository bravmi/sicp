#lang racket/base
(require (prefix-in utils: "../utils.rkt"))
(require "sqrt.rkt")

(module+ test
  (require rackunit)
  (check-= (sqrt 9) 3 0.001)
  (check-= (sqrt 137) 11.7 0.01)
  (check-= (utils:square (sqrt 1000)) 1000 2))
