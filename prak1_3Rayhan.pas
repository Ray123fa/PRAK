(* Program ini dibuat oleh Muhammad Rayhan Faridh, 1KS2 *)

program convertF2C;
uses crt;

var
  F, C: real; // F untuk Fahrenheit, C untuk Celcius. Bertipe real karena output dari pembagian bisa berupa desimal
  ulang: char;

begin
  clrscr; // clearscreen
  writeln('=======================');
  writeln('Program Konversi F ke C');
  writeln('=======================');

	// y untuk ya
	ulang := 'y'; // nilai awal variable ulang
	repeat
		// input
		writeln;
		write('Masukkan nilai suhu Fahrenheit= '); readln(F);

		C := 5/9*(F-32); // memproses konversi F ke C

		// output
		writeln;
		writeln('Berikut adalah hasil konversinya:');
		// nilai F dan C dirubah menjadi desimal 2 angka di belakang koma
		writeln('F=', F:0:2, ', C=', C:0:2);

		// tanya user
		writeln;
		write('Konversi lagi (y/n)? '); readln(ulang);
		
		// n untuk tidak
		if lowercase(ulang) = 'n' then
			begin
				writeln('Terima kasih telah menggunakan program ini!'); // output ketika memilih n
			end
		else if lowercase(ulang) <> 'y' then
			begin
				writeln('Program berhenti...');
			end
	until (lowercase(ulang) <> 'y');
	(*
	Alur program:
	- Jika user menginput huruf 'y', maka program konversi diulang
	- Jika user menginput huruf 'n', maka program berhenti dengan output 'Terima kasih telah menggunakan program ini!'
	- Jika user menginput selain huruf 'y' dan 'n', maka program berhenti dengan output 'Program berhenti...'
	*)
  readkey;
end.