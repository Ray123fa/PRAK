program kalendar_1thn;
uses crt;

label lagi;

type
	hari = (Senin, Selasa, Rabu, Kamis, Jumat, Sabtu, Minggu);
	tanggal = 1..31;

var
	i, awal: hari;
	j, tglmaks: tanggal;
	x, y, thn, num_bln: integer;
	kabisat: boolean;
	nama_bulan: shortstring;
	confirm: char;

begin
lagi:
	clrscr;
	write('Hari pertama bulan Januari: '); readln(awal);
	write('Tahun: '); readln(thn);

	writeln;
	kabisat := false;
	if (thn mod 400 = 0) then kabisat := true
	else
		if (thn mod 100 <> 0) then
			if (thn mod 4 = 0) then kabisat := true;

	x := ord(awal);
	for num_bln:=1 to 12 do begin
		clrscr;
		case num_bln of
			1: begin
				tglmaks:= 31;
				nama_bulan:= 'Januari';
			end;
			2: begin
				tglmaks:= 28 + ord(kabisat);
				nama_bulan:= 'Februari';
			end;
			3: begin
				tglmaks:= 31;
				nama_bulan:= 'Maret';
			end;
			4: begin
				tglmaks:= 30;
				nama_bulan:= 'April';
			end;
			5: begin
				tglmaks:= 31;
				nama_bulan:= 'Mei';
			end;
			6: begin
				tglmaks:= 30;
				nama_bulan:= 'Juni';
			end;
			7: begin
				tglmaks:= 31;
				nama_bulan:= 'Juli';
			end;
			8: begin
				tglmaks:= 31;
				nama_bulan:= 'Agustus';
			end;
			9: begin
        tglmaks:= 30;
        nama_bulan:= 'September';
      end;
			10: begin
        tglmaks:= 31;
        nama_bulan:= 'Oktober';
      end;
			11: begin
        tglmaks:= 30;
        nama_bulan:= 'November';
      end;
			12: begin
        tglmaks:= 31;
        nama_bulan:= 'Desember';
      end;
		end;

		writeln('Hari pertama bulan Januari: ', awal);
		writeln(nama_bulan, ' ', thn);

		for i:=Senin to Minggu do begin
			write(i:7)
		end;

		writeln;
		y := wherey();
		for j:=1 to tglmaks do begin
			if (x=7) then begin
				x := 0;
				writeln;
				y := wherey();
			end;
			gotoxy(7*x+1, y); write(j:3);
			inc(x);
		end;

		if num_bln<12 then begin
			writeln;
			writeln;
			writeln('Tekan enter untuk melanjutkan ke bulan berikutnya!');
		end;
		readkey;
	end;

	writeln;
	writeln;
	write('Coba lagi? (y/n): '); readln(confirm);
  confirm := lowercase(confirm);
  if confirm='y' then goto lagi
  else begin
    writeln('TERIMA KASIH');
    delay(1000);
    exit;
  end;
end.