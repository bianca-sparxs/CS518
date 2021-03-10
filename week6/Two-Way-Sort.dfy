// This method swaps two elements in a generic (aka polymorphic)
// array called "a". Its contract is fully inserted in lines 4-9.
method swap<T>(a: array<T>, i: int, j: int)
  requires 0 <= i < j < a.Length
  modifies a
  ensures a[i] == old(a[j])
  ensures a[j] == old(a[i])
  ensures forall m :: 0 <= m < a.Length && m != i && 
                            m != j ==> a[m] == old(a[m])
  ensures multiset(a[..]) == old(multiset(a[..]))
{
  var t := a[i];
  a[i] := a[j];
  a[j] := t;
}

// The next method sorts a Boolean array.
// The first postcondition (line 28) should express that the 
// resulting array is sorted, that is, all occurrences of 
// "false" come before all occurrences of "true".
// The second postcondition (line 29) should express that the 
// post-state array is a permutation of the pre-state array. 
// For the second postcondition, you may want to use Dafny's 
// built-in multisets. The built-in function "multiset" takes 
// an array and yields the multiset of the array elements.
method two_way_sort(a: array<bool>)
  modifies a
  ensures forall i, j :: 0 <= i < j < a.Length && !a[i] ==> a[j] || !a[j] //if a[i] == false then a[j] == true/false
  ensures forall i, j :: 0 <= i < j < a.Length && a[i] ==> a[j] //if a[i] == true then a[j] == true
  ensures multiset(a[..]) == old(multiset(a[..]))
{
  var i := 0;
  var j := a.Length - 1;
  while (i <= j)
   invariant 0 <= i <= j + 1 <= a.Length
   invariant forall m :: 0 <= m < i ==> !a[m]
   invariant forall n :: j < n < a.Length ==> a[n]
   invariant multiset(a[..]) == old(multiset(a[..]))
  {
    if (!a[i]) {
      i := i+1;
    } else if (a[j]) {
      j := j-1;
    } else {
      swap(a, i, j);
      i := i+1;
      j := j-1;
    }
  }
}
