procedure Sqr (n: int) returns (r: int)
  requires 0 < n;
  ensures  r == (n)*(n);
{
  var i, x : int;
  i := 0;
  r := 0;
  x := 1;
  while (i < n)
    invariant i <= n;
    invariant x == (i*2) + 1;
    invariant r <= n*n;
    invariant r == (i)*(i);
  {
    i := i + 1;
    r := r + x;
    x := x + 2;
  }
}

