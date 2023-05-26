program segitigaPascal;
uses crt;

var 
	n, i, j, k, r, num: shortint;

begin
	clrscr;
	write('Masukkan jumlah baris: '); readln(n);

	for i:=1 to n do begin
		r := 0;
		for j:=1 to n do
			if (j<=n-i) then write(' ':2)
			else begin
				num := 1;
				for k:=1 to r do
					num := num*(i-k) div k;
				write(num:2, ' ':2);
				inc(r);
			end;
		writeln;
	end;
end.