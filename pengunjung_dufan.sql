-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Bulan Mei 2024 pada 05.45
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
-- Database: `pengunjung_dufan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookingtiket`
--

CREATE TABLE `bookingtiket` (
  `id_pemesanan` int(11) NOT NULL,
  `id_pengunjung` int(11) NOT NULL,
  `id_tiket` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `bookingtiket`
--

INSERT INTO `bookingtiket` (`id_pemesanan`, `id_pengunjung`, `id_tiket`, `id_pembelian`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeliantiket`
--

CREATE TABLE `pembeliantiket` (
  `id_pembelian` int(11) NOT NULL,
  `id_pengunjung` int(11) NOT NULL,
  `id_tiket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembeliantiket`
--

INSERT INTO `pembeliantiket` (`id_pembelian`, `id_pengunjung`, `id_tiket`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengunjung`
--

CREATE TABLE `pengunjung` (
  `id_pengunjung` int(11) NOT NULL,
  `nama_pengunjung` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengunjung`
--

INSERT INTO `pengunjung` (`id_pengunjung`, `nama_pengunjung`, `alamat`, `phone`, `email`) VALUES
(1, 'Budi', 'Jl. Sudirman No. 1', '08123456789', 'budi@email.com'),
(2, 'Ani', 'Jl. Merdeka No. 2', '08523456789', 'ani@email.com'),
(3, 'Cici', 'Jl. Nusantara No. 3', '08923456789', 'cici@email.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tiket`
--

CREATE TABLE `tiket` (
  `id_tiket` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tiket`
--

INSERT INTO `tiket` (`id_tiket`, `tanggal_pembelian`) VALUES
(1, '2024-05-01'),
(2, '2024-05-02'),
(3, '2024-05-03');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bookingtiket`
--
ALTER TABLE `bookingtiket`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `id_pengunjung` (`id_pengunjung`),
  ADD KEY `id_tiket` (`id_tiket`),
  ADD KEY `id_pembelian` (`id_pembelian`);

--
-- Indeks untuk tabel `pembeliantiket`
--
ALTER TABLE `pembeliantiket`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_pengunjung` (`id_pengunjung`),
  ADD KEY `id_tiket` (`id_tiket`);

--
-- Indeks untuk tabel `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD PRIMARY KEY (`id_pengunjung`);

--
-- Indeks untuk tabel `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id_tiket`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bookingtiket`
--
ALTER TABLE `bookingtiket`
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pembeliantiket`
--
ALTER TABLE `pembeliantiket`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pengunjung`
--
ALTER TABLE `pengunjung`
  MODIFY `id_pengunjung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tiket`
--
ALTER TABLE `tiket`
  MODIFY `id_tiket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bookingtiket`
--
ALTER TABLE `bookingtiket`
  ADD CONSTRAINT `bookingtiket_ibfk_1` FOREIGN KEY (`id_pengunjung`) REFERENCES `pengunjung` (`id_pengunjung`),
  ADD CONSTRAINT `bookingtiket_ibfk_2` FOREIGN KEY (`id_tiket`) REFERENCES `tiket` (`id_tiket`),
  ADD CONSTRAINT `bookingtiket_ibfk_3` FOREIGN KEY (`id_pembelian`) REFERENCES `pembeliantiket` (`id_pembelian`);

--
-- Ketidakleluasaan untuk tabel `pembeliantiket`
--
ALTER TABLE `pembeliantiket`
  ADD CONSTRAINT `pembeliantiket_ibfk_1` FOREIGN KEY (`id_pengunjung`) REFERENCES `pengunjung` (`id_pengunjung`),
  ADD CONSTRAINT `pembeliantiket_ibfk_2` FOREIGN KEY (`id_tiket`) REFERENCES `tiket` (`id_tiket`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
