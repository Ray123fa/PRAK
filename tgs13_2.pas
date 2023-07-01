{
	Nama: Muhammad Rayhan Faridh
	NIM: 222212766
	Kelas: 1KS2
	Mata Kuliah: Algoritma Pemrograman
}
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
	lbr: array [0..7] of shortint;

procedure predikat(); forward;
procedure input();
var batasJ, awal_I, akhir_I: integer;
begin
	repeat
		clrscr;
		write('Masukkan banyak mahasiswa: '); readln(n);
	until (n>0);
	setlength(dataMhs, n); // menyesuaikan panjang array sesuai banyak mahasiswa dimulai indeks 0
	
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
				write('NIM        : '); readln(nim);
				write('Nama       : '); readln(nama);
				nama := upcase(nama);
				write('Alamat     : '); readln(alamat);
				alamat := upcase(alamat);
				write('Nilai Tugas: '); readln(nilai.tugas);
				write('Nilai UTS  : '); readln(nilai.uts);
				write('Nilai UAS  : '); readln(nilai.uas);
				write('Nilai PRAK : '); readln(nilai.prak);
				nilai.akhir := (10/100)*nilai.tugas + (30/100)*nilai.uts + (30/100)*nilai.uas + (30/100)*nilai.prak;
				writeln('Nilai Akhir: ', nilai.akhir:0:2);
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
		write('Enter untuk kembali ke menu ');
	end;
	predikat();
end;

function error(): boolean; // menampilkan pesan error jika n terbaca nol
begin
	if n=0 then begin
		writeln;
		writeln('Belum ada data yang diinput!');
		write('Enter untuk kembali ke menu ');
	end;
	error := (n=0);
end;

procedure predikat();
begin
	for i:=1 to n do begin
		with dataMhs[i-1] do begin
			case round(nilai.akhir) of
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

procedure tampil_alamat();
var batasJ, awal_I, akhir_I: integer;
begin
	batasJ := n div 5;
	awal_I := 1;
	akhir_I := 5;

	if (n mod 5 <> 0) then batasJ := batasJ+1;
	if (n<5) then begin
		batasJ := 1;
		akhir_I := n;
	end;

	for j:=1 to batasJ do begin
		clrscr;
		writeln('Alamat Mahasiswa 1KS2');
		writeln;
		writeln('=====================================================================');
		writeln('|    NIM    |              Nama              |        Alamat        |');
		writeln('|-----------|--------------------------------|----------------------|');

		if (n>5) and (n mod 5<>0) and (j=batasJ) then akhir_I := n;
		for i:=awal_I to akhir_I do begin
			with dataMhs[i-1] do begin
				lbr[0] := 9-length(nim);
				lbr[1] := 30-length(nama);
				lbr[2] := 20-length(alamat);

				write('| ', nim, '':lbr[0], ' | ');
				write(nama, '':lbr[1], ' | ');
				writeln(alamat, '':lbr[2], ' |');
			end;
		end;
		awal_I := i+1;
		akhir_I := awal_I+4;

		writeln('=====================================================================');
		writeln;
		if j<batasJ then begin
			writeln('Menampilkan ', awal_I-5, '-', akhir_I-5, ' dari ', n, ' data alamat mahasiswa 1KS2.');
			write('Enter untuk ke halaman selanjutnya '); readkey;
		end;
		writeln(n, ' data alamat mahasiswa 1KS2 sukses ditampilkan.');
		write('Enter untuk kembali ke menu ');
	end;
end;

