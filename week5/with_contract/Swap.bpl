const N: int;
axiom 0 <= N;

var a: [int]int;
var b: int;


procedure Swap (i: int, j: int)
 modifies a, b;
 requires i >= 0 && j >= 0;
 ensures a[j] == b;
{
 var temp: int ;
 temp := a[i] ;
 a[i] := a[j] ;
 a[j] := temp ;
 b := temp ;
}
