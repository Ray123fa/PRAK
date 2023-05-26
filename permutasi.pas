program permutasi;
var
	i, n, r: shortint;
	perm: longint;

begin
	write('n: '); readln(n);
	write('r: '); readln(r);
	perm := 1;
	for i:=n downto n-r+1 do
		perm := perm*i;
	writeln('P(', n, ',', r, ')= ', perm);
end.