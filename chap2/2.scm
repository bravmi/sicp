(load "../utils.scm")
(load "rat.scm")
(load "segment.scm")


(check-expect (make-segment 1 2) (cons 1 2))
(define p1 (make-point 1 2))
(define p2 (make-point 3 4))
(define segment (make-segment p1 p2))
(check-expect (midpoint-segment segment) (cons 2 3))
(test)
