/*
A well-know fact of arithmetic series is that the following equality is true:

              0+1+2+ ... + n = n * (n+1) /2
              
In this problem, we do not want to prove this equality ourselves, but we
want Dafny to verify it for us.              
*/

function sumn(n : int) : int 
     { n * (n + 1) / 2}

method sum(n : int) returns (s : int)
requires 0 <= n;
ensures s == sumn(n) ; // the equality which we ask Dafny to verify for us
{
   var i := 0;
   s := 0;
   while i < n
   invariant s == sumn(i);
   invariant i <= n; //dafny saddens me
   decreases (n - i);
   {
      i := i + 1;
      s := s + i;
   }
}
