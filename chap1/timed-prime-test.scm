
(define (timed-prime-test n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (begin
        (display n)
        (report-prime (- (runtime) start-time)))
      0))
(define (report-prime elapsed-time)
  (display " *** ")
  (display-line elapsed-time)
  1)

; 3 smallest starting from odd n
(define (search-for-primes n k)
  (if (> k 0)
      (search-for-primes (+ n 2)
                         (- k (timed-prime-test n)))
      null))
