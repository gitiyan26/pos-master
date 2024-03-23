-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2024 at 02:57 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos-master`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(10) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(1, 'Paket 1 Jam', '2024-03-13 18:13:41', '2024-03-13 18:13:41'),
(2, 'Full Day', '2024-03-14 07:09:52', '2024-03-14 07:09:52');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id_member` int(10) UNSIGNED NOT NULL,
  `kode_member` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text DEFAULT NULL,
  `telepon` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_03_05_194740_tambah_kolom_baru_to_users_table', 1),
(7, '2021_03_05_195441_buat_kategori_table', 1),
(8, '2021_03_05_195949_buat_produk_table', 1),
(9, '2021_03_05_200515_buat_member_table', 1),
(10, '2021_03_05_200706_buat_supplier_table', 1),
(11, '2021_03_05_200841_buat_pembelian_table', 1),
(12, '2021_03_05_200845_buat_pembelian_detail_table', 1),
(13, '2021_03_05_200853_buat_penjualan_table', 1),
(14, '2021_03_05_200858_buat_penjualan_detail_table', 1),
(15, '2021_03_05_200904_buat_setting_table', 1),
(16, '2021_03_05_201756_buat_pengeluaran_table', 1),
(17, '2021_03_11_225128_create_sessions_table', 1),
(18, '2021_03_24_115009_tambah_foreign_key_to_produk_table', 1),
(19, '2021_03_24_131829_tambah_kode_produk_to_produk_table', 1),
(20, '2021_05_08_220315_tambah_diskon_to_setting_table', 1),
(22, '2021_05_09_124745_edit_id_member_to_penjualan_table', 2),
(24, '2024_03_14_213327_update_penjualan', 3),
(25, '2024_03_20_201336_update_update_penjualan', 4),
(26, '2024_03_20_202221_update_update_update_penjualan', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(10) UNSIGNED NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `total_item` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `diskon` tinyint(4) NOT NULL DEFAULT 0,
  `bayar` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_supplier`, `total_item`, `total_harga`, `diskon`, `bayar`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 50000, 0, 50000, '2024-03-16 08:34:52', '2024-03-16 08:35:14'),
(2, 1, 1, 25000, 0, 25000, '2024-03-16 08:35:31', '2024-03-16 08:35:38');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_detail`
--

CREATE TABLE `pembelian_detail` (
  `id_pembelian_detail` int(10) UNSIGNED NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembelian_detail`
--

INSERT INTO `pembelian_detail` (`id_pembelian_detail`, `id_pembelian`, `id_produk`, `harga_beli`, `jumlah`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 50000, 1, 50000, '2024-03-16 08:35:03', '2024-03-16 08:35:03'),
(2, 2, 2, 25000, 1, 25000, '2024-03-16 08:35:36', '2024-03-16 08:35:36');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id_pengeluaran` int(10) UNSIGNED NOT NULL,
  `deskripsi` text NOT NULL,
  `nominal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`id_pengeluaran`, `deskripsi`, `nominal`, `created_at`, `updated_at`) VALUES
(1, 'Bayar Listrik', 500000, '2024-03-13 18:37:41', '2024-03-13 18:37:41'),
(2, 'Bayar air', 19000, '2024-03-14 07:14:11', '2024-03-14 07:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(10) UNSIGNED NOT NULL,
  `id_member` int(11) DEFAULT NULL,
  `total_item` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `diskon` tinyint(4) NOT NULL DEFAULT 0,
  `bayar` int(11) NOT NULL DEFAULT 0,
  `diterima` int(11) NOT NULL DEFAULT 0,
  `id_user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kode_bill` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `usia` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_member`, `total_item`, `total_harga`, `diskon`, `bayar`, `diterima`, `id_user`, `created_at`, `updated_at`, `kode_bill`, `nama`, `usia`, `payment_method`) VALUES
(1, NULL, 0, 0, 0, 0, 0, 1, '2024-03-15 11:38:22', '2024-03-15 11:38:22', NULL, '', '', ''),
(2, NULL, 1, 10000, 0, 10000, 10000, 1, '2024-03-15 11:38:51', '2024-03-15 11:39:11', '20240315003', '', '', ''),
(3, NULL, 1, 30000, 0, 30000, 40000, 1, '2024-03-15 11:39:14', '2024-03-15 11:41:56', '20240315004', '', '', ''),
(4, NULL, 1, 30000, 0, 30000, 30000, 1, '2024-03-15 11:45:42', '2024-03-15 11:46:00', '20240315005', '', '', ''),
(5, NULL, 2, 40000, 0, 40000, 49996, 1, '2024-03-15 11:46:03', '2024-03-15 11:46:18', '20240315006', '', '', ''),
(7, NULL, 1, 10000, 0, 10000, 10000, 1, '2024-03-16 08:00:08', '2024-03-16 08:00:21', '20240316002', '', '', ''),
(8, NULL, 2, 530000, 0, 530000, 0, 1, '2024-03-16 08:00:23', '2024-03-16 08:18:34', '20240316003', '', '', ''),
(9, NULL, 2, 355000, 0, 355000, 555547, 1, '2024-03-16 08:32:50', '2024-03-16 08:33:02', '20240316004', '', '', ''),
(10, NULL, 1, 7500, 0, 7500, 2131310, 1, '2024-03-16 08:33:05', '2024-03-16 08:33:31', '20240316005', '', '', ''),
(11, NULL, 2, 355000, 0, 355000, 0, 1, '2024-03-16 08:33:34', '2024-03-16 08:34:04', '20240316006', '', '', ''),
(12, NULL, 5, 67500, 0, 67500, 499970, 1, '2024-03-16 08:38:14', '2024-03-16 08:38:31', '20240316007', '', '', ''),
(14, NULL, 0, 0, 0, 0, 0, 1, '2024-03-16 08:42:39', '2024-03-16 08:42:39', NULL, '', '', ''),
(15, NULL, 1, 7500, 0, 7500, 10000, 1, '2024-03-16 08:42:40', '2024-03-16 08:42:52', '20240316009', '', '', ''),
(16, NULL, 1, 325000, 0, 325000, 80000, 1, '2024-03-16 08:43:00', '2024-03-16 08:43:32', '20240316010', '', '', ''),
(17, NULL, 1, 30000, 0, 30000, 0, 1, '2024-03-16 08:43:34', '2024-03-16 08:44:02', '20240316011', '', '', ''),
(18, NULL, 0, 0, 0, 0, 0, 1, '2024-03-16 08:44:08', '2024-03-16 08:44:08', NULL, '', '', ''),
(19, NULL, 1, 325000, 0, 325000, 600000, 2, '2024-03-16 08:44:45', '2024-03-16 08:45:03', '20240316013', '', '', ''),
(20, NULL, 1, 30000, 0, 30000, 40000, 2, '2024-03-16 08:45:07', '2024-03-16 08:45:19', '20240316014', '', '', ''),
(21, NULL, 1, 10000, 0, 10000, 60000, 2, '2024-03-16 08:45:28', '2024-03-16 08:45:41', '20240316015', '', '', ''),
(22, NULL, 1, 30000, 0, 30000, 50000, 2, '2024-03-16 08:45:44', '2024-03-16 08:45:55', '20240316016', '', '', ''),
(23, NULL, 3, 90000, 0, 90000, 50000, 2, '2024-03-16 08:45:57', '2024-03-16 08:46:20', '20240316017', '', '', ''),
(24, NULL, 1, 7500, 0, 7500, 40000, 2, '2024-03-16 08:46:23', '2024-03-16 08:46:37', '20240316018', '', '', ''),
(25, NULL, 2, 355000, 0, 355000, 499996, 2, '2024-03-16 08:46:40', '2024-03-16 08:46:54', '20240316019', '', '', ''),
(26, NULL, 1, 10000, 0, 10000, 10000, 2, '2024-03-16 08:46:57', '2024-03-16 08:47:16', '20240316020', '', '', ''),
(27, NULL, 0, 0, 0, 0, 0, 2, '2024-03-16 08:47:18', '2024-03-16 08:47:18', NULL, '', '', ''),
(28, NULL, 1, 500000, 0, 500000, 500000, 1, '2024-03-16 08:48:09', '2024-03-16 08:48:32', '20240316022', '', '', ''),
(29, NULL, 0, 0, 0, 0, 0, 1, '2024-03-16 08:48:35', '2024-03-16 08:48:35', NULL, '', '', ''),
(30, NULL, 0, 0, 0, 0, 0, 1, '2024-03-16 08:48:49', '2024-03-16 08:48:49', NULL, '', '', ''),
(31, NULL, 2, 335000, 0, 335000, 499970, 1, '2024-03-16 08:48:50', '2024-03-16 08:49:10', '20240316025', '', '', ''),
(32, NULL, 1, 30000, 0, 30000, 30000, 1, '2024-03-16 08:49:13', '2024-03-16 08:51:58', '20240316026', '', '', ''),
(33, NULL, 1, 10000, 0, 10000, 55555, 1, '2024-03-16 08:52:01', '2024-03-16 08:57:34', '20240316027', '', '', ''),
(34, NULL, 1, 30000, 0, 30000, 342423423, 1, '2024-03-16 08:57:36', '2024-03-16 08:58:54', '20240316028', '', '', ''),
(35, NULL, 1, 325000, 0, 325000, 3123123, 1, '2024-03-16 08:58:57', '2024-03-16 08:59:08', '20240316029', '', '', ''),
(36, NULL, 1, 30000, 0, 30000, 30000, 1, '2024-03-16 08:59:10', '2024-03-16 08:59:21', '20240316030', '', '', ''),
(37, NULL, 1, 30000, 0, 30000, 400000, 1, '2024-03-16 08:59:24', '2024-03-16 08:59:54', '20240316031', '', '', ''),
(38, NULL, 1, 30000, 0, 30000, 30000, 1, '2024-03-16 08:59:57', '2024-03-16 09:00:16', '20240316032', '', '', ''),
(39, NULL, 1, 325000, 0, 325000, 325000, 1, '2024-03-16 09:00:18', '2024-03-16 09:00:32', '20240316033', '', '', ''),
(40, NULL, 1, 10000, 0, 10000, 10000, 1, '2024-03-16 09:00:35', '2024-03-16 09:00:47', '20240316034', '', '', ''),
(41, NULL, 0, 0, 0, 0, 0, 1, '2024-03-16 09:00:50', '2024-03-16 09:00:50', NULL, '', '', ''),
(42, NULL, 1, 325000, 0, 325000, 325000, 1, '2024-03-16 09:01:15', '2024-03-16 09:01:26', '20240316036', '', '', ''),
(43, NULL, 1, 30000, 0, 30000, 30000, 1, '2024-03-16 09:01:28', '2024-03-16 09:01:41', '20240316037', '', '', ''),
(44, NULL, 0, 0, 0, 0, 0, 1, '2024-03-16 09:01:47', '2024-03-16 09:01:47', NULL, '', '', ''),
(45, NULL, 1, 10000, 0, 10000, 60000, 1, '2024-03-17 02:38:48', '2024-03-17 02:39:00', '20240317002', '', '', ''),
(46, NULL, 1, 325000, 0, 325000, 400000, 1, '2024-03-17 02:39:02', '2024-03-17 02:39:28', '20240317003', '', '', ''),
(47, NULL, 0, 0, 0, 0, 0, 1, '2024-03-19 12:12:01', '2024-03-19 12:12:01', NULL, '', '', ''),
(48, NULL, 1, 325000, 0, 325000, 4444444, 1, '2024-03-19 12:19:00', '2024-03-19 13:02:56', '20240319003', '', '', ''),
(49, NULL, 1, 10000, 0, 10000, 4000000, 1, '2024-03-19 13:03:14', '2024-03-19 13:03:27', '20240319004', '', '', ''),
(50, NULL, 1, 10000, 0, 10000, 90000, 1, '2024-03-19 13:08:36', '2024-03-19 13:08:51', '20240319005', '', '', ''),
(51, NULL, 1, 30000, 0, 30000, 50000, 2, '2024-03-19 13:13:41', '2024-03-19 13:14:08', '20240319006', '', '', ''),
(52, NULL, 0, 0, 0, 0, 0, 2, '2024-03-19 13:15:52', '2024-03-19 13:15:52', NULL, '', '', ''),
(53, NULL, 1, 10000, 0, 10000, 90000, 1, '2024-03-19 13:17:12', '2024-03-19 13:17:39', '20240319008', '', '', ''),
(54, NULL, 1, 10000, 0, 10000, 80000, 2, '2024-03-19 13:20:08', '2024-03-19 13:20:42', '20240319009', '', '', ''),
(55, NULL, 1, 30000, 0, 30000, 30000, 2, '2024-03-19 13:20:52', '2024-03-19 13:21:02', '20240319010', '', '', ''),
(56, NULL, 1, 30000, 0, 30000, 80000, 2, '2024-03-19 13:28:33', '2024-03-19 13:28:47', '20240319011', '', '', ''),
(57, NULL, 2, 335000, 0, 335000, 400000000, 2, '2024-03-19 14:12:53', '2024-03-19 14:17:29', '20240319012', '', '', ''),
(58, NULL, 1, 10000, 0, 10000, 10000, 2, '2024-03-19 21:06:17', '2024-03-19 21:06:35', '20240320002', '', '', ''),
(59, NULL, 1, 30000, 0, 30000, 40000, 2, '2024-03-19 21:13:51', '2024-03-19 21:14:05', '20240320003', '', '', ''),
(60, NULL, 1, 10000, 0, 10000, 10000, 2, '2024-03-19 21:27:08', '2024-03-19 21:27:20', '20240320004', '', '', ''),
(61, NULL, 1, 10000, 0, 10000, 10000, 1, '2024-03-19 21:44:14', '2024-03-19 21:44:38', '20240320005', '', '', ''),
(62, NULL, 2, 335000, 0, 335000, 0, 1, '2024-03-20 13:03:32', '2024-03-20 13:20:10', '20240320006', '', '', ''),
(63, NULL, 1, 30000, 0, 30000, 50000, 1, '2024-03-20 13:25:21', '2024-03-20 13:32:05', '20240320007', 'Promosi', NULL, 'cash'),
(64, NULL, 1, 325000, 0, 325000, 0, 1, '2024-03-20 13:33:19', '2024-03-20 13:34:06', '20240320008', 'IG Likes', '3', 'qris'),
(65, NULL, 0, 0, 0, 0, 0, 1, '2024-03-20 13:34:56', '2024-03-20 13:34:56', '0', NULL, NULL, 'cash'),
(66, NULL, 1, 10000, 0, 10000, 10000, 1, '2024-03-20 13:58:36', '2024-03-20 13:59:08', '20240320010', 'IG Followers', '4', 'cash'),
(67, NULL, 1, 30000, 0, 30000, 40000, 1, '2024-03-21 11:28:33', '2024-03-21 11:28:48', '20240321002', 's', NULL, 'cash'),
(68, NULL, 1, 30000, 0, 30000, 70000, 1, '2024-03-23 13:38:26', '2024-03-23 13:39:40', '20240323002', NULL, NULL, 'cash'),
(69, NULL, 1, 10000, 0, 10000, 50000, 2, '2024-03-23 13:40:25', '2024-03-23 13:40:45', '20240323003', 'Promosi', NULL, 'cash'),
(70, NULL, 1, 10000, 0, 10000, 20000, 2, '2024-03-23 13:41:15', '2024-03-23 13:43:09', '20240323004', 'iyan', NULL, 'qris'),
(71, NULL, 0, 0, 0, 0, 0, 2, '2024-03-23 13:44:26', '2024-03-23 13:44:26', '0', NULL, NULL, 'cash');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `id_penjualan_detail` int(10) UNSIGNED NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `diskon` tinyint(4) NOT NULL DEFAULT 0,
  `subtotal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualan_detail`
--

INSERT INTO `penjualan_detail` (`id_penjualan_detail`, `id_penjualan`, `id_produk`, `harga_jual`, `jumlah`, `diskon`, `subtotal`, `created_at`, `updated_at`) VALUES
(2, 7, 1, 10000, 1, 0, 10000, '2024-03-13 18:38:44', '2024-03-13 18:38:44'),
(5, 9, 2, 30000, 1, 0, 30000, '2024-03-14 07:10:54', '2024-03-14 07:10:54'),
(6, 10, 1, 10000, 1, 0, 10000, '2024-03-14 07:12:41', '2024-03-16 08:33:31'),
(7, 12, 2, 30000, 2, 0, 60000, '2024-03-14 07:16:50', '2024-03-16 08:38:31'),
(8, 12, 1, 10000, 3, 0, 30000, '2024-03-14 07:16:58', '2024-03-16 08:38:31'),
(9, 15, 1, 10000, 1, 0, 10000, '2024-03-14 08:31:39', '2024-03-16 08:42:52'),
(12, 21, 1, 10000, 1, 0, 10000, '2024-03-14 08:46:53', '2024-03-14 08:46:53'),
(13, 24, 1, 10000, 1, 0, 10000, '2024-03-14 08:48:23', '2024-03-16 08:46:37'),
(14, 25, 2, 30000, 1, 0, 30000, '2024-03-14 08:48:55', '2024-03-14 08:48:55'),
(16, 27, 3, 500000, 2, 35, 650000, '2024-03-14 09:18:09', '2024-03-14 09:21:48'),
(17, 28, 3, 500000, 1, 0, 325000, '2024-03-14 09:23:42', '2024-03-14 09:23:55'),
(18, 30, 1, 10000, 1, 0, 10000, '2024-03-14 15:11:44', '2024-03-14 15:11:44'),
(19, 31, 1, 10000, 1, 0, 10000, '2024-03-14 15:13:25', '2024-03-14 15:13:25'),
(24, 2, 1, 10000, 1, 0, 10000, '2024-03-15 11:39:05', '2024-03-15 11:39:05'),
(26, 4, 2, 30000, 1, 0, 30000, '2024-03-15 11:45:55', '2024-03-15 11:45:55'),
(27, 5, 2, 30000, 1, 0, 30000, '2024-03-15 11:46:08', '2024-03-15 11:46:08'),
(28, 5, 1, 10000, 1, 0, 10000, '2024-03-15 11:46:10', '2024-03-15 11:46:10'),
(29, 6, 1, 10000, 1, 0, 10000, '2024-03-16 07:54:32', '2024-03-16 07:54:32'),
(33, 8, 1, 10000, 1, 0, 10000, '2024-03-16 08:32:03', '2024-03-16 08:32:03'),
(34, 9, 3, 500000, 1, 0, 325000, '2024-03-16 08:32:55', '2024-03-16 08:33:02'),
(35, 11, 3, 500000, 1, 0, 325000, '2024-03-16 08:33:57', '2024-03-16 08:34:04'),
(36, 11, 2, 30000, 1, 0, 30000, '2024-03-16 08:34:00', '2024-03-16 08:34:00'),
(38, 16, 3, 500000, 1, 0, 325000, '2024-03-16 08:43:26', '2024-03-16 08:43:32'),
(39, 17, 2, 30000, 1, 0, 30000, '2024-03-16 08:44:00', '2024-03-16 08:44:00'),
(40, 19, 3, 500000, 1, 0, 325000, '2024-03-16 08:44:56', '2024-03-16 08:45:03'),
(41, 20, 2, 30000, 1, 0, 30000, '2024-03-16 08:45:13', '2024-03-16 08:45:13'),
(42, 22, 2, 30000, 1, 0, 30000, '2024-03-16 08:45:50', '2024-03-16 08:45:50'),
(43, 23, 2, 30000, 3, 0, 90000, '2024-03-16 08:46:12', '2024-03-16 08:46:14'),
(44, 25, 3, 500000, 1, 0, 325000, '2024-03-16 08:46:48', '2024-03-16 08:46:54'),
(45, 26, 1, 10000, 1, 0, 10000, '2024-03-16 08:47:11', '2024-03-16 08:47:11'),
(46, 31, 3, 500000, 1, 0, 325000, '2024-03-16 08:48:57', '2024-03-16 08:49:10'),
(47, 32, 2, 30000, 1, 0, 30000, '2024-03-16 08:51:53', '2024-03-16 08:51:53'),
(48, 33, 1, 10000, 1, 0, 10000, '2024-03-16 08:57:28', '2024-03-16 08:57:28'),
(50, 34, 2, 30000, 1, 0, 30000, '2024-03-16 08:58:48', '2024-03-16 08:58:48'),
(51, 35, 3, 500000, 1, 0, 325000, '2024-03-16 08:59:02', '2024-03-16 08:59:08'),
(52, 36, 2, 30000, 1, 0, 30000, '2024-03-16 08:59:15', '2024-03-16 08:59:15'),
(53, 37, 2, 30000, 1, 0, 30000, '2024-03-16 08:59:43', '2024-03-16 08:59:43'),
(54, 38, 2, 30000, 1, 0, 30000, '2024-03-16 09:00:02', '2024-03-16 09:00:02'),
(55, 39, 3, 500000, 1, 0, 325000, '2024-03-16 09:00:23', '2024-03-16 09:00:32'),
(56, 40, 1, 10000, 1, 0, 10000, '2024-03-16 09:00:41', '2024-03-16 09:00:41'),
(57, 42, 3, 500000, 1, 0, 325000, '2024-03-16 09:01:20', '2024-03-16 09:01:26'),
(58, 43, 2, 30000, 1, 0, 30000, '2024-03-16 09:01:35', '2024-03-16 09:01:35'),
(59, 45, 1, 10000, 1, 0, 10000, '2024-03-17 02:38:52', '2024-03-17 02:38:52'),
(60, 46, 3, 500000, 1, 0, 325000, '2024-03-17 02:39:10', '2024-03-17 02:39:29'),
(61, 47, 1, 10000, 1, 0, 10000, '2024-03-19 12:18:41', '2024-03-19 12:18:41'),
(63, 48, 3, 500000, 1, 0, 325000, '2024-03-19 13:02:50', '2024-03-19 13:02:56'),
(64, 49, 1, 10000, 1, 0, 10000, '2024-03-19 13:03:20', '2024-03-19 13:03:20'),
(65, 50, 1, 10000, 1, 0, 10000, '2024-03-19 13:08:45', '2024-03-19 13:08:45'),
(66, 51, 2, 30000, 1, 0, 30000, '2024-03-19 13:13:53', '2024-03-19 13:13:53'),
(67, 53, 1, 10000, 1, 0, 10000, '2024-03-19 13:17:28', '2024-03-19 13:17:28'),
(68, 54, 1, 10000, 1, 0, 10000, '2024-03-19 13:20:34', '2024-03-19 13:20:34'),
(69, 55, 2, 30000, 1, 0, 30000, '2024-03-19 13:20:56', '2024-03-19 13:20:56'),
(70, 56, 2, 30000, 1, 0, 30000, '2024-03-19 13:28:38', '2024-03-19 13:28:38'),
(71, 57, 1, 10000, 1, 0, 10000, '2024-03-19 14:13:20', '2024-03-19 14:13:20'),
(72, 57, 3, 500000, 1, 0, 325000, '2024-03-19 14:17:13', '2024-03-19 14:17:29'),
(73, 58, 1, 10000, 1, 0, 10000, '2024-03-19 21:06:25', '2024-03-19 21:06:25'),
(74, 59, 2, 30000, 1, 0, 30000, '2024-03-19 21:13:58', '2024-03-19 21:13:58'),
(75, 60, 1, 10000, 1, 0, 10000, '2024-03-19 21:27:13', '2024-03-19 21:27:13'),
(76, 61, 1, 10000, 1, 0, 10000, '2024-03-19 21:44:32', '2024-03-19 21:44:32'),
(77, 62, 1, 10000, 1, 0, 10000, '2024-03-20 13:03:48', '2024-03-20 13:03:48'),
(78, 62, 3, 500000, 1, 0, 325000, '2024-03-20 13:04:24', '2024-03-20 13:20:10'),
(79, 63, 2, 30000, 1, 0, 30000, '2024-03-20 13:25:58', '2024-03-20 13:25:58'),
(80, 64, 3, 500000, 1, 0, 325000, '2024-03-20 13:33:25', '2024-03-20 13:34:06'),
(81, 66, 1, 10000, 1, 0, 10000, '2024-03-20 13:58:43', '2024-03-20 13:58:43'),
(82, 67, 2, 30000, 1, 0, 30000, '2024-03-21 11:28:37', '2024-03-21 11:28:37'),
(83, 68, 2, 30000, 1, 0, 30000, '2024-03-23 13:38:49', '2024-03-23 13:38:49'),
(84, 69, 1, 10000, 1, 0, 10000, '2024-03-23 13:40:31', '2024-03-23 13:40:31'),
(85, 70, 1, 10000, 1, 0, 10000, '2024-03-23 13:42:58', '2024-03-23 13:42:58');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(10) UNSIGNED NOT NULL,
  `id_kategori` int(10) UNSIGNED NOT NULL,
  `kode_produk` varchar(255) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `merk` varchar(255) DEFAULT NULL,
  `harga_beli` int(11) NOT NULL,
  `diskon` tinyint(4) NOT NULL DEFAULT 0,
  `harga_jual` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `kode_produk`, `nama_produk`, `merk`, `harga_beli`, `diskon`, `harga_jual`, `stok`, `created_at`, `updated_at`) VALUES
