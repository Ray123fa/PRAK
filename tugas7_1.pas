program tugas7_1;
uses crt;

var n, i, j: shortint;

begin
	write('Masukkan jumlah baris: '); readln(n);

	for i:=1 to n do
	begin
		if (i mod 2 = 1) then begin
			for j:=0 to 9 do write(j, ' ');
		end
		else begin
			for j:=9 downto 0 do write(j, ' ');
		end;
		writeln;
	end;
end.