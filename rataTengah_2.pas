program rata_tengah;
uses crt;

var 
	n, i, j, lebar: shortint;
	kar: char = '*';

begin
	write('Masukkan jumlah baris: '); readln(n);
	n := n-1;
	// write('Masukkan karakter: '); readln(kar);

	lebar := 2;
	for i:=0 to n do begin
		for j:=0 to n do
			if (j<n-i) then write(' ':lebar)
			else write(kar:lebar, ' ':lebar);
		writeln;
	end;
end.