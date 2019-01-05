
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (let* ((x (expmod base (/ exp 2) m))
                (r (remainder (square x) m)))
           ; check for non-trivial root of 1 mod n
           (if (and (= r 1)
                    (not (or (= x 1)
                             (= x (- m 1)))))
               0
               r)))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (miller-rabin n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin n) (fast-prime? n (- times 1)))
        (else false)))

(define (prime? n)
  (fast-prime? n 100))
