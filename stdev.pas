(* Program ini dibuat oleh Muhammad Rayhan Faridh, 1KS2 *)
program standarDeviasi;
uses crt, math;

var
  n, i: integer; // n menyimpan banyaknya data, i adalah indeks data ke
  varians, stdev, data, jml: real;
  // varians menyimpan variansi, stdev menyimpan standar deviasi
  // data menyimpan setiap data yang diinput, jml menyimpan hasil penjumlahan semua data

begin
  clrscr;
  writeln('MENCARI STANDAR DEVIASI');
  writeln('=======================');
  writeln;
  
	// Minta user memasukkan banyaknya data
  write('Masukkan banyaknya data: '); readln(n);

  // Minta user memasukkan setiap data
  varians := 0; // nilai awal
	jml := 0; // nilai awal
  for i := 1 to n do
  begin
    write('Masukkan data ke-', i, ': '); readln(data);
    varians := varians + sqr(data); // hitung jumlah kuadrat setiap data
		jml := jml + data; // jumlah data
  end;

  // Hitung variansi
	varians := (varians * n) - sqr(jml);
  varians := varians / (n*(n-1));

  // Hitung standar deviasi
  stdev := sqrt(varians);

  // Tampilkan hasil
  writeln('Standar Deviasi: ', stdev:0:2);
  readkey;
end.