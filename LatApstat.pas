uses crt;

type data = array[1..100] of integer;

procedure input(var x:data; n:integer);
var i: smallint;
begin
	for i := 1 to n do
  begin
    write('Data ke-', i, ': ');
    readln(x[i]);
  end;
end;

procedure tampil(var x:data; n:integer);
var i: smallint;
begin
	for i := 1 to n do
		writeln('Data ke-', i, ': ', x[i]);
end;

function total(x:data; n:integer): integer;
var i, sum: smallint;
begin
	sum := 0;
	for i:=1 to n do
		sum := sum + x[i];
	total := sum;
end;

function mean(x:data; n:integer): real;
begin
	mean := total(x,n)/n;
end;

function cekMax(x:data; n:integer): integer;
var i, max: integer;
begin
	max := x[1];
	for i:=2 to n do
		if x[i] > max then max := x[i];
	cekMax := max;
end;

function cekMin(x:data; n:integer): integer;
var i, min: integer;
begin
	min := x[1];
	for i:=2 to n do
		if x[i] < min then min := x[i];
	cekMin := min;
end;

var
	pil: char;
begin
	writeln('Selamat datang di aplikasi statistik sederhana');
	writeln('Silahkan pilih menu berikut:');
	writeln('1. Input data');
	writeln('2. Tampilkan semua data');
	writeln('3. Tampilkan data terkecil');
	writeln('4. Tampilkan data terbesar');
	writeln('5. Tampilkan rata-rata');
	writeln('6. Keluar');
	write('Pilihan anda: '); readln(pil);
end.