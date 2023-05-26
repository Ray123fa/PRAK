program faktorial;
var
	i, n: shortint;
	fak: integer;

begin
	write('n: '); readln(n);
	fak := 1;
	for i:=1 to n do
		fak:=fak*i;
	writeln(n, '!= ', fak);
end.