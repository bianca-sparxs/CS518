method getEven(arr: array?<int>)
modifies arr;
requires arr != null;
ensures forall i:int :: 0 <= i < arr.Length ==> arr[i] % 2 == 0;
{
    var i := 0;
    var j := arr.Length;

    while i < j
    invariant i <= j;
    invariant forall k :: 0 <= k < i  ==> arr[k] % 2 == 0;
    decreases j - i
    {
        if (arr[i] % 2 == 1) {
            arr[i] := arr[i] + 1;
        }
        i := i + 1;
    }

}