
(load "../utils.scm")


(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(define (count-change-list amount)
  (cc-list amount 5))
(define (cc-list amount kinds-of-coins)
  (cond ((= amount 0) '(()))
        ((or (< amount 0) (= kinds-of-coins 0)) '())
        (else (append (cc-list amount (- kinds-of-coins 1))
                      (let ((denom (first-denomination kinds-of-coins)))
                        (map (lambda (a) (cons denom a))
                             (cc-list (- amount denom)
                                 kinds-of-coins)))))))


(check-expect (count-change 100) 292)
(check-expect (length (count-change-list 100)) 292)
(test)
