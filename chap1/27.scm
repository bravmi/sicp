
(load "../utils.scm")
(load "fermat-test.scm")


(define (test-congruent n)
  (define (iter a)
    (if (>= a n)
        true
        (and (= (expmod a n n) a) (iter (+ a 1)))))
  (iter 1))


; Carmichael numbers
(check-expect (test-congruent 561) true)
(check-expect (test-congruent 1105) true)
(check-expect (test-congruent 1729) true)
(check-expect (test-congruent 2465) true)
(check-expect (test-congruent 2821) true)
(check-expect (test-congruent 6601) true)
(test)
