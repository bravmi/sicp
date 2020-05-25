#lang racket/base
(require "../utils.rkt")
(require "fermat-test.rkt")
(require "timed-prime-test.rkt")

(module+ main
  (search-for-primes (expt 10 10) 3 prime?) (newline)
  (search-for-primes (expt 10 20) 3 prime?) (newline)
  (search-for-primes (expt 10 30) 3 prime?) (newline)
  (search-for-primes (expt 10 40) 3 prime?) (newline)
  (search-for-primes (expt 10 50) 3 prime?) (newline)
  (search-for-primes (expt 10 60) 3 prime?) (newline)
  (search-for-primes (expt 10 70) 3 prime?) (newline)
  (search-for-primes (expt 10 80) 3 prime?) (newline)
  (search-for-primes (expt 10 90) 3 prime?) (newline)
  (search-for-primes (expt 10 100) 3 prime?) (newline))
