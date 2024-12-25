-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2024 at 02:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id_category` varchar(20) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id_category`, `category_name`) VALUES
('C001', 'Furniture'),
('C002', 'Lembaran'),
('C003', 'Non-Lembaran'),
('C004', 'Buku');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` varchar(20) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `stock` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `product_name`, `price`, `stock`, `description`) VALUES
('P-B-001', 'Buku Tamu', 13000, 60, ''),
('P-F-001', 'Lemari Kecil', 150000, 150, 'Lemari Kecil untuk menyimpan berkas-berkas'),
('P-L-001', 'Kertas HVS', 55000, 50, 'Kertas HVS (1 Rim)'),
('P-N-001', 'Stapler', 7000, 200, 'Alat untuk menyatukan kertas dengan staples.');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id_transactions` varchar(20) NOT NULL,
  `id_user` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `total_price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id_transactions`, `id_user`, `date`, `total_price`) VALUES
('T-001', 'U002', '2024-12-01', 150000),
('T-002', 'U001', '2024-12-02', 110000);

-- --------------------------------------------------------

--
-- Table structure for table `transactions_detail`
--

CREATE TABLE `transactions_detail` (
  `id_detail` int(11) NOT NULL,
  `id_transactions` varchar(20) NOT NULL,
  `id_product` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions_detail`
--

INSERT INTO `transactions_detail` (`id_detail`, `id_transactions`, `id_product`, `quantity`, `subtotal`) VALUES
(1, 'T-001', 'P-F-001', 1, 150000),
(2, 'T-002', 'P-L-001', 2, 110000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` varchar(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Gudang','Pemilik') NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `role`, `email`) VALUES
('U001', 'adm_001', 'admin1', 'Admin', 'admin1@gmail.com'),
('U002', 'gdg_001', 'gudang1', 'Gudang', 'gudang1@gmail.com'),
('U003', 'pemilik_001', 'pemilik1', 'Pemilik', 'pemilik1@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id_transactions`),
  ADD UNIQUE KEY `id_user` (`id_user`);

--
-- Indexes for table `transactions_detail`
--
ALTER TABLE `transactions_detail`
  ADD PRIMARY KEY (`id_detail`),
  ADD UNIQUE KEY `id_transactions` (`id_transactions`),
  ADD UNIQUE KEY `id_product` (`id_product`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transactions_detail`
--
ALTER TABLE `transactions_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `transactions_detail`
--
ALTER TABLE `transactions_detail`
  ADD CONSTRAINT `transactions_detail_ibfk_1` FOREIGN KEY (`id_transactions`) REFERENCES `transactions` (`id_transactions`),
  ADD CONSTRAINT `transactions_detail_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
