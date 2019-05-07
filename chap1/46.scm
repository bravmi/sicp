
(load "../utils.scm")
(load "iterative-improve.scm")


(define (fixed-point f first-guess)
  ((iterative-improve close-enough? f) first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))
(define (sqrt x)
  ((iterative-improve close-enough?           
                      (average-damp (lambda (y) (/ x y))))
   1.0))


; x**x = 1000
(check-within (fixed-point (lambda (x)
                             (average x (/ (log 1000)
                                           (log x))))
                           2.0)
              4.555
              0.001)
(check-within (sqrt 225) 15 0.001)
(test)
