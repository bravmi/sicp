
(load "../utils.scm")


(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))


(assert= (a-plus-abs-b 1 2) 3)
(assert= (a-plus-abs-b 1 -2) 3)
