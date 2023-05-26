program rata_kiriAtas;
uses crt;

var n, i, j: shortint;

begin
	write('Masukkan jumlah baris: '); readln(n);

	for i:=n downto 1 do begin
		for j:=1 to i do
			write('*': 2);
		writeln;
	end;
end.