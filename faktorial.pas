program faktorial;
uses crt;

var n, res: integer;

begin
	clrscr;
	write('Faktorial yang dicari: '); readln(n);

	res := 1;
	write(n, '! = ');
	while n>=1 do begin
		if n=1 then write('1 = ')
		else write(n, ' x ');
		res := res*n;
		n := n-1;
	end;
	write(res);
	readkey;
end.