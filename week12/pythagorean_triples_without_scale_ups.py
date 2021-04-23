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

from z3 import Solver, Ints, And, Not, Or, sat
import math
s = Solver ()

"""From math stackexchange:
the formula is as follows:
𝑎=𝑚^2 − 𝑛^2, 𝑏=2𝑚𝑛, 𝑐=^2 + 𝑛^2

where 𝑚>𝑛>0

for any 2 values of 𝑚 and 𝑛 the above formula will give a Pythagorean Triple.

To get a Primitive Pythagorean triple, 𝑚 and 𝑛 have to co-prime and not both odd.
"""
def Odd(x):
    return x % 2 == 1

def GCD(x, y):
    # Everything divides 0
    if (x == 0):
        return b
    if (y == 0):
        return a
  
    # base case
    if (x == y):
        return x
  
    # a is greater
    if (x > y): #throws: z3.z3types.Z3Exception: Symbolic expressions cannot be cast to concrete Boolean values.
        return gcd(x-y, y)
    return gcd(x, y-x)


def CoPrime(x, y):
    return GCD(x, y) == 1

# Declare three integer variables/constants of Z3Py {x, y, z} :
x, y, z, a, b = Ints ('x y z a b')

# Assert that {x, y, z} are positive integers such that 0 < x < y < z :
s.add (And( 0 < x , x < y , y < z ) )

# Assert that x*x + y*y = z*z, i.e. (x,y,z) is a Pythagorean triple :
s.add ( x * x + y * y == z * z )

#x = a^2 - b^2, y = 2ab, z = a^2 + b^2
s.add(And(x == (a * a) - (b * b), y == 2 * a * b, z == (a * a) + (b * b)))

#a>b>0
s.add(And(b > 0, a > b))

#a and b both not odd
s.add(Or(And(Odd(a), Not(Odd(b))), And(Odd(b), Not(Odd(a)))))
s.add(Not(Odd(a) == Odd(b))) #ok apparently i needed both of these....?

#a and b coprime (GCD of both numbers == 1)
# s.add(CoPrime(a, b))          #ok apparently i didn't need this ....?

n = 1
results = []
while s.check() == sat and n <= 5:
    m = s.model()
    results.append (m)
    s.add ( x != m[x] )
    n = n+1

# print (s.check())

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
