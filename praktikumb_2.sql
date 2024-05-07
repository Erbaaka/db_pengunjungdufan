-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Bulan Mei 2024 pada 05.40
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `praktikumb_2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `cust_id` char(5) NOT NULL,
  `cust_name` varchar(10) DEFAULT NULL,
  `cust_addres` text DEFAULT NULL,
  `cust_city` varchar(10) DEFAULT NULL,
  `cust_zip` varchar(10) DEFAULT NULL,
  `cust_state` varchar(10) DEFAULT NULL,
  `cust_country` varchar(15) DEFAULT NULL,
  `cust_contact` varchar(15) DEFAULT NULL,
  `cust_email` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`cust_id`, `cust_name`, `cust_addres`, `cust_city`, `cust_zip`, `cust_state`, `cust_country`, `cust_contact`, `cust_email`) VALUES
('c-001', 'Renny', 'Jalan Anggrek', 'Jakarta Ba', '223344', 'Jakarta', 'Indonesia', '0862 7777 2456', 'Renny@gmail.com'),
('c-002', 'Inna', 'jalan cinta', 'Duri kosam', '114367', 'Jakarta', NULL, '0899 2345 7765', 'inna@gmail.com'),
('c-004', 'Rifqi', 'Jalan timun', NULL, NULL, 'Jakarta', NULL, '0811 2233 4422', 'rifqi@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `order_num` char(5) NOT NULL,
  `order_date` date DEFAULT NULL,
  `cust_id` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_items`
--

CREATE TABLE `order_items` (
  `order_num` char(5) NOT NULL,
  `product_id` char(5) NOT NULL,
  `quantity` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `product_id` char(5) NOT NULL,
  `vendor_id` char(5) DEFAULT NULL,
  `product_name` varchar(25) DEFAULT NULL,
  `product_price` int(10) DEFAULT NULL,
  `product_desc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_notes`
--

CREATE TABLE `product_notes` (
  `note_id` char(5) NOT NULL,
  `product_id` char(5) DEFAULT NULL,
  `note_date` date DEFAULT NULL,
  `note_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `vendors`
--

CREATE TABLE `vendors` (
  `vend_id` char(5) NOT NULL,
  `vend_name` varchar(25) DEFAULT NULL,
  `vend_addres` text DEFAULT NULL,
  `vend_city` varchar(10) DEFAULT NULL,
  `vend_state` varchar(10) DEFAULT NULL,
  `vend_zip` varchar(10) DEFAULT NULL,
  `vend_country` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_num`),
  ADD KEY `fk_cust` (`cust_id`);

--
-- Indeks untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_num`,`product_id`),
  ADD KEY `fk_prod_mm` (`product_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_vendor` (`vendor_id`);

--
-- Indeks untuk tabel `product_notes`
--
ALTER TABLE `product_notes`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `fk_product` (`product_id`);

--
-- Indeks untuk tabel `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`vend_id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_cust` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`);

--
-- Ketidakleluasaan untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order_mm` FOREIGN KEY (`order_num`) REFERENCES `orders` (`order_num`),
  ADD CONSTRAINT `fk_prod_mm` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vend_id`);

--
-- Ketidakleluasaan untuk tabel `product_notes`
--
ALTER TABLE `product_notes`
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
