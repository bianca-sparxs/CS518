# Execute this script from the Python prompt by issuing:
# >>> execfile ('simple_example.py')

from z3 import *

# declaring propositional variables x,y
x,y = Bools('x y')

# defining phi - a propositional wff with two variables
phi = And(Or(x,Not(y)),Or(Not(x),Not(y)))

# in standard notation of propositional logic:
# phi = ( (x \lor (\neg y)) \land ((\neg x) \lor (\neg y)) )

# adding a constraint that phi and its negation are equal
s = Solver()
s.add(phi == Not(phi))

# check if it is satisfiable
print s.check()


