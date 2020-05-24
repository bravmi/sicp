#lang racket/base

(define (* a b)
  (cond ((= a 0) 0)
        ((even? a) (double (* (halve a) b)))
        (else (+ b (* (- a 1) b)))))
(define (double a)
  (+ a a))
(define (halve a)
  (/ a 2))

(module+ test
  (require rackunit)
  (check-equal? (* 4 4) 16)
  (check-equal? (* 127 128) 16256))
