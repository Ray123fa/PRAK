program bykUsiaMhs;
uses crt;

label 1;
var
	i, n, mhs: shortint;
	a,b,c,d,e: shortint;
	lagi: char;

begin
1:
	a := 0;
	b := 0;
	c := 0;
	d := 0;
	e := 0;

	repeat
		clrscr;
		write('Masukkan jumlah mahasiswa: '); readln(n);
	until (n>0);

	i := 1;
	while i<=n do
	begin
		repeat
			write('Usia mahasiswa ke-', i, ': '); readln(mhs);
		until (mhs>0);

		case mhs of
			17: a:=a+1;
			18: b:=b+1;
			19: c:=c+1;
			20: d:=d+1;
			else e:=e+1;
		end;
		i := i+1;
	end;

	writeln('Jumlah mahasiswa berusia 17 tahun adalah ', a);
	writeln('Jumlah mahasiswa berusia 18 tahun adalah ', b);
	writeln('Jumlah mahasiswa berusia 19 tahun adalah ', c);
	writeln('Jumlah mahasiswa berusia 20 tahun adalah ', d);
	writeln('Jumlah mahasiswa berusia selain 17-20 tahun adalah ', e);
	writeln;

	write('Ulangi program? (y/n): '); readln(lagi);
	if upcase(lagi)='Y' then goto 1
	else writeln('Terima kasih telah menggunakan program ini.');
	readkey;
end.