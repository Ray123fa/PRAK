program StandarDev;
uses crt;

type data = array of integer;

procedure input(var x:data; n: integer);
var i: integer;
begin
	// meminta user memasukkan setiap data satu per satu
  for i := 1 to n do
  begin
    write('Data ke-', i, ': ');
    readln(x[i]);
  end;
end;

function jumlah(x:data; n: integer): integer;
var i, sum: integer;
begin
	// untuk mencari jumlah data
  sum := 0;
  for i := 1 to n do
  begin
    sum := sum + x[i];
  end;
	jumlah := sum;
end;

function mean(var x:data; n: integer): real;
begin
	mean := jumlah(x,n)/n;
end;

function stdev(x:data; n: integer): real;
var
	i: integer;
	sum, rerata: real;
begin
	sum := 0;
	rerata := mean(x,n);
	for i:=1 to n do
		sum := sum+sqr(x[i]-rerata);
	stdev := sqrt(sum);
end;

function cekMax(x:data; n: integer): integer;
var i, max: integer;
begin
	max := x[1];
	for i:=2 to n do
		if x[i] > max then max := x[i];
	cekMax := max;
end;

function cekMin(x:data; n: integer): integer;
var i, min: integer;
begin
	min := x[1];
	for i:=2 to n do
		if x[i] < min then min := x[i];
	cekMin := min;
end;

var
	x: data;
	n: smallint;
begin
	clrscr;
  write('Masukkan banyak data: '); readln(n);
	setlength(x, n);
	input(x, n);

	writeln;
	writeln('Rerata: ', mean(x, n):0:2);
	writeln('Stdev: ', stdev(x, n):0:2);
	writeln('Bilangan terkecil: ', cekMin(x, n));
	writeln('Bilangan terbesar: ', cekMax(x, n));
	readkey;
end.