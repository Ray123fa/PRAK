program SegitigaPascal_withParam;
uses crt;

label lagi;

function fak(n: integer): longint;
begin
	if n = 0 then
		fak := 1
	else
		fak := n * fak(n-1);
end;

function perm(n, r: integer): integer;
begin
	perm := fak(n) div fak(n-r);
end;

function komb(n, r: integer): integer;
begin
	komb := perm(n, r) div fak(r);
end;

var 
	n, i, j: integer;
	confirm: char;
begin
lagi:
	clrscr;
  write('Masukkan nilai n: '); readln(n);

  for i := 0 to n-1 do
  begin
		for j:=1 to n-(i+1) do write(' ':2);
    for j:=0 to i do
      write(komb(i, j):2, ' ':2);
    writeln;
  end;

	writeln;
	write('Coba lagi (y/n)?: '); readln(confirm);
	confirm := lowercase(confirm);
	if confirm='y' then goto lagi
	else begin
		writeln('TERIMA KASIH');
		delay(1000);
		exit;
	end;
end.