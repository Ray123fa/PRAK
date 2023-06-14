uses crt;

function biner(n: integer): string;
begin
	if n=0 then biner := '0'
	else if n=1 then biner := '1'
	else if (n mod 2=0) then
		biner := biner(n div 2) + '0'
	else biner := biner(n div 2) + '1';
end;

var n: integer;
begin
	write('N: '); readln(n);
	writeln('Biner: ', biner(n));
end.