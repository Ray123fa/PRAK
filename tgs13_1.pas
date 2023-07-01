{
	Nama: Muhammad Rayhan Faridh
	NIM: 222212766
	Kelas: 1KS2
	Mata Kuliah: Algoritma Pemrograman
}
program tgs13_1;
uses crt;

type arr = array [1..100] of integer;

function binarySearch(A:arr; n: integer; x:integer): integer;
var low, mid, high, has: integer;
begin
	low := 1;
	high := n;
	while (low <= high) do
	begin
		mid := (low+high) div 2;
		if(A[mid] > x) then high := mid - 1
		else if(A[mid] < x) then low := mid + 1
		else break;
	end;
	if A[mid] = x then has := mid {ditemukan}
	else has := 0; {tidak ditemukan}
	binarySearch := has;
end;

function binarySearchRekursif(A:arr; low,high: integer; x:integer): integer;
var mid, has: integer;
begin
	if low > high then has := 0
	else begin
		mid := (low+high) div 2;
		if A[mid] > x then has := binarySearchRekursif(A, low, mid-1, x)
		else if A[mid] < x then has := binarySearchRekursif(A, mid+1, high, x)
		else has := mid;
	end;
	binarySearchRekursif := has;
end;

var
	A: arr;
	awal, i,n,x: integer;
begin
	clrscr;
	writeln('Diberikan barisan geometri U1,U2,U3,...,Un dengan rasio 3');
	repeat
		write('Masukkan n (n>=2)  : '); readln(n);
	until (n>=2);
	write('Masukkan nilai awal: '); readln(awal);

	A[1] := awal;
	for i :=2 to n do A[i]:= A[i-1]*3;
	write('Masukkan nilai barisan yang ingin dicari = '); readln(x);
	if binarySearch(A,n,x) = 0 then
		writeln('Tidak ada yang bernilai ', x)
	else begin
		writeln('(Non-rekursif) Yang memiliki nilai ', x, ' adalah U-', binarySearch(A,n,x));
		writeln('(Rekursif) Yang memiliki nilai ', x, ' adalah U-', binarySearchRekursif(A,1,n,x));
	end;
	readkey;
end.