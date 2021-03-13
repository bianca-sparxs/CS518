method Reverse (str: array?<char>) returns(b: array<char>)
requires str != null;
ensures str.Length == b.Length;
ensures forall k: int :: 0 <= k < str.Length ==> b[k] == str[(str.Length - 1) - k]

{
    b := new char[str.Length];
    print str.Length, '\n';
    var i := str.Length - 1;
    var j := 0;
    
    while j < str.Length
    // decreases i
    invariant j <= str.Length
    invariant forall k: int :: 0 <= k < j ==> b[k] == str[(str.Length - 1) - k]
    {
        b[j] := str[i - j];
        // i := i - 1; this line gives me error but that make no sense to meee
        j := j + 1;
    }
}


method Main()
{
    var a := new char[8];
    a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7] := 'd', 'e', 's', 'r', 'e', 'v', 'e', 'r';
    var b := Reverse(a);
    print b[..];
    assert b[..] == [ 'r', 'e', 'v', 'e', 'r', 's', 'e', 'd' ];
    a := new char[1];
    a[0] := '!';
    b := Reverse(a);
    assert b[..] == [ '!' ];
    print b[..], '\n';
}