(* Program ini dibuat oleh Muhammad Rayhan Faridh, 1KS2 *)

program prak2_2;
uses crt;

var r, L: real;

begin
	clrscr;
	writeln('MENCARI LUAS LINGKARAN');
	writeln('======================');

	// input
	write('Input Panjang jari-jari (cm)= '); readln(r);
	
	L := (22/7)*r*r; // proses

	// output
	writeln('Luas lingkaran adalah ', L:0:2, ' cm2');
	readkey;
end.