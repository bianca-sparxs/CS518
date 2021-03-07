var counter : int ;
procedure incrementCounter ()
  requires  counter <= 0 || counter >= 0;
  ensures counter == old(counter) + 1;
  modifies counter ;
{
  counter := counter + 1;
}
