#lang racket/base
(require "../utils.rkt")

(define (plus a b)
  (if (= a 0)
      b
      (inc (plus (dec a) b))))

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

(module+ test
  (require rackunit)
  (check-equal? (plus 1 2) 3)
  (check-equal? (+ 1 2) 3))
