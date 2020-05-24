#lang racket/base

; better grasp in matrix form though
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* q q) (* 2 p q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(module+ test
  (require rackunit)
  (check-equal? (fib 2) 1)
  (check-equal? (fib 4) 3)
  (check-equal? (fib 8) 21)
  (check-equal? (fib 16) 987)
  (check-equal? (fib 32) 2178309))
