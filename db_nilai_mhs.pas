program db_nilai_mhs;
uses crt, sysutils;

type
	mhs = record
		nim: string[9];
		nama: string[30];
		alamat: string[20];
		nilai: record
			tugas, uts, uas, prak: shortint;
			akhir: real;
		end;
		grade: string[2];
	end;

var
  dataMhs: array of mhs;
	i,j,n: integer;
	pil: shortint;
	lbr1,lbr2,lbr3,lbr4,lbr5,lbr6: shortint;

procedure nilai_akhir(); forward;
procedure input();
var batasJ, awal_I, akhir_I: integer;
begin
	repeat
		clrscr;
		write('Masukkan banyak mahasiswa: '); readln(n);
	until (n>0);
	setlength(dataMhs, n);
	
	batasJ := n div 5;
	awal_I := 1;
	akhir_I := 5;

	if (n mod 5 <> 0) then batasJ := batasJ+1;
	if (n<5) then begin
		batasJ := 1;
		akhir_I := n;
	end;

	writeln;
	for j:=1 to batasJ do begin
		if j>1 then clrscr;
		if (n>5) and (n mod 5<>0) and (j=batasJ) then akhir_I := n;

		for i:=awal_I to akhir_I do begin
			writeln('==========================');
			writeln('Input data mahasiswa ke-',i);
			with dataMhs[i-1] do
			begin
				// write('NIM: '); readln(nim);
				write('Nama: '); readln(nama);
				nama := upcase(nama);
				// write('Alamat: '); readln(alamat);
				// alamat := upcase(alamat);
				write('Nilai Tugas: '); readln(nilai.tugas);
				write('Nilai UTS: '); readln(nilai.uts);
				write('Nilai UAS: '); readln(nilai.uas);
				write('Nilai PRAK: '); readln(nilai.prak);
			end;
		end;
		awal_I := i+1;
		akhir_I := awal_I+4;

		writeln('==========================');
		writeln;
		if j<batasJ then begin
			write('Enter untuk melanjutkan input data '); readkey;
		end;
		writeln(n, ' data mahasiswa sukses diinputkan.');
	end;
	nilai_akhir();
end;

// procedure menu(); forward;
function error(): boolean; // menampilkan pesan error jika n terbaca nol
begin
	if n=0 then begin
		writeln;
		writeln('Belum ada data yang diinput!');
		write('Enter untuk kembali ke menu ');
	end;
	error := (n=0);
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

procedure tampil_alamat();
begin
	clrscr;
	writeln('Alamat Mahasiswa 1KS2');
	writeln;
	writeln('=====================================================================');
	writeln('|    NIM    |              Nama              |        Alamat        |');
	writeln('|-----------|--------------------------------|----------------------|');
	for i:=1 to n do begin
		with dataMhs[i-1] do begin
			lbr1 := 9-length(nim);
			lbr2 := 30-length(nama);
			lbr3 := 20-length(alamat);

			write('| ', nim, '':lbr1, ' | ');
			write(nama, '':lbr2, ' | ');
			writeln(alamat, '':lbr3, ' |');
		end;
	end;
	writeln('=====================================================================');
end;

procedure tampil_grade();
begin
	clrscr;
	writeln('Nilai Akhir Mahasiswa 1KS2');
	writeln;
	writeln('====================================================================');
	writeln('|    NIM    |              Nama              | Nilai Akhir | Grade |');
	writeln('|-----------|--------------------------------|-------------|-------|');
	for i:=1 to n do begin
		with dataMhs[i-1] do begin
			lbr1 := 9-length(nim);
			lbr2 := 30-length(nama);
			lbr3 := 8-length(inttoStr(round(nilai.akhir)));
			lbr4 := 5-length(grade);

			write('| ', nim, '':lbr1, ' | ');
			write(nama, '':lbr2, ' | ');
			write('':lbr3, nilai.akhir:0:2, ' | ');
			writeln(grade, '':lbr4, ' |');
		end;
	end;
	writeln('====================================================================');
end;

procedure tampil_detail();
begin
	clrscr;
	writeln('Transparansi Nilai Mahasiswa 1KS2');
	writeln;
	writeln('=======================================================================');
	writeln('|              Nama              | TUGAS | UTS | UAS | PRAK |  AKHIR  |');
	writeln('|--------------------------------|-------|-----|-----|------|---------|');
	for i:=1 to n do begin
		with dataMhs[i-1] do begin
			lbr1 := 30-length(nama);
			lbr2 := 5-length(inttoStr(nilai.tugas));
			lbr3 := 3-length(inttoStr(nilai.uts));
			lbr4 := 3-length(inttoStr(nilai.uas));
			lbr5 := 4-length(inttoStr(nilai.prak));
			lbr6 := 4-length(inttoStr(round(nilai.akhir)));

			write('| ', nama, '':lbr1, ' | ');
			write('':lbr2, nilai.tugas, ' | ');
			write('':lbr3, nilai.uts, ' | ');
			write('':lbr4, nilai.uas, ' | ');
			write('':lbr5, nilai.prak, ' | ');
			writeln('':lbr6, nilai.akhir:0:2, ' |');
		end;
	end;
	writeln('=======================================================================');
end;

