#lang racket/base
(require "../utils.rkt")

(define (f g)
  (g 2))

(module+ test
  (require rackunit)
  (check-equal? (f square) 4)
  (check-equal? (f (lambda (z)
                     (* z (+ z 1))))
                6)
  ; application: not a procedure;
  (check-exn exn:fail:contract? (lambda ()
                                  (f f))))
