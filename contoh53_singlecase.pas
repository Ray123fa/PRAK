program contoh53_singlecase;
uses crt;

var nilai: integer;

begin
	clrscr;
	writeln('Input nilai yang didapat 0 s.d. 100!');
	write('Nilai: '); readln(nilai);

	case nilai of
		0..59: writeln('Anda tidak lulus');
		60..74: writeln('Anda lulus dengan nilai cukup');
		75..89: writeln('Anda lulus dengan nilai baik');
		90..100: writeln('Anda lulus dengan nilai sangat baik');
		else begin
			writeln('Anda salah input nilai');
			delay(2000);
			exit;
		end;
	end;
	readkey;
end.