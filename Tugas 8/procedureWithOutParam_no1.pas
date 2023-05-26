// Prosedur tanpa Parameter (Modul 7 - Nomor 1)
uses crt;

var i, j, n: shortint;
procedure cetak;
begin
	write(j, ' ');
end;

begin
	clrscr;
	write('Masukkan jumlah baris: '); readln(n);

	for i:=1 to n do
	begin
		if (i mod 2 = 1) then
			for j:=0 to 9 do cetak
		else
			for j:=9 downto 0 do cetak;
		writeln;
	end;
	readkey;
end.