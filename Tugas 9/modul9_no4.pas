uses crt;

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
	pil: smallint;
	n, r: integer;
begin
	writeln('1. Faktorial');
	writeln('2. Permutasi');
	writeln('3. Kombinasi');
	write('Ketikkan yang diinginkan: '); readln(pil);

	case pil of
		1: begin
			write('Masukkan nilai n: '); readln(n);
			writeln('Faktorial dari ', n, ' adalah ', fak(n));
		end;
		2..3: begin
			write('Masukkan nilai n: '); readln(n);
			write('Masukkan nilai r: '); readln(r);
			if pil=2 then writeln('P(',n,',',r,') = ', perm(n,r))
			else if pil=3 then writeln('C(',n,',',r,') = ', komb(n,r));
		end;
	end;
end.