// Fungsi dengan Parameter (Segitiga 74 - Modul 7)
uses crt;

label lagi;

function cetak(c: char): char;
begin
	write(c:2);
end;

var 
	pilihan, i, j, n: shortint;
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
						for j:=1 to i do cetak(c);
						writeln;
					end;
				end;
				2: begin
					for i:=1 to n do begin
						for j:=1 to i do cetak(c);
						writeln;
					end;
				end;
				3: begin
					for i:=n downto 1 do begin
						for j:=1 to n-i do cetak(' ');
						for j:=i downto 1 do cetak(c);
						writeln;
					end;
				end;
				4: begin
					for i:=1 to n do begin
						for j:=1 to n-i do cetak(' ');
						for j:=1 to i do cetak(c);
						writeln;
					end;
				end;
				5: begin
					for i:=1 to n do begin
						for j:=0 to n-1 do
							if (j<n-i) then cetak(' ')
							else begin
								cetak(c);
								cetak(' ');
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