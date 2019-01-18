
(load "../utils.scm")


(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorial n)
  (product (lambda (x) x)
           1
           (lambda (x) (+ x 1))
           10))

(define (wallis n)
  (let ((m (* 2.0 n)))
    (* (/ m (- m 1))
       (/ m (+ m 1)))))


(check-expect (factorial 10)
              3628800)
(check-within (* (product wallis
                          1
                          (lambda (x) (+ x 1))
                          100000)
                 2)
              3.1415
              0.001)
(test)
