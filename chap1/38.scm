
(load "../utils.scm")
(load "cont-frac.scm")


(define (euler k)
  (define (d i)
    (if (= (remainder i 3) 2)
        (/ (+ i 1) 1.5)
        1))
  (cont-frac (lambda (i) 1) d k))


(check-within (+ 2.0 (euler 20))
              2.718
              0.001)
(test)
