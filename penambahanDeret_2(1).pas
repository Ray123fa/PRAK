program penambahanDeret_2;
uses crt;

var 
	i, n, pny: integer;
	sum: real;

begin
	clrscr;
	write('Masukkan banyak deret: '); readln(n);

	sum := 1;
	pny := 3;
	write(1);
	for i:=2 to n do begin
		if (i mod 2 = 1) then begin
			sum := sum + 1/pny;
			write(' + 1/', pny);
		end
		else begin
			sum := sum - 1/pny;
			write(' - 1/', pny);
		end;
		pny := pny+2;
	end;
	writeln(' = ', sum:0:2);
	readkey;
end.