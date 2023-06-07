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

procedure inSort(var A: data; N: integer);
var i, j, key: integer;
begin
	for i:=2 to n do begin
		key := A[i];
		j := i-1;
		while (j > 0) and (key < A[j]) do begin
			A[j+1] := A[j];
			dec(j);
		end;
		A[j+1] := key;
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
	inSort(A, n);
	tampil(A, n);
end.