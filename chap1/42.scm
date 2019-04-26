
(load "../utils.scm")
(load "repeated.scm")


(check-expect ((compose square inc) 6)
              49)
(test)