procedure tampil_nilai();
var batasJ, awal_I, akhir_I: integer;
begin
	batasJ := n div 5;
	awal_I := 1;
	akhir_I := 5;

	if (n mod 5 <> 0) then batasJ := batasJ+1;
	if (n<5) then begin
		batasJ := 1;
		akhir_I := n;
	end;

	for j:=1 to batasJ do begin
		clrscr;
		writeln('Nilai ALPRO Mahasiswa 1KS2');
		writeln;
		writeln('===========================================================================================');
		writeln('|    NIM    |              Nama              | TUGAS | UTS | UAS | PRAK |  AKHIR  | Grade |');
		writeln('|-----------|--------------------------------|-------|-----|-----|------|---------|-------|');

		if (n>5) and (n mod 5<>0) and (j=batasJ) then akhir_I := n;
		for i:=awal_I to akhir_I do begin
			with dataMhs[i-1] do begin
				lbr[0] := 9-length(nim);
				lbr[1] := 30-length(nama);
				lbr[2] := 5-length(inttoStr(nilai.tugas));
				lbr[3] := 3-length(inttoStr(nilai.uts));
				lbr[4] := 3-length(inttoStr(nilai.uas));
				lbr[5] := 4-length(inttoStr(nilai.prak));
				lbr[6] := 4-length(inttoStr(round(nilai.akhir)));
				lbr[7] := 5-length(grade);

				write('| ', nim, '':lbr[0], ' | ');
				write(nama, '':lbr[1], ' | ');
				write('':lbr[2], nilai.tugas, ' | ');
				write('':lbr[3], nilai.uts, ' | ');
				write('':lbr[4], nilai.uas, ' | ');
				write('':lbr[5], nilai.prak, ' | ');
				write('':lbr[6], nilai.akhir:0:2, ' | ');
				writeln(grade, '':lbr[7], ' |');
			end;
		end;
		awal_I := i+1;
		akhir_I := awal_I+4;

		writeln('===========================================================================================');
		writeln;
		if j<batasJ then begin
			writeln('Menampilkan ', awal_I-5, '-', akhir_I-5, ' dari ', n, ' data nilai mahasiswa 1KS2.');
			write('Enter untuk ke halaman selanjutnya '); readkey;
		end;
		writeln(n, ' data nilai mahasiswa 1KS2 sukses ditampilkan.');
		write('Enter untuk kembali ke menu ');
	end;
end;

procedure tampil();
begin
	if error() = true then exit; // checking n value
	clrscr;
	writeln('Menu Tampilan');
	writeln('1. Daftar Alamat');
	writeln('2. Daftar Nilai Akhir dan Grade');
	writeln('Ketik angka selain 1-2 untuk keluar!');
	write('Pilihan Anda: '); readln(pil);

	case pil of
		1: tampil_alamat();
		2: tampil_nilai();
		else writeln('Terima kasih!');
	end;
end;

procedure max();
var
	sum: shortint = 1;
	maks: real;
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

	case pil of
		1: maks := dataMhs[0].nilai.tugas;
		2: maks := dataMhs[0].nilai.uts;
		3: maks := dataMhs[0].nilai.uas;
		4: maks := dataMhs[0].nilai.prak;
		5: maks := dataMhs[0].nilai.akhir;
	end;

	for i:=2 to n do begin
		case pil of
			1: begin
				if dataMhs[i-1].nilai.tugas > maks then begin
					maks := dataMhs[i-1].nilai.tugas;
					sum := 1;
				end
				else if dataMhs[i-1].nilai.tugas = maks then
					sum := sum+1;
			end;
			2: begin
				if dataMhs[i-1].nilai.uts > maks then begin
					maks := dataMhs[i-1].nilai.uts;
					sum := 1;
				end
				else if dataMhs[i-1].nilai.uts = maks then
					sum := sum+1;
			end;
			3: begin
				if dataMhs[i-1].nilai.uas > maks then begin
					maks := dataMhs[i-1].nilai.uas;
					sum := 1;
				end
				else if dataMhs[i-1].nilai.uas = maks then
					sum := sum+1;
			end;
			4: begin
				if dataMhs[i-1].nilai.prak > maks then begin
					maks := dataMhs[i-1].nilai.prak;
					sum := 1;
				end
				else if dataMhs[i-1].nilai.prak = maks then
					sum := sum+1;
			end;
			5: begin
				if dataMhs[i-1].nilai.akhir > maks then begin
					maks := dataMhs[i-1].nilai.akhir;
					sum := 1;
				end
				else if dataMhs[i-1].nilai.akhir = maks then
					sum := sum+1;
			end;
		end;
	end;

	case pil of
		1: writeln('Ditemukan ', sum, ' orang dengan nilai Tugas terbesar -> ', maks:0:2);
		2: writeln('Ditemukan ', sum, ' orang dengan nilai UTS terbesar -> ', maks:0:2);
		3: writeln('Ditemukan ', sum, ' orang dengan nilai UAS terbesar -> ', maks:0:2);
		4: writeln('Ditemukan ', sum, ' orang dengan nilai Praktikum terbesar -> ', maks:0:2);
		5: writeln('Ditemukan ', sum, ' orang dengan nilai Akhir terbesar -> ', maks:0:2);
	end;

	for i:=1 to n do begin
		case pil of
			1: if dataMhs[i-1].nilai.tugas = maks then writeln('- ', dataMhs[i-1].nama);
			2: if dataMhs[i-1].nilai.uts = maks then writeln('- ', dataMhs[i-1].nama);
			3: if dataMhs[i-1].nilai.uas = maks then writeln('- ', dataMhs[i-1].nama);
			4: if dataMhs[i-1].nilai.prak = maks then writeln('- ', dataMhs[i-1].nama);
			5: if dataMhs[i-1].nilai.akhir = maks then writeln('- ', dataMhs[i-1].nama);
		end;
	end;
	
	if (pil>=1) and (pil<=5) then begin
		writeln;
		write('Enter untuk kembali ke menu ');
	end;
