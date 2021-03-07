
procedure SqRt (x: int) returns (r: int)
  // requires ... ;
  // ensures ... ;
{
 var s: int ;
 r := 0;
 s := 1;
 while (s <= x)
   // invariant ...  ;
   // invariant ... ;
 {
   r := r + 1 ;
   s := (r+1) * (r+1) ;
 }
}

