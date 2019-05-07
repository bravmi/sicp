
(define (iterative-improve close-enough? improve)
  (define (try guess)
    (let ((next (improve guess)))
      (if (close-enough? guess next)      
          next
          (try next))))
  try)

(define tolerance 0.00001)
(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))
