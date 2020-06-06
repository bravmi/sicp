#lang racket/base
(require "../utils.rkt")
(require "segment.rkt")

(provide (all-defined-out))

(define (make-rect first-segment second-segment)
  (cons first-segment second-segment))
(define (first-segment rect)
  (car rect))
(define (second-segment rect)
  (cdr rect))

(define (perimeter rect)
  (* (+ (len-segment (first-segment rect))
        (len-segment (second-segment rect)))
     2))

(define (area rect)
  (* (len-segment (first-segment rect))
     (len-segment (second-segment rect))))
