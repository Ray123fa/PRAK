program rata_kananAtas;
uses crt;

var n, i, j: shortint;

begin
	write('Masukkan jumlah baris: '); readln(n);

	for i:=n downto 1 do begin
		for j:=1 to n-i do
			write(' ':2);
		for j:=i downto 1 do
			write('*':2);
		writeln;
	end;
end.