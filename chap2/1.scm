
(load "../utils.scm")
(load "rational.scm")


(check-expect (make-rat 1 2) (cons 1 2))
(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))
(check-expect (add-rat one-third one-third) (cons 2 3))

(check-expect (make-rat -1 2) (cons -1 2))
(check-expect (make-rat 1 -2) (cons -1 2))
(check-expect (make-rat -1 -2) (cons 1 2))
(test)
