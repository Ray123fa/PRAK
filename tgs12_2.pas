{
	Nama: Muhammad Rayhan Faridh
	NIM: 222212766
	Kelas: 1KS2
	Mata Kuliah: Algoritma Pemrograman
}
program desimalBiner;
uses crt;

function biner(n: integer): string;
begin
	if n=0 then biner := '0'
	else if n=1 then biner := '1'
	else if (n mod 2=0) then
		biner := biner(n div 2) + '0'
	else biner := biner(n div 2) + '1';
end;

var n: integer;
begin
	clrscr;
	write('N: '); readln(n);
	writeln('Biner: ', biner(n));
end.