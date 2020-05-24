#lang racket/base
(require "../utils.rkt")

(provide (all-defined-out))

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (f n) (A 0 n))

(define (g n) (A 1 n))

(define (h n) (A 2 n))

(define (k n) (* 5 n n))

(module+ test
  (require rackunit)
  (check-equal? (A 1 10) 1024)
  (check-equal? (A 2 4) (pow 2 16))
  (check-equal? (A 3 3) (pow 2 16))
  
  (check-equal? (f 20) (* 2 20))
  (check-equal? (g 7) (pow 2 7))
  (check-equal? (h 5) ((repeat (lambda (x) (pow 2 x)) 4) 2)))