end;

procedure min();
var
	sum: shortint = 1;
	minim: real;
begin
	if error() = true then exit; // checking n value
	clrscr;
	writeln('Pencarian Nilai Minimum');
	writeln('1. Nilai Tugas');
	writeln('2. Nilai UTS');
	writeln('3. Nilai UAS');
	writeln('4. Nilai Praktikum');
	writeln('5. Nilai Akhir');
	writeln('Ketik angka selain 1-5 untuk keluar!');
	write('Cari Berdasar: '); readln(pil);

	if (pil<1) or (pil>5) then writeln('Terima kasih!');

	case pil of
		1: minim := dataMhs[0].nilai.tugas;
		2: minim := dataMhs[0].nilai.uts;
		3: minim := dataMhs[0].nilai.uas;
		4: minim := dataMhs[0].nilai.prak;
		5: minim := dataMhs[0].nilai.akhir;
	end;

	for i:=2 to n do begin
		case pil of
			1: begin
				if dataMhs[i-1].nilai.tugas < minim then begin
					minim := dataMhs[i-1].nilai.tugas;
					sum := 1;
				end
				else if dataMhs[i-1].nilai.tugas = minim then
					sum := sum+1;
			end;
			2: begin
				if dataMhs[i-1].nilai.uts < minim then begin
					minim := dataMhs[i-1].nilai.uts;
					sum := 1;
				end
				else if dataMhs[i-1].nilai.uts = minim then
					sum := sum+1;
			end;
			3: begin
				if dataMhs[i-1].nilai.uas < minim then begin
					minim := dataMhs[i-1].nilai.uas;
					sum := 1;
				end
				else if dataMhs[i-1].nilai.uas = minim then
					sum := sum+1;
			end;
			4: begin
				if dataMhs[i-1].nilai.prak < minim then begin
					minim := dataMhs[i-1].nilai.prak;
					sum := 1;
				end
				else if dataMhs[i-1].nilai.prak = minim then
					sum := sum+1;
			end;
			5: begin
				if dataMhs[i-1].nilai.akhir < minim then begin
					minim := dataMhs[i-1].nilai.akhir;
					sum := 1;
				end
				else if dataMhs[i-1].nilai.akhir = minim then
					sum := sum+1;
			end;
		end;
	end;

	case pil of
		1: writeln('Ditemukan ', sum, ' orang dengan nilai Tugas terkecil -> ', minim:0:2);
		2: writeln('Ditemukan ', sum, ' orang dengan nilai UTS terkecil -> ', minim:0:2);
		3: writeln('Ditemukan ', sum, ' orang dengan nilai UAS terkecil -> ', minim:0:2);
		4: writeln('Ditemukan ', sum, ' orang dengan nilai Praktikum terkecil -> ', minim:0:2);
		5: writeln('Ditemukan ', sum, ' orang dengan nilai Akhir terkecil -> ', minim:0:2);
	end;

	for i:=1 to n do begin
		case pil of
			1: if dataMhs[i-1].nilai.tugas = minim then writeln('- ', dataMhs[i-1].nama);
			2: if dataMhs[i-1].nilai.uts = minim then writeln('- ', dataMhs[i-1].nama);
			3: if dataMhs[i-1].nilai.uas = minim then writeln('- ', dataMhs[i-1].nama);
			4: if dataMhs[i-1].nilai.prak = minim then writeln('- ', dataMhs[i-1].nama);
			5: if dataMhs[i-1].nilai.akhir = minim then writeln('- ', dataMhs[i-1].nama);
		end;
	end;

	if (pil>=1) and (pil<=5) then begin
		writeln;
		write('Enter untuk kembali ke menu ');
	end;
