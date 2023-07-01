{
	Nama: Muhammad Rayhan Faridh
	NIM: 222212766
	Kelas: 1KS2
	Mata Kuliah: Algoritma Pemrograman
}
program urutDesc;
uses crt;

type arr = array [1..25] of integer;

procedure bubbleSort(var data: arr; n: integer);
var i,j,temp:integer;
begin
	for i:=1 to n-1 do
		for j:=n downto i+1 do
			if data[j]>data[j-1] then
			begin
				temp := data[j];
				data[j] := data[j-1];
				data[j-1] := temp;
			end;
end;

procedure selectionSort(var data: arr; n: integer);
var i,j,max,temp: integer;
begin
	for i:=1 to n-1 do begin
		max := i;
		for j:=i+1 to n do
			if data[j]>data[max] then max := j;
		
		temp := data[i];
		data[i] := data[max];
		data[max] := temp;
	end;
end;

procedure insertionSort(var data: arr; n: integer);
var i,j,key: integer;
begin
	for i:=2 to n do
	begin
		key := data[i];
		j := i-1;
		while (j>0) and (data[j]<key) do 
		begin
			data[j+1] := data[j];
			j := j-1;
		end;
		data[j+1] := key;
	end;
end;

var
	i, n: integer;
	data: arr;
begin
	clrscr;
	randomize;

	n := 10;
	for i:=1 to n do
		data[i] := random(200);
	
	writeln('Data sebelum diurutkan:');
	for i:=1 to n do
		write(data[i], ' ');
	writeln;

	// bubbleSort(data,n);
	// selectionSort(data,n);
	insertionSort(data,n);

	writeln;
	writeln('Data setelah diurutkan:');
	for i:=1 to n do
		write(data[i], ' ');
end.