program rata_tengah;
uses crt;

var n, i, j: shortint;

begin
	write('Masukkan jumlah baris: '); readln(n);

	for i:=1 to n do begin
		for j:=1 to n-i do begin
			write(' ':2)
		end;
		for j:=1 to i do begin
			write('*':2, ' ':2)
		end;
		writeln;
	end;
end.