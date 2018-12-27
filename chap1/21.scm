
(load "../utils.scm")
(load "smallest-divisor.scm")


(check-expect (smallest-divisor 199) 199)
(check-expect (smallest-divisor 1999) 1999)
(check-expect (smallest-divisor 19999) 7)
(test)
