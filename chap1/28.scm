
(load "../utils.scm")
(load "miller-rabin.scm")


; Carmichael
(check-expect (prime? 561) false)
(check-expect (prime? 6601) false)
; just not prime
(check-expect (prime? 560) false)
(check-expect (prime? 987901) false)

; prime
(check-expect (prime? 5003) true)
(check-expect (prime? 10007) true)

(test)
