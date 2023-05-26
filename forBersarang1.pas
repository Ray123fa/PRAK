program forBersarang1;
uses crt;

var 
	i, j, m, n: shortint;
	kar: char;

begin
	clrscr;
	write('Masukkan banyak baris: '); readln(m);
	write('Masukkan banyak kolom: '); readln(n);

	for i:=1 to m do begin
		for j:=1 to n do
			write((j+i-1) mod 10:3);
		writeln;
	end;
end.