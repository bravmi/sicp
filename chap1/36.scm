
(load "../utils.scm")


(define tolerance 0.00001)

; need display guesses here
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display-line guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))


; x**x = 1000
(check-within (fixed-point (lambda (x) 
                             (average x
                                      (/ (log 1000)
                                         (log x))))
                           2.0)
              4.555
              0.001)
(test)
; Took round 9 iterations with damping and 34 without
