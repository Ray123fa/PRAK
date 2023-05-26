program cariRerata;
uses crt;

label 1;
var
	i, n, num, total: shortint;
	rerata: real;
	lagi: char;

begin
1:
	repeat
		clrscr;
		write('Masukkan jumlah bilangan: '); readln(n);
	until (n>0);

	total := 0;
	i := 1;
	repeat
		write('Masukkan bilangan ke-', i, ': '); readln(num);
		total := total+num;
		i := i+1;
	until (i>n);
	rerata := total/n;
	writeln('Rata-rata bilangan adalah: ', rerata:0:2);
	writeln;

	write('Ulangi program? (y/n): '); readln(lagi);
	if upcase(lagi)='Y' then goto 1
	else writeln('Terima kasih telah menggunakan program ini.');
	readkey;
end.