CREATE TABLE tb_kategori (
	kat_id TINYINT(3) NOT NULL AUTO_INCREMENT,
	kat_nama VARCHAR(50) NOT NULL,
	kat_keterangan TEXT DEFAULT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT NULL,
	PRIMARY KEY(kat_id)
);

CREATE TABLE tb_produk (
	produk_id INT(11) NOT NULL AUTO_INCREMENT,
	produk_id_kat TINYINT(3) NOT NULL,
	produk_kode VARCHAR(50) NOT NULL,
	produk_nama VARCHAR(100) NOT NULL,
	produk_hrg INT DEFAULT '0',
	produk_keterangan TEXT DEFAULT NULL,
	produk_stock INT NOT NULL DEFAULT '0',
	produk_photo VARCHAR(255) DEFAULT NULL,
	PRIMARY KEY(produk_id),
	FOREIGN KEY(produk_id_kat) REFERENCES tb_kategori(kat_id)
);

CREATE TABLE tb_penjualan (
	penjualan_id INT(11) NOT NULL AUTO_INCREMENT,
	penjualan_tgl DATETIME NOT NULL,
	penjualan_total INT NOT NULL DEFAULT '0',
	PRIMARY KEY(penjualan_id)
);

CREATE TABLE tb_penjualan_detail (
	detail_id INT(11) NOT NULL AUTO_INCREMENT,
	detail_id_penjualan INT(11) NOT NULL,
	detail_id_produk INT(11) NOT NULL,
	detail_qty INT NOT NULL,
	detail_hrg INT NOT NULL,
	PRIMARY KEY(detail_id),
	FOREIGN KEY(detail_id_penjualan) REFERENCES tb_penjualan(penjualan_id),
	FOREIGN KEY(detail_id_produk) REFERENCES tb_produk(produk_id)
);