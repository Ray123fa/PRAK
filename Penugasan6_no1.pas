program penambahanDeret;
uses crt;

var n, jum, i: shortint;

begin
	clrscr;
	write('Masukkan jumlah angka: '); readln(n);

	i := 1;
	jum := 1;
	write(i);
	while i<n do begin
		write('+', i+1);
		i := i+1;
		jum := jum+i;
	end;
	write('=', jum);
	readkey;
end.