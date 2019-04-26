
(load "../utils.scm")
(load "repeated.scm")


(check-expect ((repeated square 2) 5)
              625)
(check-expect ((repeated square 4) 5)
              152587890625)
(test)
