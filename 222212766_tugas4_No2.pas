(* Program ini dibuat oleh Muhammad Rayhan Faridh, 1KS2 *)
program kondisiAir;
uses crt;

var
	suhu: integer;
	kondisi: string;

begin
	clrscr;
	writeln('MENENTUKAN KONDISI AIR');
	writeln('======================');
	writeln;

	writeln('Berapa suhu air saat ini?');
	write('SUHU: '); readln(suhu);

	if (suhu<=0) then kondisi := 'Beku'
	else if (suhu>0) and (suhu<100) then kondisi := 'Cair'
	else if (suhu>=100) then kondisi := 'Uap';

	writeln;
	writeln('Kondisi air saat ', suhu, ' derajat: ', kondisi);
	readkey;
end.