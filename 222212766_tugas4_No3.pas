(* Program ini dibuat oleh Muhammad Rayhan Faridh, 1KS2 *)
program jadwalKuliah;
uses crt;

var hari, matkul: string;

begin
	clrscr;
	writeln('JADWAL KULIAH');
	writeln('=============');
	writeln;
	
	repeat
		writeln('Ketikkan hari yang ingin diketahui jadwalnya (Senin s.d. Sabtu)!');
		write('Hari: '); readln(hari);
		hari := upcase(hari); // mengubah hasil input dari user menjadi kapital semua

		if (hari='SENIN') or (hari='SELASA') or (hari='RABU') or (hari='KAMIS') or (hari='JUMAT') or (hari='SABTU') then
			begin
				if (hari='SENIN') then matkul := 'Algoritma dan Pemrograman I'
				else if (hari='SELASA') then matkul := 'Kalkulus'
				else if (hari='RABU') then matkul := 'Bahasa Indonesia'
				else if (hari='KAMIS') then matkul := 'Pengantar Teknik Informatika'
				else if (hari='JUMAT') then matkul := 'Bahasa Inggris'
				else if (hari='SABTU') then matkul := 'Basis Data';

				writeln('Mata kuliah pada hari ', hari, ' adalah ', matkul);
				break; // break digunakan agar ketika input sudah sesuai, perulangan repeat until akan berhenti
			end
		else
			begin
				writeln('HARUS MENGINPUT DI ANTARA SENIN s.d. SABTU!');
				writeln;
			end;
	until (false); // ketika user menginput di luar dari yang ditentukan, maka akan meminta user menginput ulang
	readkey;
end.