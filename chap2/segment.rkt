#lang racket/base
(require "../utils.rkt")

(provide (all-defined-out))

(define (make-segment start-segment end-segment)
  (cons start-segment end-segment))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (midpoint-segment segment)
  (define p1 (start-segment segment))
  (define p2 (end-segment segment))
  (make-point (average (x-point p1) (x-point p2))
              (average (y-point p1) (y-point p2))))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (len-segment segment)
  (define start (start-segment segment))
  (define end (end-segment segment))
  (sqrt (+ (square (- (x-point start)
                      (x-point end)))
           (square (- (y-point start)
                      (y-point end))))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(module+ test
  (require rackunit)
  (define p1 (make-point 0 0))
  (define p2 (make-point 3 0))
  (define p3 (make-point 3 4))
  (check-equal? (len-segment (make-segment p1 p2)) 3)
  (check-equal? (len-segment (make-segment p2 p3)) 4)
  (check-equal? (len-segment (make-segment p1 p3)) 5))
