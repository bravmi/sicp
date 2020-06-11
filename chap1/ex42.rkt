#lang racket/base
(require (prefix-in utils: "../utils.rkt"))
(require "repeated.rkt")

(module+ test
  (require rackunit)
  (check-equal? ((compose utils:square utils:inc) 6)
                49))
