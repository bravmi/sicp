
(require test-engine/racket-tests)
(require rackunit)

(check-random (random 10) (random 10))
(check-equal? 5 5)

(test)
