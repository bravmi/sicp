
(load "../utils.scm")
(load "cont-frac.scm")


(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
        x
        (- (* x x))))
  (define (d i)
    (- (* 2 i) 1))
  (cont-frac n d k))


(check-within (tan-cf 2.0 20)
              -2.185
              0.001)
(test)
