program pembulatanBelanja;
uses crt;

var 
	awal, akhir: longint;
	sisa: integer;

begin
	clrscr;
	write('Total belanja: Rp'); readln(awal);
	sisa := awal mod 25;
	akhir := awal - sisa;

	writeln('Yang harus dibayarkan adalah Rp', akhir, ',-');
	readkey;
end.