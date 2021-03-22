// The following Dafny program computes the k-th positive even number, where the
// first even number is defined to be 0, the second is defined to be 2, the third
// is 4 and so on.

method kthEven(k : int ) returns (e : int)
requires 0 < k;
ensures ... ;
{
  e := 0;
  var i := 1;
  while (i < k)
  // invariant ... ;
  // decreases ... ;
  {
    e := e + 2;
    i := i + 1;
  }
}