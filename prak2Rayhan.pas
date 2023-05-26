(* Program ini dibuat oleh Muhammad Rayhan Faridh, 1KS2 *)

program prak2_2;
uses crt;

var c, f: real;

begin
	clrscr;
	writeln('MENCARI KONVERSI SUHU');
	writeln('=====================');

	// input
	write('Input derajat Celsius= '); readln(c);
	
	f := 9/5*c + 32; // proses

	//output
	writeln('Derajat Fahrenheit= ', f:0:2);
	readkey;
end.