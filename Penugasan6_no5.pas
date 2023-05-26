program jumBilangan;
uses crt;

label 1;
var
	i, n, sum, bil: integer;
	lagi: char;

begin
1:
	clrscr;
	repeat
		write('Masukkan jumlah bilangan: '); readln(n);

		if n<=1 then begin
			writeln;
			writeln('Maaf, jumlah bilangan setidaknya paling sedikit 2!');
			delay(2000);
			clrscr;
		end;
	until (n>1);

	sum := 0;
	i := 1;
	while i<=n do begin
		repeat
			write('Bilangan ke-', i, ': '); readln(bil);
		until (bil mod 2 >= 0);
		sum := sum+bil;

		if (bil mod 2 = 1) then sum := sum-bil;
		i := i+1;
	end;
	writeln('Jumlah semua bilangan genap = ', sum);
	writeln;

	write('Ulangi program? (y/n): '); readln(lagi);
	if upcase(lagi)='Y' then goto 1
	else writeln('Terima kasih telah menggunakan program ini.');
	readkey;
end.