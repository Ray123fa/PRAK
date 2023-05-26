program komb2;
var
	i, j, n, r: shortint;
	komb: real;

begin
	write('n: '); readln(n);
	write('r: '); readln(r);

	komb := 1;
	// for i:=n downto n-r+1 do begin
	// 	komb := komb*i/(r-j);
	// 	j := j+1;
	// end;
	for i:=1 to r do
		// komb := komb*(n-i+1)/(r-i+1);
		komb := komb*(n-i+1)/i;
	writeln('C(', n, ',', r, ')= ', komb:0:0);
end.