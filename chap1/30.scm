
(load "../utils.scm")


(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))


(check-expect (sum (lambda (x) x)
                   0
                   (lambda (x) (+ x 1))
                   5)
              15)
(test)
