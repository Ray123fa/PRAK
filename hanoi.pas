program hanoi;
uses crt;

var langkah: integer = 0;
procedure Hanoi(n: integer; asal,bantu,tujuan: char);
begin
	if (n=1) then begin
		inc(langkah);
		writeln('Langkah ke-', langkah, ' pindahkan piringan ke-',n ,' dari ', asal, ' ke ', tujuan);
	end
	else begin
		Hanoi(n-1, asal, tujuan, bantu);
		inc(langkah);
		writeln('Langkah ke-', langkah, ' pindahkan piringan ke-',n ,' dari ', asal, ' ke ', tujuan);
		Hanoi(n-1, bantu, asal, tujuan);
	end;
end;

var n: integer;
begin
	clrscr;
	write('n: '); readln(n);
	Hanoi(n, 'A', 'B', 'C');
end.