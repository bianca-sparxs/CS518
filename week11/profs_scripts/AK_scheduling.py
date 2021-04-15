# Execute this script from the Python2 or Python3 prompt by issuing:
#    >>> execfile ('AK_scheduling.py')           # in Python2 only
#    >>> exec(open("./AK_scheduling.py").read()) # in Python2 and Python3

from z3 import *

s = Solver()

#variables declaration.
A, B, C, D, E, F = Ints('A B C D E F')
At, Bt, Ct, Dt, Et, Ft = Ints('At Bt Ct Dt Et Ft')
End = Int('End')

#constrains on the starting time
s.add(A >= 0)
s.add(B >= 0)
s.add(C >= 0)
s.add(D >= 0)
s.add(E >= 0)
s.add(F >= 0)

s.add(At == 2)
s.add(Bt == 1)
s.add(Ct == 2)
s.add(Dt == 2)
s.add(Et == 7)
s.add(Ft == 5)

s.add(End == 14)

#constrains on the ending time
s.add( A + At <= B ) 
s.add( A + At <= End )
s.add( B + Bt <= End )
s.add( C + Ct <= End )
s.add( D + Dt <= End )
s.add( E + Et <= End )
s.add( F + Ft <= End )

#constrain for not overlaping
s.add( Or ( (A + At <= C), (C + Ct <= A) ) )
s.add( Or ( (B + Bt <= D), (D + Dt <= B) ) )
s.add( Or ( (B + Bt <= E), (E + Et <= B) ) )
s.add( Or ( (D + Dt <= E), (E + Et <= D) ) )
s.add( And ( (D + Dt <= F), (E + Et <= F) ) )

print (s.check())
print(s.model())
