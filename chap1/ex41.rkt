#lang racket/base

(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc x)
  (+ x 1))

(module+ test
  (require rackunit)
  ; double => double * 2 => double * 4
  (check-equal? (((double (double double)) inc) 0)
                16)
  (check-equal? ((double (double (double inc))) 0)
                8))
