<?php
	try {
		// buat koneksi dengan database
		$dbh = new PDO('mysql:host=localhost;dbname=dbku', "root", "");

		// set error mode
		$dbh->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );

		// jalankan query
		$result = $dbh->query('SELECT * FROM mahasiswa');

		// tampilkan data
		while($row = $result->fetch()) {
		 echo "<h1>Nama : $row[1] </h1>";
	     echo "<p><b>NIM : $row[2] </b></p>";
	     echo "<p>Hobi : $row[3] </p>";
		 echo "<br />";
		}

		// hapus koneksi
		$dbh = null;
	}
	catch (PDOException $e) {
		// tampilkan pesan kesalahan jika koneksi gagal
		print "Koneksi atau query bermasalah: " . $e->getMessage() . "<br/>";
		die();
	}
?>
