program segitigaPascal;
uses crt;

var n, i, j, num: integer;

begin
  clrscr;
  write('Masukkan jumlah baris segitiga pascal: '); readln(n);

  for i:=1 to n do begin
		for j:=1 to n-i do write(' ':2);

    num := 1;
    for j:=1 to i do begin
      write(num:2, ' ':2);
      num := num*(i-j) div j;
		end;
    writeln;
  end;
	readkey;
end.