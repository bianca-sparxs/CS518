## To run this script, issue the command:
##       >>> execfile ('rev_list_buggy.py')              IN PYTHON 2
##       >>> exec (open('rev_list_buggy.py').read())     IN PYTHON 3

########################################
### Buggy code to reverse a list
### Try to debug it! (fixes needed are explained below)
########################################
import pytest

# BUG: access index out of range
def rev_list_buggy1(L):
    """
    input: L, a list
    Modifies L such that its elements are in reverse order
    returns: nothing
    """
    for i in range(len(L)):
        j = len(L) - i
        temp = L[i]
        L[i] = L[j]
        L[j] = L[i]

# BUG: L[j] is None, need to set L[j] to temp
def rev_list_buggy2(L):
    """
    input: L, a list
    Modifies L such that its elements are in reverse order
    returns: nothing
    """
    for i in range(len(L)):
        j = len(L) - i -1
        temp = L[i]
        L[i] = L[j]
        L[j] = L[i]
        
L = [1,2,3,4]

# Correct implenatation
def rev_list(L):
    return L[::-1]


##########
# TESTS
##########

@pytest.mark.parametrize(
    "test_input,expected",
    [([1], [1]), ([1,2], [2,1]), ([1,2,2,1], [1,2,2,1])],
)
def test_bug(test_input, expected):
    assert rev_list_buggy1(test_input) == expected





# rev_list_buggy1 (L)
rev_list_buggy2 (L)
print(L[::-1])
# print(rev_list_buggy2 (L))