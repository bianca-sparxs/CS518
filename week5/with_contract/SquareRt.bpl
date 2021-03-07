
procedure SqRt (x: int) returns (r: int)
  requires x > 0 ;
  ensures x >= r*r && x < (r+1) * (r+1);
{
 var s: int ;
 r := 0;
 s := 1;
 while (s <= x)
   invariant s <= x;
   invariant r*r <= x;
 {
   r := r + 1 ;
   s := (r+1) * (r+1) ;
 }
}
