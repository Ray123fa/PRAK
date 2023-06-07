uses crt;

type
	data = array [1..100] of integer;

procedure input(var A: data; N: integer);
var i: integer;
begin
	for i:=1 to n do begin
		write('[', i, ']: '); readln(A[i]);
	end;
	writeln;
end;

procedure tampil(A: data; N: integer);
var i: integer;
begin
	for i:=1 to N do begin
		write(A[i], ' ':2);
	end;
	writeln;
end;

function minimI(A: data; N, awal: integer): integer;
var i, imin: integer;
begin
	imin := awal;
	for i:=awal+1 to N do
		if A[i] < A[imin] then imin := i;
	minimI := imin;
end;

procedure tukar(var a,b: integer);
var c: integer;
begin
	c:=a; a:=b; b:=c;
end;

procedure SelSort(var A: data; N: integer);
var i, imin: integer;
begin
	for i:=1 to n-1 do begin
		imin := minimI(A,N,i);
		tukar(A[imin], A[i]);
	end;
end;

var 
	n: integer;
	A: data;
begin
	write('N: '); readln(n);
	input(A, n);

	writeln('Data sebelum:');
	tampil(A, n);
	writeln('Data sesudah:');
	SelSort(A, n);
	tampil(A, n);
end.