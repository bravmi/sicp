#lang racket/base
(require "../utils.rkt")

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

; n assumed to be even
(define (simpson f a b n)
  (define h (/ (- b a) n 1.0))
  (define (f2 k)
    (define x (+ a (* k h)))
    (define y (f x))
    (cond ((or (= k 0) (= k n)) y)
          ((even? k) (* 2 y))
          (else (* 4 y))))
  (* (sum f2 0 inc n)
     (/ h 3)))

(module+ test
  (require rackunit)
  (check-within (integral cube 0 1 0.01) 0.25 0.01)
  (check-within (integral cube 0 1 0.001) 0.25 0.001)
  (check-within (simpson cube 0 1 100) 0.25 0.0001)
  (check-within (simpson cube 0 1 1000) 0.25 0.00001))
