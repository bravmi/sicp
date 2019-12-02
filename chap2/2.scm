
(load "../utils.scm")
(load "rational.scm")


(define (make-segment start-segment end-segment)
  (cons start-segment end-segment))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))
(define (midpoint-segment segment)
  (let ((p1 (start-segment segment))
        (p2 (end-segment segment)))
    (make-point (/ (+ (x-point p1) (x-point p2)) 2)
                (/ (+ (y-point p1) (y-point p2)) 2))))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


(check-expect (make-segment 1 2) (cons 1 2))
(define p1 (make-point 1 2))
(define p2 (make-point 3 4))
(define segment (make-segment p1 p2))
(check-expect (midpoint-segment segment) (cons 2 3))
(test)
