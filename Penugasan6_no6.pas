program hargaFotokopi;
uses crt, sysutils;

var 
	i: shortint;
	j, k: shortstring;

begin
	clrscr;
	writeln('TABEL HARGA FOTOKOPI');
	writeln('|---------|--------|');
	writeln('|LEMBAR   |HARGA   |');
	writeln('|---------|--------|');

	i := 1;
	while i<=100 do begin
		j := IntToStr(i);
		k := IntToStr(i*125);

		if length(j)=1 then write('|', i, '        |')
		else if length(j)=2 then write('|', i, '       |')
		else if length(j)=3 then write('|', i, '      |');

		if length(k)=4 then write(i*125, '    |')
		else if length(k)=5 then write(i*125, '   |')
		else write(i*125, '     |');

		writeln;
		i := i+1;
	end;
	writeln('|---------|--------|');
	readkey;
end.