procedure tampil();
begin
	if error() = true then exit; // checking n value
	clrscr;
	writeln('Menu Tampilan');
	writeln('1. Daftar Alamat');
	writeln('2. Daftar Nilai Akhir dan Grade');
	writeln('3. Daftar Nilai Tugas, UTS, UAS, Prak, Akhir');
	writeln('Ketik angka selain 1-3 untuk keluar!');
	write('Pilihan Anda: '); readln(pil);

	case pil of
		1: tampil_alamat();
		2: tampil_grade();
		3: tampil_detail();
		else writeln('Terima kasih!');
	end;
end;

procedure max();
var
  maks: record
		tugas, uts, uas, prak: shortint;
		akhir: real;
	end;
  pemilik: string[30];
  sum: record
		tugas, uts, uas, prak, akhir: shortint;
	end;
begin
	if error() = true then exit; // checking n value
	clrscr;
	writeln('Pencarian Nilai Maksimum');
	writeln('1. Nilai Tugas');
	writeln('2. Nilai UTS');
	writeln('3. Nilai UAS');
	writeln('4. Nilai Praktikum');
	writeln('5. Nilai Akhir');
	writeln('Ketik angka selain 1-5 untuk keluar!');
	write('Cari Berdasar: '); readln(pil);

	if (pil<1) or (pil>5) then writeln('Terima kasih!');

	maks.tugas := -1;
	maks.uts := -1;
	maks.uas := -1;
	maks.prak := -1;
	maks.akhir := -1;
	for i:=1 to n do begin
		case pil of
			1: begin
				if dataMhs[i-1].nilai.tugas > maks.tugas then begin
					maks.tugas := dataMhs[i-1].nilai.tugas;
					pemilik := dataMhs[i-1].nama;
					sum.tugas := 1;
				end
				else if dataMhs[i-1].nilai.tugas = maks.tugas then
					sum.tugas := sum.tugas+1;
			end;
			2: begin
				if dataMhs[i-1].nilai.uts > maks.uts then begin
					maks.uts := dataMhs[i-1].nilai.uts;
					pemilik := dataMhs[i-1].nama;
					sum.uts := 1;
				end
				else if dataMhs[i-1].nilai.uts = maks.uts then
					sum.uts := sum.uts+1;
			end;
			3: begin
				if dataMhs[i-1].nilai.uas > maks.uas then begin
					maks.uas := dataMhs[i-1].nilai.uas;
					pemilik := dataMhs[i-1].nama;
					sum.uas := 1;
				end
				else if dataMhs[i-1].nilai.uas = maks.uas then
					sum.uas := sum.uas+1;
			end;
			4: begin
				if dataMhs[i-1].nilai.prak > maks.prak then begin
					maks.prak := dataMhs[i-1].nilai.prak;
					pemilik := dataMhs[i-1].nama;
					sum.prak := 1;
				end
				else if dataMhs[i-1].nilai.prak = maks.prak then
					sum.prak := sum.prak+1;
			end;
			5: begin
				if dataMhs[i-1].nilai.akhir > maks.akhir then begin
					maks.akhir := dataMhs[i-1].nilai.akhir;
					pemilik := dataMhs[i-1].nama;
					sum.akhir := 1;
				end
				else if dataMhs[i-1].nilai.akhir = maks.akhir then
					sum.akhir := sum.akhir+1;
			end;
		end;
	end;

	case pil of
		1: writeln('Ditemukan ', sum.tugas, ' orang dengan nilai tugas terbesar -> ', maks.tugas);
		2: writeln('Ditemukan ', sum.uts, ' orang dengan nilai tugas terbesar -> ', maks.uts);
		3: writeln('Ditemukan ', sum.uas, ' orang dengan nilai tugas terbesar -> ', maks.uas);
		4: writeln('Ditemukan ', sum.prak, ' orang dengan nilai tugas terbesar -> ', maks.prak);
		5: writeln('Ditemukan ', sum.akhir, ' orang dengan nilai tugas terbesar -> ', maks.akhir:0:2);
	end;

	for i:=1 to n do begin
		case pil of
			1: begin
				if dataMhs[i-1].nilai.tugas = maks.tugas then
					writeln('- ', dataMhs[i-1].nama);
			end;
			2: begin
				if dataMhs[i-1].nilai.uts = maks.uts then
					writeln('- ', dataMhs[i-1].nama);
			end;
			3: begin
				if dataMhs[i-1].nilai.uas = maks.uas then
					writeln('- ', dataMhs[i-1].nama);
			end;
			4: begin
				if dataMhs[i-1].nilai.prak = maks.prak then
					writeln('- ', dataMhs[i-1].nama);
			end;
			5: begin
				if dataMhs[i-1].nilai.akhir = maks.akhir then
					writeln('- ', dataMhs[i-1].nama);
			end;
		end;
	end;
end;

// function min(): integer;
// begin
// 	min := dataMhs[0].nilai;
// 	for i:=1 to n-1 do begin
// 		if dataMhs[i].nilai < min then
// 			min := dataMhs[i].nilai;
// 	end;
// end;

// function total(): integer;
// var sum: integer;
// begin
// 	sum := 0;
// 	for i:=0 to n-1 do begin
// 		sum := sum + dataMhs[i].nilai;
// 	end;
// 	total := sum;
// end;

// function rerata(): real;
// begin
// 	rerata := total/n;
// end;

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
		3: max();
    else writeln('Terima kasih!');
	end;
	readkey;
end;

begin
	repeat
		menu();
	until (pil<1) or (pil>5);
end.