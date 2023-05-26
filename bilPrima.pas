program bilPrima;
uses crt;

label 1;
var 
	x, i, faktor, jum_faktor: integer;
	periksa: char;

begin
  clrscr;
	1:
		write('Masukkan angka x: '); readln(x);
		faktor := 2;
		jum_faktor := 0;

		for i:=2 to x do
		begin
			if (x mod faktor = 0) then begin
				jum_faktor := jum_faktor+1;
				faktor := faktor+1;
			end
			else begin
				faktor := faktor+1;
			end;
		end;
		
		if (jum_faktor=1) then writeln(x, ' adalah bilangan prima')
		else writeln(x, ' bukan bilangan prima');

		write('Periksa bil lainnya (y/n)? '); readln(periksa);
		periksa := lowercase(periksa);
    writeln;
		if periksa='y' then goto 1
		else exit;
end.