end;

function total(pil: shortint): real;
var sum: real = 0;
begin
	for i:=1 to n do begin
		case pil of
			1: sum := sum + dataMhs[i-1].nilai.tugas;
			2: sum := sum + dataMhs[i-1].nilai.uts;
			3: sum := sum + dataMhs[i-1].nilai.uas;
			4: sum := sum + dataMhs[i-1].nilai.prak;
			5: sum := sum + dataMhs[i-1].nilai.akhir;
		end;
	end;
	total := sum;
end;

function rerata(): real;
begin
	if error() = true then exit; // checking n value
	clrscr;
	writeln('Pencarian Rata-rata Nilai');
	writeln('1. Nilai Tugas');
	writeln('2. Nilai UTS');
	writeln('3. Nilai UAS');
	writeln('4. Nilai Praktikum');
	writeln('5. Nilai Akhir');
	writeln('Ketik angka selain 1-5 untuk keluar!');
	write('Cari Berdasar: '); readln(pil);
	
	rerata := total(pil)/n;
	if pil=1 then writeln('Rerata nilai Tugas Alpro adalah ', rerata:0:2)
	else if pil=2 then writeln('Rerata nilai UTS Alpro adalah ', rerata:0:2)
	else if pil=3 then writeln('Rerata nilai UAS Alpro adalah ', rerata:0:2)
	else if pil=4 then writeln('Rerata nilai Praktikum Alpro adalah ', rerata:0:2)
	else if pil=5 then writeln('Rerata nilai Akhir Alpro adalah ', rerata:0:2)
	else writeln('Terima kasih!');
	
	if (pil>=1) and (pil<=5) then begin
		writeln;
		write('Enter untuk kembali ke menu ');
	end;
end;

procedure cariNama();
var
	sum: integer = 0;
	dicari: string[30];
begin
	if error() = true then exit; // checking n value
	writeln;
	write('Masukkan nama yang ingin dicari: '); readln(dicari);
	dicari := upcase(dicari);

	for i:=1 to n do begin
		if pos(dicari, dataMhs[i-1].nama)>0 then inc(sum)
		else if (i=n) and (sum=0) then
		begin
			writeln('Data tidak ditemukan!'); break;
		end;
	end;

	if sum <> 0 then begin
		writeln('=======================================================================');
		writeln('|              Nama              | TUGAS | UTS | UAS | PRAK |  AKHIR  |');
		writeln('|--------------------------------|-------|-----|-----|------|---------|');
		for i:=1 to n do
			with dataMhs[i-1] do
				if pos(dicari, nama)>0 then
				begin
					lbr[0] := 30-length(nama);
					lbr[1] := 5-length(inttoStr(nilai.tugas));
					lbr[2] := 3-length(inttoStr(nilai.uts));
					lbr[3] := 3-length(inttoStr(nilai.uas));
					lbr[4] := 4-length(inttoStr(nilai.prak));
					lbr[5] := 4-length(inttoStr(round(nilai.akhir)));

					write('| ', nama, '':lbr[0], ' | ');
					write('':lbr[1], nilai.tugas, ' | ');
					write('':lbr[2], nilai.uts, ' | ');
					write('':lbr[3], nilai.uas, ' | ');
					write('':lbr[4], nilai.prak, ' | ');
					writeln('':lbr[5], nilai.akhir:0:2, ' |');
				end;
		writeln('=======================================================================');
	end;
	write('Enter untuk kembali ke menu ');
end;

procedure menu();
begin
	clrscr;
	writeln('Entri Data Mahasiswa');
	writeln('1. Input data');
	writeln('2. Tampilkan data');
	writeln('3. Nilai Alpro terbesar');
	writeln('4. Nilai Alpro terkecil');
	writeln('5. Rata-rata nilai Alpro');
	writeln('6. Cari Nilai Mahasiswa');
	writeln('Ketik angka selain 1-6 untuk keluar!');
	writeln;

	write('Pilihan Anda: '); readln(pil);
	case pil of
		1: input();
		2: tampil();
		3: max();
		4: min();
		5: rerata();
		6: cariNama();
		else writeln('Terima kasih!');
	end;
	readkey;
end;

begin
	repeat
		menu();
	until (pil<1) or (pil>6);
end.