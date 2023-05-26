program segitigaPascal;
uses crt;

var n, i, j, num, counter: integer;

begin
	clrscr;
	write('Masukkan jumlah baris segitiga pascal: '); readln(n);

	for i:=1 to n do begin
		num := 1;
		counter := 1;
		for j:=1 to n do
			if (j>n-i) then begin
				write(num:2, ' ':2);
				num := num*(i-counter) div counter;
				inc(counter);
			end
			else write(' ':2);
		writeln;
	end;
	readkey;
end.