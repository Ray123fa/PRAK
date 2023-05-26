program With_2param;
uses crt;

var has: integer;
procedure add1(a,b: integer);
begin
	has := a+b;
end;

function add2(a,b: integer): integer;
begin
	add2 := a+b;
end;

var x, y: integer;
begin
	clrscr;
	write('X= '); readln(x);
	write('Y= '); readln(y);
	writeln;

	// Prosedur
	add1(x, y);
	writeln('Prosedur -> Hasil dari ', x, ' + ', y, ' = ', has);

	// Fungsi
	writeln('Fungsi -> Hasil dari ', x, ' + ', y, ' = ', add2(x,y));
end.