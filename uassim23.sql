-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2025 at 03:25 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uassim23`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_so`
--

CREATE TABLE `detail_so` (
  `iddetail` int(11) NOT NULL,
  `idso` int(11) DEFAULT NULL,
  `idproduk` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `subtotal` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_so`
--

INSERT INTO `detail_so` (`iddetail`, `idso`, `idproduk`, `jumlah`, `subtotal`) VALUES
(1, 1, 1, 2, '24000000.00'),
(2, 2, 2, 1, '3500000.00'),
(3, 3, 2, 2, '7000000.00');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `idpelanggan` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` text,
  `no_telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`idpelanggan`, `nama`, `alamat`, `no_telp`) VALUES
(1, 'Dinii', 'gggggggggg', 'rr777777777777777777'),
(2, 'YYYY', 'Apaaa', '0888888888');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `kode_produk` varchar(20) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `kode_produk`, `nama_produk`, `harga`, `stok`) VALUES
(1, 'BRG01', 'TV SAMSUNGG', '12000000.00', 3),
(2, 'BRG02', 'HP OPPO', '3500000.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `idsales` int(11) NOT NULL,
  `nama_sales` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`idsales`, `nama_sales`) VALUES
(1, 'Liliiii'),
(2, 'hihi');

-- --------------------------------------------------------

--
-- Table structure for table `salesorder`
--

CREATE TABLE `salesorder` (
  `idso` int(11) NOT NULL,
  `kode_so` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `idpelanggan` int(11) DEFAULT NULL,
  `idsales` int(11) DEFAULT NULL,
  `status` enum('draft','dikirim','selesai','dibatalkan') DEFAULT 'draft',
  `total_harga` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salesorder`
--

INSERT INTO `salesorder` (`idso`, `kode_so`, `tanggal`, `idpelanggan`, `idsales`, `status`, `total_harga`) VALUES
(1, '123', '2025-06-04', 1, 1, 'draft', '24000000.00'),
(2, '2222', '2025-06-06', 1, 2, 'draft', '3500000.00'),
(3, '1235', '2025-06-06', 1, 2, 'draft', '7000000.00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','sales','manager') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `password`, `role`) VALUES
(1, '', 'admin', '$2y$10$XTOXDQPuuCFB/WW2.ULMle7Y7YVDCpnisjBaWWea.SSWSfiJE/zUK', 'admin'),
(2, '', 'sales', '$2y$10$V.KKGoePUiBzMon8rt6SRuVTGO7xvLiAgE5Jn8LQ1OT0FTfAdNYcy', 'sales'),
(7, '', 'azka', '$2y$10$hWC2/DeIw9k8C/0aegiji.7MXIyYjVszPVSdOF3tDkQVhhDWZVo7C', 'manager'),
(8, '', 'manager', '$2y$10$DGpTlak1G58MRv.AaEWdGO/oRPWNQzGX3sVQ3ZQq7.4eVHjCI7T9K', 'manager');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_so`
--
ALTER TABLE `detail_so`
  ADD PRIMARY KEY (`iddetail`),
  ADD KEY `idso` (`idso`),
  ADD KEY `idproduk` (`idproduk`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`idpelanggan`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`),
  ADD UNIQUE KEY `kode_produk` (`kode_produk`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`idsales`);

--
-- Indexes for table `salesorder`
--
ALTER TABLE `salesorder`
  ADD PRIMARY KEY (`idso`),
  ADD KEY `idpelanggan` (`idpelanggan`),
  ADD KEY `idsales` (`idsales`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_so`
--
ALTER TABLE `detail_so`
  MODIFY `iddetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `idpelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `idsales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salesorder`
--
ALTER TABLE `salesorder`
  MODIFY `idso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_so`
--
ALTER TABLE `detail_so`
  ADD CONSTRAINT `detail_so_ibfk_1` FOREIGN KEY (`idso`) REFERENCES `salesorder` (`idso`),
  ADD CONSTRAINT `detail_so_ibfk_2` FOREIGN KEY (`idproduk`) REFERENCES `produk` (`idproduk`);

--
-- Constraints for table `salesorder`
--
ALTER TABLE `salesorder`
  ADD CONSTRAINT `salesorder_ibfk_1` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`),
  ADD CONSTRAINT `salesorder_ibfk_2` FOREIGN KEY (`idsales`) REFERENCES `sales` (`idsales`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
