#lang racket/base

(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1 -- CONS" m))))
  dispatch)

(define (car z) (z 0))

(define (cdr z) (z 1))

(module+ test
  (require rackunit)
  (define p (cons 1 2))
  (check-equal? (car p) 1)
  (check-equal? (cdr p) 2))
