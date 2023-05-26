program db_nilai_mhs;
uses crt, sysutils;

type
	mhs = record
		nim: string[9];
		nama: string[30];
		kelas: string[4];
		nilai: smallint;
	end;

var
  dataMhs: array of mhs;
	i,n: integer;

procedure input();
begin
	clrscr;
	write('Masukkan banyak mahasiswa: '); readln(n);
	setlength(dataMhs, n);
	
	writeln;
	for i:=0 to n-1 do begin
		writeln('==========================');
		writeln('Input data mahasiswa ke-',i+1);
		with dataMhs[i] do
		begin
			write('NIM: '); readln(nim);
			write('Nama: '); readln(nama);
			write('Kelas: '); readln(kelas);
			write('Nilai Alpro: '); readln(nilai);
		end;
	end;
	writeln('==========================');
	writeln('Data sebanyak ', n, ' mahasiswa berhasil diinputkan.');
end;

procedure tampil();
var lbr1, lbr2, lbr3, lbr4: smallint;
begin
	clrscr;
	writeln('Menampilkan data yang sudah diinputkan');
	writeln('Data Mahasiswa Polstat STIS');
	writeln('====================================================================');
	writeln('|    NIM    |              Nama              | Kelas | Nilai Alpro |');
	writeln('|-----------|--------------------------------|-------|-------------|');
	for i:=0 to n-1 do
	begin
		with dataMhs[i] do begin
			lbr1 := 9-length(nim);
			lbr2 := 30-length(nama);
			lbr3 := 5-length(kelas);
			lbr4 := 11-length(intToStr(nilai));

			write('| ', nim, '':lbr1, ' | ');
			write(nama, '':lbr2, ' | ');
			write(kelas, '':lbr3, ' | ');
			writeln(nilai, '':lbr4, ' |');
		end;
	end;
	writeln('====================================================================');
end;

function max(): integer;
begin
	max := dataMhs[0].nilai;
	for i:=1 to n-1 do begin
		if dataMhs[i].nilai > max then
			max := dataMhs[i].nilai;
	end;
end;

function min(): integer;
begin
	min := dataMhs[0].nilai;
	for i:=1 to n-1 do begin
		if dataMhs[i].nilai < min then
			min := dataMhs[i].nilai;
	end;
end;

function total(): integer;
var sum: integer;
begin
	sum := 0;
	for i:=0 to n-1 do begin
		sum := sum + dataMhs[i].nilai;
	end;
	total := sum;
end;

function rerata(): real;
begin
	rerata := total/n;
end;

var pil: smallint;
procedure menu();
begin
	clrscr;
	writeln('Entri Data Mahasiswa');
	writeln('1. Input data');
	writeln('2. Tampilkan data');
	writeln('3. Nilai Alpro terbesar');
	writeln('4. Nilai Alpro terkecil');
	writeln('5. Rata-rata nilai Alpro');
	writeln('Ketik angka selain 1-5 untuk keluar!');
	writeln;

	write('Pilihan Anda: '); readln(pil);
	case pil of
		1: input();
    2: tampil();
    3: writeln('Nilai Alpro terbesar adalah ', max());
    4: writeln('Nilai Alpro terkecil adalah ', min());
		5: writeln('Rata-rata nilai Alpro adalah ', rerata():0:2);
    else writeln('Terima kasih!');
	end;
	readkey;
end;

begin
	repeat
		menu();
	until (pil<1) or (pil>5);
end.