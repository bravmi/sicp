
(load "../utils.scm")
(load "sqrt.scm")


(assert-= (sqrt 9) 3)
(assert-= (sqrt 137) 11.7 0.01)
(assert-= (square (sqrt 1000)) 1000 2)
