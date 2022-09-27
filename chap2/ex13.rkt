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
  (test-case
   "percent-tolerance"
   (define eps 1e-1)
   (define i1 (make-center-percent 10 4))
   (define i2 (make-center-percent 10 5))
   (define i3 (mul-interval i1 i2))
   (check-within (percent i3) 9 eps))
  (test-case
   "par1"
   (define r1 (make-center-percent 10 4))
   (define r2 (make-center-percent 10 5))
   (define tol1 (percent (par1 r1 r2)))
   (define tol2 (percent (par2 r1 r2)))
   (define diff (abs (- tol1 tol2)))
   (define diff-expected 8)
   (check-true (> diff diff-expected)
               (format "difference is more than ~a%" diff-expected))))