(1, 1, 'P000001', 'Paket 1 Jam Anak', 'Paket', 50000, 0, 10000, -32, '2024-03-13 18:14:27', '2024-03-23 13:43:09'),
(2, 2, 'P000002', 'Paket Full Day', 'Paket', 25000, 0, 30000, -27, '2024-03-14 07:10:27', '2024-03-23 13:39:40'),
(3, 2, 'P000003', 'Paket Full Day Meeting', 'Paket', 100000, 35, 500000, 81, '2024-03-14 09:17:54', '2024-03-20 13:34:06');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('lky2zMDPRqp77feFVwNGnHZYUwFUP8VyqUQcRutt', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiako1WFRXbDNSZXkwbjV6ZVUxYXlqUUlJWXhVdVpEWFhtWk5XM2YzWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90cmFuc2Frc2kiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkS0NyUjAwMWoyQ3VHNk9SYWVyT09PdVU5dWZRek1hZXFMQVZudWNrTzFiMDRaVVRjNnZtblciO3M6MTI6ImlkX3Blbmp1YWxhbiI7aTo3MTt9', 1711201767);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(10) UNSIGNED NOT NULL,
  `nama_perusahaan` varchar(255) NOT NULL,
  `alamat` text DEFAULT NULL,
  `telepon` varchar(255) NOT NULL,
  `tipe_nota` tinyint(4) NOT NULL,
  `diskon` smallint(6) NOT NULL DEFAULT 0,
  `path_logo` varchar(255) NOT NULL,
  `path_kartu_member` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id_setting`, `nama_perusahaan`, `alamat`, `telepon`, `tipe_nota`, `diskon`, `path_logo`, `path_kartu_member`, `created_at`, `updated_at`) VALUES
(1, 'Toko Ku', 'Jl. Kibandang Samaran Ds. Slangit', '081234779987', 1, 25, '/img/logo.png', '/img/member.png', NULL, '2024-03-14 07:12:08');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text DEFAULT NULL,
  `telepon` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama`, `alamat`, `telepon`, `created_at`, `updated_at`) VALUES
