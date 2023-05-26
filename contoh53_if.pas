program contoh53;
uses crt;

var nilai: integer;

begin
	clrscr;
	writeln('Input nilai yang didapat 0 s.d. 100!');
	write('Nilai: '); readln(nilai);

	if (nilai>=0) and (nilai<60) then
		writeln('Anda tidak lulus')
	else if (nilai>=60) and (nilai<=100) then
		begin
			write('Anda lulus dengan nilai ');

			if (nilai>=60) and (nilai<75) then writeln('cukup')
			else if (nilai>=75) and (nilai<89) then writeln('baik')
			else writeln('sangat baik');
		end
	else begin
		writeln('Anda salah input nilai');
		delay(2000);
		exit;
	end;
	readkey;
end.