
(load "../utils.scm")


(define (f g)
  (g 2))


(check-expect (f square) 4)
(check-expect (f (lambda (z)
                         (* z (+ z 1))))
              6)
(test)

(f f)
; application: not a procedure; 
