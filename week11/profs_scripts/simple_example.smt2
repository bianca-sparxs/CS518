;;;;   execute at the linux prompt by issuing the command:
;;;;   > z3 simple_example.smt2

(declare-const x Bool)
(declare-const y Bool)

; INSTEAD OF, in Z3Py:
;    x, y = Bools ('x y')

(declare-fun phi (Bool Bool) Bool)
(assert (= (phi x y) 
           (and (or x (not y)) (or (not x) (not y)))))

; INSTEAD OF, in Z3Py:
;    phi = And(Or(x,Not(y)),Or(Not(x),Not(y)))

(assert (= (phi x y)
           (not (phi x y)) ) )

; INSTEAD OF, in Z3Py:
;    s = Solver()
;    s.add(phi == Not(phi))
 
(check-sat)

; INSTEAD OF, in Z3Py:
;    print s.check()



