(* Program ini dibuat oleh Muhammad Rayhan Faridh, 1KS2 *)

program prak2_1;
uses crt;

var
  jmlBrg: integer;
  hargaSatuan, pajakRp, hargaBayar: real;

begin
	clrscr;
  writeln('Menentukan Harga Bayar');
	writeln('======================');

	// Input
  write('Jumlah Barang= '); readln(jmlBrg);
  write('Harga satuan= Rp'); readln(hargaSatuan);
  write('Pajak= Rp'); readln(pajakRp);

  // Hitung harga bayar
  hargaBayar := jmlBrg * hargaSatuan + pajakRp;

	// Output
  writeln('Harga bayar= Rp', hargaBayar:0:2);
  readkey;
end.