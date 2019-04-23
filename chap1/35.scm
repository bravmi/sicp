
(load "../utils.scm")
(load "fixed-point.scm")


; phi
(check-within (fixed-point (lambda (x)
                             (+ 1 (/ 1 x)))
                           1.0)
              1.618
              0.001)
(test)
