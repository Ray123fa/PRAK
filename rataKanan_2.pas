program rata_kanan;
uses crt;

var 
	n, i, j: shortint;
	kar: char;

begin
	write('Masukkan jumlah baris: '); readln(n);
	write('Masukkan karakter: '); readln(kar);

	for i:=1 to n do begin
		for j:=1 to n do
			if (j>n-i) then write(kar:2)
			else write(' ':2);
		writeln;
	end;
end.