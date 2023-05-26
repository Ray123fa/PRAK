program forBersarang2;
uses crt;

var 
	i, j, m, n: shortint;
	kar: char;

begin
	clrscr;
	write('Masukkan banyak baris: '); readln(m);
	write('Masukkan banyak kolom: '); readln(n);
	write('Masukkan karakter: '); readln(kar);

	for i:=1 to m do begin
		for j:=1 to n do begin
			if (i=1) or (i=m) or (j=1) or (j=n) then write(kar:2)
			else write(' ':2);
		end;
		writeln;
	end;
end.