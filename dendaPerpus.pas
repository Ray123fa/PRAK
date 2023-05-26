program dendaPerpus;
uses crt;

type _langka = (y, n);
var
	i, byk_pinjam: shortint;
	wkt_pinjam: integer;
	denda: longint;
	judul: string;
	langka: _langka;

begin
	clrscr;
	writeln('SELAMAT DATANG DI PERPUSTAKAAN');
	writeln('==============================');
	writeln;

	writeln('PERATURAN:');
	writeln('1. Buku yang dapat dipinjam ialah buku teks (maks. 3 buku)');
	writeln('2. Bila buku yang dipinjam tergolong langka (<= 3 koleksi), maks. 3 hari');
	writeln('3. Bila buku yang dipinjam tidak langka, maks. 7 hari');
	writeln('4. Setiap keterlambatan dikenakan denda per harinya');
	writeln;

	delay(5000);
	repeat
		clrscr;
		write('Banyak buku yang dipinjam (maks. 3 buku): '); readln(byk_pinjam);
	until ((byk_pinjam>0) and (byk_pinjam<=3));

	for i := 1 to byk_pinjam do
		begin
			writeln;
			write('Masukkan judul buku ke-', i, '           : '); readln(judul);
			write('Apakah buku ke-', i, ' langka? (y/n)     : '); readln(langka);
			write('Lama pinjam buku ke-', i, ' (dalam hari) : '); readln(wkt_pinjam);

			if langka = y then
				begin
					if (wkt_pinjam <= 3) then denda := 0
					else if (wkt_pinjam <= 7) then denda := (wkt_pinjam-3)*1000
					else if (wkt_pinjam <= 10) then denda := 4000 + (wkt_pinjam-7)*2500
					else denda := 11500 + (wkt_pinjam-10)*5000;
				end
			else
				begin
					if wkt_pinjam <= 7 then denda := 0
					else denda := (wkt_pinjam - 7) * 500;
				end;

			if denda > 0 then writeln('Dikenakan denda sebesar Rp', denda, ',-')
			else writeln('Tidak dikenakan denda');
		end;

  // Menghentikan program
  readkey;
end.