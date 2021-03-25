//  This script goes with the set of slides:
//  "ProofPower.Albert_Nymeyer.pdf"
 
/***************************************************************
Pythagoras' Theorem asserts x^2 + y^2 = z^2 where x, y, z are the
sides of a right triangle.

A Pythagorean triple (x,y,z) is any triple of positive integers
satisfying the Pythagorean equation.

FACT (from arithmetic): 
There are infinitely many Pythagorean triples. 
***************************************************************/

// The following Dafny code is an attempt to prove the 
// existence of a Pythagorean triple, but it fails!!
 
predicate Pythag (a : int, b : int, c : int)
requires a > 0 && b > 0 && c > 0
  { a*a + b*b == c*c }
  
method VerifyPyA () 
{
   assert exists l,m,n :: l > 0 && m > 0 && n > 0 && Pythag(l,m,n);
}  

// Partial explanation of the preceding failure: The declarative
// part (i.e. the inserted logical conditions) of a Dafny script 
// does not do computation. 
//
// More explanation in slides 7-10 in ProofPower.Albert_Nymeyer.pdf

method VerifyPyB () 
{
   assert Pythag(3,4,5);
   assert exists l,m,n :: l > 0 && m > 0 && n > 0 && Pythag(l,m,n);
}

