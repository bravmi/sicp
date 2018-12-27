
(load "../utils.scm")


(define (fast-expt b n)
  (cond ((= n 0) 1)
    ((even? n) (square (fast-expt b (/ n 2))))
    (else (* b (fast-expt b (- n 1))))))

; invariant b^n * a
(define (fast-expt-iter b n)
  (define (iter b n a)
  (cond ((= n 0) a)
      ((even? n) (iter (* b b) (/ n 2) a))
      (else (iter b (- n 1) (* a b)))))
  (iter b n 1))


(check-expect (fast-expt 2 3) 8)
(check-expect (fast-expt-iter 2 3) 8)
(check-expect (fast-expt 5 5) 3125)
(check-expect (fast-expt-iter 5 5) 3125)
(test)

