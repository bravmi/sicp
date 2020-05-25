#lang racket/base
(require racket/math)

(provide (all-defined-out))

(define (display-line x)
  (display x)
  (newline))

(define (id x) x)
(define (inc x) (+ x 1))
(define (dec x) (- x 1))
(define (square x) (* x x))
(define (cube x) (* x x x))

(define (average x y)
  (/ (+ x y)
     2.0))

; n in Z
(define (pow x n)
  (if (= n 0)
      1
      (* x (pow x (- n 1)))))

(define (log2 x)
  (/ (log x) (log 2)))

(define (even? x)
  (= (remainder x 2) 0))

(define (identity x) x)
(define (repeat f n)
  (if (= n 0)
      identity
      (lambda (x) (f ((repeat f (- n 1)) x)))))

(define (runtime) (current-milliseconds))

(define true #t)
(define false #f)
