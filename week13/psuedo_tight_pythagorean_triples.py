######### BEGIN pythagorean_triples.py #############################
######### Assaf Kfoury
######### 15 April 2021

######### This Z3Py program generates n Pythagorean triples where n is
######### an integer >= 1 (not necessarily the "first n" and not always
######### in the same order -- the result of some obvious non-determinism
######### and randomness in Z3 implementation). For n >= 25 or 30, this
######### will run for several seconds before returning an output.

######### Run from the Unix prompt '$' at the command line by issuing:
######### $ python3 pythagorean_triples.py

######### Run from the Python prompt '>>>' at the command line:
######### >>> execfile ('pythagorean_triples.py')           # in Python2 only
######### >>> exec(open("./pythagorean_triples.py").read()) # in Python2 and Python3

from z3 import Solver, Ints, And, Not, sat
import math
s = Solver ()

# Declare three integer variables/constants of Z3Py {x, y, z} :
x, y, z = Ints ('x y z')

# Assert that {x, y, z} are positive integers such that 0 < x < y < z :
s.add (And( 0 < x , x < y , y < z ) )

# Assert that x*x + y*y = z*z, i.e. (x,y,z) is a Pythagorean triple :
s.add ( x * x + y * y == z * z )

#m^2 + n^2 = (n + 2)^2 ==  m^2 = 2n+4
s.add(x * x + y * y == (y+2) * (y+2))



n = 1
results = []
while s.check() == sat and n <= 10:
    m = s.model()
    results.append (m)
    s.add ( x != m[x] )
    n = n+1

print (s.check())

for p in range (len (results)) :
    print (results[p])

# print([results for result in results if not 'a' or 'b' in results ])

## Interesting fact about Pythagorean triples:
##
## The set {1,2,...,7824} can be partitioned into two parts,
## such that no part contains a Pythagorean. However, this
## is impossible for the set {1,2,...,7825} and any larger
## set containing it.

##

######### END pythagorean_triples.py #############################
