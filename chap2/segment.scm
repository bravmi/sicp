
(load "../utils.scm")


(define (make-segment start-segment end-segment)
  (cons start-segment end-segment))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))
(define (midpoint-segment segment)
  (let ((p1 (start-segment segment))
        (p2 (end-segment segment)))
    (make-point (average (x-point p1) (x-point p2))
                (average (y-point p1) (y-point p2)) 2)))

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
