
(load "../utils.scm")
(load "cont-frac.scm")


; 1/phi
(check-within (cont-frac (lambda (i) 1.0)
                         (lambda (i) 1.0)
                         11) ; 11 is ok for 4 places
              0.618
              0.001)
(test)
