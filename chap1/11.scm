
(load "../utils.scm")


(define (f1 n)
  (if (< n 3)
    n
    (+ (f1 (- n 1))
       (* 2 (f1 (- n 2)))
       (* 3 (f1 (- n 3))))))

(define (f2 n)
  (define (f-iter a b c count)
    (if (= count 0)
      c
      (f-iter (+ a (* 2 b) (* 3 c))
              a
              b
              (- count 1))))
  (f-iter 2 1 0 n))


(assert= (f1 1) 1)
(assert= (f1 2) 2)
(assert= (f1 7) (f2 7))
(assert= (f1 17) (f2 17))
