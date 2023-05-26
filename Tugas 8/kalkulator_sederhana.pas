// Created by M. Rayhan Faridh
program kalkulator_sederhana;
uses crt;

label lagi;

var has: real;
procedure kali(a, b: real);
begin
	has := a*b;
end;

procedure bagi(a, b: real);
begin
	has := a/b;
end;

procedure tambah(a, b: real);
begin
	has := a+b;
end;

procedure kurang(a, b: real);
begin
	has := a-b;
end;

var
	pil: smallint;
	a, b: real;
	confirm: char;

begin
lagi:
	clrscr;
	writeln('KALKULATOR SEDERHANA');
	writeln('1. Perkalian');
	writeln('2. Pembagian');
	writeln('3. Penambahan');
	writeln('4. Pengurangan');
	writeln('5. Keluar');
	write('Pilih menu yang Anda inginkan!: '); readln(pil);

	writeln;
	case pil of
		1..4: begin
			write('Masukkan angka pertama: '); readln(a);
			write('Masukkan angka kedua: '); readln(b);
			if pil=1 then kali(a,b)
			else if pil=2 then bagi(a,b)
			else if pil=3 then tambah(a,b)
			else kurang(a,b);
		end;
		5: exit;
		else begin
			writeln('Pilihan anda di luar dari menu!');
			exit;
		end;
	end;

	writeln('Hasilnya adalah ', has:0:2);
	writeln;

	delay(1000);
	write('Ulang program? (y/n): '); readln(confirm);
	confirm := lowercase(confirm);
	if (confirm='y') then goto lagi
	else begin
		writeln('TERIMA KASIH');
		delay(1000);
		exit;
	end;
	readkey;
end.