
(load "../utils.scm")
(load "sqrt.scm")


(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))


; (sqrt-iter 1.0 5) ; blows up
