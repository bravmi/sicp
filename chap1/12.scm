
(load "../utils.scm")


(define (pascal row col)
  (cond ((= col 0) 1)
        ((= row col) 1)
        ((> col row) 0)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))


(assert= (pascal 0 0) 1)
(assert= (pascal 3 1) 3)
(assert= (pascal 4 2) 6)
