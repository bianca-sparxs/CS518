/*
The following method increments a loop 'indx' by 'step' on every iteration, 
where 'step' is an input parameter. The limit of the loop is fixed at 42.
*/

method BigFoot(step: nat)               // DO NOT CHANGE
// pre- and post-conditions
requires 0 < step;

{
  var indx := 0;                       // DO NOT CHANGE
  while indx <= 42                     // DO NOT CHANGE
    invariant indx <= 42 + step;
    decreases (42 - indx); 
  {
    indx := indx + step;               // DO NOT CHANGE
  }
  // assert indx == ; // index == 42 / step + 42 % mod step ? ay carumba
}
 
/*
The method is missing a method spec (using keywords: 'requires' and 'enforces'), 
a loop invariant (keyword: 'invariant'), a loop variant (keyword: 'decreases'),
and an assertion (keyword: 'assert'), all involving 'indx' and 'step'. Verify 
the method is correct by adding these logical conditions. These should be as 
strong as possible. Do not change any of the existing lines of code or add any 
lines to the program. Note that the method does not generate any output.
*/
