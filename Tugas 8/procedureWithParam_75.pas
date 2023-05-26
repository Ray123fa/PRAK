// Prosedur dengan Parameter (Segitiga 75 - Modul 7)
uses crt;

label lagi;

var i, j: shortint;
procedure cetak(c: char; n: shortint);
begin
	if (i=1) or (i=n) or (j=1) or (j=i) then write(c:2)
	else write(' ':2)
end;

var 
	pilihan, n: shortint;
	c, confirm: char;
begin
lagi:
	clrscr;
	writeln('Pilih salah satu menu di bawah ini!');
	writeln('1. Segitiga rata kiri atas');
	writeln('2. Segitiga rata kiri bawah');
	writeln('3. Segitiga rata kanan atas');
	writeln('4. Segitiga rata kanan bawah');
	writeln('5. Segitiga rata tengah');
	writeln;

	write('Ketikkan pilihan anda: '); readln(pilihan);

	case pilihan of
		1..5: begin
			write('Masukkan karakter yang anda inginkan: '); readln(c);
			write('Masukkan lebar: '); readln(n);
			writeln;
			case pilihan of
				1: begin
					for i:=n downto 1 do begin
						for j:=1 to i do cetak(c, n);
						writeln;
					end;
				end;
				2: begin
					for i:=1 to n do begin
						for j:=1 to i do cetak(c, n);
						writeln;
					end;
				end;
				3: begin
					for i:=n downto 1 do begin
						for j:=1 to n-i do write(' ':2);
						for j:=i downto 1 do cetak(c, n);
						writeln;
					end;
				end;
				4: begin
					for i:=1 to n do begin
						for j:=1 to n-i do write(' ':2);
						for j:=1 to i do cetak(c, n);
						writeln;
					end;
				end;
				5: begin
					for i:=1 to n do begin
						for j:=1 to n-i do write(' ':2);
						for j:=1 to i do begin
							cetak(c, n);
							write(' ':2);
						end;
						writeln;
					end;
				end;
			end;
		end;
		else writeln('Pilihan Anda di luar menu!');
	end;

	writeln;
	write('Coba lagi (y/n)?: '); readln(confirm);
	confirm := lowercase(confirm);
	if confirm='y' then goto lagi
	else begin
		writeln('TERIMA KASIH');
		delay(1000);
		exit;
	end;
	readkey;
end.