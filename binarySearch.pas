uses crt;

type
	larik = array [1..8] of integer;

procedure CariBiner(l:larik; n,x:integer; var y:integer);
var a,b,k: integer;
begin
	a:=1; b:=n; y:=0;
	while (a<=b) do begin
		k := (a+b) div 2;
		if l[k]=x then begin
			y := k;
			break;
		end
		else if l[k]>x then
			a := k+1
		else b := k-1;
	end;
end;

var
	l: larik;
	i,n,x,y: integer;
begin
	clrscr;
	write('N: '); readln(n);
	for i:=1 to n do begin
		readln(l[i]);
	end;
	write('Data yang dicari: '); readln(x);

	CariBiner(l,n,x,y);
	writeln(y);
end.