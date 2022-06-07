#lang racket/base
(require "smallest-divisor.rkt")
(require "timed-prime-test.rkt")

(module+ main
  (search-for-primes (expt 10 11) 3 prime?) (newline)
  (search-for-primes (expt 10 12) 3 prime?) (newline)
  (search-for-primes (expt 10 13) 3 prime?) (newline))
