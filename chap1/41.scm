
(load "../utils.scm")


(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc x)
  (+ x 1))


; double => double * 2 => double * 4
(check-expect (((double (double double)) inc) 0)
              16)
(check-expect ((double (double (double inc))) 0)
              8)
(test)
