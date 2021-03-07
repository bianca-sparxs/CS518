
const N: int;
axiom 0 <= N;

var a: [int]int;
var b: int;

procedure Swap (i: int, j: int)
 modifies a, b;
 // requires ...    ;
 // ensures ... ;
{
 var temp: int ;
 temp := a[i] ;
 a[i] := a[j] ;
 a[j] := temp ;
 b := temp ;
}