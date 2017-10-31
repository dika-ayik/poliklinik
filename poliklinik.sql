-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2017 at 08:13 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `poliklinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail`
--

CREATE TABLE IF NOT EXISTS `detail` (
  `ID_DETAIL` int(11) NOT NULL,
  `NO_RESEP` int(11) DEFAULT NULL,
  `KODE_OBAT` int(11) NOT NULL,
  `HARGA` int(11) DEFAULT NULL,
  `DOSIS` varchar(50) DEFAULT NULL,
  `SUBTOTAL` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_DETAIL`),
  KEY `FK_BERISI` (`NO_RESEP`),
  KEY `FK_BERISI1` (`KODE_OBAT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE IF NOT EXISTS `dokter` (
  `KODE_POLI` int(11) NOT NULL,
  `KODE_DOKTER` int(11) NOT NULL,
  `NAMA_DOKTER` varchar(100) DEFAULT NULL,
  `SPESIALIS` varchar(50) DEFAULT NULL,
  `ALAMAT_DOKTER` text,
  `TELEPON_DOKTER` varchar(20) DEFAULT NULL,
  `TARIF` int(11) DEFAULT NULL,
  PRIMARY KEY (`KODE_POLI`,`KODE_DOKTER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE IF NOT EXISTS `obat` (
  `KODE_OBAT` int(11) NOT NULL,
  `NAMA_OBAT` varchar(100) DEFAULT NULL,
  `JENIS_OBAT` varchar(100) DEFAULT NULL,
  `KATEGORI` varchar(100) DEFAULT NULL,
  `HARGA_OBAT` int(11) DEFAULT NULL,
  `JUMLAH_OBAT` int(11) DEFAULT NULL,
  PRIMARY KEY (`KODE_OBAT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE IF NOT EXISTS `pasien` (
  `KODE_PASIEN` int(11) NOT NULL,
  `NAMA_PASIEN` varchar(100) DEFAULT NULL,
  `ALAMAT_PASIEN` text,
  `GENDER_PASIEN` varchar(20) DEFAULT NULL,
  `UMUR_PASIEN` int(11) DEFAULT NULL,
  `TELEPON_PASIEN` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`KODE_PASIEN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE IF NOT EXISTS `pembayaran` (
  `NO_BAYAR` int(11) NOT NULL,
  `KODE_PASIEN` int(11) NOT NULL,
  `TANGGAL_BAYAR` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `JUMLAH_BAYAR` int(11) DEFAULT NULL,
  PRIMARY KEY (`NO_BAYAR`),
  KEY `FK_BAYAR` (`KODE_PASIEN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran`
--

CREATE TABLE IF NOT EXISTS `pendaftaran` (
  `NO_PENDAFTARAN` int(11) NOT NULL,
  `KODE_POLI` int(11) NOT NULL,
  `KODE_DOKTER` int(11) NOT NULL,
  `KODE_PASIEN` int(11) NOT NULL,
  `TANGGAL_PENDAFTRAN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `BIAYA` int(11) DEFAULT NULL,
  `KET` text,
  PRIMARY KEY (`NO_PENDAFTARAN`),
  KEY `FK_DILAYANI` (`KODE_POLI`,`KODE_DOKTER`),
  KEY `FK_MELAKUKAN` (`KODE_PASIEN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE IF NOT EXISTS `poli` (
  `KODE_POLI` int(11) NOT NULL,
  `NAMA_POLI` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`KODE_POLI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resep`
--

CREATE TABLE IF NOT EXISTS `resep` (
  `NO_RESEP` int(11) NOT NULL,
  `KODE_PASIEN` int(11) NOT NULL,
  `KODE_POLI` int(11) NOT NULL,
  `KODE_DOKTER` int(11) NOT NULL,
  `TANGGAL_RESEP` int(11) DEFAULT NULL,
  `TOTAL_HARGA` int(11) DEFAULT NULL,
  `BAYAR` int(11) DEFAULT NULL,
  `KEMBALI` int(11) DEFAULT NULL,
  PRIMARY KEY (`NO_RESEP`),
  KEY `FK_DITERIMA` (`KODE_PASIEN`),
  KEY `FK_MEMBUAT` (`KODE_POLI`,`KODE_DOKTER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('admin','poli','apoteker','resepsionis','kasir') NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `tanggal_lahir` varchar(255) NOT NULL,
  `bulan_lahir` varchar(255) NOT NULL,
  `tahun_lahir` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user`, `password`, `status`, `tempat_lahir`, `tanggal_lahir`, `bulan_lahir`, `tahun_lahir`, `alamat`, `no_hp`, `gambar`, `nama_lengkap`) VALUES
(1, 'admin@admin.com', 'admin', 'admin', 'lumajang', '3', 'Januari', '1999', 'lumajang', '08123456789', '', ''),
(2, 'poli@poli.com', 'poli', 'poli', 'lumajang', '9', 'Maret', '2003', 'lumajang', '08124356783', '', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail`
--
ALTER TABLE `detail`
  ADD CONSTRAINT `FK_BERISI1` FOREIGN KEY (`KODE_OBAT`) REFERENCES `obat` (`KODE_OBAT`),
  ADD CONSTRAINT `FK_BERISI` FOREIGN KEY (`NO_RESEP`) REFERENCES `resep` (`NO_RESEP`);

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `FK_MEMILIKI` FOREIGN KEY (`KODE_POLI`) REFERENCES `poli` (`KODE_POLI`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `FK_BAYAR` FOREIGN KEY (`KODE_PASIEN`) REFERENCES `pasien` (`KODE_PASIEN`);

--
-- Constraints for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD CONSTRAINT `FK_MELAKUKAN` FOREIGN KEY (`KODE_PASIEN`) REFERENCES `pasien` (`KODE_PASIEN`),
  ADD CONSTRAINT `FK_DILAYANI` FOREIGN KEY (`KODE_POLI`, `KODE_DOKTER`) REFERENCES `dokter` (`KODE_POLI`, `KODE_DOKTER`);

--
-- Constraints for table `resep`
--
ALTER TABLE `resep`
  ADD CONSTRAINT `FK_MEMBUAT` FOREIGN KEY (`KODE_POLI`, `KODE_DOKTER`) REFERENCES `dokter` (`KODE_POLI`, `KODE_DOKTER`),
  ADD CONSTRAINT `FK_DITERIMA` FOREIGN KEY (`KODE_PASIEN`) REFERENCES `pasien` (`KODE_PASIEN`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
