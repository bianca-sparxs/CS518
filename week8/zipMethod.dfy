method zip(a: array?<int>, b: array?<int>) returns (c: array?<int>) 
//TODO: model after python's zip() method, where the 
//len of shortest array determines output
requires a != null;
requires b != null;
requires a.Length == b.Length;
ensures c != null;
ensures forall i :: 0 <= i < a.Length * 2 && i % 2 == 0 ==> c[i] == a[i/2];
ensures forall j :: 0 <= j < a.Length * 2 && j % 2 == 1 ==> c[j] == a[j/2];

{   
    var len := a.Length * 2;
    c := new int[len];

    var i := 0;
    var j := a.Length;

    while i < j
    invariant i <= j;
    decreases j - i;
    {   
        
        if i % 2 == 0{
            c[i] := a[i/2];
        } else{
            c[i] := b[i/2];
        }
        i := i + 1;
    }
}
