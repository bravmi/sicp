
(load "../utils.scm")


(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (f n) (A 0 n))

(define (g n) (A 1 n))

(define (h n) (A 2 n))

(define (k n) (* 5 n n))


(assert= (A 1 10) 1024)
(assert= (A 2 4) (pow 2 16))
(assert= (A 3 3) (pow 2 16))

(assert= (f 20) (* 2 20))
(assert= (g 7) (pow 2 7))
(assert= (h 5) ((repeat (lambda (x) (pow 2 x)) 4) 2))
