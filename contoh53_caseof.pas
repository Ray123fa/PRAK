program contoh53;
uses crt;

var nilai: integer;

begin
	clrscr;
	writeln('Input nilai yang didapat 0 s.d. 100!');
	write('Nilai: '); readln(nilai);

	case nilai of
		0..59: writeln('Anda tidak lulus');
		60..100: begin
			write('Anda lulus dengan nilai ');
			case nilai of
				60..74: writeln('cukup');
				75..89: writeln('baik');
				else writeln('sangat baik');
			end;
		end;
		else begin
			writeln('Anda salah input nilai');
			delay(2000);
			exit;
		end;
	end;
	readkey;
end.