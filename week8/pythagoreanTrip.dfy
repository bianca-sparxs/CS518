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

predicate Pythag (a : int, b : int, c : int)
requires a > 0 && b > 0 && c > 0 ;
  { a*a + b*b == c*c }

method PythagInSet() {
  var s: set := {1,2,3,4,5,6,7,8,9,11,12,13,14} ; 
  // if 10 or 15 or probably many other natural numbers are added to 'set',
  // an error occurs that says "Error: assertion violation" at line 27
  assert exists x :: x in s;
  assert exists x,y :: x in s && y in s && x==y+1 ;
  assert exists x,y,z :: x in s && y in s && z in s && Pythag(x,y,z) ;
  var t := s - {5} ;  // remove element 5 from s
  assert !exists x,y,z :: x in t && y in t && z in t && Pythag(x,y,z) ;
}

// The preceding program is a little ad-hoc ... 
 

