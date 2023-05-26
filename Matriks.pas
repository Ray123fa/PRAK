program operasi_matriks;
uses crt, math;

type
	int = integer;
	matriks = array [1..5, 1..5] of int;
  mreal = array [1..5, 1..5] of real;

procedure input(var m: matriks; row,col: int);
var i,j: smallint;
begin
	writeln('Masukkan elemen matriks:');
  for i := 1 to row do begin
    for j := 1 to col do begin
      write('[', i, ',', j, ']: ');
      readln(m[i,j]);
    end;
  end;
end;

procedure tampil(has: matriks; row,col: int);
var i,j: smallint;
begin
	for i := 1 to row do begin
    for j := 1 to col do
      write(has[i,j]:5, ' ');
    writeln;
  end;
end;

procedure tampil_real(has: mreal; ordo: int);
var i,j: smallint;
begin
	for i := 1 to ordo do begin
    for j := 1 to ordo do
      write(has[i,j]:5:2, ' ');
    writeln;
  end;
end;

function err(row,col: smallint): boolean;
begin
  err := (row>5) or (col>5);
	if err then 
	begin
		writeln('Banyak baris dan kolom maksimal 5!');
		delay(1000); clrscr;
	end;
end;

procedure kali();
var
  i,j,k: smallint;
  b1,b2,k1,k2: smallint;
  A, B, has: matriks;
begin
  clrscr;
  writeln('Perkalian Matriks');
  writeln('1. Matriks A (b1 x k1):');
  write('   Banyak baris = '); readln(b1);
  write('   Banyak kolom = '); readln(k1);
  if err(b1,k1)=true then kali();
  input(A, b1,k1);
  
  writeln;
  writeln('2. Matriks B (b2 x k2):');
  write('   Banyak baris = '); readln(b2);
  write('   Banyak kolom = '); readln(k2);
  if err(b2,k2)=true then kali();
  input(B, b2,k2);

  writeln;
  if k1<>b2 then
    writeln('Tidak dapat dihitung!')
  else begin
    for i := 1 to b1 do begin
      for j := 1 to k2 do begin
        has[i,j] := 0;
        for k := 1 to k1 do
          has[i,j] := has[i,j] + A[i,k] * B[k,j];
      end;
    end;
    write('Processing...');
    delay(1000); gotoxy(1, wherey()); delLine;
    writeln('Matriks hasil perkalian: ');
    tampil(has, b1,k2);
    writeln;
  end;
  write('Enter untuk kembali ke menu '); readkey;
end;

function kof(m: matriks; k,n: smallint): matriks;
var i,j: smallint;
begin
  for i:=2 to n do begin
    for j:=1 to n do begin
      if j<k then
        kof[i-1, j] := m[i,j]
      else if j>k then
        kof[i-1, j-1] := m[i,j];
    end;
  end;
end;

function callDeterminan(m: matriks; n: smallint): int;
var k, det: smallint;
begin
  if n=1 then
    det := m[1,1]
  else if n=2 then
    det := m[1,1]*m[2,2] - m[1,2]*m[2,1]
  else begin
    det := 0;
    for k:=1 to n do
      det := det + m[1,k] * callDeterminan(kof(m, k,n), n-1) * (-1)**(1+k);
  end;
  callDeterminan := det;
end;

procedure determinan();
var
  ordo: smallint;
  M: matriks;
begin
  clrscr;
  writeln('Determinan Matriks');
  write('Masukkan ordo matriks (baris=kolom): '); readln(ordo);
  if err(ordo,ordo)=true then determinan();
  input(M, ordo,ordo);

  writeln; writeln('Processing...');
  delay(1000); clrscr;
  writeln('Determinan dari matriks');
  tampil(M, ordo,ordo);
  writeln('adalah ', callDeterminan(M, ordo));

  writeln;
  write('Enter untuk kembali ke menu '); readkey;
end;

procedure transpose();
var
  i,j, b,k: smallint;
  M, MT: matriks;
begin
  clrscr;
  writeln('Transpose Matriks');
  write('Banyak baris = '); readln(b);
  write('Banyak kolom = '); readln(k);
  if err(b,k)=true then kali();
  input(M, b,k);

  for i:=1 to b do begin
    for j:=1 to k do
      MT[j,i] := M[i,j];
  end;

  writeln; writeln('Processing...');
  delay(1000); clrscr;
  writeln('Transpose dari matriks'); tampil(M, b,k);
  writeln('adalah'); tampil(MT, k,b);

  writeln;
  write('Enter untuk kembali ke menu '); readkey;
end;

function invers_m(M: matriks; n: smallint): mreal;
var
  i,j: smallint;
  det: int;
begin
  if n=2 then begin
    det := callDeterminan(M, 2);
    invers_m[1,1] := (1/det) * M[2,2];
    invers_m[1,2] := (-1/det) * M[1,2];
    invers_m[2,1] := (-1/det) * M[2,1];
    invers_m[2,2] := (1/det) * M[1,1];
  end
  else begin
    for i:=1 to n do
      for j:=1 to n do
        invers_m[i,j] := callDeterminan(kof(M, i,n), n-1)/callDeterminan(M, n);
  end;
end;

procedure invers();
var
  ordo: smallint;
  M: matriks;
begin
  clrscr;
  writeln('Invers Matris');
  write('Masukkan ordo matriks (baris=kolom): '); readln(ordo);
  input(M, ordo,ordo);

  writeln; writeln('Processing...');
  delay(1000); clrscr;
  if callDeterminan(M, ordo)=0 then begin
    tampil(M, ordo,ordo);
    writeln('Matriks di atas tidak memiliki invers -> Determinan=0 !');
  end
  else begin
    writeln('Invers dari matriks'); tampil(M, ordo,ordo);
    writeln('adalah'); tampil_real(invers_m(M, ordo), ordo);
    writeln;
  end;
  write('Enter untuk kembali ke menu '); readkey;
end;

var pil: smallint;
procedure menu();
begin
  clrscr;
  writeln('Silakan pilih menu berikut!');
  writeln('1. Perkalian Matriks');
  writeln('2. Determinan Matriks');
  writeln('3. Transpose Matriks');
  writeln('4. Invers Matriks');
  writeln('Tekan angka selain 1-4 untuk keluar.');

  writeln;
  write('Masukkan pilihan = '); readln(pil);
  case pil of
    1: kali();
    2: determinan();
    3: transpose();
    4: invers();
    else writeln('Terima kasih!');
  end;
end;

begin
	clrscr;
  writeln('Selamat datang di operasi matriks!');
  write('Enter untuk masuk ke menu '); readkey;
  repeat
    menu();
  until ((pil < 1) or (pil > 4));
end.