program db_nilai_mhs;
uses crt, sysutils;

type
	mhs = record
		nim: string[9];
		nama: string[30];
		alamat: string[25];
		nilai: record
			tugas, uts, uas, prak: smallint;
			akhir: real;
		end;
		grade: string[2];
	end;

var
  dataMhs: array of mhs;
	i,j,n: integer;

procedure nilai_akhir(); forward;
procedure input();
var batasJ, awal_I, akhir_I: integer;
begin
	repeat
		clrscr;
		write('Masukkan banyak mahasiswa: '); readln(n);
	until (n>0);
	setlength(dataMhs, n);
	
	batasJ := n div 5; // untuk n lebih dari sama dengan 5
	awal_I := 1;
	akhir_I := 5;

	if (n mod 5 <> 0) then batasJ := batasJ+1
	else if (n<5) then batasJ := 1;

	writeln;
	for j:=1 to batasJ do begin
		if j>1 then clrscr;
		if (n>5) and (n mod 5<>0) and (j=batasJ) then akhir_I := n
		else akhir_I := n;

		for i:=awal_I to akhir_I do begin
			writeln('==========================');
			writeln('Input data mahasiswa ke-',i);
			with dataMhs[i-1] do
			begin
				write('NIM: '); readln(nim);
				write('Nama: '); readln(nama);
				write('Alamat: '); readln(alamat);
				with nilai do begin
					write('Nilai Tugas: '); readln(tugas);
					write('Nilai UTS: '); readln(uts);
					write('Nilai UAS: '); readln(uas);
					write('Nilai PRAK: '); readln(prak);
				end;
			end;
			writeln('==========================');
		end;
		awal_I := i+1;
		akhir_I := awal_I+4;
		if j<batasJ then begin
			write('Enter untuk melanjutkan input data '); readkey;
		end;
	end;
	nilai_akhir();
end;

procedure nilai_akhir();
begin
	for i:=1 to n do begin
		with dataMhs[i-1] do begin
			with nilai do begin
				akhir := (10/100)*tugas + (30/100)*uts + (30/100)*uas + (30/100)*prak;

				case round(akhir) of
					85..100: grade:='A';
					80..84: grade:='A-';
					75..79: grade:='B+';
					70..74: grade:='B';
					65..69: grade:='C+';
					60..64: grade:='C';
					55..59: grade:='D+';
					40..54: grade:='D';
					0..39: grade:='E';
				end;
			end;
		end;
	end;
end;

procedure tampil();
var lbr1, lbr2, lbr3, lbr4: smallint;
begin
	clrscr;
	writeln('Menampilkan data yang sudah diinputkan');
	writeln('Data Mahasiswa Polstat STIS');
	
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
    else writeln('Terima kasih!');
	end;
	readkey;
end;

begin
	repeat
		menu();
	until (pil<1) or (pil>5);
end.