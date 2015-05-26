-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 14, 2015 at 08:24 
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `DBSistemInformasiPerusahaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblAbsensi`
--

CREATE TABLE IF NOT EXISTS `tblAbsensi` (
  `Kd_Absensi` char(12) CHARACTER SET utf8 NOT NULL,
  `Kd_Pegawai` char(12) CHARACTER SET utf8 DEFAULT NULL,
  `Tgl` date DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Shift` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblAdmin`
--

CREATE TABLE IF NOT EXISTS `tblAdmin` (
  `IdAdmin` int(11) NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `bagian` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblAdmin`
--

INSERT INTO `tblAdmin` (`IdAdmin`, `userName`, `password`, `bagian`) VALUES
(0, 'dary', 'saputra', 'keuangan'),
(1, 'dary', 'saputra', 'keuangan'),
(2, 'budi', 'anduk', 'Penjualan');

-- --------------------------------------------------------

--
-- Table structure for table `tblAlat`
--

CREATE TABLE IF NOT EXISTS `tblAlat` (
  `Kd_Alat` char(12) CHARACTER SET utf8 NOT NULL,
  `Tgl_Beli` date DEFAULT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Harga` int(11) DEFAULT NULL,
  `Foto` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblBahanKeluar`
--

CREATE TABLE IF NOT EXISTS `tblBahanKeluar` (
  `Kd_BahanKeluar` char(12) CHARACTER SET utf8 NOT NULL,
  `Tgl_Keluar` varchar(50) DEFAULT NULL,
  `Kd_Pegawai` char(12) CHARACTER SET utf8 DEFAULT NULL,
  `Kd_JenisBahan` char(12) CHARACTER SET utf8 DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblBeliBahan`
--

CREATE TABLE IF NOT EXISTS `tblBeliBahan` (
  `Kd_Bahan` char(12) CHARACTER SET utf8 NOT NULL,
  `Tgl_Beli` date DEFAULT NULL,
  `Nominal` int(11) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL,
  `Satuan` varchar(50) DEFAULT NULL,
  `Kd_JenisBahan` char(12) CHARACTER SET utf8 DEFAULT NULL,
  `kd_pemasok` char(12) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblDetailGaji`
--

CREATE TABLE IF NOT EXISTS `tblDetailGaji` (
  `kd_detail_gaji` varchar(12) NOT NULL,
  `kd_gaji` varchar(12) NOT NULL,
  `hari` int(11) NOT NULL,
  `nominal_harian` int(11) NOT NULL,
  PRIMARY KEY (`kd_detail_gaji`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblDetailGaji`
--

INSERT INTO `tblDetailGaji` (`kd_detail_gaji`, `kd_gaji`, `hari`, `nominal_harian`) VALUES
('DETGJ1', 'gj1', 1, 5000000),
('DETGJ2', 'gj1', 2, 5000000);

-- --------------------------------------------------------

--
-- Table structure for table `tblDetailMaintenance`
--

CREATE TABLE IF NOT EXISTS `tblDetailMaintenance` (
  `Kd_DetMaintenance` char(12) CHARACTER SET utf8 NOT NULL,
  `Keterangan_Kerusakan` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `Biaya` int(11) DEFAULT NULL,
  `Kd_Maintenance` char(12) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblDetailPenjualan`
--

CREATE TABLE IF NOT EXISTS `tblDetailPenjualan` (
  `Kd_Penjualan` char(12) CHARACTER SET utf8 NOT NULL,
  `Kd_Barang` char(12) CHARACTER SET utf8 NOT NULL,
  `Harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblDetailTunjangan`
--

CREATE TABLE IF NOT EXISTS `tblDetailTunjangan` (
  `kd_detail_tunjangan` varchar(12) NOT NULL,
  `kd_gaji` varchar(12) NOT NULL,
  `keterangan` text NOT NULL,
  `nominal` int(11) NOT NULL,
  PRIMARY KEY (`kd_detail_tunjangan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblDetailTunjangan`
--

INSERT INTO `tblDetailTunjangan` (`kd_detail_tunjangan`, `kd_gaji`, `keterangan`, `nominal`) VALUES
('det1', 'gj1', 'Anak', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `tblGaji`
--

CREATE TABLE IF NOT EXISTS `tblGaji` (
  `Kd_Gaji` char(12) CHARACTER SET utf8 NOT NULL,
  `Kd_Pegawai` char(12) CHARACTER SET utf8 DEFAULT NULL,
  `Periode` varchar(20) DEFAULT NULL,
  `Tgl_Ambil` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblGaji`
--

INSERT INTO `tblGaji` (`Kd_Gaji`, `Kd_Pegawai`, `Periode`, `Tgl_Ambil`) VALUES
('gj1', 'P1', 'MARET', '2015-04-01');

-- --------------------------------------------------------

--
-- Table structure for table `tblHutang`
--

CREATE TABLE IF NOT EXISTS `tblHutang` (
  `Kd_Hutang` char(12) CHARACTER SET utf8 NOT NULL,
  `Tgl_Masuk` date DEFAULT NULL,
  `Nominal` int(11) DEFAULT NULL,
  `Keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblJenis`
--

CREATE TABLE IF NOT EXISTS `tblJenis` (
  `Kd_Jenis` char(12) CHARACTER SET utf8 NOT NULL,
  `Keterangan` text,
  `Foto` text,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblJenisBahan`
--

CREATE TABLE IF NOT EXISTS `tblJenisBahan` (
  `Kd_JenisBahan` char(12) CHARACTER SET utf8 NOT NULL,
  `Keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblJenisGajiHarian`
--

CREATE TABLE IF NOT EXISTS `tblJenisGajiHarian` (
  `kd_jenis_gaji_harian` varchar(12) NOT NULL,
  `keterangan` text NOT NULL,
  `nominal_gaji_harian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblJenisGajiHarian`
--

INSERT INTO `tblJenisGajiHarian` (`kd_jenis_gaji_harian`, `keterangan`, `nominal_gaji_harian`) VALUES
('KDJ1', 'Manjaer', 5000000);

-- --------------------------------------------------------

--
-- Table structure for table `tblKepentingan`
--

CREATE TABLE IF NOT EXISTS `tblKepentingan` (
  `Kd_Kepentingan` char(12) CHARACTER SET utf8 NOT NULL,
  `Keterangan` char(10) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblMaintenance`
--

CREATE TABLE IF NOT EXISTS `tblMaintenance` (
  `Kd_Maintenance` char(12) CHARACTER SET utf8 NOT NULL,
  `Tgl_Perbaikan` date DEFAULT NULL,
  `Kd_Alat` char(12) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblMember`
--

CREATE TABLE IF NOT EXISTS `tblMember` (
  `kd_member` varchar(15) NOT NULL,
  `username` varchar(35) NOT NULL,
  `password` varchar(35) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `kd_pos` varchar(50) NOT NULL,
  PRIMARY KEY (`kd_member`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblPegawai`
--

CREATE TABLE IF NOT EXISTS `tblPegawai` (
  `Kd_Pegawai` char(12) CHARACTER SET utf8 NOT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Jenis_Kelamin` varchar(1) DEFAULT NULL,
  `Telpon` varchar(15) DEFAULT NULL,
  `Alamat` text,
  `Status` bit(1) DEFAULT NULL,
  `Foto` text,
  `Bagian` int(11) DEFAULT NULL,
  `kd_jenis_gaji` varchar(12) NOT NULL,
  PRIMARY KEY (`Kd_Pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblPegawai`
--

INSERT INTO `tblPegawai` (`Kd_Pegawai`, `Nama`, `Jenis_Kelamin`, `Telpon`, `Alamat`, `Status`, `Foto`, `Bagian`, `kd_jenis_gaji`) VALUES
('kdPegawai', 'Nama Saya', 'M', 'telpon', 'alamat', b'1', 'foto', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `tblPemasok`
--

CREATE TABLE IF NOT EXISTS `tblPemasok` (
  `kd_pemasok` char(12) CHARACTER SET utf8 NOT NULL,
  `nama_pemasok` varchar(50) DEFAULT NULL,
  `telpon` varchar(15) DEFAULT NULL,
  `alamat` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblPemasok`
--

INSERT INTO `tblPemasok` (`kd_pemasok`, `nama_pemasok`, `telpon`, `alamat`) VALUES
('A001', 'PT.Bukit Kenangan', '08383454687', 'songgoriti'),
('A002', 'PT. Blitar Abadi', '08383879097', 'kanigoro');

-- --------------------------------------------------------

--
-- Table structure for table `tblPembiayaanDivisi`
--

CREATE TABLE IF NOT EXISTS `tblPembiayaanDivisi` (
  `Kd_Pembiayaan` char(12) CHARACTER SET utf8 NOT NULL,
  `Divisi` int(11) DEFAULT NULL,
  `Nominal` int(11) DEFAULT NULL,
  `Kd_Kepentingan` char(12) CHARACTER SET utf8 DEFAULT NULL,
  `Keterangan_Lain` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblPengiriman`
--

CREATE TABLE IF NOT EXISTS `tblPengiriman` (
  `Kd_Pengiriman` char(12) CHARACTER SET utf8 NOT NULL,
  `Kd_Penjualan` char(12) CHARACTER SET utf8 DEFAULT NULL,
  `Tgl_Pengiriman` date DEFAULT NULL,
  `Alamat_Pengiriman` text,
  `Atas_Nama` varchar(50) DEFAULT NULL,
  `Telpon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblPenjualan`
--

CREATE TABLE IF NOT EXISTS `tblPenjualan` (
  `Kd_Penjualan` char(12) CHARACTER SET utf8 NOT NULL,
  `Tgl_Penjualan` date DEFAULT NULL,
  `Atas_Nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblPenjualanMasuk`
--

CREATE TABLE IF NOT EXISTS `tblPenjualanMasuk` (
  `Kd_PenjualanMasuk` varchar(12) CHARACTER SET utf8 NOT NULL,
  `Kd_Penjualan` char(12) CHARACTER SET utf8 DEFAULT NULL,
  `Tgl_PenjualanMasuk` date DEFAULT NULL,
  `Nominal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblRegistrasiProduk`
--

CREATE TABLE IF NOT EXISTS `tblRegistrasiProduk` (
  `Kd_Barang` char(12) CHARACTER SET utf8 NOT NULL,
  `Kd_Jenis` char(12) CHARACTER SET utf8 DEFAULT NULL,
  `Kualitas` int(11) DEFAULT NULL,
  `Tgl_Registrasi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblTunjangan`
--

CREATE TABLE IF NOT EXISTS `tblTunjangan` (
  `kd_tunjangan` varchar(12) NOT NULL,
  `kd_pegawai` varchar(12) NOT NULL,
  `keterangan` text NOT NULL,
  `nominal` int(11) NOT NULL,
  PRIMARY KEY (`kd_tunjangan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblTunjangan`
--

INSERT INTO `tblTunjangan` (`kd_tunjangan`, `kd_pegawai`, `keterangan`, `nominal`) VALUES
('TUN1', 'P1', 'Anak', 1000000),
('TUN2', 'P1', 'MAKAN', 3000000);
--
-- Database: `DbProyekPabrik`
--
--
-- Database: `cdcol`
--

-- --------------------------------------------------------

--
-- Table structure for table `cds`
--

CREATE TABLE IF NOT EXISTS `cds` (
  `titel` varchar(200) DEFAULT NULL,
  `interpret` varchar(200) DEFAULT NULL,
  `jahr` int(11) DEFAULT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `cds`
--

INSERT INTO `cds` (`titel`, `interpret`, `jahr`, `id`) VALUES
('Beauty', 'Ryuichi Sakamoto', 1990, 1),
('Goodbye Country (Hello Nightclub)', 'Groove Armada', 2001, 4),
('Glee', 'Bran Van 3000', 1997, 5);
--
-- Database: `phpmyadmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE IF NOT EXISTS `pma__bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE IF NOT EXISTS `pma__column_info` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin' AUTO_INCREMENT=27 ;

--
-- Dumping data for table `pma__column_info`
--

INSERT INTO `pma__column_info` (`id`, `db_name`, `table_name`, `column_name`, `comment`, `mimetype`, `transformation`, `transformation_options`) VALUES
(1, 'DBSistemInformasiPerusahaan', 'tblPegawai', 'Jenis_Kelamin', '', '', '_', ''),
(2, 'DBSistemInformasiPerusahaan', 'tblPegawai', 'kd_jenis_gaji', '', '', '_', ''),
(3, 'DBSistemInformasiPerusahaan', 'tblTunjangan', 'kd_tunjangan', '', '', '_', ''),
(4, 'DBSistemInformasiPerusahaan', 'tblTunjangan', 'kd_pegawai', '', '', '_', ''),
(5, 'DBSistemInformasiPerusahaan', 'tblTunjangan', 'keterangan', '', '', '_', ''),
(6, 'DBSistemInformasiPerusahaan', 'tblTunjangan', 'nominal', '', '', '_', ''),
(7, 'DBSistemInformasiPerusahaan', 'tblJenisGajiHarian', 'kd_jenis_gaji_harian', '', '', '_', ''),
(8, 'DBSistemInformasiPerusahaan', 'tblJenisGajiHarian', 'keterangan', '', '', '_', ''),
(9, 'DBSistemInformasiPerusahaan', 'tblJenisGajiHarian', 'nominal_gaji_harian', '', '', '_', ''),
(10, 'DBSistemInformasiPerusahaan', 'tblDetailGaji', 'kd_detail_gaji', '', '', '_', ''),
(11, 'DBSistemInformasiPerusahaan', 'tblDetailGaji', 'kd_gaji', '', '', '_', ''),
(12, 'DBSistemInformasiPerusahaan', 'tblDetailGaji', 'hari', '', '', '_', ''),
(13, 'DBSistemInformasiPerusahaan', 'tblDetailGaji', 'nominal_harian', '', '', '_', ''),
(14, 'DBSistemInformasiPerusahaan', 'tblDetailTunjangan', 'kd_detail_tunjangan', '', '', '_', ''),
(15, 'DBSistemInformasiPerusahaan', 'tblDetailTunjangan', 'kd_gaji', '', '', '_', ''),
(16, 'DBSistemInformasiPerusahaan', 'tblDetailTunjangan', 'keterangan', '', '', '_', ''),
(17, 'DBSistemInformasiPerusahaan', 'tblDetailTunjangan', 'nominal', '', '', '_', ''),
(18, 'DBSistemInformasiPerusahaan', 'tblAdmin', 'bagian', '', '', '_', ''),
(19, 'DBSistemInformasiPerusahaan', 'tblMember', 'kd_member', '', '', '_', ''),
(20, 'DBSistemInformasiPerusahaan', 'tblMember', 'username', '', '', '_', ''),
(21, 'DBSistemInformasiPerusahaan', 'tblMember', 'password', '', '', '_', ''),
(22, 'DBSistemInformasiPerusahaan', 'tblMember', 'nama', '', '', '_', ''),
(23, 'DBSistemInformasiPerusahaan', 'tblMember', 'email', '', '', '_', ''),
(24, 'DBSistemInformasiPerusahaan', 'tblMember', 'alamat', '', '', '_', ''),
(25, 'DBSistemInformasiPerusahaan', 'tblMember', 'kd_pos', '', '', '_', ''),
(26, 'DBSistemInformasiPerusahaan', 'tblJenis', 'harga', '', '', '_', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_coords`
--

CREATE TABLE IF NOT EXISTS `pma__designer_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `v` tinyint(4) DEFAULT NULL,
  `h` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for Designer';

--
-- Dumping data for table `pma__designer_coords`
--

INSERT INTO `pma__designer_coords` (`db_name`, `table_name`, `x`, `y`, `v`, `h`) VALUES
('DBSistemInformasiPerusahaan', 'tblAbsensi', 434, 75, 0, 1),
('DBSistemInformasiPerusahaan', 'tblAdmin', 0, 225, 0, 1),
('DBSistemInformasiPerusahaan', 'tblAlat', 1739, 33, 0, 1),
('DBSistemInformasiPerusahaan', 'tblBahanKeluar', 1495, 336, 0, 1),
('DBSistemInformasiPerusahaan', 'tblBeliBahan', 1493, 311, 0, 1),
('DBSistemInformasiPerusahaan', 'tblDetailMaintenance', 1740, 61, 0, 1),
('DBSistemInformasiPerusahaan', 'tblDetailPenjualan', 1064, 539, 0, 1),
('DBSistemInformasiPerusahaan', 'tblGaji', 1013, 168, 0, 1),
('DBSistemInformasiPerusahaan', 'tblHutang', 1015, 107, 0, 1),
('DBSistemInformasiPerusahaan', 'tblJenis', 448, 373, 0, 1),
('DBSistemInformasiPerusahaan', 'tblJenisBahan', 1500, 361, 0, 1),
('DBSistemInformasiPerusahaan', 'tblKepentingan', 1015, 25, 0, 1),
('DBSistemInformasiPerusahaan', 'tblMaintenance', 1741, 86, 0, 1),
('DBSistemInformasiPerusahaan', 'tblPegawai', 435, 113, 0, 1),
('DBSistemInformasiPerusahaan', 'tblPemasok', 436, 38, 0, 1),
('DBSistemInformasiPerusahaan', 'tblPembiayaanDivisi', 1016, 133, 0, 1),
('DBSistemInformasiPerusahaan', 'tblPengiriman', 1062, 563, 0, 1),
('DBSistemInformasiPerusahaan', 'tblPenjualan', 1064, 507, 0, 1),
('DBSistemInformasiPerusahaan', 'tblPenjualanMasuk', 1015, 79, 0, 1),
('DBSistemInformasiPerusahaan', 'tblRegistrasiProduk', 446, 406, 0, 1),
('DBSistemInformasiPerusahaan', 'tblDetailGaji', 1009, 201, 0, 1),
('DBSistemInformasiPerusahaan', 'tblDetailTunjangan', 1016, 234, 0, 1),
('DBSistemInformasiPerusahaan', 'tblJenisGajiHarian', 396, 183, 0, 1),
('DBSistemInformasiPerusahaan', 'tblTunjangan', 424, 150, 0, 1),
('DBSistemInformasiPerusahaan', 'tblMember', 1066, 468, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE IF NOT EXISTS `pma__history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`,`db`,`table`,`timevalue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE IF NOT EXISTS `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`page_nr`),
  KEY `db_name` (`db_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE IF NOT EXISTS `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{"db":"DBSistemInformasiPerusahaan","table":"tblJenis"},{"db":"DBSistemInformasiPerusahaan","table":"tblPemasok"},{"db":"DBSistemInformasiPerusahaan","table":"tblMember"},{"db":"DBSistemInformasiPerusahaan","table":"tblAdmin"},{"db":"DBSistemInformasiPerusahaan","table":"tblAbsensi"},{"db":"DBSistemInformasiPerusahaan","table":"tblDetailGaji"},{"db":"DBSistemInformasiPerusahaan","table":"tblDetailTunjangan"},{"db":"DBSistemInformasiPerusahaan","table":"tblGaji"},{"db":"DBSistemInformasiPerusahaan","table":"tblJenisGajiHarian"},{"db":"DBSistemInformasiPerusahaan","table":"tblTunjangan"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE IF NOT EXISTS `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  KEY `foreign_field` (`foreign_db`,`foreign_table`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE IF NOT EXISTS `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float unsigned NOT NULL DEFAULT '0',
  `y` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE IF NOT EXISTS `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE IF NOT EXISTS `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`,`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE IF NOT EXISTS `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`db_name`,`table_name`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE IF NOT EXISTS `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2015-04-04 01:23:31', '{"collation_connection":"utf8mb4_general_ci"}');
--
-- Database: `test`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_multi_sets`()
    DETERMINISTIC
begin
        select user() as first_col;
        select user() as first_col, now() as second_col;
        select user() as first_col, now() as second_col, now() as third_col;
        end$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
