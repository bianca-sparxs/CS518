
procedure Sqr (n: int) returns (r: int)
  // requires  ... ;
  // ensures ... ;
{
  var i, x : int;
  i := 0;
  r := 0;
  x := 1;
  while (i < n)
    // invariant ... ;
    // invariant ... ;
    // invariant ... ;
  {
    i := i + 1;
    r := r + x;
    x := x + 2;
  }
}

