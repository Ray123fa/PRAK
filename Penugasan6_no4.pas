program penambahanDeret_2;
uses crt;

label 1;
var 
	i, j, n, sign: integer;
	lagi: char;
	sum: real;

begin
1:
	repeat
		clrscr;
		write('Masukkan batas n: '); readln(n);
	until (n mod 2 <> 0);

	i := 1;
	j := 2;
	sign := 1;
	sum := 0;

	while i<=n do begin
		sum := sum + (1/i*sign);
		sign := -1*sign;

		if i=1 then write(i)
		else if (j mod 2 = 1) then write(' - 1/', i)
		else write(' + 1/', i);

		j := j+1;
		i := i+2;
	end;
	writeln(' = ', sum:0:2);
	writeln;

	write('Ulangi program? (y/n): '); readln(lagi);
	if upcase(lagi)='Y' then goto 1
	else writeln('Terima kasih telah menggunakan program ini.');
	readkey;
end.