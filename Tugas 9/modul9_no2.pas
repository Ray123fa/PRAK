program With_3param;
uses crt;

procedure add1(a,b: integer; var has: integer);
begin
	has := a+b;
end;

function add2(a,b: integer; has: integer): integer;
begin
	has := a+b;
	add2 := has;
end;

var x, y, has: integer;
begin
	clrscr;
	write('X= '); readln(x);
	write('Y= '); readln(y);
	writeln;
	
	// Prosedur
	add1(x,y, has);
	writeln('Prosedur -> Hasil dari ', x, ' + ', y, ' = ', has);

	// Fungsi
	writeln('Fungsi -> Hasil dari ', x, ' + ', y, ' = ', add2(x,y, has));
end.