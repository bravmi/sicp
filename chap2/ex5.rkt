#lang racket/base
(require "../utils.rkt")

(define (cons a b)
  (* (pow 2 a)
     (pow 3 b)))

; alternatively can be done with log
(define (car c)
  (if (= (remainder c 2) 0)
      (+ (car (/ c 2)) 1)
      0))
  
(define (cdr c)
  (if (= (remainder c 3) 0)
      (+ (cdr (/ c 3)) 1)
      0))
  
(module+ test
  (require rackunit)
  (define p (cons 5 10))
  (check-equal? (car p) 5)
  (check-equal? (cdr p) 10))
