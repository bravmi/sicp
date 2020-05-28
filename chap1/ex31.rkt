#lang racket/base
(require "../utils.rkt")

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorial n)
  (product identity 1 inc n))

(define (wallis b)
  (define (term n)
    (define m (* 2.0 n))
    (* (/ m (- m 1))
       (/ m (+ m 1))))
  (* (product term 1 inc b)
     2))

(module+ test
  (require rackunit)
  (check-equal? (factorial 10) 3628800)
  (check-within (wallis 10000)
                3.1415
                0.001))
