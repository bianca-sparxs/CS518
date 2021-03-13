method intDiv(n: nat, d: nat) returns(q: nat, r: nat) 
requires n >= 0 && d > 0;
ensures n == q * d + r
ensures 0 <= r < d

{
    q := 0;
    r := n;

    while r >= d
    invariant q * d + r == n
    // invariant q * d <= n
    {
        q := q + 1;
        r := r - d;
    }
}