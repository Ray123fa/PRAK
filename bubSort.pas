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

procedure tukar(var a,b: integer);
var c: integer;
begin
	c:=a; a:=b; b:=c;
end;

procedure bubSort(var A: data; N: integer);
var i, j: integer;
begin
	for i:=1 to n-1 do begin
		for j:=n downto i+1 do
			if A[j] < A[j-1] then tukar(A[j], A[j-1]);
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
	bubSort(A, n);
	tampil(A, n);
end.