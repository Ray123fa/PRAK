// Prosedur dengan Parameter (Modul 7 - Nomor 1)
uses crt;

procedure cetak(num: shortint);
begin
	write(num, ' ');
end;

var i, j, n: shortint;
begin
	clrscr;
	write('Masukkan jumlah baris: '); readln(n);

	for i:=1 to n do
	begin
		if (i mod 2 = 1) then
			for j:=0 to 9 do cetak(j)
		else
			for j:=9 downto 0 do cetak(j);
		writeln;
	end;
	readkey;
end.