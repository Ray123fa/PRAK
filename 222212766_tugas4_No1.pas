(* Program ini dibuat oleh Muhammad Rayhan Faridh, 1KS2 *)
program bonusPegawai;
uses crt;

var umur, tKerja, jabatan: integer;

begin
	clrscr;
	writeln('PENENTUAN BONUS PEGAWAI');
  writeln('=======================');
	writeln;

	repeat
		writeln('Golongan Pegawai? (0/1)');
		writeln('Ketik 0 untuk staf');
		writeln('Ketik 1 untuk non-staf');
		write('JABATAN: '); readln(jabatan);

		if (jabatan=0) then
			begin
				writeln;
				writeln('Lama Kerja? (dalam tahun)');
				write('MASA KERJA: '); readln(tKerja);
				writeln;

				writeln('Berapa umur Anda?');
				write('UMUR: '); readln(umur);
				writeln;

				if (tKerja>=5) and (umur>=50) then
					writeln('SELAMAT ANDA MENDAPATKAN BONUS SEBESAR Rp1.000.000,00')
				else
					writeln('SELAMAT ANDA MENDAPATKAN BONUS SEBESAR Rp500.000,00')
			end
		else if (jabatan=1) then
			begin
				writeln;
				writeln('Lama Kerja? (dalam tahun)');
				write('MASA KERJA: '); readln(tKerja);
				writeln;

				writeln('Berapa umur Anda?');
				write('UMUR: '); readln(umur);
				writeln;

				if (tKerja>=5) or (umur>=50) then
					writeln('SELAMAT ANDA MENDAPATKAN BONUS SEBESAR Rp400.000,00')
				else writeln('SELAMAT ANDA MENDAPATKAN BONUS SEBESAR Rp250.000,00');
			end
		else
			begin
				writeln('Maaf, terjadi kesalahan input!');
				writeln;
			end;
	until ((jabatan=0) or (jabatan=1)); // ketika jabatan bukan 0 ataupun 1, program otomatis mengirim pesan salah input dan meminta user untuk input ulang
	readkey;
end.