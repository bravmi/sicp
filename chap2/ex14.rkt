#lang racket/base
(require "interval.rkt")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(module+ test
  (require rackunit)
  (define r1 (make-center-percent 10 4))
  (define r2 (make-center-percent 10 5))
  (define tol1 (percent-tolerance (par1 r1 r2)))
  (define tol2 (percent-tolerance (par2 r1 r2)))
  (define diff (abs (- tol1 tol2)))
  (check-true (> diff 8) "difference is more than 8%"))
