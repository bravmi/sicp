#lang racket/base
(require "../utils.rkt")

(define zero
  (lambda (f) (lambda (x)
                x)))

(define (add-1 n)
  (lambda (f) (lambda (x) 
                (f ((n f) x)))))

(define one
  (lambda (f) (lambda (x)
                (f x))))

(define two
  (lambda (f) (lambda (x)
                (f (f x)))))

(define (add n m)
  (lambda (f) (compose (n f) (m f))))

(define three (add one two))

(define (mul n m) (compose n m))

(define (int-to-church n)
  (if (= n 0)
      zero
      (add-1 (int-to-church (- n 1)))))

(define (church-to-int n)
  (define f (lambda (x) (+ x 1)))
  ((n f) 0))

(module+ test
  (require rackunit)
  (check-equal? (church-to-int (int-to-church 2)) 2)
  (check-equal? (church-to-int two) 2)
  (check-equal? (church-to-int (add two three)) 5)
  (check-equal? (church-to-int (mul two three)) 6))