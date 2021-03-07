procedure catching (x: int) returns (y: int)
   requires 0 < x;
   ensures y == x;
{
   y := 0 ;
   while ( y < x )
      invariant y <= x;
   {
     y := y + 1;
   }
}
   