(1, 'Promosi', NULL, '23', '2024-03-16 08:34:46', '2024-03-16 08:34:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `foto`, `level`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@gmail.com', NULL, '$2y$10$V3Lk6W/HbImK5phjo.vhh.hajCERWH4H3g/v9SMJs3Nb0ihNOhm/2', '/img/user.jpg', 1, NULL, NULL, NULL, NULL, NULL, '2024-03-13 18:12:45', '2024-03-13 18:12:45'),
(2, 'Kasir 1', 'kasir1@gmail.com', NULL, '$2y$10$KCrR001j2CuG6ORaerOOOuU9ufQzMaeqLAVnuckO1b04ZUTc6vmnW', '/img/user.jpg', 2, NULL, NULL, NULL, NULL, NULL, '2024-03-13 18:12:45', '2024-03-13 18:12:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD UNIQUE KEY `kategori_nama_kategori_unique` (`nama_kategori`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`),
  ADD UNIQUE KEY `member_kode_member_unique` (`kode_member`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD PRIMARY KEY (`id_pembelian_detail`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indexes for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD PRIMARY KEY (`id_penjualan_detail`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD UNIQUE KEY `produk_nama_produk_unique` (`nama_produk`),
  ADD UNIQUE KEY `produk_kode_produk_unique` (`kode_produk`),
  ADD KEY `produk_id_kategori_foreign` (`id_kategori`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  MODIFY `id_pembelian_detail` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id_pengeluaran` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  MODIFY `id_penjualan_detail` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
