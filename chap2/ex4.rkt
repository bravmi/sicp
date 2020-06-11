#lang racket/base

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(module+ test
  (require rackunit)
  (define p (cons 1 2))
  (check-equal? (car p) 1)
  (check-equal? (cdr p) 2))
