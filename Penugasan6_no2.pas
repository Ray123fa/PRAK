program anakAyam;
uses crt;

var
	n: shortint;
	lagi: char;

begin
	repeat
		clrscr;
		write('Masukkan jumlah anak ayam: '); readln(n);
		writeln;

		while n>=1 do begin
			write('Anak Ayam turun ', n);
			if n=1 then write(', mati satu tinggal induknya.')
			else write(', mati satu tinggal ', n-1);
			n := n-1;
			writeln;
		end;

		writeln;
		write('Ulangi program? (y/n): '); readln(lagi);
		if upcase(lagi)='N' then writeln('Terima kasih telah menggunakan program ini.');
	until (upcase(lagi) <> 'Y');
	readkey;
end.