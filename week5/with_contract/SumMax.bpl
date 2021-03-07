procedure sum_max (a: [int] int, N: int) returns (sum: int, max: int)
	requires 0 < N ;
	ensures (forall i: int :: 0 <= i && i < N  ==> a[i] <= max);
{
	var i: int;
	sum := 0;
	max := 0;
	i := 0;
	while (i < N)
		// invariant ;
	{
		if (max < a[i]) {
			max := a[i];
		}
		sum := sum + a[i];
		i := i + 1;
	}
}