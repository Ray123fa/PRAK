program rata_kanan;
uses crt;

var n, i, j: shortint;

begin
	write('Masukkan jumlah baris: '); readln(n);

	for i:=1 to n do begin
		for j:=1 to n-i do
			write(' ':2);
		for j:=1 to i do
			write('*':2);
		writeln;
	end;
end.