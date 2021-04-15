;;;;   execute at the linux prompt by issuing the command:
;;;;   > z3 majority.smt2

;; DNF for majority function phi = (x \land y) \lor (x \land z) \lor (y \land z)
;; CNF for majority function psi = (x \lor y) \land (x \lor z) \land (y \lor z)

(declare-const x Bool)
(declare-const y Bool)
(declare-const z Bool)

(declare-fun phi (Bool Bool Bool) Bool)
(assert (= (phi x y z)
           (or (and x y) (or (and x z) (and y z)))))

(declare-fun psi (Bool Bool Bool) Bool)
(assert (= (psi x y z)
           (and (or x y) (and (or x z) (or y z)))))

;; the equivalence of phi and psi is obtained by verifying that
;; (not (= (phi x y z) (psi x y z))) is unsatisfiable.

(assert (not (= (phi x y z) (psi x y z))))

(check-sat)