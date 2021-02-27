## To run this script, issue the command:
##       >>> execfile ('primes_list_buggy.py')              IN PYTHON 2
##       >>> exec (open('primes_list_buggy.py').read())     IN PYTHON 3

########################################################
### Buggy code to get a list of primes. Try to debug it!
########################################################
import pytest

class TestClass:
    def test_one(self):
        assert primes_list_buggy(2) == [1,2]
    def test_two(self):
        assert 5 in primes_list_buggy(5)


#BUG: i does not exist yet;

def primes_list_buggy(n):
   ## input: n an integer > 1
   ## returns: list of all the primes up to and including n
   
   # initialize primes list
   if i == 2:
       primes.append(2)
   # go through each elem of primes list
   for i in range(len(primes)):
       # go through each of 2...n
       for j in range(len(n)):
           # check if not divisible by elem of list
           if i%j != 0:
               primes.append(i)

# print(primes_list(2) )               
# print(primes_list(15)  )

##OUTPUT:
# ================================================ FAILURES =================================================
# ___________________________________________ TestClass.test_one ____________________________________________

# self = <primes_list_buggy.TestClass object at 0x10b63cfa0>

#     def test_one(self):
# >       assert primes_list_buggy(2) == [1,2]

# primes_list_buggy.py:12: 
# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

# n = 2

#     def primes_list_buggy(n):
#        ## input: n an integer > 1
#        ## returns: list of all the primes up to and including n
    
#        # initialize primes list
# >      if i == 2:
# E      UnboundLocalError: local variable 'i' referenced before assignment

# primes_list_buggy.py:22: UnboundLocalError
# ___________________________________________ TestClass.test_two ____________________________________________

# self = <primes_list_buggy.TestClass object at 0x10b635730>

#     def test_two(self):
# >       assert 5 in primes_list_buggy(5)

# primes_list_buggy.py:14: 
# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

# n = 5

#     def primes_list_buggy(n):
#        ## input: n an integer > 1
#        ## returns: list of all the primes up to and including n
    
#        # initialize primes list
# >      if i == 2:
# E      UnboundLocalError: local variable 'i' referenced before assignment

# primes_list_buggy.py:22: UnboundLocalError
# ========================================= short test summary info =========================================
# FAILED primes_list_buggy.py::TestClass::test_one - UnboundLocalError: local variable 'i' referenced befo...
# FAILED primes_list_buggy.py::TestClass::test_two - UnboundLocalError: local variable 'i' referenced befo...
# ============================================ 2 failed in 0.17s ============================================

## FIXES: --------------------------
## = invalid syntax, variable i unknown, variable primes unknown
## can't apply 'len' to an int
## division by zero -> iterate through elems not indices
##                  -> iterate from 2 not 0
## forgot to return 
## primes is empty list for n > 2
## n = 3 goes through loop once -> range to n+1 not n
## infinite loop -> append j not i
##               -> list is getting modified as iterating over it!
##               -> switch loops around
## n = 4 adds 4 -> need way to stop going once found a divisible num
##              -> use a flag
## --------------------------
         


