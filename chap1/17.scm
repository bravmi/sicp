
(load "../utils.scm")


(define (* a b)
  (cond ((= a 0) 0)
        ((even? a) (double (* (halve a) b)))
        (else (+ b (* (- a 1) b)))))
(define (double a)
  (+ a a))
(define (halve a)
  (/ a 2))


(check-expect (* 4 4) 16)
(check-expect (* 127 128) 16256)
(test)
