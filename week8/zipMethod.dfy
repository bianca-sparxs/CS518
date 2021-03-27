method zip(a: array?<int>, b: array?<int>) returns (c: array?<int>) 
//TODO: model after python's zip() method, where the 
//len of shortest array determines output
requires a != null;
requires b != null;
requires a.Length == b.Length;
ensures c != null;
ensures c.Length == a.Length * 2;

ensures forall i :: 0 <= i < a.Length && i % 2 == 0 ==> c[i] == a[i];
ensures forall i :: a.Length <= i < a.Length * 2 && i % 2 == 0 ==> c[i] == a[i/2];

ensures forall j :: 0 <= j < a.Length && j % 2 == 1 ==> c[j] == b[j];
ensures forall j :: a.Length <= j < a.Length * 2 && j % 2 == 1 ==> c[j] == b[j/2];

{   
    var len := a.Length * 2;
    c := new int[len];

    var i := 0;
    var j := a.Length * 2;

    while i < j
    invariant i <= j;
    invariant forall k :: 0 <= k < i < a.Length && k % 2 == 0 ==> c[k] == a[k];
    invariant forall m :: 0 <= m < i < a.Length && m % 2 == 1 ==> c[m] == b[m];
    decreases j - i;
    {   
        
        if i % 2 == 0{
            if i >=a.Length{
                c[i] := a[i/2];
            } else {
                c[i] := a[i];
            }
            
        } else {
            if i >= a.Length{
                c[i] := b[i/2];
            } else {
                c[i] := b[i];
            }
        }
        i := i + 1;
    }
}
