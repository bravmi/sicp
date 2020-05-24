#lang racket/base

(define (pascal row col)
  (cond ((= col 0) 1)
        ((= row col) 1)
        ((> col row) 0)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))

(module+ test
  (require rackunit)
  (check-equal? (pascal 0 0) 1)
  (check-equal? (pascal 3 1) 3)
  (check-equal? (pascal 4 2) 6))
