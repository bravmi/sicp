#lang racket/base
(require "../utils.rkt")

(define tolerance 0.00001)

; need display guesses here
(define (fixed-point f first-guess [report #f])
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess count)
    (define next (f guess))
    (if (close-enough? guess next)
        (begin
          (when report
            (printf "done in ~a steps\n" count))
          next)
        (try next (inc count))))
  (try first-guess 1))

(define (test-func x)
  (/ (log 1000)
     (log x)))

(define (test-func-damped x)
  (average x
           (test-func x)))

(module+ test
  (require rackunit)
  ; x**x = 1000
  (check-within (fixed-point test-func-damped 2.0)
                4.555
                0.001))

; Took round 9 iterations with damping and 34 without
(module+ main
  (displayln "[without damping]")
  (printf "result: ~a\n" (fixed-point test-func 2.0 #t))
  (newline)
  (displayln "[with damping]")
  (printf "result: ~a\n" (fixed-point test-func-damped 2.0 #t)))
