
(load "../utils.scm")
(load "timed-prime-test.scm")


(define (prime? n)
  (= n (smallest-divisor n)))
; we need old smallest-divisor here
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))


(search-for-primes 1001 3) (newline)
(search-for-primes 10001 3) (newline)
(search-for-primes 100001 3) (newline)
(search-for-primes 1000001 3) (newline)
(search-for-primes 10000001 3) (newline)
(search-for-primes 100000001 3) (newline)
(search-for-primes 1000000001 3) (newline)
(search-for-primes 10000000001 3) (newline)
(search-for-primes 100000000001 3) (newline)
(search-for-primes 1000000000001 3) (newline)
(search-for-primes 10000000000001 3) (newline)
