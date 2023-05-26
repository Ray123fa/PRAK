program contoh51_if;
uses crt;

var
	nilai: integer;
	grade: char;

begin
	clrscr;
	writeln('Input nilai yang didapat 0 s.d. 100!');
	write('Nilai: '); readln(nilai);

	if (nilai>=0) and (nilai<=100) then
		begin
			if (nilai>=0) and (nilai <60) then grade:='D'
			else if (nilai>=60) and (nilai <70) then grade:='C'
			else if (nilai>=70) and (nilai <80) then grade:='B'
			else if (nilai>=80) and (nilai <=100) then grade:='A';

			writeln('Grade Anda: ', grade);
		end
	else begin
		writeln('Anda salah input nilai');
		delay(2000);
		exit;
	end;

	if grade='D' then writeln('Kurang Memuaskan')
	else if grade='C' then writeln('Cukup')
	else if grade='B' then writeln('Baik')
	else writeln('Sangat Baik');
	readkey;
end.