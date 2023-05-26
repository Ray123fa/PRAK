(* Program ini dibuat oleh Muhammad Rayhan Faridh, 1KS2 *)
program distribusi_Normal;
uses crt, math;

var
  n, i: integer; // n menyimpan banyaknya data, i adalah indeks data ke
  varians, stdev, data: real; // varians menyimpan variansi, stdev menyimpan standar deviasi
	jml, jmlsqr, avg: real; // jml: jumlah setiap data, jmlsqr: jumlah kuadrat setiap data, avg: rata-rata
	x, distnorm: real; // x menyimpan data yang diamati, distnorm menyimpan hasil distribusi normal
	
begin
  clrscr;
  writeln('MENGHITUNG DISTRIBUSI NORMAL');
  writeln('============================');
  writeln;

	// Minta user memasukkan banyaknya data
  write('Masukkan banyaknya data: '); readln(n);

  // Minta user memasukkan setiap data
	jml := 0; // nilai awal jumlah data
  jmlsqr:= 0; // nilai awal jumlah kuadrat
  for i := 1 to n do
  begin
    write('Masukkan data ke-', i, ': '); readln(data);
    jmlsqr := jmlsqr + sqr(data); // hitung jumlah kuadrat setiap data
		jml := jml + data; // hitung jumlah data
  end;

	// Hitung rerata
	avg := jml/n;

  // Hitung variansi
	varians := (n * jmlsqr) - sqr(jml);
  varians := varians / (n*(n-1));

  // Hitung standar deviasi
  stdev := sqrt(varians);

	// Minta user memasukkan data yang ingin diamati
	writeln;
  write('Masukkan nilai x yang ingin dicari distribusi normalnya: '); readln(x);
  
  // Hitung z atau distribusi normal
  distnorm := (x-avg)/stdev;

  // menampilkan hasil
  writeln('Rerata: ', avg:0:2);
  writeln('Standar deviasi: ', stdev:0:2);
  writeln('Nilai distribusi normal untuk x=', x:0:2, ' adalah: ', distnorm:0:6);
  readkey;
end.