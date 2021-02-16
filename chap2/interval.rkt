#lang racket/base

(provide (all-defined-out))

(define (make-interval a b)
  (if (<= a b)
      (cons a b)
      (cons b a)))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define (bounds x)
  (cons (lower-bound x)
        (upper-bound x)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (add-interval x
                (make-interval (- (upper-bound y))
                               (- (lower-bound y)))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (<= (lower-bound y) 0 (upper-bound y))
      (error "y interval spans 0")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define (width x)
  (/ (- (upper-bound x)
        (lower-bound x))
     2.0))

(module+ test
  (require rackunit)
  (define x (make-interval 1 2))
  (define y (make-interval 3 4))
  (check-equal? (bounds (add-interval x y)) (cons 4 6))
  (check-equal? (bounds (mul-interval x y)) (cons 3 8))
  (check-within (bounds (div-interval x y))
                (cons (/ 1 4) (/ 2 3))
                1e-3)
  (check-within (width x) 0.5 1e-3))
