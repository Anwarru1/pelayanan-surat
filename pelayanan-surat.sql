-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20250526.403f5512ff
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 29, 2025 at 08:45 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pelayanan-surat`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('kepala desa','admin') NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$12$sWajKjPfbiJrLjchezLC0eccm8JHfjUQ7qcm5IfcCx2PxwYIvreq.', 'admin', NULL, NULL, '2025-06-23 04:34:14'),
(2, 'kepala desa', '$2y$12$82aucrMlrK8g5/h942lsy.PMipHtDuJkSDWBeW4oxzUBYmCa5IMaO', 'kepala desa', NULL, NULL, '2025-06-27 23:12:03');

-- --------------------------------------------------------

--
-- Table structure for table `berkas_surat`
--

CREATE TABLE `berkas_surat` (
  `id` bigint UNSIGNED NOT NULL,
  `pengajuan_surat_id` bigint UNSIGNED NOT NULL,
  `no_surat` varchar(255) NOT NULL,
  `tanda_tangan` varchar(255) DEFAULT NULL,
  `stempel` varchar(255) DEFAULT NULL,
  `tanggal_diajukan` date NOT NULL,
  `file_surat` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `berkas_surat`
--

INSERT INTO `berkas_surat` (`id`, `pengajuan_surat_id`, `no_surat`, `tanda_tangan`, `stempel`, `tanggal_diajukan`, `file_surat`, `created_at`, `updated_at`) VALUES
(3, 3, '500/564/VI/2025', NULL, NULL, '2025-06-22', 'generated/surat_3.pdf', '2025-06-22 10:03:20', '2025-06-22 10:03:25'),
(4, 4, '600/153/VI/2025', NULL, NULL, '2025-06-23', 'generated/surat_4.pdf', '2025-06-23 08:52:30', '2025-06-23 08:52:42'),
(5, 5, '600/345/VI/2025', NULL, NULL, '2025-06-24', 'generated/surat_5.pdf', '2025-06-24 04:02:47', '2025-06-24 04:02:59'),
(6, 6, '470/546/VI/2025', NULL, NULL, '2025-06-24', 'generated/surat_6.pdf', '2025-06-24 04:03:18', '2025-06-24 04:03:21'),
(7, 7, '470/435/VI/2025', NULL, NULL, '2025-06-24', 'generated/surat_7.pdf', '2025-06-24 04:03:35', '2025-06-24 04:03:39'),
(8, 8, '470/154/VI/2025', NULL, NULL, '2025-06-24', 'generated/surat_8.pdf', '2025-06-24 04:03:55', '2025-06-24 04:03:58'),
(12, 13, '600/125/VI/2025', NULL, NULL, '2025-06-25', 'generated/surat_13.pdf', '2025-06-25 00:02:17', '2025-06-25 00:02:36'),
(13, 14, '470/12/VI/2025', NULL, NULL, '2025-06-25', 'generated/surat_14.pdf', '2025-06-25 00:38:46', '2025-06-25 00:39:06'),
(16, 17, '600/76/VI/2025', NULL, NULL, '2025-06-25', 'generated/surat_17.pdf', '2025-06-25 00:52:49', '2025-06-25 00:52:54'),
(17, 18, '600/XXX/VI/2025', NULL, NULL, '2025-06-25', 'generated/surat_18.pdf', '2025-06-26 10:26:36', '2025-06-26 10:26:48'),
(18, 19, '350/234/VI/2025', NULL, NULL, '2025-06-26', 'generated/surat_19.pdf', '2025-06-26 10:56:28', '2025-06-26 10:56:31'),
(19, 20, '600/45/VI/2025', NULL, NULL, '2025-06-26', 'generated/surat_20.pdf', '2025-06-27 02:06:26', '2025-06-27 02:06:39');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_surat`
--

CREATE TABLE `jenis_surat` (
  `id` bigint UNSIGNED NOT NULL,
  `kode_surat` varchar(255) NOT NULL,
  `nama_jenis_surat` varchar(255) NOT NULL,
  `syarat` json NOT NULL,
  `template` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `keterangan_default` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jenis_surat`
--

INSERT INTO `jenis_surat` (`id`, `kode_surat`, `nama_jenis_surat`, `syarat`, `template`, `created_at`, `updated_at`, `keterangan_default`) VALUES
(1, '600', 'Surat Keterangan Kartu Kuning', '[\"Foto Copy KTP\"]', 'templates/UYNhmkHy3TUoll3aKlFcqEIl8MsQEShqQL0ziSnm.docx', NULL, '2025-06-29 01:32:53', NULL),
(2, '470', 'Surat Pengajuan Keringanan', '[\"Foto Copy KTP\", \"Surat Pengantar RT/RW\", \"Foto Copy KK\", \"keperluan\", \"keterangan\"]', 'templates/tigHKRvO4Zm8Kb49lV1zbC0CzWtTiczNn9KUpEFI.docx', NULL, '2025-06-25 00:55:22', 'Penghasilan Rp. 200.000,-'),
(3, '470', 'Surat Pengantar E-KTP', '[\"Foto Copy KK\", \"Foto Copy Akte Kelahiran\"]', 'templates/txoz72QDqFVkC5hdjmFVnoJ2Np6hMPUcc9zN6F1G.docx', NULL, '2025-06-25 00:55:40', NULL),
(4, '470', 'Surat Keterangan Status Perkawinan', '[\"Foto Copy KTP\", \"Foto Copy KK\", \"Keterangan\"]', 'templates/kedge3B1PM1UpvAQ8ZkMw5jTtja7sT3U1y7cyWJg.docx', NULL, '2025-06-25 00:56:14', 'dan Bahwa yang bersangkutan benar- \r\nbenar Warga Desa Wiramastra Kec. Bawang Kab. Banjarnegara yang berkelakuan baik.'),
(5, '500', 'Surat Keterangan Usaha', '[\"bidang_usaha\", \"jenis_usaha\", \"mulai_usaha\"]', 'templates/lLo0zPjyEBY2D9WvU3JPN8pdAXHICxD80E1dOekr.docx', '2025-06-22 08:19:50', '2025-06-25 00:56:59', NULL),
(6, '350', 'Surat Pengantar Kehilangan E-Ktp', '[\"Foto Copy KK\", \"keterangan\"]', 'templates/QQMiohwFTaPNXCTjzNAgziKvJkvaGjfMF6J1vqaU.docx', '2025-06-22 08:21:31', '2025-06-25 00:57:15', 'pada saat Perjalanan dari Wonosobo Sampai Wiramastra.');

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_laporan` varchar(255) NOT NULL,
  `berkas_surat_id` bigint UNSIGNED NOT NULL,
  `periode_awal` date NOT NULL,
  `periode_akhir` date NOT NULL,
  `file_laporan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_pengguna_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '2025_05_29_085240_create_jenis_surats_table', 1),
(4, '2025_05_29_085347_create_pengajuan_surats_table', 1),
(5, '2025_05_29_085401_create_berkas_surats_table', 1),
(6, '2025_05_29_085425_create_admin_table', 1),
(7, '2025_05_29_085436_create_laporans_table', 1),
(8, '2025_06_13_164123_create_sessions_table', 1),
(9, '2025_06_24_064518_create_pesan_pengguna', 2),
(10, '2025_06_24_073517_add_no_hp_to_pengguna_table', 3),
(11, '2025_06_24_073648_create_password_otps_table', 4),
(12, '2025_06_24_100227_add_keterangan_default_to_jenis_surat_table', 5),
(13, '2025_06_26_160850_add_balasan_to_pesan_pengguna_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_otp`
--

CREATE TABLE `password_otp` (
  `id` bigint UNSIGNED NOT NULL,
  `nomor_hp` varchar(255) NOT NULL,
  `otp_code` varchar(255) NOT NULL,
  `expired_at` timestamp NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `password_otp`
--

INSERT INTO `password_otp` (`id`, `nomor_hp`, `otp_code`, `expired_at`, `used`, `created_at`, `updated_at`) VALUES
(4, '082220770252', '699393', '2025-06-24 02:38:13', 0, '2025-06-24 02:28:13', '2025-06-24 02:28:13'),
(5, '082220770252', '304913', '2025-06-24 02:45:54', 0, '2025-06-24 02:35:54', '2025-06-24 02:35:54'),
(6, '082220770252', '990972', '2025-06-24 02:52:30', 1, '2025-06-24 02:42:30', '2025-06-24 02:46:57'),
(7, '082220770252', '415214', '2025-06-24 09:13:08', 1, '2025-06-24 09:03:08', '2025-06-24 09:03:24');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_surat`
--

CREATE TABLE `pengajuan_surat` (
  `id` bigint UNSIGNED NOT NULL,
  `jenis_surat_id` bigint UNSIGNED NOT NULL,
  `nama_jenis_surat` varchar(255) DEFAULT NULL,
  `pengguna_id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `data_tambahan` json NOT NULL,
  `nomor_urutan` int DEFAULT NULL,
  `status` enum('menunggu','diproses','diterima','ditolak') NOT NULL DEFAULT 'menunggu',
  `keterangan` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pengajuan_surat`
--

INSERT INTO `pengajuan_surat` (`id`, `jenis_surat_id`, `nama_jenis_surat`, `pengguna_id`, `nama`, `tanggal`, `data_tambahan`, `nomor_urutan`, `status`, `keterangan`, `created_at`, `updated_at`) VALUES
(3, 5, 'Surat Keterangan Usaha', 1, 'Budi Santoso', '2025-06-22', '\"{\\\"bidang_usaha\\\":\\\"Pertambangan\\\",\\\"jenis_usaha\\\":\\\"Cuci Pasir\\\",\\\"mulai_usaha\\\":\\\"2017\\\"}\"', 564, 'diterima', NULL, '2025-06-22 10:02:56', '2025-06-22 10:53:59'),
(4, 1, 'Surat Keterangan Kartu Kuning', 1, 'Budi Santoso', '2025-06-23', '\"{\\\"keperluan\\\":\\\"Pembuatan Kartu Kuning\\\",\\\"keterangan\\\":\\\"Yang bersangkutan benar-benar sedang berdomisili di Desa Wiramastra Kecamatan Bawang Kabupaten Banjarnegara\\\",\\\"Foto Copy KTP\\\":\\\"syarat-pengajuan\\\\/1750693858-Foto_Copy_KTP.jpg\\\"}\"', 153, 'diterima', NULL, '2025-06-23 08:50:58', '2025-06-23 09:25:32'),
(5, 1, 'Surat Keterangan Kartu Kuning', 1, 'Anwarru Romadon', '2025-06-24', '\"{\\\"Foto Copy KTP\\\":\\\"syarat-pengajuan\\\\/1750762776-Foto_Copy_KTP.jpg\\\"}\"', 345, 'diterima', NULL, '2025-06-24 03:59:36', '2025-06-24 04:10:13'),
(6, 2, 'Surat Pengajuan Keringanan', 1, 'Anwarru Romadon', '2025-06-24', '\"{\\\"keperluan\\\":\\\"Biaya Kuliah Reza Anang di Universitas Bina Sarana Informatika\\\",\\\"keterangan\\\":\\\"Penghasilan Rp. 200.000,-\\\",\\\"Foto Copy KTP\\\":\\\"syarat-pengajuan\\\\/1750762854-Foto_Copy_KTP.jpg\\\",\\\"Surat Pengantar RT\\\\/RW\\\":\\\"syarat-pengajuan\\\\/1750762854-Surat_Pengantar_RT_RW.jpg\\\",\\\"Foto Copy KK\\\":\\\"syarat-pengajuan\\\\/1750762854-Foto_Copy_KK.jpg\\\"}\"', 546, 'diterima', NULL, '2025-06-24 04:00:54', '2025-06-24 04:10:19'),
(7, 3, 'Surat Pengantar E-KTP', 1, 'Anwarru Romadon', '2025-06-24', '\"{\\\"Foto Copy KK\\\":\\\"syarat-pengajuan\\\\/1750762867-Foto_Copy_KK.jpg\\\",\\\"Foto Copy Akte Kelahiran\\\":\\\"syarat-pengajuan\\\\/1750762867-Foto_Copy_Akte_Kelahiran.jpg\\\"}\"', 435, 'diterima', NULL, '2025-06-24 04:01:07', '2025-06-24 04:10:21'),
(8, 4, 'Surat Keterangan Status Perkawinan', 1, 'Anwarru Romadon', '2025-06-24', '\"{\\\"Keterangan\\\":\\\"dan Bahwa yang bersangkutan benar- \\\\r\\\\nbenar Warga Desa Wiramastra Kec. Bawang Kab. Banjarnegara yang berkelakuan baik.\\\",\\\"Foto Copy KTP\\\":\\\"syarat-pengajuan\\\\/1750762902-Foto_Copy_KTP.jpg\\\",\\\"Foto Copy KK\\\":\\\"syarat-pengajuan\\\\/1750762902-Foto_Copy_KK.jpg\\\"}\"', 154, 'diterima', NULL, '2025-06-24 04:01:42', '2025-06-24 04:10:23'),
(9, 5, 'Surat Keterangan Usaha', 1, 'Anwarru Romadon', '2025-06-24', '\"{\\\"bidang_usaha\\\":\\\"Pertambangan\\\",\\\"jenis_usaha\\\":\\\"Cuci Pasir\\\",\\\"mulai_usaha\\\":\\\"2020\\\"}\"', 231, 'ditolak', 'nomor surat tidak terisi', '2025-06-24 04:02:05', '2025-06-24 04:29:28'),
(10, 6, 'Surat Pengantar Kehilangan E-Ktp', 1, 'Anwarru Romadon', '2025-06-24', '\"{\\\"keterangan\\\":\\\"pada saat Perjalanan dari Wonosobo Sampai Wiramastra.\\\",\\\"Foto Copy KK\\\":\\\"syarat-pengajuan\\\\/1750762939-Foto_Copy_KK.jpg\\\"}\"', 172, 'diproses', NULL, '2025-06-24 04:02:19', '2025-06-24 04:05:06'),
(11, 5, 'Surat Keterangan Usaha', 1, 'Anwarru Romadon', '2025-06-24', '\"{\\\"bidang_usaha\\\":\\\"Pertambangan\\\",\\\"jenis_usaha\\\":\\\"Cuci Pasir\\\",\\\"mulai_usaha\\\":\\\"2020\\\"}\"', 329, 'diproses', NULL, '2025-06-24 04:06:16', '2025-06-24 04:06:51'),
(12, 1, 'Surat Keterangan Kartu Kuning', 2, 'Budi Santoso', '2025-06-24', '\"{\\\"Foto Copy KTP\\\":\\\"syarat-pengajuan\\\\/1750777723-Foto_Copy_KTP.jpg\\\"}\"', 15, 'menunggu', NULL, '2025-06-24 08:08:43', '2025-06-25 00:26:43'),
(13, 1, 'Surat Keterangan Kartu Kuning', 1, 'Anwarru Romadon', '2025-06-25', '\"{\\\"Foto Copy KTP\\\":\\\"syarat-pengajuan\\\\/1750834911-Foto_Copy_KTP.jpg\\\"}\"', 125, 'diproses', NULL, '2025-06-25 00:01:51', '2025-06-25 00:02:17'),
(14, 3, 'Surat Pengantar E-KTP', 2, 'Budi Santoso', '2025-06-25', '\"{\\\"Foto Copy KK\\\":\\\"syarat-pengajuan\\\\/1750837095-Foto_Copy_KK.jpg\\\",\\\"Foto Copy Akte Kelahiran\\\":\\\"syarat-pengajuan\\\\/1750837095-Foto_Copy_Akte_Kelahiran.jpg\\\"}\"', 12, 'diterima', NULL, '2025-06-25 00:38:15', '2025-06-26 12:00:44'),
(15, 1, 'Surat Keterangan Kartu Kuning', 2, 'Budi Santoso', '2025-06-25', '\"{\\\"Foto Copy KTP\\\":\\\"syarat-pengajuan\\\\/1750837234-Foto_Copy_KTP.jpg\\\"}\"', 19, 'ditolak', 'isi yan bener', '2025-06-25 00:40:34', '2025-06-26 12:01:09'),
(16, 1, 'Surat Keterangan Kartu Kuning', 2, 'Budi Santoso', '2025-06-25', '\"{\\\"Foto Copy KTP\\\":\\\"syarat-pengajuan\\\\/1750837776-Foto_Copy_KTP.jpg\\\"}\"', 49, 'ditolak', 'isi apake', '2025-06-25 00:49:36', '2025-06-26 12:25:21'),
(17, 1, 'Surat Keterangan Kartu Kuning', 2, 'Budi Santoso', '2025-06-25', '\"{\\\"Foto Copy KTP\\\":\\\"syarat-pengajuan\\\\/1750837951-Foto_Copy_KTP.jpg\\\"}\"', 76, 'ditolak', 'pppp', '2025-06-25 00:52:31', '2025-06-26 12:29:51'),
(18, 1, 'Surat Keterangan Kartu Kuning', 2, 'Budi Santoso', '2025-06-25', '\"{\\\"Foto Copy KTP\\\":\\\"syarat-pengajuan\\\\/1750862993-Foto_Copy_KTP.jpg\\\"}\"', NULL, 'diproses', NULL, '2025-06-25 07:49:53', '2025-06-26 10:26:36'),
(19, 6, 'Surat Pengantar Kehilangan E-Ktp', 2, 'Budi Santoso', '2025-06-26', '\"{\\\"keterangan\\\":\\\"pada saat Perjalanan dari jakarta Sampai Wiramastra.\\\",\\\"Foto Copy KK\\\":\\\"syarat-pengajuan\\\\/1750959034-Foto_Copy_KK.jpg\\\"}\"', 234, 'diproses', NULL, '2025-06-26 10:30:34', '2025-06-26 10:56:28'),
(20, 1, 'Surat Keterangan Kartu Kuning', 2, 'Budi Santoso', '2025-06-26', '\"{\\\"Foto Copy KTP\\\":\\\"syarat-pengajuan\\\\/1750965815-Foto_Copy_KTP.jpg\\\"}\"', 45, 'diproses', NULL, '2025-06-26 12:23:35', '2025-06-27 02:06:26'),
(21, 1, 'Surat Keterangan Kartu Kuning', 1, 'Anwarru Romadon', '2025-06-27', '\"{\\\"Foto Copy KTP\\\":\\\"syarat-pengajuan\\\\/1751014165-Foto_Copy_KTP.jpg\\\"}\"', NULL, 'menunggu', NULL, '2025-06-27 01:49:26', '2025-06-27 01:49:26'),
(22, 1, 'Surat Keterangan Kartu Kuning', 1, 'ANWARRU ROMADON', '2025-06-29', '\"{\\\"Foto Copy KTP\\\":\\\"syarat-pengajuan\\\\/1751186043-Foto_Copy_KTP.jpg\\\"}\"', NULL, 'menunggu', NULL, '2025-06-29 01:34:03', '2025-06-29 01:34:03');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` bigint UNSIGNED NOT NULL,
  `nik` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `j_kel` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `agama` enum('Islam','Kristen','Katolik','Hindu','Buddha','Konghucu') NOT NULL,
  `status` enum('Kawin','Belum Kawin','Cerai Mati','Cerai Hidup') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pekerjaan` varchar(255) NOT NULL,
  `tmp_lahir` varchar(255) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nomor_hp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `nik`, `password`, `nama`, `j_kel`, `alamat`, `agama`, `status`, `pekerjaan`, `tmp_lahir`, `tgl_lahir`, `remember_token`, `created_at`, `updated_at`, `nomor_hp`) VALUES
(1, '3304051511030001', '$2y$12$7mlibNtHZrr28UQ6mNQz3e3n8kv8soVgPOhhZyVAATWCw1NBbeVRa', 'ANWARRU ROMADON', 'Laki-laki', 'Wiramastra RT 01/RW 01, Kec. Bawang', 'Islam', 'Belum Kawin', 'Mahasiswa', 'Banjarnegara', '2003-11-15', NULL, '2025-06-22 08:12:28', '2025-06-29 01:40:29', '082220770259'),
(2, '1234567890123456', '$2y$12$DLAX.jW.az3NhBJpfmbY5.For3WS/zSeqQSIkE6TAi8oObkhZ8CPy', 'Budi Santoso', 'Laki-laki', 'Purwokerto Selatan RT 01/RW 01', 'Islam', 'Kawin', 'Mahasiswa', 'Jakarta', '2000-02-14', NULL, '2025-06-24 08:06:39', '2025-06-28 01:45:08', '082220770255'),
(306, '3304051405890004', '$2y$12$i.Z5j63nv6O.Ij5TAJLypup8.mwBvXmNm3hp/3U45hFmXk9qW99Ja', 'SLAMET RIYADI', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1989-05-14', NULL, NULL, '2025-06-27 06:54:37', NULL),
(307, '3304054505860006', '$2y$12$Vgk.ZsaoFXvSG9S900e9o.w9gdKo0WgTcpOWQhXnHlBFNVBAcenv6', 'MURYATI', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1986-05-05', NULL, NULL, '2025-06-27 06:54:38', NULL),
(308, '3304051809850002', '$2y$12$nJXAVU.YPMBWajVEaNicwuSvz62qO3DzFjjptYfHv5zk1ZhS2cih6', 'KHOERIYAH', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Pelaut', 'Banjarnegara', '1985-06-17', NULL, NULL, '2025-06-27 06:54:38', NULL),
(309, '3304054211910002', '$2y$12$X4MFrNyJfwF3lk.5daw6ceaEsnrggt133KQXC79A3iZNirA7iNMfW', 'LISTIANI DWI NOVIYANTI', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Guru', 'Banjarnegara', '1991-11-02', NULL, NULL, '2025-06-27 06:54:38', NULL),
(311, '3304051710740003', '$2y$12$RpR0u.kbuYPj.WUBMxmu7eshvEqectnL.mOVeNX./25akk65XLToG', 'MISTAR ', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1974-10-17', NULL, NULL, '2025-06-27 06:54:39', NULL),
(312, '3304054607760010', '$2y$12$MFoZE6sZcJByrdzvyTzb4u4x8lZk1JmvU5GBm0Zdt4GBerCEcuaSO', 'SAMINI', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1976-07-06', NULL, NULL, '2025-06-27 06:54:39', NULL),
(313, '3304051604930004', '$2y$12$acnKaxP.GkPcNIIrAO135OYfZgMMOR5YK/xdqW1GSh2gZionpF9C6', 'MUARIFIN', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1993-04-16', NULL, NULL, '2025-06-27 06:54:39', NULL),
(314, '3304051808990003', '$2y$12$EWjb6kuOp4s9QPXQzIb34e2zgSAG95hP5niF7cMe7QxB096Jnt33.', 'IMAM MUSAFIIN', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1999-08-18', NULL, NULL, '2025-06-27 06:54:40', NULL),
(315, '3304050110750002', '$2y$12$4acjI86twRhGgf3S1fSR5eCWPWxK3HBH4ME4b9xonqy7UPviBt4gG', 'AHMAD TAHJUDIN', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Buruh', 'Banjarnegara', '1975-10-01', NULL, NULL, '2025-06-27 06:54:40', NULL),
(316, '3304054606810001', '$2y$12$vBqWr9p2bA0xeTS20tZ5QuGnoDe8/kqUrmQWBJzwYgQQrGgCNpYpW', 'DINI SUKMOWATI', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1981-06-06', NULL, NULL, '2025-06-27 06:54:40', NULL),
(317, '330405108820004', '$2y$12$Z92f5A8T/zXeit.2JnC.4.SQvNgCHVybRRCdUk5qaRf4SkR6Gjhky', 'HARIYANTI', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Tkw', 'Banjarnegara', '1982-08-11', NULL, NULL, '2025-06-27 06:54:41', NULL),
(318, '3304054907840005', '$2y$12$2cY0ruGPG8YS3Sk52b1P2eu6vd02Xd5X5tXQE5X3svIJRD37gvbGK', 'SETIYANI', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Cerai Mati', 'Tkw', 'Banjarnegara', '1984-07-09', NULL, NULL, '2025-06-27 06:54:41', NULL),
(319, '3304050807840003', '$2y$12$Qv5cKroN9nV512OPlvvK..kp0Ye2Ge8uJZS1mhHWfRnfng8BBmvYq', 'HERIYANTO', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Sopir', 'Banjarnegara', '1984-07-08', NULL, NULL, '2025-06-27 06:54:41', NULL),
(320, '3304056810900002', '$2y$12$O.Biz.SqXoXiMxMfLvA9EO4PLQrXdjdDjszav4TVQX1JUBRvZINSC', 'JARIYATUN', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1990-10-28', NULL, NULL, '2025-06-27 06:54:41', NULL),
(321, '3304050506880006', '$2y$12$KKPDgn6X.PWLeYjXSQpyEuzflMQMPH/FGDg90kaKsN0Ixgwz8ynB.', 'KAMSIDI', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1986-06-05', NULL, NULL, '2025-06-27 06:54:42', NULL),
(322, '3304051106920006', '$2y$12$fsUexfbvrVCjqG0ResCjo.yo5C2HvXsjqnRM7GbMz/O0IXm3T5eeG', 'TOHIRIN', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Buruh', 'Banjarnegara', '1992-06-11', NULL, NULL, '2025-06-27 06:54:42', NULL),
(323, '3304054306760002', '$2y$12$NHEGThPiZPmK3ysb2nSoJuVqPBXZpzHy9LEZzsGaQ3.grW201dXlW', 'SUWIYATI', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1976-06-03', NULL, NULL, '2025-06-27 06:54:42', NULL),
(324, '3304050706800004', '$2y$12$pfyYbVMLVKSmjv9FjuePCul0LDYe67oRgUDc10cTfLaVoP0DShlh6', 'SUSONO', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1980-06-07', NULL, NULL, '2025-06-27 06:54:43', NULL),
(325, '3304052907920002', '$2y$12$EoRuxZGwoGEFNBhh3.inE.RQz8tYXkpCQAOKoHTJVY/ILPP0mSVwy', 'ATAN DARMAWAN', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1992-07-29', NULL, NULL, '2025-06-27 06:54:43', NULL),
(326, '3304050812830001', '$2y$12$RpfGQfC.HIt9VI/H/UaODu4iuT/qiOg8ocA77kOFX6GtAoMx6xuxO', 'SAJIDIN', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1983-12-08', NULL, NULL, '2025-06-27 06:54:43', NULL),
(327, '3304050703950001', '$2y$12$GY1Ped.2SQe/2qRV4TfXcuPtYwUEpkzeM3Xkr33w4DWCn0UgAePrW', 'MUNZOFIR', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1995-03-07', NULL, NULL, '2025-06-27 06:54:44', NULL),
(328, '3304054905750001', '$2y$12$m.xfLpE/dr2Mdpvub5ITeOiH9pHYV1Q04jZZ1/Hf531LROay1kNlq', 'DARINAH', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1975-05-09', NULL, NULL, '2025-06-27 06:54:44', NULL),
(329, '3304050102960002', '$2y$12$DI5w5Wfy2/fhEVOAR.PrruJtHn/ET65bV4ynGEKejF9phY7BqAxCK', 'FAIJIN', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1996-02-01', NULL, NULL, '2025-06-27 06:54:44', NULL),
(330, '3304055011990002', '$2y$12$DxrFZX/ySl6LHVjq3CDzCeZ5LpC00JGEUTmBWK6esJOaW2g9okhby', 'HANI MA\'RUFAH', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1998-10-10', NULL, NULL, '2025-06-27 06:54:44', NULL),
(331, '3304052911820004', '$2y$12$2VeAMg/Z.sKJK52OpzA.yeZxITzbOo6cALkB1pPhDooGnkc/lKAJS', 'ALEK SUPRIANTO', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1982-11-29', NULL, NULL, '2025-06-27 06:54:45', NULL),
(332, '3304055806840008', '$2y$12$pYwLzgtdULSta/HdJmTbv.f1rPhQ4do69xclACmnLe4e8QP8TAo/a', 'JAMIYAH', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1984-06-18', NULL, NULL, '2025-06-27 06:54:45', NULL),
(333, '3304051905930004', '$2y$12$1VT5Ht8NMzky..TxdQGBF.pfEmpIa7XWtTtjwXSe77jjzntjXnZfK', 'ARI PRIYANTO', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1993-05-19', NULL, NULL, '2025-06-27 06:54:45', NULL),
(334, '3304054505940001', '$2y$12$PbNAtpUGUN9HXDQLElVySulD.Xm3AQEy50aAfUzRfEZwoPfHgnG3u', 'IFTAHUL KHOIROH', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Tkw', 'Banjarnegara', '1994-05-05', NULL, NULL, '2025-06-27 06:54:46', NULL),
(335, '3304051210820008', '$2y$12$Z.5NCjkboVxYhSEiybvVX.uH.2GKkx.nmvWpNkYDUvTtu7BCRwFGS', 'MUJIB', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Buruh', 'Banjarnegara', '1982-10-12', NULL, NULL, '2025-06-27 06:54:46', NULL),
(336, '3304056005860004', '$2y$12$/AynYFU8lXKm37dFOWj/r.HsPb5VIOmV7.RtLLLM4vE.P.SKpNAfy', 'ELSI SUSIATIL.K', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1987-03-17', NULL, NULL, '2025-06-27 06:54:46', NULL),
(337, '3304056505090001', '$2y$12$bY712EBoiUoRWKgsoZxAKuxPTWxYhUe1eOpmdMC.S/KDTeGZ/S646', 'WINDA FASIKHATUL.F', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2009-05-25', NULL, NULL, '2025-06-27 06:54:47', NULL),
(338, '3304050209840001', '$2y$12$ICo0u4ooZgmFrKzMEM/oX.3iXORbaMDD4AALpIbkLj3pqdR62/Gfq', 'ADIB', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Perangkat Desa', 'Banjarnegara', '1984-09-02', NULL, NULL, '2025-06-27 06:54:47', NULL),
(339, '3304055101880002', '$2y$12$w..RLlYWLTfSGgaIX8TKdOJ3uL9ZCjh3rovTq.0RzPgKlu/sTrM2i', 'ROFINGAH', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1988-01-11', NULL, NULL, '2025-06-27 06:54:47', NULL),
(340, '33040513332890001', '$2y$12$5Ujwkb7Cs8OY2PK7OVZVC.r9sk9qpJjBYeO3oEOajSLIN47Ov6ezG', 'UNIK SA\'FIIN', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1989-06-14', NULL, NULL, '2025-06-27 06:54:47', NULL),
(341, '3304050403910001', '$2y$12$jao7GlU4wfcCZ4TCUApBHux9JsVV15ZWC01Qsa5S/ZOR8j6ZwO8kq', 'ANAS', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1991-03-04', NULL, NULL, '2025-06-27 06:54:48', NULL),
(342, '3304051502930002', '$2y$12$f10XQBWbidITnq9N9p90BuZjq/UV3QcutI68s6dB4JAIzHAckvg5C', 'ULIN MUKTAMUN.N', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1993-02-15', NULL, NULL, '2025-06-27 06:54:48', NULL),
(343, '3304051407960001', '$2y$12$3lCPxeZ0FnRZhh2JXvhbj.ogfS1WIxAWraQQfeBVmfytC4xY9pFDu', 'MABRUR', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1995-12-15', NULL, NULL, '2025-06-27 06:54:48', NULL),
(344, '3304051009980001', '$2y$12$ilYKLrlch3.51U4SbziXyuAuCqHHiLlajubi7EZdoDvBNhv2lzTYq', 'M.ABDIL MINALLOH', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1997-07-09', NULL, NULL, '2025-06-27 06:54:49', NULL),
(345, '3304054104010002', '$2y$12$0BDVAhQPysbIZ74ciETqK.94VcmB.6LQYBF77BSPwVa7jpKAUcVEC', 'EVI RUKMANATUL.M', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2001-04-01', NULL, NULL, '2025-06-27 06:54:49', NULL),
(346, '3304055101030001', '$2y$12$HvmveAQIpi3uMJC.mBfR9O6fpqyan.ZI0CMW9m6jucO.JJH1OvouW', 'NOVA HIKBATULM', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2003-01-11', NULL, NULL, '2025-06-27 06:54:49', NULL),
(347, '3304055404980006', '$2y$12$bsqI.XsoHMdrwE3lSSGiOeIe9WqBpgRpijGX1NbWWBX/r9HrhPF5a', 'NAFINGAH', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1998-04-14', NULL, NULL, '2025-06-27 06:54:50', NULL),
(348, '3304052410000003', '$2y$12$35XrOzZajTjwY/tfkC1bAODv0sjpSVHyZLR5utkajGu8ziCYPpX3O', 'NGAFIFULOH', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '2000-10-24', NULL, NULL, '2025-06-27 06:54:50', NULL),
(349, '3304050411870004', '$2y$12$tZ2iSLd4xEOB/tkLSp.hAOjsx6M/6qq.Iu8pGk5gLXfXC0A/5WE/O', 'SLAMET RIYADI', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1987-11-04', NULL, NULL, '2025-06-27 06:54:50', NULL),
(350, '3304056207870001', '$2y$12$LygKYUM2UVR/.9lJIb8B9uj.tYbEsvxJ1bhRCZW219..GAblHsGCG', 'TASMINI', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1987-07-12', NULL, NULL, '2025-06-27 06:54:50', NULL),
(351, '3304051112890007', '$2y$12$MHkuUcYjYe1zgCIsf6Fir.hmjBCok.DpVa55O4nEViMTGkx0yNvem', 'ZAZULI', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1989-12-11', NULL, NULL, '2025-06-27 06:54:51', NULL),
(352, '3304055309980002', '$2y$12$h4C3PBVYkYuNWKkmxj4r6edVf2FxTZWhjVm3t3Mg7s88yQiUi/N5m', 'ANESTI UNAWA', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1998-09-13', NULL, NULL, '2025-06-27 06:54:51', NULL),
(353, '3304055906830004', '$2y$12$xmI2TXfzL5gD8c0kGB.XKuE.KYqgoXCbmk7jihJkusu7JDCuAyhv6', 'IFTIYAH', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1983-06-19', NULL, NULL, '2025-06-27 06:54:51', NULL),
(354, '3304054507920003', '$2y$12$wXWWPwj4mx7AI28pNKzYTOi1GW2tTh2RMCYUvhGhc4UBEQTYyuX2.', 'RONIYAH', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Cerai Mati', 'Irt', 'Banjarnegara', '1992-07-05', NULL, NULL, '2025-06-27 06:54:52', NULL),
(355, '3304050703740001', '$2y$12$UEhPnJJyguXjrRgqv8W37enNqIe48V56ItGKmZqk41lIffj8ItRmu', 'KAMILIN', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Guru', 'Banjarnegara', '1974-03-07', NULL, NULL, '2025-06-27 06:54:52', NULL),
(356, '3304055405800002', '$2y$12$cp7uj1nQhVzi7E9TtANMluFCpPZCgAq5UANtu18TsoPuO/2NEmi/u', 'HARTATI', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1980-05-14', NULL, NULL, '2025-06-27 06:54:52', NULL),
(357, '3304054212980001', '$2y$12$2Ky6PBTrGsZdYwpQHYMvIO5zYYhkz.k8GieCnNqn4T2Q0frOZfnsO', 'LULU MUKAROMAH', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1998-12-02', NULL, NULL, '2025-06-27 06:54:53', NULL),
(358, '3304051203760001', '$2y$12$BWraYC5MP8fAWdENq97o0ugfWCEzPQuqLTrw1D/TehkXgBeZ0f/Q.', 'WASIKIN', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1976-03-12', NULL, NULL, '2025-06-27 06:54:53', NULL),
(359, '3304055304790004', '$2y$12$pXN2N0.Uxgtv9ahOZAHqHeW2eT7z0FNX8Y0uq73jOyca.ZXCdo6OG', 'MUKODIMAH', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1979-04-13', NULL, NULL, '2025-06-27 06:54:53', NULL),
(360, '3304051201860001', '$2y$12$CtYsFa/xknaEK1YNt3pC2OLEprQyGj6imjguujnxCT.NT9eMqjrtu', 'TRIYANTA', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1986-01-12', NULL, NULL, '2025-06-27 06:54:54', NULL),
(361, '3304054801890002', '$2y$12$4ckhINM8k7zB1mUG0KWk7.gFjWhg7P2m2QbEIEGB82LqBoY0lrfo.', 'FITRIYAH', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1989-01-08', NULL, NULL, '2025-06-27 06:54:54', NULL),
(362, '3304055103770001', '$2y$12$aC1l.bZHlCUu0WHP034d9.5tdngzjTXS40TlIxHFDOBSJlbz8NDYe', 'TUMISAH', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1977-03-11', NULL, NULL, '2025-06-27 06:54:54', NULL),
(363, '3304050410010001', '$2y$12$6X6IqSuCTGmklIAuQPWiMe3Ma61MFEdDnJp2hyYn52h0pyrbU1DMa', 'HASANNUDIN', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2001-10-04', NULL, NULL, '2025-06-27 06:54:54', NULL),
(364, '3304131504880001', '$2y$12$/1W22/p8N6TOGTEnh2WsweVli9n2nGMNnbykqoU7511jRWqfrOGfG', 'PUJIONO', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Buruh', 'Banjarnegara', '1988-04-15', NULL, NULL, '2025-06-27 06:54:55', NULL),
(365, '3304056008950002', '$2y$12$BHv5QLYT3GLQZojOnN5cUOaolgJfS7bOW6Hfyj2LcECvasUURnkpO', 'KURSIAH', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1995-08-28', NULL, NULL, '2025-06-27 06:54:55', NULL),
(366, '6201060506820004', '$2y$12$.Titpj84dT/RltJUKHz.KeUT1MMm4Gj18ltgxLnYYC6BPFvHhK9Q.', 'WADIRIN', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Ustadz', 'Banjarnegara', '1982-06-05', NULL, NULL, '2025-06-27 06:54:55', NULL),
(367, '6201065512870002', '$2y$12$M30i9wvFn6yf0fPeZmcN/.rNhg6kwx5tZNSjQQaf35Fw8Bmcqtsri', 'RUWAIDAH HASANAH', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1987-12-15', NULL, NULL, '2025-06-27 06:54:56', NULL),
(368, '3304050203010004', '$2y$12$3BMoJJenJ99S/nuOvm5b5.sPohb1rdCGI1RP3pnZA72oyY6CF2wdm', 'KUSNI', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Belum Bekerja', 'Banjarnegara', '2001-03-02', NULL, NULL, '2025-06-27 06:54:56', NULL),
(369, '3304052710910001', '$2y$12$D7fKe5Hlsu/3S0zi3/ds3uvEpuPD7.T3mz51cGylXmgQVPZlbC8fW', 'RUDIN', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1991-10-27', NULL, NULL, '2025-06-27 06:54:56', NULL),
(370, '3304056307900005', '$2y$12$/MNpEkRaWfHRc0/tkuUmouY4t8554mm3On.BdnDDJByNqLKPrSeBK', 'IDAH KHAEROMAH', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1990-07-23', NULL, NULL, '2025-06-27 06:54:57', NULL),
(371, '33040501037080002', '$2y$12$RRoXIm5fcGhiyhQs/SvJc.Aii4TwioargVQcAxQz2K2IwcjIm9ENa', 'SUROTO', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Sragen', '1978-03-01', NULL, NULL, '2025-06-27 06:54:57', NULL),
(372, '3304056402830003', '$2y$12$WEsFsFNix/5iknXxHXx87.jcubvzdFpog2Y9OSmzz.8BtZWNv1YNO', 'SITI UMMAYAH', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1983-02-24', NULL, NULL, '2025-06-27 06:54:57', NULL),
(373, '3304053112770005', '$2y$12$JPl9sgjGhF2H1MMg/ep.w.KdkZA5/oNpefql03rZiE4JW7FGYF8/G', 'JUMALI', 'Laki-laki', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1977-12-31', NULL, NULL, '2025-06-27 06:54:58', NULL),
(374, '3304055202800002', '$2y$12$yjNZctNLkUkjMRUmwgIRnuBMcLd9mpK3tI4z/SArYlXms5K7gldfK', 'WATINAH', 'Perempuan', 'Wiramastra, RT 01/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1980-02-12', NULL, NULL, '2025-06-27 06:54:58', NULL),
(375, '3304051012730002', '$2y$12$6uPjVJAp5XT7dFbQPWFaiugOv35gEriL3Js6OShzZWlrrxJOVELHK', 'DISLAM', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Kariawan Swasta', 'Banjarnegara', '1973-12-10', NULL, NULL, '2025-06-27 06:54:58', NULL),
(376, '3304055006780009', '$2y$12$PVtXq6ByzTPuWaITqDNWyuvmX/uT6VotqTlOoC1CAWeY2ut9iJ5ye', 'MUFIDAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1978-06-10', NULL, NULL, '2025-06-27 06:54:59', NULL),
(377, '3304050707880003', '$2y$12$i1Wr0vnIUAe6R89/h5ZlrOHR1du8v7EcLqcPOemVDJI1lRWubQrkO', 'MUSARIF', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Kariawan Swasta', 'Banjarnegara', '1988-07-07', NULL, NULL, '2025-06-27 06:54:59', NULL),
(378, '3304055201000001', '$2y$12$FvRpOGcLKWOjqPamGrDHuuUOLn07kDwg5VvOCt5s9yTWyEVJ50Mxi', 'ANIS MARDIAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1999-09-01', NULL, NULL, '2025-06-27 06:55:00', NULL),
(379, '3304050305820001', '$2y$12$.fpUVXZTSIpxTPd0RFEabeKRBBvLdy8vICd8ZyvoqIdkwBramhFSi', 'ACHMAD SOLEH', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Kariawan Swasta', 'Banjarnegara', '1982-05-03', NULL, NULL, '2025-06-27 06:55:00', NULL),
(380, '3304051405940001', '$2y$12$Ypvl3hGAQwCgQd6PsonhNeZrtMAtIlfwq5Hwuxz2tsxNzPAxs3mP6', 'WASINGAN', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Kariawan Swasta', 'Banjarnegara', '1994-05-14', NULL, NULL, '2025-06-27 06:55:01', NULL),
(381, '3304052707910004', '$2y$12$Y9zqUYjK0dQ56QEooNyp6OR.s/sfS/1zBxQVaIyuCyKXyP6DeXhf.', 'WAHIDIN', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Kariawan Swasta', 'Banjarnegara', '1989-07-27', NULL, NULL, '2025-06-27 06:55:01', NULL),
(382, '3304057010890004', '$2y$12$JJPepKdElsmOC1TvJTuQfuCAmCNtL3rYz0D5iy2sZUaGKk2KJJ8gm', 'RODIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1989-10-30', NULL, NULL, '2025-06-27 06:55:02', NULL),
(383, '3304051708850001', '$2y$12$BT51rpDLKj2vhzgMiAsuU.tihKW64UgiP17.zk1XVKsZPaqrhHBIi', 'SUGENG', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Kariawan Swasta', 'Banjarnegara', '1985-07-01', NULL, NULL, '2025-06-27 06:55:02', NULL),
(384, '3304050103000004', '$2y$12$V33DTce0SttiNOmsBOYKruaxScFZIAIFgZyVpTk1kmEocJa1.uhju', 'SALMAN ALFARISI', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2000-03-01', NULL, NULL, '2025-06-27 06:55:03', NULL),
(385, '3304054507750001', '$2y$12$qsKsIg/HUY.gtwxvEWoWruIrLjJrgIeRw5k2AzCyIbF.ORZpXeB8W', 'SUTI', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1975-07-05', NULL, NULL, '2025-06-27 06:55:03', NULL),
(386, '3304056907010001', '$2y$12$N.1ASgHHvdPM/J/TfIOb/ulcTWpI8AJGqkYK21vfsccuRDign3YX.', 'SITI NURYANAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2001-07-29', NULL, NULL, '2025-06-27 06:55:04', NULL),
(387, '3304051905750010', '$2y$12$aapvBn56X5JANG/gz5ILfu/xJ/lHaD5OKNWHuXYPvxzEW0THDUheC', 'ROHMAT DWI PURNOMO', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Kariawan Swasta', 'Banjarnegara', '1975-05-19', NULL, NULL, '2025-06-27 06:55:05', NULL),
(388, '3304055905750003', '$2y$12$nzIT3/X/97.mhWaSBgsdp.u9MKYKkavs0vmpVOWWZYOPXMXVT7sVu', 'DAIMAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1975-05-19', NULL, NULL, '2025-06-27 06:55:05', NULL),
(389, '3304050507880005', '$2y$12$0mr.v0tWnM3N5G5yjz7q4egi/tkkYfSyH20.sNG79xQTyOFM37V9.', 'ROFIDIN', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Kariawan Swasta', 'Banjarnegara', '1988-07-05', NULL, NULL, '2025-06-27 06:55:05', NULL),
(390, '3304050107730008', '$2y$12$mxfIsQblrB5fVW6U2unqDOSREX/00HkSjYsndDN9yjICXrKvIyjp.', 'KASIR', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1973-07-01', NULL, NULL, '2025-06-27 06:55:06', NULL),
(391, '3304054107710060', '$2y$12$DDSt7yMUMAEvecaAoRbpVOYgdL0s5vBSPAZxJFqMuFaeP.oXOqTdW', 'TASRINGAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1971-07-01', NULL, NULL, '2025-06-27 06:55:06', NULL),
(392, '3304050605950001', '$2y$12$57KrowZDzp7LYoRwFl/EpOOmYZGLKWmcKAMPj.hh0YAvm9rnA4X4m', 'FAHRON', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Kariawan Swasta', 'Banjarnegara', '1995-05-06', NULL, NULL, '2025-06-27 06:55:06', NULL),
(393, '3304054108000003', '$2y$12$1H.QnjTCYEFK66Crht.OkuyR9pP3tomjeXVf0/0w87zQxwrMHV6rG', 'TIKA CAHYATI', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '2000-08-01', NULL, NULL, '2025-06-27 06:55:07', NULL),
(394, '3304052506890003', '$2y$12$sPrMgLtu8dXImy9dhQilzOycNoqMChkOETkHtBUvpFmd964MGQQ.e', 'KHAMIDUN', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Kariawan Swasta', 'Banjarnegara', '1989-06-25', NULL, NULL, '2025-06-27 06:55:07', NULL),
(395, '3304054107980030', '$2y$12$cU.699345wg4Mx4KzqmnbOdhhVGtMUx.O.nWUBh.c6MTwmybuIGbq', 'ISNIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Kariawan Swasta', 'Banjarnegara', '1998-07-01', NULL, NULL, '2025-06-27 06:55:07', NULL),
(396, '3304050903980001', '$2y$12$pHyLf6EuQcF2.oJFN0R2XOop1NQhnAH0XK.Y2UgCm7R1GpIxGE3Vy', 'AZIZI', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Kariawan Swasta', 'Banjarnegara', '1998-03-09', NULL, NULL, '2025-06-27 06:55:08', NULL),
(397, '3304112405800001', '$2y$12$uOHQkA.bglgAhiwZNK9./.Tz7CfwrXygSaLKGPYb1RbMxHgHKsw52', 'AZIZI FAROCHAN', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Kariawan Swasta', 'Banjarnegara', '1980-05-24', NULL, NULL, '2025-06-27 06:55:08', NULL),
(398, '3304055507880005', '$2y$12$MDVheBgfnFJVGUJLoYA4LOkb/l6xbSS8tegit6GtRXL/zHMvBz4w.', 'SITI PARTIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Kariawan Honorer', 'Banjarnegara', '1988-07-15', NULL, NULL, '2025-06-27 06:55:08', NULL),
(399, '3304050403920001', '$2y$12$QLWvrSHXHg/WocxmWlfm0eJKda7XovhWZhVgOjz8YgBe8SbLDT/Nu', 'SULAIMAN', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1992-04-07', NULL, NULL, '2025-06-27 06:55:09', NULL),
(400, '3304050510960001', '$2y$12$yPMeKVgZD6vRIeXzv1W0CuEqaL1AowTpdckEIsmbGcRN0VcHFx5la', 'SOFINGIN', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1996-11-05', NULL, NULL, '2025-06-27 06:55:09', NULL),
(401, '3304050102780003', '$2y$12$y0fZtUa/2Uj4lzZaD8JlHOa0viNNxmuVQGuUUi3hXDP2wsO46NCzi', 'DAHLAN', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1978-02-01', NULL, NULL, '2025-06-27 06:55:09', NULL),
(402, '3304054107730008', '$2y$12$/swMHN8ag2f73UfjmoaZA.XVidUEGBVw3Fr9i.vH4291IZAeF.p16', 'TARYATI', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1973-07-01', NULL, NULL, '2025-06-27 06:55:10', NULL),
(404, '3304055109810001', '$2y$12$3vSH7JINiNMDf1ToX7vEcuScXVvuNjl0CEnbnu.gDGgsOgsJY3GdK', 'PAWIT WIDIYANTI', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1981-09-11', NULL, NULL, '2025-06-27 06:55:10', NULL),
(405, '3304050101770005', '$2y$12$1sMZDJITEJj.vTNHUnwXxuSw7PQycxsx0pcJn617m/JLigTPMJFxW', 'SARNO', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan Swasta', 'Banjarnegara', '1977-01-01', NULL, NULL, '2025-06-27 06:55:10', NULL),
(406, '3304056404790003', '$2y$12$r5Hm91bxq.zqIg7AlPxGQenlF3OvT3HZT5mYxtx5XneKlOTicV/Zu', 'SITI ROCHMAWATI', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1979-04-24', NULL, NULL, '2025-06-27 06:55:11', NULL),
(407, '3304050101780008', '$2y$12$DNiG3ghYBD3qNWmceXwnNOxyIg2Jgih.Z1K7gFW8sE3OhHIIpjcsm', 'ROJIKON', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan Swasta', 'Banjarnegara', '1978-01-01', NULL, NULL, '2025-06-27 06:55:11', NULL),
(408, '3304056508800001', '$2y$12$dvxsDUuibsMaejQ3sRs07.9bx8uDluLxaYI8FcWUIL5e0sm3jCTyq', 'SITI NARYATI', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1980-08-25', NULL, NULL, '2025-06-27 06:55:11', NULL),
(409, '3304051005790002', '$2y$12$kjkY58M0TfIeXqw44WUrR.lmQ.wOhx8T6h1BGlfsHHfWokERxtGSm', 'SUGIMIN', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan Swasta', 'Banjarnegara', '1979-05-10', NULL, NULL, '2025-06-27 06:55:11', NULL),
(410, '3304054709830005', '$2y$12$.0GvHWz7c3H8D0iYoNbNke.kpHLVz5XUGRrL7k8ZfCbLaH9RTnrLC', 'MUIBAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1963-09-07', NULL, NULL, '2025-06-27 06:55:12', NULL),
(411, '3304055105780002', '$2y$12$OEv18GVxMk5WNuYprzw8POOdT912XOWQtuIusHcrQrILQWLSrS6sC', 'KHOSITIN', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Irt', 'Banjarnegara', '1978-05-11', NULL, NULL, '2025-06-27 06:55:12', NULL),
(412, '3304050604820007', '$2y$12$A.qLSOedoKgoMLN7MEnYgu2aaTHdootMQejoP2ReeBFrw758hHU6S', 'MUSODIKIN', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1982-04-06', NULL, NULL, '2025-06-27 06:55:12', NULL),
(413, '3304055510890002', '$2y$12$CmEeCLIXgoeXMDEj5r2Hye6m7OQyD5lz4ryHM5Xhrv.oBS/Vg6uPW', 'QONINGAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1989-10-15', NULL, NULL, '2025-06-27 06:55:13', NULL),
(414, '3304051707870002', '$2y$12$mO/f7EnKUpTvdLbQ0x1GtuUv2B83yG/nlzqlfNkaR1TtgajSWMbLu', 'DARTO', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan Swasta', 'Banjarnegara', '1987-07-17', NULL, NULL, '2025-06-27 06:55:13', NULL),
(415, '3304056105890004', '$2y$12$CcQP5tNmxmbus5RDyEKoZefKDCRiWkkERoAobWWE2ReoDBuhQMuk2', 'DZAKIROH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1989-05-21', NULL, NULL, '2025-06-27 06:55:13', NULL),
(416, '3304050704870002', '$2y$12$vxKg6flr.zMe/h/0pzhLJeztjP6CI4iopnaiHh3B7Ded4nV9f7Rby', 'QOSDI', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan Swasta', 'Banjarnegara', '1987-04-07', NULL, NULL, '2025-06-27 06:55:14', NULL),
(417, '3304054403890003', '$2y$12$9du5JDe/k8.1ABp3wJVa.OWoTpoRz6w2rAM0WzMgFvsZYvpq8rqsm', 'NASIROH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1989-03-04', NULL, NULL, '2025-06-27 06:55:14', NULL),
(418, '3304050807840005', '$2y$12$mLKxVg96kIMINgGtHCatKOd4Ke89kyK8ZsZuo1szSVOrsxD38I1ru', 'WAJIB', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan Swasta', 'Banjarnegara', '1984-07-08', NULL, NULL, '2025-06-27 06:55:14', NULL),
(419, '3304056703880001', '$2y$12$3UxtMvWEGvoSlR/7D8TAl.aXIaLUpjTXdG9ermrAt5ZjQftWRD/JW', 'WARTI', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1988-03-27', NULL, NULL, '2025-06-27 06:55:14', NULL),
(420, '3304052503830005', '$2y$12$Ua4P8ufd8cHgtShCFIy1E.w1oWcrF2CbxGnBLMyPK9TbBGAoH0I9i', 'HASIM', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan Swasta', 'Banjarnegara', '1983-03-25', NULL, NULL, '2025-06-27 06:55:15', NULL),
(421, '3304056511890001', '$2y$12$2KzyIyMetSaBXnn4XgIG4OejFVaZ2deFe6UDcFLyKAJxJKOrxjuou', 'MUNISAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1989-11-15', NULL, NULL, '2025-06-27 06:55:15', NULL),
(422, '3304056707830003', '$2y$12$ZO.6M4AINpgWXw73MddAD.ES9b1sRrASKiWTHMuyKLvAnxaZJJjtK', 'RUSMIYATI', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Irt', 'Banjarnegara', '1983-07-27', NULL, NULL, '2025-06-27 06:55:15', NULL),
(423, '3304055503990001', '$2y$12$fWpvIP9FPjPz4QK4mpfwgeiyTxNpu7I/yOZyFvAD7.AAUTnmh2dlq', 'EKA MUNAWAROH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Belum Bekerja', 'Banjarnegara', '1999-03-13', NULL, NULL, '2025-06-27 06:55:16', NULL),
(424, '3304055307010001', '$2y$12$NDB45zzvaIyh9Vk3.8ms1OLleGTV.JlGqamjt8U.Rqw.DXIuN5egy', 'IDA LAILATUL M.', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2001-07-13', NULL, NULL, '2025-06-27 06:55:16', NULL),
(425, '3304054911750002', '$2y$12$w0BlKuGHu12wUed69S0BX.VO3/3jH6I8rJ3VHQYWGGpiJbczDISlG', 'KAROMAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1975-11-09', NULL, NULL, '2025-06-27 06:55:16', NULL),
(426, '3304051608000001', '$2y$12$j406nMGuUoHUdSfdelAfV.QPBpxivSFpU01upuy9LIUBq6QIO0Wae', 'MIFTAHUL HAWAJIH', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2000-08-16', NULL, NULL, '2025-06-27 06:55:17', NULL),
(427, '3304050506900001', '$2y$12$R31IOe8XCHTMQC4qep5qfeuyHWbEccofzvXbuntPvtJs4jAJIXlGC', 'RAMLAN', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1990-06-05', NULL, NULL, '2025-06-27 06:55:17', NULL),
(428, '3304052310950002', '$2y$12$Wmpe/.6ZgbBYwkRa/NQjG.FE6MOlJNFPlpFYm3vOsgDJNjR5X1uCa', 'RADIMAN', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1995-10-23', NULL, NULL, '2025-06-27 06:55:17', NULL),
(429, '3304050104930004', '$2y$12$9MPP5YOP.r2EmYNO8U.KHeMZ02lvOrhk.h6IwVJ7vTDWigWtVQsB.', 'MUSTAHIK', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1993-04-01', NULL, NULL, '2025-06-27 06:55:17', NULL),
(430, '3304054107800027', '$2y$12$RO.6c9DCkOK8dV1Sjcf9GOE2YSoBt2E4/T5AyPlWnLVLhAPA.q7zK', 'RASMINI', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Irt', 'Banjarnegara', '1980-07-01', NULL, NULL, '2025-06-27 06:55:18', NULL),
(431, '3304051007820002', '$2y$12$/NP5b0YMwEVUC5CKrGja6eYdb90acWAlFIV4cByg38tengbYFfqd.', 'KODRI', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1982-07-10', NULL, NULL, '2025-06-27 06:55:18', NULL),
(432, '3304050107940014', '$2y$12$/xLIrQcV6Y42.nGEFWRK7eWDIHs.pao804ZxCG7Z0.DHJqwP6rFTa', 'SAPRIYANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1994-07-01', NULL, NULL, '2025-06-27 06:55:18', NULL),
(433, '3304050107970013', '$2y$12$Xzhika9MjiGZSpyVnMKvheu9FCvwIrZCdIKkBMnlinYd7Af32GyHS', 'ABDUL AZIZ', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1997-07-01', NULL, NULL, '2025-06-27 06:55:19', NULL),
(434, '3304055004730004', '$2y$12$sWld4ZTC6K81xqeOz5aImuKMjEb5kt0W6LSKvsTz0Yw1Tsn5pGhNW', 'DASIMAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1973-04-10', NULL, NULL, '2025-06-27 06:55:19', NULL),
(435, '3304050910940002', '$2y$12$q7mqw8pW2xqoquCTHTn7K.5Whznmzl.pa0QhvIQDv8XDPIfLlugb6', 'DWI HANDOKO', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1994-10-09', NULL, NULL, '2025-06-27 06:55:19', NULL),
(436, '3304050505750001', '$2y$12$CBkl.0R9wUFJhrVes8HCleGH5s96zNXRcp31DQgFw3oLhZ3q2ZUKG', 'IRFAN', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1975-05-05', NULL, NULL, '2025-06-27 06:55:20', NULL),
(437, '3304054310750001', '$2y$12$lS4AOwzB7P7Ix7BH.ARtq.DqaL/oTFf7xn.Lvp.V2NQT8M82JcoeG', 'SITI SUMIYATI', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1975-10-03', NULL, NULL, '2025-06-27 06:55:20', NULL),
(438, '3304054903730006', '$2y$12$3WQCfBJwabTjatM.ehy6duD..BWb9JCGC9rflKQjetwKd.o2Knn.m', 'MALIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1973-03-09', NULL, NULL, '2025-06-27 06:55:20', NULL),
(439, '3304050709780001', '$2y$12$s271e3udzd1UBtn3QAyVD.I48J/KJEPMI21tdu1R2eVDzGyi1tdnq', 'DAYA', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1978-09-07', NULL, NULL, '2025-06-27 06:55:20', NULL),
(440, '3304051803900004', '$2y$12$I6PCwU9w44IZXCCc1Nfcxudes/oxXNGe0s1V2T.bpJyCfljV8MI6i', 'KODIRON', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1990-03-18', NULL, NULL, '2025-06-27 06:55:21', NULL),
(441, '3304055811940003', '$2y$12$2dKAWgfuOK/a6yyRpR6z8eREPRgsIO.g7FJa9GVd8m702UMnWmtmW', 'KHOMISAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1994-11-18', NULL, NULL, '2025-06-27 06:55:21', NULL),
(442, '3304052411850002', '$2y$12$g1ztE4aIeMQBj6qbnuAZ7.3Or.P.LQ9c6iHj8/NvhTDCla5DcPVNW', 'AHMAD AHSIN', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan Swasta', 'Banjarnegara', '1985-11-24', NULL, NULL, '2025-06-27 06:55:21', NULL),
(443, '3304056207860002', '$2y$12$ZMKy3TKm2TdNld5eXdsSre.iQ8pLqDIdok9PhdvfIYS/Ntpc29cLi', 'NADIROH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1986-07-22', NULL, NULL, '2025-06-27 06:55:22', NULL),
(444, '3304050204770002', '$2y$12$SE5Y.6HyqwJKb3ai9Ocu9uKkBEZIScFZcB0p5pKMiZ1MkUoOuwe22', 'DULKARIM', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan Swasta', 'Banjarnegara', '1977-04-02', NULL, NULL, '2025-06-27 06:55:22', NULL),
(445, '3304054503830008', '$2y$12$NVRWR42eTKHYiAWZhndcAOgaoS5Z73F.yI6yZUHtcehHZ.PfUI9yq', 'SULIHAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1983-03-05', NULL, NULL, '2025-06-27 06:55:22', NULL),
(446, '3304055912010001', '$2y$12$wF.ISePFQV..9AtnZzd4oOWkQJzk6tQQaVunUmLmjGKgQUPJ70.j6', 'SELY FAJRIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2001-12-19', NULL, NULL, '2025-06-27 06:55:23', NULL),
(447, '3304055007770005', '$2y$12$/gNy9A6znb64Nq.hL.DykeOZ1mY81/.5F7zan9bzZwMOfgnDNGMoS', 'DARINAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1977-07-10', NULL, NULL, '2025-06-27 06:55:23', NULL),
(448, '3304055012000005', '$2y$12$P6omVVn72IkRFneSMzHg7uM1u5dTo74syzLNrQWtUhj.63pDcK8kS', 'SAROFAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2000-12-06', NULL, NULL, '2025-06-27 06:55:23', NULL),
(449, '3304050509950003', '$2y$12$0/TXsVaPPmuMnxP2BvPVS.Z3ZS1D7tDR/tEMn78KxNv1RCOOA5KFe', 'RIZKI SEPTO ADI', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Mahasiswa', 'Banjarnegara', '1995-09-05', NULL, NULL, '2025-06-27 06:55:23', NULL),
(450, '3304050509950004', '$2y$12$3hLkWNBXS2.kHTYLghCol.Mv1nUTBVbHmXH2VD7N/F766MIhXsfXq', 'RIZKA SEPTO ANA', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Mahasiswa', 'Banjarnegara', '1995-09-05', NULL, NULL, '2025-06-27 06:55:24', NULL),
(451, '3304051811730002', '$2y$12$PzIfTIFG5XNuJjVP6.iDx./IP8Evw02CdGOiG7pF7aQ0xcPzMsU82', 'ABIDIN', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Sopir', 'Banjarnegara', '1973-11-18', NULL, NULL, '2025-06-27 06:55:24', NULL),
(452, '3304056009790004', '$2y$12$dy5To/CRzKMxh/EXyTFTPeqk4B7UE8aPM1z9TT4VZuxf4oU3vDB6m', 'JUNTIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1979-09-20', NULL, NULL, '2025-06-27 06:55:24', NULL),
(453, '3304055607950005', '$2y$12$Ihw2KadUhQYsfU89..U8outegRifW7cKMo9./U3rJyP1qz0eEgtWS', 'TITI WIDIYANTI', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1995-07-16', NULL, NULL, '2025-06-27 06:55:25', NULL),
(454, '3304055609980001', '$2y$12$0Dbty8k3wDxX9EE1Ua38a.4OU3JbquadhUhNun4WDeUCXuCAjb3Vq', 'ROFINGATUN KHASANAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1998-09-16', NULL, NULL, '2025-06-27 06:55:25', NULL),
(455, '3304056005730002', '$2y$12$Y66wjPJQV7YVMl4SDvfkiuqy0R4ARHqPW9MQddRRiKzUGZF3kHhVu', 'NADIROH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1976-05-20', NULL, NULL, '2025-06-27 06:55:25', NULL),
(456, '3304042610920005', '$2y$12$VYm7dVbpdRVyF2SyqgeHZeh6.xCXoQujR.tegdAyV6Mtm7eR70HPS', 'FENDI RIFAI', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan Swasta', 'Banjarnegara', '1992-10-26', NULL, NULL, '2025-06-27 06:55:26', NULL),
(457, '3304055906940003', '$2y$12$jGjkkFdxl9jqvAgvbkshhO9y13YZFDUrRxPEDthkPj.llfCGKslaa', 'WIWIT RUIDAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1994-06-19', NULL, NULL, '2025-06-27 06:55:26', NULL),
(458, '3304051105830004', '$2y$12$r672JxtUiAsjfWgKQPh68u7VGIS86TB.KpGy29bwY1hu8euCl9gUy', 'IBROHIM', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1987-05-11', NULL, NULL, '2025-06-27 06:55:26', NULL),
(459, '3304051007950001', '$2y$12$jyHo5xndcdTbQR3rUPUeCenEwzMRCzmEDeTKeeA.7ZMhAvbo8aW7m', 'ISKHAK', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1995-07-10', NULL, NULL, '2025-06-27 06:55:26', NULL),
(460, '3304052808830001', '$2y$12$3EZZ5FQadQiuLS5o/k0xD.Nef9Y9rrakvi2mVhat4rY.VgPjjSjqC', 'SALIMAN', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1983-08-28', NULL, NULL, '2025-06-27 06:55:27', NULL),
(461, '3304050801960002', '$2y$12$m2b2z5yN//qoJ.t7Uncyee2clP/LjCAOky4lp8xa0ryBht8f63Ct6', 'MOHAMAD JAZIL', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1996-01-08', NULL, NULL, '2025-06-27 06:55:27', NULL),
(462, '330405071080010', '$2y$12$BwFNet4rt7lDW0BqCrk1BekbXxaWFELCc7RT3OlR0w0iKWxyTinKW', 'KABUL SEDYATMOKO', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Pekerja Lainnya', 'Banjarnegara', '1978-10-07', NULL, NULL, '2025-06-27 06:55:27', NULL),
(463, '3304054305800008', '$2y$12$/hKLZfm1P7Mxi4JMtQ96GO3mdA5LLdcJkVRIl9MteVTkRspN8MEsC', 'UNIK MEILIN T.', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Bidan', 'Banjarnegara', '1980-05-03', NULL, NULL, '2025-06-27 06:55:28', NULL),
(464, '3304050104920006', '$2y$12$vkRg3tYffdLKGVr4Aaj6juGbJfNDXo4MzZxz0GZbpNo3iLQsvyWDS', 'RIYANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1992-04-01', NULL, NULL, '2025-06-27 06:55:28', NULL),
(465, '3304051510980004', '$2y$12$GQo5oRCgnCMiNgLoa53dvOFzI/NynSFmpePc0TwXUT3.QBw2smhBC', 'NUR ROHIM', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan Swasta', 'Banjarnegara', '1998-10-15', NULL, NULL, '2025-06-27 06:55:28', NULL),
(466, '3304056308940002', '$2y$12$AgJWB1GDEv.cu.e199vWAOu5TEXTGxq7lb4pDsj/R/FmcBxH4hXO.', 'SITI RUKOYAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1994-08-23', NULL, NULL, '2025-06-27 06:55:28', NULL),
(467, '3304052811820001', '$2y$12$dxuJ0q.7Aja3y/lkY9MKgOKEUhEFESopaCu5uDk0C9zDMrDUqP6qK', 'URIP SUPRIYANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1982-11-28', NULL, NULL, '2025-06-27 06:55:29', NULL),
(468, '3304054210890002', '$2y$12$4ZWxANO8KuY8nIUw8DinlO6vmYK0.O5/XBTZXpTUxBA2dC7aCCHM.', 'MUALIFAH', 'Perempuan', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1989-10-02', NULL, NULL, '2025-06-27 06:55:29', NULL),
(469, '3304052605930001', '$2y$12$9a88bJJd.uwfilOlwXCGuOzf4YcfzeS639m3X3TXV7Xtzi0WZKixK', 'SYAMSUL ANWAR', 'Laki-laki', 'Wiramastra, RT 02/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan Swasta', 'Banjarnegara', '1993-05-26', NULL, NULL, '2025-06-27 06:55:29', NULL),
(470, '3304054710750001', '$2y$12$AhxhllKCuljTCFATLvWtv.ip1EcBtcN8rxByolXWLlRRh2.Ceolqa', 'JUMIRAH', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1975-10-07', NULL, NULL, '2025-06-27 06:55:30', NULL),
(471, '3304050107970003', '$2y$12$pXZO9sHlnl0NYBfb9CZuM.nOU4QhMQgC1kyFsqsq2wpsO5Q9Yh/ke', 'EDI SUPRIONO', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1997-07-01', NULL, NULL, '2025-06-27 06:55:30', NULL),
(472, '3304051612020001', '$2y$12$jA88w.mkQ2OVBZKL7acZZ.w2r0rt23JvdrojNg9LFK.LLowIvXaU.', 'WAHYU HIDAYAT', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '2002-12-16', NULL, NULL, '2025-06-27 06:55:30', NULL),
(473, '3304051107820006', '$2y$12$JNWJTOTSVDAXdfwgJXbU2u9LlCbrBJnYATa7yS6B28TvwPkaoz/Me', 'MUHTAR AMINULLOH', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1982-07-11', NULL, NULL, '2025-06-27 06:55:31', NULL),
(474, '3304054107860057', '$2y$12$09LEwpkDX2P6L9y.Da43f.BEFD9SpKIbnsTopyno8NKWSi2T15lN6', 'MURNIATI', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1986-07-01', NULL, NULL, '2025-06-27 06:55:31', NULL),
(475, '3304052001730003', '$2y$12$wlmBUswrjnvEYDQnQeqxDujeUE44lm3qTd3uPtHgHXdUBrNlaWA2O', 'NUR BAHRUL AMIN', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1973-01-20', NULL, NULL, '2025-06-27 06:55:31', NULL),
(476, '3304056407730001', '$2y$12$Hn/nVM9B42IuCooL8gHb7u3Ur676sM5mmNlk90yeTkbl.Mqk2JrDG', 'MUINAH', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1973-07-24', NULL, NULL, '2025-06-27 06:55:31', NULL),
(477, '3304050708940002', '$2y$12$NCjkik41Yxadg/vkJPAkHuaUpc2HWcHE787Xld/.iuePVV9RmmCPa', 'MIFTAHUDIN', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1994-08-07', NULL, NULL, '2025-06-27 06:55:32', NULL),
(478, '3304050104990001', '$2y$12$Eu5z3dX01CwjLfGyM2v96.avZUIz2ABGPnWd71/y.8IwYGjDFu.Mm', 'SALAM IKHFANULOH', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1999-04-01', NULL, NULL, '2025-06-27 06:55:32', NULL),
(479, '3304050911770001', '$2y$12$5aOVsv3T4grnzfTDdol69.GYcqSAYk9GoB4nXWByCy6ir67KUiC.m', 'DULAMIN', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1977-11-09', NULL, NULL, '2025-06-27 06:55:32', NULL),
(480, '3304055604840002', '$2y$12$Dvcc3UGBElN7Xnkk3L1XaO0moEuYpFOsFoYLe/q.Lpoa8/GwdZJCq', 'TUKIYEM', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1984-04-16', NULL, NULL, '2025-06-27 06:55:33', NULL),
(481, '3304057108000004', '$2y$12$aD.lpG47wbDaXZ16Tdy0keFj9F28f0tWp9OGPrB0An.SE3k/JOGOW', 'ELSI SITI N.', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '2000-08-31', NULL, NULL, '2025-06-27 06:55:33', NULL),
(482, '3304055011820012', '$2y$12$2vf.8IXG4cMYbLzCk9LfReb66HuRjxisHsHUiNw4yvxQgGPpQykGS', 'TARLIYAH', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Irt', 'Banjarnegara', '1982-11-10', NULL, NULL, '2025-06-27 06:55:33', NULL),
(483, '3304051312800003', '$2y$12$aXYWQe.aSa11P8MRaJMFEuKOxab3SNcBDSqg7Sa1ZMGr4IcxkUNNC', 'KAMALIN', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1980-12-13', NULL, NULL, '2025-06-27 06:55:34', NULL),
(484, '3304056109890002', '$2y$12$vZtHxbOOZ7LQpRhTWs2b7OW8.UAJ5qv6wFnTozsCf0Pi0r6ACCLUS', 'SUTINI', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1989-09-21', NULL, NULL, '2025-06-27 06:55:34', NULL),
(485, '3304051803760002', '$2y$12$ytfJ07nT70K6zkv3SxrBuuFbNrGIhOXMjT.T4enTxEGQTBVgZx9d2', 'DASNO', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1976-03-18', NULL, NULL, '2025-06-27 06:55:34', NULL),
(486, '3304054303820004', '$2y$12$/n8KwjFrghNiReSeo/Avg.3yUCzZWKHCCIHHuy09kkqjl.J.uGy8W', 'DIROH', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1982-03-03', NULL, NULL, '2025-06-27 06:55:35', NULL),
(487, '3304052207990004', '$2y$12$YoKSYrSjtyDpHApQaAkpK.3X78RbfYPhw6rNKTKTXW8QmW7MpwPka', 'JENAL ARIFIN', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1999-07-22', NULL, NULL, '2025-06-27 06:55:35', NULL),
(489, '3304051503870001', '$2y$12$egnCcCj4.PwfCrSFIzUeQ.DbewCqqfBGzSrRgg8ikOw52yJ60WDbC', 'MISNGAD', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1987-03-15', NULL, NULL, '2025-06-27 06:55:35', NULL),
(490, '3304051301940001', '$2y$12$qNrVVzGk9x3kYgXHzZjpxeCZ.lXcXGnx5hgSEThogPKz1.7YRiFVK', ' DARSAN', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1995-07-15', NULL, NULL, '2025-06-27 06:55:35', NULL),
(491, '3304204507970005', '$2y$12$Eug683YCj9ejy/4zlUvzVeKfXM/PVmGXfUd/dDp5TBJsSYGnlTBt2', 'SITI MAESAROH', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1997-07-05', NULL, NULL, '2025-06-27 06:55:36', NULL),
(492, '3304055005760002', '$2y$12$t/fMp6bi5tlHfpQDfarmROJH1v/Z/ysbUE7muVpCU1XBroJBvFSHK', 'RAMINI', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1976-05-10', NULL, NULL, '2025-06-27 06:55:36', NULL),
(493, '3304051707960001', '$2y$12$gcQ85dC0jOLEzcAvZ8f/X.UnRsgwrNXerzbLYZsQkqeygBep7KihK', 'MOHAMAD ASIF', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1996-07-17', NULL, NULL, '2025-06-27 06:55:36', NULL),
(494, '3304055703760005', '$2y$12$89L1W3r7n6NSCKZL8r4kyuQ1AUQLTMGjVUZR9HIUGE443DLVA9TOW', 'TARSINAH', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1976-03-17', NULL, NULL, '2025-06-27 06:55:37', NULL),
(495, '3304055404940001', '$2y$12$h/NvScb3B4LNLN8pRLyL9OhyWOLsAOlu5E3Dfa3qtTQ3PCN6kRj26', 'WAHYU NUR JANAH', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1994-04-14', NULL, NULL, '2025-06-27 06:55:37', NULL),
(496, '3304050302820001', '$2y$12$SH3EPn2n1O8IAB.qSVqNwuX6hCXAGajoUl5X/BQd6VUvkXWV8RVK2', 'PARMIN', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1982-02-03', NULL, NULL, '2025-06-27 06:55:37', NULL),
(497, '3304054302840001', '$2y$12$bE/V4b1Pm8/S//gJV6UlB.lDvwuvQ6sAaLrUWxuT.DVkrUDms70zC', 'SOFIJAH', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1984-02-03', NULL, NULL, '2025-06-27 06:55:37', NULL),
(498, '3304051308930002', '$2y$12$cgK9qYD5YgBcU6.qcKariubxtSV.tbkgJcr6d4uVEHyBesT6whgme', 'MUSLIM SIDIK', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1993-08-13', NULL, NULL, '2025-06-27 06:55:38', NULL),
(499, '3304044311950001', '$2y$12$15ntJg4DBZcDYtFiiqw5J.64mLTiCaEiY91nE/YYd.DW1WB2tCNCy', 'NOFA SULISTIANI', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1996-11-03', NULL, NULL, '2025-06-27 06:55:38', NULL);
INSERT INTO `pengguna` (`id`, `nik`, `password`, `nama`, `j_kel`, `alamat`, `agama`, `status`, `pekerjaan`, `tmp_lahir`, `tgl_lahir`, `remember_token`, `created_at`, `updated_at`, `nomor_hp`) VALUES
(500, '330405501750001', '$2y$12$2/jPn1nsKvMqIPuSvlu5K.WmMTdFtUh6Y3oonAbanY8xltG/1jH.K', 'RASIYEM', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1975-01-15', NULL, NULL, '2025-06-27 06:55:38', NULL),
(501, '3304051205970003', '$2y$12$l6795FKooLq0OOwvnRLW6OyZ.zv5B0IWxZ5fevKXkIEPgFHH5B1kq', 'SURATNO', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1997-05-12', NULL, NULL, '2025-06-27 06:55:39', NULL),
(502, '3304056507050003', '$2y$12$HLMA9j5tTkorj5yHliv1UeIdL5wdpTWbzTPnOfzkF6wdbJIiop.zW', 'YOSSIKA ELSA W', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2005-07-25', NULL, NULL, '2025-06-27 06:55:39', NULL),
(503, '3304055213820001', '$2y$12$fuVrWfBVHrFPFiVonc8s6.AsG0hjsBk6QHWEHO8xn2eyAb.xYds9y', 'SITI MUNJIATUN', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Wiraswasta', 'Banjarnegara', '1982-12-12', NULL, NULL, '2025-06-27 06:55:39', NULL),
(504, '3304050606910003', '$2y$12$Lf6ChaEwzbS9ag/DFrZqm.nC.H0Bhv4Md.R5zdIkWf.FtgDGPHrmS', 'ROIDIN', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Buruh', 'Banjarnegara', '1991-06-06', NULL, NULL, '2025-06-27 06:55:40', NULL),
(505, '3304051611010001', '$2y$12$pzBRtpsOYzl0cSUClln6nu.XNgeJcn64nW8imDOD4rsi0epsLHb1q', 'JODI PRAYOGA', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2001-11-16', NULL, NULL, '2025-06-27 06:55:40', NULL),
(506, '3304050603830001', '$2y$12$WGQUz5CHLCaHbk3ulOZCYegdmD4SrZEBBTnSF3/DXo9aLRkm42uSu', 'SUKIRNO', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1982-03-06', NULL, NULL, '2025-06-27 06:55:40', NULL),
(507, '3304057003880001', '$2y$12$e1w3FOqs0/7wWIdounfiyu7BuvpU/vZZceVqQex33hZlUJCm/D.0O', 'SULIS ERNAWATI', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1988-03-30', NULL, NULL, '2025-06-27 06:55:40', NULL),
(508, '3304055910750001', '$2y$12$8PU.fRyvrWeh36BMvMViGOvfiblVqD06AplGjQKKryqEv9X3sYdj2', 'SOLIMAH', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1975-10-19', NULL, NULL, '2025-06-27 06:55:41', NULL),
(509, '3304051105870003', '$2y$12$wxQSUoBTPU52inKF1RPB8uUPz1HAj/abARDVBwW85cm5DEMKngzBm', 'JOHI SAPUTRA', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1987-05-11', NULL, NULL, '2025-06-27 06:55:41', NULL),
(510, '3304055004910001', '$2y$12$hH/jkdCGeY/74MW6ZP5lN.wDgQwf4PtWRmSkNJqQn17au1YsYY9WW', 'ERNI SUSANTI', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Wiraswasta', 'Banjarnegara', '1991-04-10', NULL, NULL, '2025-06-27 06:55:41', NULL),
(511, '3304055411000002', '$2y$12$btD7bX8F8hg2LuUcWpugt.s6.VHSxuBNLBjn2whX2n4lBbJP.7eo.', 'NOVA SAGITA SARI', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '2000-11-14', NULL, NULL, '2025-06-27 06:55:42', NULL),
(512, '3304052202920001', '$2y$12$mlmszTNom5p9FW0nzOfeS.49UAXgg/89LwQrD4OD61GEkQIyDumqu', 'AFANDI', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1992-02-22', NULL, NULL, '2025-06-27 06:55:42', NULL),
(513, '3325114505890006', '$2y$12$QlJV9N8xmmSAgvAMB.Q2Ee3JxiX36UBZjWBTU17LX3iFYmQ/X92kq', 'SRI MELATI', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Batang', '1989-05-05', NULL, NULL, '2025-06-27 06:55:42', NULL),
(514, '3304051409760001', '$2y$12$uRF9HRWErbxyE8OmyAREbOeyBZqsZL7PGsyOb4Vgb.XfzjHGUGKJi', 'SAPTO GUNTORO', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Buruh', 'Banjarnegara', '1976-09-14', NULL, NULL, '2025-06-27 06:55:43', NULL),
(515, '3304054808790005', '$2y$12$49q4e2u7lWpAdjXCZBwV/ukNRx2nHnn61agq5Xml7GyB3UMZTnAOm', 'SARIPAH', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1979-08-08', NULL, NULL, '2025-06-27 06:55:43', NULL),
(516, '3304054201870001', '$2y$12$IRMoM0HNcAjrvqCA7aHmfeNywOGqoZbuv9W6MKMeu4Od55COA3GmO', 'RODIYAH', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1987-01-02', NULL, NULL, '2025-06-27 06:55:43', NULL),
(517, '3304054310010002', '$2y$12$doQR1YpfwY3.hNL2078wAOqLWOgVisHxeecfNLVNN58PcqXaT/sOy', 'RIANTI', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2001-10-03', NULL, NULL, '2025-06-27 06:55:44', NULL),
(518, '6408080901740001', '$2y$12$JOvQGWwu2PMP1gSgQBpjVeWEuDKhFUH2/clvUTeht1bzsT8uNiXvK', 'AHMAD MUJIONO S', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1974-01-09', NULL, NULL, '2025-06-27 06:55:44', NULL),
(519, '6408084512780001', '$2y$12$b28CR9FIzQ3J219QY4WIjub/7zzbn4d35Vac1a5Cjcz2poCPdVy4W', 'MUJIONO MUJIATI', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1978-12-05', NULL, NULL, '2025-06-27 06:55:44', NULL),
(520, '3304050107910034', '$2y$12$LKUbRiVBubMAgLZJv8/kROpCcZahKcFsZ5LysrBiGGSGHyF.S8uTq', 'SUDIR PUJIANTO', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Wiraswasta', 'Banjarnegara', '1990-05-03', NULL, NULL, '2025-06-27 06:55:44', NULL),
(521, '3304052206860003', '$2y$12$/UXUsZ/S9DJZyxdyjtNq.egAjJ7p3ieAc5zEDBGQAX8XAX7d0a8/2', 'WAJIDIN', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1986-06-22', NULL, NULL, '2025-06-27 06:55:45', NULL),
(522, '3304054909920001', '$2y$12$TMskYXlXKwJ8Q1d7Y5HRQuPUZWrMygs2n.W7pqCQ/rGUnTFISlO.2', 'WAGINI', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1992-09-09', NULL, NULL, '2025-06-27 06:55:45', NULL),
(523, '3304054101810002', '$2y$12$dBuBpCYNyTyUlKn/RT.OEOpeI9CL/7dJ7PvwK4I6Y1VMZKTWHwy2K', 'RUSMINAH', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1981-01-01', NULL, NULL, '2025-06-27 06:55:45', NULL),
(524, '3304116804850004', '$2y$12$FeQG67br3LnfA0cmM8bzY.60MFWofxmJJft8MbrOcd6ImkWKX.VYy', 'MUSRINGAH', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1985-04-28', NULL, NULL, '2025-06-27 06:55:46', NULL),
(525, '3304050209830002', '$2y$12$TxuNK2hY08bo6mBgb98ymOlTeRhJp61sziO/h4m3hm.Nrn04yU2FO', 'ROHAYAT', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1983-09-02', NULL, NULL, '2025-06-27 06:55:46', NULL),
(526, '3304051211930004', '$2y$12$/Sv4Hu0aUdXfhHZKswyHzuZaonJLM36DDItU5wDqUZfrlIrGsRp06', 'KHOERUL ANAM', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1993-11-12', NULL, NULL, '2025-06-27 06:55:46', NULL),
(527, '3304050205980001', '$2y$12$Xmz7AY2ZLNwYjPcTAcER8uz8ByoxoZrLbiKdgGa06Kfw6agtKH/wi', 'MAESUR SINDIQ', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1998-05-02', NULL, NULL, '2025-06-27 06:55:47', NULL),
(528, '3304052908810001', '$2y$12$ljUFPj87HwTEJNswqnBTi.jt1jDaVezHREAjzJCGm0onHWSWyOd26', 'WAHIDIN SUWARNO', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1981-08-29', NULL, NULL, '2025-06-27 06:55:47', NULL),
(529, '3304052905950003', '$2y$12$pxeNU2BDI3Tq6XRP6LHsW.Ko3Tem7crfRGOA4Yrexvx9loz2ZmDGa', 'AKHMAD SUKIRMAN', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1995-05-29', NULL, NULL, '2025-06-27 06:55:47', NULL),
(530, '3304051802820004', '$2y$12$n3lbt47o.VvmESyyYI4drOiUgclQekDSSuNtLl9JxAiHghOLXAmW.', 'SAMSUL HASAN', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1982-02-18', NULL, NULL, '2025-06-27 06:55:47', NULL),
(531, '3304052712930005', '$2y$12$P2RRCSVS0Y.ux2Vuttgd/OiFGU2.WRnEu8hrdAdiE7Dktg8X1HA2m', 'BADRUS SALAM', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1993-12-27', NULL, NULL, '2025-06-27 06:55:48', NULL),
(532, '3304054107850258', '$2y$12$qq/eFswsPvXjYdap9xOjr.GS7S/F.kv.IH8GhES/WxZzWYqbpCWC.', 'ROHYATI', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1985-07-01', NULL, NULL, '2025-06-27 06:55:48', NULL),
(533, '3304054811760001', '$2y$12$uHW0pyOyH.5WJgGUtnFo0OD68XtogVYKiIBY0ZF5ZdhjUHS4y0G.u', 'RUPINAH ', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1976-11-08', NULL, NULL, '2025-06-27 06:55:48', NULL),
(534, '3304051802750002', '$2y$12$Xp947MXjVvKhJgpLyvGHY.oSf6aHXOb4wtXJ48pbIsMdYtOFQe1qe', 'SOBIR', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Guru', 'Banjarnegara', '1975-02-18', NULL, NULL, '2025-06-27 06:55:49', NULL),
(535, '330405514760003', '$2y$12$kp3Mvvs2NrnZ58qd72ngyOEKvZo2.xpnf5VncOh1o6FEZ1eCuzTXi', 'DIYAH TRI ASIH', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1976-04-11', NULL, NULL, '2025-06-27 06:55:49', NULL),
(536, '3304054406990004', '$2y$12$WB7r0Caen8v/Q4kVWvkVp.u3OM7LLpi9WRU6ScDxLqOX3HZXcwxWa', 'INDAH SURYANINGRUM', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Mahasiswi', 'Banjarnegara', '1998-06-04', NULL, NULL, '2025-06-27 06:55:49', NULL),
(537, '3304054501950001', '$2y$12$Ebcmmglsi0GpBrv41dX83e08xZ9QIbTgLmdcuU58xYGZ0/QkVnHNS', 'NUR HIDAYAH', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Guru', 'Banjarnegara', '1995-01-05', NULL, NULL, '2025-06-27 06:55:50', NULL),
(538, '3304054109010001', '$2y$12$YKtmDAPlIzukjhwgnUk7h.Xh5sVgKXcbsqAMUH1wUf6sRqTAhTLji', 'SITI ALFIAH', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2001-09-01', NULL, NULL, '2025-06-27 06:55:50', NULL),
(539, '3304050908760003', '$2y$12$QmlLIXYC3YKtS7ETaVUWK.yWUk99BPln43uPloOmZrxJa4TQJe3Ii', 'TOLAB', 'Laki-laki', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Buruh', 'Banjarnegara', '1978-08-09', NULL, NULL, '2025-06-27 06:55:50', NULL),
(540, '3304054502810004', '$2y$12$RJ8guxV6VRyIHsimUcEXHuc.AiqnISnLnuv5MMha6AmUUm9cCilmO', 'AMYATI', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1981-02-05', NULL, NULL, '2025-06-27 06:55:50', NULL),
(541, '3304054107750055', '$2y$12$yg1V3XhYcVNXOeYeh2H8N.ONTziZUijn1xKScP0m20FO/t8RkmRR6', 'SITI KHOTIMAH', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1975-07-01', NULL, NULL, '2025-06-27 06:55:51', NULL),
(542, '3304055302000001', '$2y$12$HcCajyvpBYa6PEV//uUENuC0VTrXK2HLqQqhWF5F6B5YGIjUi76S2', 'IKA PUJI PRIHATINI', 'Perempuan', 'Wiramastra, RT 03/RW 04 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '2000-02-13', NULL, NULL, '2025-06-27 06:55:51', NULL),
(543, '3304054107940011', '$2y$12$qETRkFTSOXVLjVePTKqsgePmAN55vBK4JLH2ARX4tHPfuQxpa1oKK', 'KHAMDIAH', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1994-07-01', NULL, NULL, '2025-06-27 06:55:51', NULL),
(544, '3277010305780028', '$2y$12$wt5zmAzdzUxDIzpmADsFcOtV8LjEM8FZ5IUEQBWNXPjpSG5EnrC/e', 'SUBAGIO', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S', 'Banjarnegara', '1978-05-03', NULL, NULL, '2025-06-27 06:55:52', NULL),
(545, '32770152078200027', '$2y$12$mId/4gg9vd0btAGf.PtX7.Uvc1Dfberz5pKvK/oUrviBdDBoCpYf6', 'KHAMIYATI', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1982-07-12', NULL, NULL, '2025-06-27 06:55:52', NULL),
(546, '3304055003730001', '$2y$12$hrQ2SFnFe7hTmpgIomNcX.Tu/9jgmsmm4OKNU4kQpng4cRROVksSm', 'FUCHAIROH', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1973-03-10', NULL, NULL, '2025-06-27 06:55:52', NULL),
(547, '3304051805810001', '$2y$12$gbb3vH4S7smL76K3e7lSwuqlxmcn1Swk8b3EAVH.DdVyuhsAa/Uwy', 'UJANG SUGIYANTO', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Transportasi', 'Banjarnegara', '1981-05-18', NULL, NULL, '2025-06-27 06:55:53', NULL),
(548, '3304055506890003', '$2y$12$tZIQbJpJQD4LnuN3uTi33.I8ZtID848cSrANOGoTLD2XvFOLLkiJ.', 'PUNGKI I.P', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1989-06-15', NULL, NULL, '2025-06-27 06:55:53', NULL),
(549, '3304051803860001', '$2y$12$4rKxRYSq1.fNKkO6ZrZQtuZa8Fo6Y1TUNscTesR9L.9Kz2rUkzcI6', 'HADIR SUPANGAT', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1987-03-18', NULL, NULL, '2025-06-27 06:55:53', NULL),
(550, '3304055103880805', '$2y$12$wG0Dxi.jPV7TxwoCrP558.xf9BtRyI3pvwrPdcGFyDi/oh4vZFAe2', 'TITIN WIDIYANTI', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1988-03-11', NULL, NULL, '2025-06-27 06:55:54', NULL),
(551, '3304056406960003', '$2y$12$ea8IxbzK0EUwwW5xX8hkf.m62uoH98eb8KfZ.KW.lXd7clBFJFEYK', 'J.B.KHASANATI RODIYAH', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Mahasiswa', 'Banjarnegara', '1996-06-24', NULL, NULL, '2025-06-27 06:55:54', NULL),
(552, '3304050106680004', '$2y$12$PG5Tv1x7HuA4eI53q7ftKOjYI76kurHLBSJgXLT/kZpzkwSoXClEO', 'TAMIN', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1968-06-01', NULL, NULL, '2025-06-27 06:55:54', NULL),
(553, '3304056307730002', '$2y$12$bDL5zJq7/NvBsPa62ge5p.PpXdq96XHxM1jK.FOTE0v1L46.e3gy6', 'KAMISAH', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1973-07-23', NULL, NULL, '2025-06-27 06:55:54', NULL),
(554, '3304054306910002', '$2y$12$7GUxbfdBfroLZpHwnN4DwOGQ/q2NbB0rOPf8M12qjJLREgJIlTIbu', 'SITI LATIFAH', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1991-06-03', NULL, NULL, '2025-06-27 06:55:55', NULL),
(555, '3304051708970002', '$2y$12$QaoourTHDlTm97/k9anHWOk88xFhhKv/tToXqhPUKiyIdH4Mm/sQe', 'RIDWAN MAULANA', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1997-08-17', NULL, NULL, '2025-06-27 06:55:55', NULL),
(556, '3304051401790002', '$2y$12$yGMSP1fc1NKdHGqyHn2rmu3eLi7.CixOMj1fpzy5vNn.hCLhJJlHG', 'PARYONO', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Prt', 'Banjarnegara', '1979-01-14', NULL, NULL, '2025-06-27 06:55:55', NULL),
(557, '3304054607820006', '$2y$12$ag/J9qoUxErYjUqkL3.TlO/AQgEQN6LbXpYAfbaUhpvAeiqzbmDoS', 'KANTI MUJIATI', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1982-07-06', NULL, NULL, '2025-06-27 06:55:56', NULL),
(558, '3304050110800006', '$2y$12$h3IfVgEYkPbB56BGPuZU.OL4dC.L13HT86UF2gxAA1V2AvHfrEpEy', 'WALADUL KIROM', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Pns', 'Banjarnegara', '1980-10-01', NULL, NULL, '2025-06-27 06:55:56', NULL),
(559, '3304054101920009', '$2y$12$06mi9sM3Vlk8SDy78ePOVeY7SKph8CtJBBNfa7b5xXLOd7osyM3eK', 'NUR KHOERIYAH', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1992-01-01', NULL, NULL, '2025-06-27 06:55:56', NULL),
(560, '3304052905780008', '$2y$12$2xrlvIOFVBg6aijHFT642us.lUv4.GMbmNJGTezP0IbBLLhVyuSMa', 'ISNADI', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1978-05-29', NULL, NULL, '2025-06-27 06:55:56', NULL),
(561, '330405571820005', '$2y$12$zc1ZGrBJA7B7VnHK8NB43.Z1DDG96XcJMhy.kUCHQ1Oi37sFyKj4K', 'WAMUNAH', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1982-12-17', NULL, NULL, '2025-06-27 06:55:57', NULL),
(562, '3304051104830003', '$2y$12$FJA7YuxsPSI0wX3bH9cKnuwkxrmnPBnokemkjVdNCpGMivXRtMFDS', 'SAFRUDIN', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1983-04-11', NULL, NULL, '2025-06-27 06:55:57', NULL),
(563, '3304056710870002', '$2y$12$DruoKjlEKylnXg4qI74c3utCuZF7l6Gdr5womteFxcJ5w3/ykJCU.', 'ROFIQOH', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1987-10-27', NULL, NULL, '2025-06-27 06:55:57', NULL),
(564, '3304051412710001', '$2y$12$kbabLL7Vfd52cfsCMLAfsOBpHWhWpfIfniDEG0KPiRpCvZsPlVTyu', 'WIJAYA DWI YUWANA', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Cerai Mati', 'Petani', 'Banjarnegara', '1974-12-14', NULL, NULL, '2025-06-27 06:55:58', NULL),
(565, '3304051001820007', '$2y$12$dfxfMhLU3e8Ny9PE7N6wCeu027HvQvVTFeh7/IDRBFxukdBwuzKQa', 'HERI ADI PRASETYO', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Karyawan S.', 'Banjarnegara', '1982-01-10', NULL, NULL, '2025-06-27 06:55:58', NULL),
(566, '3304050107980005', '$2y$12$ird9p1lyuzYbm3WgSEKnJueVLDPxHjpfsouDBBa6q6Vipga/hOcee', 'ADI GUNANTO', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1998-11-30', NULL, NULL, '2025-06-27 06:55:58', NULL),
(567, '3304051601790001', '$2y$12$3LTqfxPW0OUM.mtUxFT2U.xRKC3Gf6zsOnBvU8gwsbuNSHbNnhany', 'YATIMAN', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1979-03-16', NULL, NULL, '2025-06-27 06:55:59', NULL),
(568, '3304054400040010', '$2y$12$3Ik5xNJs/dTNimTmdyN1p.5Hj6tSyPqvHudIuJHndL6X0Y11anRQi', 'DAIMAH', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1984-06-04', NULL, NULL, '2025-06-27 06:55:59', NULL),
(569, '3304056606930001', '$2y$12$zR42RISbJwxASkIgezGGEO5Fbq68iwFgya8HQt1QkHkgkl452h64m', 'NUR KHOTIMAH', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1994-06-26', NULL, NULL, '2025-06-27 06:55:59', NULL),
(570, '3304056608920001', '$2y$12$jLjIjL1kEz4T.iFPs4Aj7u0q6uMqnce0zTrOn9kTi8eRIPk4Ebuum', 'SUPRAPTI', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Belum Kerja', 'Banjarnegara', '1992-08-26', NULL, NULL, '2025-06-27 06:55:59', NULL),
(571, '3304050807810002', '$2y$12$/RqaINdMoQBk.psnaiAMSuh8oKdYTCl9LnGds6vHYbMzxxRBWRQUe', 'SUKISNO', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1981-07-08', NULL, NULL, '2025-06-27 06:56:00', NULL),
(572, '3304054306820003', '$2y$12$fswHYmXjPtZgUpBf5tirReTMpmSuMJfTRUJUCd24vRpxK2lC5V0N.', 'KHOLIFATUN', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1982-06-03', NULL, NULL, '2025-06-27 06:56:00', NULL),
(573, '3304050109800010', '$2y$12$1afXOCcahk5Phv1nMgtu0Ocg7zJFmrJWxVPtyfBKBoD0FgXC.KdqG', 'DASUKI', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Sopir', 'Banjarnegara', '1980-05-09', NULL, NULL, '2025-06-27 06:56:00', NULL),
(574, '3304050401790001', '$2y$12$FiEJugCmlZ/4LajotHw0Ruol7ney9ntdVRaXkgrh3qd3UEYg6xNyC', 'SADIK', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan Sewasta', 'Banjarnegara', '1979-01-04', NULL, NULL, '2025-06-27 06:56:01', NULL),
(575, '3304057001770001', '$2y$12$Aw5srky1t2M5ulVQc3gtbufANYJcq.B67iluA2US7JLpDWO3T9ZPi', 'ANI MISWANTI', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1977-01-30', NULL, NULL, '2025-06-27 06:56:01', NULL),
(576, '3304050101850003', '$2y$12$MXF7fEFmErHgKKvFeObn7.Y8lW4O9Thly7sR2MHLf/h7G8rbjrTPu', 'SUKARJI', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan Sewasta', 'Banjarnegara', '1985-01-01', NULL, NULL, '2025-06-27 06:56:01', NULL),
(577, '3304056712890001', '$2y$12$5w1PHIfIS.JIsDCsGnaJneBO43VN3LplopImlFgE4/xvcIJ96DDVi', 'FARHANA', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1989-12-27', NULL, NULL, '2025-06-27 06:56:02', NULL),
(578, '3304054908840002', '$2y$12$.0LhPjB/MOiteeQmNzieN.glEX1BZRbu4Hz8OIb0bS5x5WjyGn16a', 'ROBINI', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1984-08-09', NULL, NULL, '2025-06-27 06:56:02', NULL),
(579, '3304056905010001', '$2y$12$w8Kjq/WgZt0GpkgZhI22F.H1B3MvnLtq93g9rdHTMzp9xImfG7Pnu', 'WIDI ANGGRAENI', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2001-05-29', NULL, NULL, '2025-06-27 06:56:03', NULL),
(580, '3304051206000001', '$2y$12$FBfw0ygd8Ut6LZtLzZ6mIepZ4ZF.fd1VBpK5FyS963h62Q9nAUii.', 'MUHAMAD YUSUF', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2000-06-12', NULL, NULL, '2025-06-27 06:56:03', NULL),
(581, '3304180311800002', '$2y$12$IFP/bN399QvDPawxS6yIUO6T.eNiH0VOs3q/NFWs.IUrWpjrLD8iq', 'ROHMAN', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1980-11-03', NULL, NULL, '2025-06-27 06:56:03', NULL),
(582, '3304186605920001', '$2y$12$y2oRKaWsEeEuh1pdIGSo4e29/lRzh6e5ue9GEweqzhI1j91jnRwFO', 'SARTI', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1992-05-26', NULL, NULL, '2025-06-27 06:56:03', NULL),
(583, '3304050404940001', '$2y$12$UhwnmdqSRk4HxAMj/GhoEex5LZXED.RSPOV6ztR9djArYG/QfOtSG', 'YOGA SETIAWAN', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Swasta', 'Banjarnegara', '1994-04-04', NULL, NULL, '2025-06-27 06:56:04', NULL),
(584, '3304051308830001', '$2y$12$/6gCNr7uQDFDyNiwiBBEj.hsgxaHGKsRn5gsfZupPE3Jb11yDaN6S', 'SULISMAN', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Perangkat', 'Banjarnegara', '1983-06-13', NULL, NULL, '2025-06-27 06:56:04', NULL),
(585, '330405411860001', '$2y$12$9.BjUV2Ov47PyfwbUj56c.E.efPDkzUiyBnCueAlUPDT5VLRtjO/W', 'SITI KHANIFAH', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1986-01-10', NULL, NULL, '2025-06-27 06:56:04', NULL),
(586, '3304054905740001', '$2y$12$U6J0jvrfSS5oq0Y8953KLOXyQAt9mDZv88A7UWvnYm3GFAASChEbO', 'SRI SUKEMTI', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Swasta', 'Banjarnegara', '1974-05-09', NULL, NULL, '2025-06-27 06:56:05', NULL),
(587, '3304054111950001', '$2y$12$vxIIdvd9ibcEn4PWn9tx6O9I.j.nh0zQEyfsiraPvJSMCfJ0jzWxq', 'NOVITA INDAR D.', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Swasta', 'Banjarnegara', '1995-11-01', NULL, NULL, '2025-06-27 06:56:05', NULL),
(588, '3304054703760002', '$2y$12$Udptbs/BODmujivnWBxYTOV2Ft.gMPTvyCdLs8SzSFPy9NvYF4pHi', 'RUMIDAH', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1976-03-07', NULL, NULL, '2025-06-27 06:56:05', NULL),
(589, '3304052107940001', '$2y$12$mkubUAwErtablp3PkuGoq.aq3WvX0NiRULstAJoCruikjUvEiyWLi', 'IKHWAN', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Belum Kerja', 'Banjarnegara', '1994-07-21', NULL, NULL, '2025-06-27 06:56:06', NULL),
(590, '3304052109860004', '$2y$12$vv3Fww4Y6z6SXpDLeUyctOiU.H3R50Gtnkg0JZkPboEG.t7Ppbb2C', 'INDRA SULAEMAN', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Jakarta', '1986-09-21', NULL, NULL, '2025-06-27 06:56:06', NULL),
(591, '3304055608800002', '$2y$12$QItg9KoS9RCAl.CTF20LVOZZdYwt514jpQWhnBMia1/9J5oicm7EG', 'RUDIAH', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1980-08-16', NULL, NULL, '2025-06-27 06:56:06', NULL),
(592, '3304051106720003', '$2y$12$PuWZoGPpeghwdVMCrr3nHuQZvbOstTzlQNJsQP2T5yvQlCmOQbYVO', 'SUNARJI', 'Laki-laki', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1972-06-11', NULL, NULL, '2025-06-27 06:56:06', NULL),
(593, '3304055211780006', '$2y$12$/iRprNDFeZgVOO570t7sZ.0J4nYJUfw.9SO72n9sswK44fVXGiaFa', 'SULASTRI', 'Perempuan', 'Wiramastra, RT 01/RW 02 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Wiraswasta', 'Banjarnegara', '1978-11-12', NULL, NULL, '2025-06-27 06:56:07', NULL),
(594, '3304051005760001', '$2y$12$6J1zSx20PhoqB1XhzWVwRuk6U7639EGEdnpN5OxalKzDRCQH1Qii.', 'SALIM', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S', 'Banjarnegara', '1976-05-10', NULL, NULL, '2025-06-27 06:56:07', NULL),
(595, '3304056606790001', '$2y$12$1zmJuPq7BW5DNbbjf3qpPOuymDwPjCq2gWyCvdvrK3ETUSgKy4Y92', 'NARSITI', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S', 'Banjarnegara', '1982-06-26', NULL, NULL, '2025-06-27 06:56:07', NULL),
(596, '3304054107930009', '$2y$12$DBI8pJ4N7aP1CFdLB.JS1.5djJvXYPwLb9HLilk0LseXpPNtC/5lu', 'NUR TATIMAH', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1994-07-11', NULL, NULL, '2025-06-27 06:56:08', NULL),
(597, '330241307850001', '$2y$12$Sf4Y.3fapuMhrwXh7SuxbO.0YMlNyUTJ6rPi4pjYjqnGUWYUpg1G2', 'SIDIK KAMSENO', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Harian Lepas', 'Banyumas', '1985-07-13', NULL, NULL, '2025-06-27 06:56:08', NULL),
(598, '3304052908770005', '$2y$12$oC7HOFr93vy.Xxb0C8TSOuRnCHnjgBX0kOS1zc9SAI6IWONYthW8m', 'MISMAN', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1977-08-29', NULL, NULL, '2025-06-27 06:56:08', NULL),
(599, '3304055603810001', '$2y$12$VtNERt/iVgSiiUFBfe92OuV0XjNGf6xI50jG7Jz2KSHa8bUYa9Vl2', 'RASEM', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1981-03-16', NULL, NULL, '2025-06-27 06:56:09', NULL),
(600, '3304051310950003', '$2y$12$wmwoFkn1E2rofV/w9SZnCOkwOwuUAMwEbblZuDSVkWhROGUpefrCe', 'JUMIANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S', 'Banjarnegara', '1995-10-13', NULL, NULL, '2025-06-27 06:56:09', NULL),
(601, '3304054606960005', '$2y$12$cNwfXnfuRhUf8Rbtw3sDeu81F.zTCICBvnRTW3y1WD93TpL3pAF62', 'AMITA MUNIATI', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1996-06-06', NULL, NULL, '2025-06-27 06:56:09', NULL),
(603, '3304054107820053', '$2y$12$e596.107Qqi0RP5Bejcr7eAeeNBLiQstLiWbtTyFLXdwuChlkggPu', 'DARWATI', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S', 'Banjarnegara', '1982-07-01', NULL, NULL, '2025-06-27 06:56:09', NULL),
(604, '3304050803910004', '$2y$12$OJIKFvzJ12UDPawdXf1TWukhFJSMUbg/e.7qlHTfkxLT0E.bYJ4gi', 'NURUL FATAH', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'K.Honorer', 'Banjarnegara', '1991-03-08', NULL, NULL, '2025-06-27 06:56:10', NULL),
(605, '3304056810910002', '$2y$12$Lla1v62ZDl38VAjrsHlVrubltB3PcF9ZIuuPfGPR65unB7YkXsBNG', 'LELA SETIANA', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1991-10-26', NULL, NULL, '2025-06-27 06:56:10', NULL),
(606, '3304054811730005', '$2y$12$q5k8jVtzeVbIrBqTyJK.eu/xa1oR0BEJYcOr65yrpqlK.3SNywGQu', 'MUNDIROH', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Buruh Tani', 'Banjarnegara', '1973-11-08', NULL, NULL, '2025-06-27 06:56:10', NULL),
(607, '3304050611810003', '$2y$12$5c3iA226pRHSyH.Y0M8zX.1gN/T5YhimNagt3/y4gjcehm//3KK9W', 'WARSAN', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1980-12-06', NULL, NULL, '2025-06-27 06:56:11', NULL),
(608, '3304056910890004', '$2y$12$O2i3IAoId8HAywnNFATGM.OIgPAYvPT6xLJL9W0cFvNSMXkYbC6Na', 'SUPRIYANTI', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1989-10-29', NULL, NULL, '2025-06-27 06:56:11', NULL),
(609, '3304051009870003', '$2y$12$IrvtSWnoKB91XuKkpObzmuoel9IDdCdfck7cUbC7Hh5fzqzpGLU1a', 'KHAERUDIN', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1987-09-10', NULL, NULL, '2025-06-27 06:56:11', NULL),
(610, '3304051505920001', '$2y$12$jkNJcQlWwGv1L3v3q.vL4u5VPowfpJ96fa.Dz8sVFDUASMx6jA4de', 'AKHAMAD PRIYANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S', 'Banjarnegara', '1992-05-15', NULL, NULL, '2025-06-27 06:56:12', NULL),
(611, '3304054105950003', '$2y$12$Bb1REzcxAHwKjdXYgeRBE.wqLX5VhalCofK56TMlim.Y/uoSgWkYi', 'SANIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1995-05-01', NULL, NULL, '2025-06-27 06:56:12', NULL),
(612, '3304056304740001', '$2y$12$I9iyKD1iOdJnjktsD20rCO6a.iDPn0In9xISpluwqlBaydhnyw9aa', 'MUKAROMAH', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1974-04-23', NULL, NULL, '2025-06-27 06:56:12', NULL),
(613, '3304050906970001', '$2y$12$f5.nuA6WDd/YR.Hy6aL.HuoVBd6KmBpsVxpFU.yUCKZ.CZTEEkHSO', 'ANDRI HAMID H.', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1997-06-09', NULL, NULL, '2025-06-27 06:56:12', NULL),
(614, '3304051211850005', '$2y$12$u4fEZB/RYnRB7ik54VYbcufnbOXhs61B3X8pxlTRjmOH9V7yn3tAK', 'DASIMAN', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Petani', 'Banjarnegara', '1986-11-12', NULL, NULL, '2025-06-27 06:56:13', NULL),
(615, '3304050904870005', '$2y$12$qLm/z8xinHOVyk814DsPqetdVPKfTpwQiBM3aNSjs24xj2KCIVeIS', 'WAHIDIN', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Petani', 'Banjarnegara', '1988-10-11', NULL, NULL, '2025-06-27 06:56:13', NULL),
(616, '3304051805850001', '$2y$12$UXQ8HYX.dDN.W6A5Pr8DCu1VRlHKPugR4bCiOsKtWUvyFd/S5npI6', 'WAJIDIN', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Sopir', 'Banjarnegara', '1985-05-18', NULL, NULL, '2025-06-27 06:56:13', NULL),
(617, '3304054708950001', '$2y$12$KRNunT/Wm/NzBtWdoN5qZu8GDXh4L53gf3g8CpdRL3wFSmFvmpZji', 'LUSIANA', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1995-08-07', NULL, NULL, '2025-06-27 06:56:14', NULL),
(618, '3304054510930002', '$2y$12$OsvBHCcPp1rZsTl.LJoGF.9KNWXUSrnk0UeJT4HbNxgmsDtDFcWf6', 'SRI NIINGSIH', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Mrt', 'Banjarnegara', '1993-10-05', NULL, NULL, '2025-06-27 06:56:14', NULL),
(619, '330405221080002', '$2y$12$/mlZujrKBTSYzbW4cKEiWeoWL2C.Z2tKIGnoDO4R6p0/rrxOhb/ue', 'DARMAN', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1980-10-22', NULL, NULL, '2025-06-27 06:56:14', NULL),
(620, '3304054802870002', '$2y$12$6uKs9T7fWt9eGw4E89SC6uF4W.m80PIeH4HWJ7s62j/xNODW6zQQm', 'WINARTI', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1987-02-08', NULL, NULL, '2025-06-27 06:56:15', NULL),
(621, '3304051901880002', '$2y$12$wYSused4vnXkr9T5EsszwevEhVAQZVhWze.w6zMQoyWGUuI6BuIsK', 'IDRIS', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1988-01-01', NULL, NULL, '2025-06-27 06:56:15', NULL),
(622, '3304051201920004', '$2y$12$vyEHFUdQZHpTfK5u2.frsebBIl.3CemMcXjJdcgYkLc5R92n3Rpee', 'HOLIS MUAFIN', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Wiraswasta', 'Banjarnegara', '1992-01-12', NULL, NULL, '2025-06-27 06:56:15', NULL),
(623, '3304052303720008', '$2y$12$NQM3n1aLn59CMg5Ut21C.Ohz2zkuM2muOr.5cCp/kxwzKJmA./qt.', 'RISWANDI', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1972-03-23', NULL, NULL, '2025-06-27 06:56:15', NULL),
(624, '3304056105860002', '$2y$12$MxSU.0JmcQfbYmMxosUPT.dq1XA.YnCBhP0Ko4wzm/t8ZpqBGR.WK', 'EKANI R. PUSPITASARI', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1986-05-21', NULL, NULL, '2025-06-27 06:56:16', NULL),
(625, '3304052307770003', '$2y$12$WRPsvKuzBhdFJ0ITZNXLXO4UnYSIGlD9VWlRbHhtgUIDeH4S73DmC', 'SUGINO', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Perangkat Desa', 'Banjarnegara', '1977-03-02', NULL, NULL, '2025-06-27 06:56:16', NULL),
(626, '3304054112860002', '$2y$12$EV73wlvZNRMtatmTxuhMw.8feveQwFMSorQtf7BTcIRIi18W9W/HO', 'NUR KHASANAH', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1986-12-04', NULL, NULL, '2025-06-27 06:56:16', NULL),
(627, '3304054408750001', '$2y$12$j9zH2G6NJL//sY8isWxydORFiad9yA7vPZmdwadFGv8OzzL9wPEjW', 'SUTINI', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1975-08-04', NULL, NULL, '2025-06-27 06:56:17', NULL),
(628, '3304054711950001', '$2y$12$/5dPaAJnrJGZbJ9ppSSXF.B2SIUq.9IIXUFpEpabthFiS0W4s/lYy', 'NOVI YUNIATI', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Belum Bekerja', 'Banjarnegara', '1995-11-07', NULL, NULL, '2025-06-27 06:56:17', NULL),
(629, '3304051005700001', '$2y$12$YRYWWMmFj6urklVgDFiu1eCH6hj5PqcBn1VlEtdsetyIBJYT8FoRu', 'SUWARNO', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1970-05-10', NULL, NULL, '2025-06-27 06:56:17', NULL),
(630, '3304055608760001', '$2y$12$.qn.DYAUxAIQVo8twBgkj.Qc6vaKIuGMGPAmCAQuZsXaZctmQb2rq', 'KOMIRAH', 'Perempuan', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1976-08-16', NULL, NULL, '2025-06-27 06:56:17', NULL),
(631, '3304110101810011', '$2y$12$e3ocLQAPvVc4Mz4ZNqno8u/imwyqxbWVQt9LEDlWU6eTbtce6kiCG', 'KUSNAN', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'T.Batu', 'Banjarnegara', '1981-01-01', NULL, NULL, '2025-06-27 06:56:18', NULL),
(632, '3304114703870001', '$2y$12$mjx/QzcgfCjCbrQK5bCp2.dUKy8ZqXj9PpM3TRRpxDJ5BxQbJOCnK', 'NUR LAELA', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1987-03-07', NULL, NULL, '2025-06-27 06:56:18', NULL),
(633, '3304050607790001', '$2y$12$lAu0rolSbTkexP1J14Uj/OLjjCl7ENc9EFKdZlzZb6WHgmMUkqNt2', 'KHODIKIN', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1979-07-06', NULL, NULL, '2025-06-27 06:56:18', NULL),
(634, '3304055206810001', '$2y$12$ziCuH440iIqpJ8cJL4Fg4eYL00.8Xnv9DryzkNUlVUhXmglwPpt1W', 'HARNINGSIH', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1981-06-12', NULL, NULL, '2025-06-27 06:56:19', NULL),
(635, '3304051501860002', '$2y$12$qDxe.xNgPcPsHcYiPbDNK.AhDdvbQXfBsn6IoytuOCCqh4i9rcC.6', 'HABIB MUALIM', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1986-01-05', NULL, NULL, '2025-06-27 06:56:19', NULL),
(636, '3304055509920003', '$2y$12$OOb3TBqGd6xDQi3Bd88ScecqbZ365SO1sqb6hG2RlYzPFpLXGahq6', 'SUIROH', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1992-09-15', NULL, NULL, '2025-06-27 06:56:19', NULL),
(637, '3304050107890005', '$2y$12$tEjWq18/6WZ5T/bboeCYr.WHnCXLeK7T0yhL9htFHjmzIeoMOPIce', 'SOLIHIN', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pedagang', 'Banjarnegara', '1989-07-01', NULL, NULL, '2025-06-27 06:56:20', NULL),
(638, '3304055910850003', '$2y$12$tmtbHdc6WwT6y7yHaKjf/O9r08a9dcQ6y1K5t7e07b9lCAO/pKGKW', 'UMI SALAMAH', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pns', 'Banjarnegara', '1985-10-19', NULL, NULL, '2025-06-27 06:56:20', NULL),
(639, '3304051708880007', '$2y$12$EcyCGtn9Y0IEVZobRe43req78ko2fL.ZHGx4SVY4pz6P1VUyRmG0e', 'ABDUL KHOLIK', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S', 'Banjarnegara', '1988-08-17', NULL, NULL, '2025-06-27 06:56:20', NULL),
(640, '3304050707760006', '$2y$12$MRCeNpO3PlzXE6n4s8RAHuNOo83.wI.FG5z9rGvrh.gCM5n3CIaf.', 'RUSMAN', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1976-07-07', NULL, NULL, '2025-06-27 06:56:20', NULL),
(641, '3304055909810002', '$2y$12$Px3h1nwS7bfQlo1dc0G8C.EakebEgx5jXp3nXWzm5URaQGHznyoXu', 'SAPTORINI', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1981-09-19', NULL, NULL, '2025-06-27 06:56:21', NULL),
(642, '3304055403730002', '$2y$12$RS2pdg5uDlNPqrt3fNpnA.6O/Pfp9tZvnyMqcYGmebW7r28bFlFyu', 'SARIYEM', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Tani', 'Banjarnegara', '1973-03-14', NULL, NULL, '2025-06-27 06:56:21', NULL),
(643, '3304051110010001', '$2y$12$dj4Xs72VEeMWqirFthkMQOpQPjjUngKgqdH18phNo6YaBNHJ2cocK', 'ALIM MULYANA', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2001-10-11', NULL, NULL, '2025-06-27 06:56:21', NULL),
(644, '3304052906810001', '$2y$12$xjuG0N9tDhhYAwmuR4Ldp.1.7cfa1jbz.bVbIFlmhbtLCV5HkM29m', 'MUJIARTO', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1981-06-29', NULL, NULL, '2025-06-27 06:56:22', NULL),
(645, '3304054102850001', '$2y$12$117uOlKuM/Jvoekc5LplW.6T2K/WbpoFYb.5ijHKvI.asJmZXIvaC', 'DAHYATI', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1985-02-01', NULL, NULL, '2025-06-27 06:56:22', NULL),
(646, '3304051009940001', '$2y$12$V8wgI.2MeRwaG/eL3zI.w.202ppiQF0/68f3DKISiDon4p6uN/RLK', 'MUALIP HIDAYAT', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1994-09-10', NULL, NULL, '2025-06-27 06:56:22', NULL),
(647, '3304054906750002', '$2y$12$zdBGdFTa3zSx0Socilmjb.fUEbF6sgd6skLyHl3ua3FTsmJ.MPe.C', 'RUPINGAH', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1975-06-09', NULL, NULL, '2025-06-27 06:56:23', NULL),
(648, '3304050611750001', '$2y$12$q82ptgSIe9ME6aBezsSAY.MVzU9Su6EpMwXtyaYc63hsAuKPFY3fS', 'WAGIMIN', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Jasa Lainnya', 'Wonosobo', '1975-11-06', NULL, NULL, '2025-06-27 06:56:23', NULL),
(649, '3304054703840003', '$2y$12$Y/a9U22bwnMJpElkmsC0P.iBhK3Iatri3yDzUJj2L.rTLVudaIMjO', 'SUSMIATI', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1984-03-07', NULL, NULL, '2025-06-27 06:56:23', NULL),
(650, '6207071305900001', '$2y$12$meanxQDxsC6HAUGWMTp41uztYmrVV47T2265/6Nj0PM9mBRwizmSK', 'SUGIHARTO', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Belum Bekerja', 'Banjarnegara', '1990-05-13', NULL, NULL, '2025-06-27 06:56:23', NULL),
(651, '3304051703950004', '$2y$12$ojXZMo0x3uw0RQKOraEkBuKai0KO56d0UTYLgVIBwIuBqWNwyHaI2', 'SUKUR MARDIANA', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1995-03-17', NULL, NULL, '2025-06-27 06:56:24', NULL),
(652, '3304054406980001', '$2y$12$tQ4o7IdZ60vgMNIRlVtUQeN3QagKPrWma4hwmKKBkPYz3N0s.Sawi', 'SRI WIJI UTAMI', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1998-06-04', NULL, NULL, '2025-06-27 06:56:24', NULL),
(653, '3304052407800005', '$2y$12$ZqK76fDbVmEQUqYiXH0OMuVynwHN7myF923J7tA5xRiW93bJ39dge', 'SUTARYO', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S', 'Banjarnegara', '1980-07-24', NULL, NULL, '2025-06-27 06:56:24', NULL),
(654, '3304054308810001', '$2y$12$qPxHnWZGTgaR3Kx6E6eR9.Ox3KPiQqbHcyAI7MccJHo.yiyb1tyEy', 'SALYATI', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1981-08-03', NULL, NULL, '2025-06-27 06:56:25', NULL),
(655, '3304052011830001', '$2y$12$osUHcvplbUYsOvKtMvwcgOREytdmIBOLbAU8RFLbJaOLsh0krkoVC', 'MUFIDIN', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1983-11-20', NULL, NULL, '2025-06-27 06:56:25', NULL),
(656, '3304055905930002', '$2y$12$KwO4tlfUypZTrGZjMutPTOFYWnyGedha/n5.iXAly.verbtAMpAsu', 'ANI MAH', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1993-05-19', NULL, NULL, '2025-06-27 06:56:25', NULL),
(657, '3304056111070005', '$2y$12$c3ZNwhHgSRvw6PrkMhisM.mfdaolHvafSIh.MBWaQRYY9AL3jSJWC', 'ALMA NOVIANTI', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2007-11-21', NULL, NULL, '2025-06-27 06:56:26', NULL),
(658, '3304052509000001', '$2y$12$are5EReZB2cC9wo7UpkX0.KL9/P23b8dy3MzsqMDPbOA84rqT/nWW', 'AKHMAD NURULAIN', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2000-09-25', NULL, NULL, '2025-06-27 06:56:26', NULL),
(659, '3304052009800002', '$2y$12$ahcEiYWNclmgoTpKsUq0UetGzx4APZ9Y3nyCHN288pVSPMgiU0Dhm', 'JAMINGAN', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Kariawan Honorer', 'Banjarnegara', '1980-09-20', NULL, NULL, '2025-06-27 06:56:26', NULL),
(660, '3304054503880002', '$2y$12$b8YEdviu2H8aIZRq0xPp6utkUg0NAfd.ncUGb.ZRP5CaItFiW5K22', 'MUTAHAROH', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1988-03-05', NULL, NULL, '2025-06-27 06:56:27', NULL),
(661, '3304050202730002', '$2y$12$EOmuiJD67rZovQAsCFo28OYShIKsgOeNJKPInzKvGHBCk9dmlycd.', 'SUWARNO', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1973-02-02', NULL, NULL, '2025-06-27 06:56:27', NULL),
(662, '3304055503810005', '$2y$12$IaYCWqIZg3ZrxT6W.PRV0O6hrGJTF1MQqY2HiHJNV5SwGtfebMLAy', 'MANISEM', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1981-03-15', NULL, NULL, '2025-06-27 06:56:27', NULL),
(663, '3304051508780001', '$2y$12$FLwaaZpuGBNKhThASPoedOA8UJTD56/6isExIiQStce516lo84uzy', 'SUSILADI', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Belum Bekerja', 'Banjarnegara', '1978-08-15', NULL, NULL, '2025-06-27 06:56:27', NULL),
(664, '3304105404740003', '$2y$12$oY/ItdbKRpPoc0NWY9qPIuWSm8f5ofEkfrGdN4kB0No7QVdQqFF0a', 'KHOTIJAH', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Pns', 'Banjarnegara', '1974-04-14', NULL, NULL, '2025-06-27 06:56:28', NULL),
(665, '3304056406860001', '$2y$12$5U8qt.PG5QFJi3mReNMRjOTFP.tylp77whNebVGY5dK5huOQvxYgy', 'JUNIATIN', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Mrt', 'Banjarnegara', '1986-06-24', NULL, NULL, '2025-06-27 06:56:28', NULL),
(666, '3304052408860003', '$2y$12$pjvIh7cvzoo5v2Nfm7vkwu0s8bqupndr.vMhi0xe7rsZ9E3mMIBha', 'JUDIARTO', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1990-04-05', NULL, NULL, '2025-06-27 06:56:28', NULL),
(667, '3304051306780003', '$2y$12$i.JpL1mtK1X23AldxliA2Oxuht64mJIqQgSDX5LqKNsCARH4RuklK', 'ERWIN', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1978-06-13', NULL, NULL, '2025-06-27 06:56:29', NULL),
(668, '3304055203750004', '$2y$12$OkqjLFuKeGMYnUzdZhRrfuMWSve/Z.o3Yln6mxi3ABdw1RqqM9lBu', 'KHAMINEM', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Kariawan Honorer', 'Banjarnegara', '1975-03-12', NULL, NULL, '2025-06-27 06:56:29', NULL),
(669, '3304052004960002', '$2y$12$qQGvTw7k/GlP2u9aU.yNx.Udd3geG.yYupy0XaudIV5v2eh7Uq8xa', 'ALI RIDWAN', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S', 'Banjarnegara', '1996-04-20', NULL, NULL, '2025-06-27 06:56:29', NULL),
(670, '3304051910900005', '$2y$12$r.v4zDdiqfX7K.can641GO3WX95t4TWTcyMn2iUswSZ/5eVREE6AG', 'WIWIT BUDIARTO', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Kariawan S', 'Banjarnegara', '1990-10-19', NULL, NULL, '2025-06-27 06:56:30', NULL),
(671, '3304056910960003', '$2y$12$wUTEh52cC.YnUd7UiZ8MxuxN6dwTyBehr4bAK4xbNBOUTFkxg9VqG', 'DIAH FITRIATUN', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1996-10-29', NULL, NULL, '2025-06-27 06:56:30', NULL),
(672, '330405540780002', '$2y$12$YgGbZTX7rIJST3dtdQZqRuECGWUFZMeQqURyREjLd8UEuwD.4MrE6', 'SATINEM', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Swasta', 'Banjarnegara', '1980-07-14', NULL, NULL, '2025-06-27 06:56:30', NULL),
(673, '3304052111960001', '$2y$12$VsfdkW8QK.MZejU8vMdKOOdq0l8hI54NG/9pLKg4Ypc2hiW..ntwi', 'FAIZIN', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karwan S', 'Banjarnegara', '1996-11-21', NULL, NULL, '2025-06-27 06:56:30', NULL),
(674, '3304051312800004', '$2y$12$uUzFbAozuB74B3G6vs9ymuITIe9eqh5xCPghvIvIUF2eMDkBnYsZC', 'SARTO', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S', 'Banjarnegara', '1980-12-13', NULL, NULL, '2025-06-27 06:56:31', NULL),
(675, '3304055205810010', '$2y$12$RB7sqUCFfNnle2RzCxnGwunh/WzEIFVjfLNlUBnecqt6ubyv/msDy', 'WARSINI', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S', 'Banjarnegara', '1981-05-12', NULL, NULL, '2025-06-27 06:56:31', NULL),
(676, '3304051301920001', '$2y$12$CaCxlL/DDyfCQTZJH5x1POWsAUbKRmW746B3hQDXFl3s5Uz7D3rma', 'ROUF SUPRAPTO', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1992-01-13', NULL, NULL, '2025-06-27 06:56:31', NULL),
(677, '3304051004880003', '$2y$12$lo.0ni2j4djS0UpZd9/8Le5Qo.3h8pYkJDNWPq8ICL2MG8uYmiUGC', 'KAMINUDIN', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Karwan S', 'Banjarnegara', '1988-04-10', NULL, NULL, '2025-06-27 06:56:32', NULL),
(678, '3304055005950002', '$2y$12$qawQyYWnML2P1vn9Ixs9Vu5hYHLzZxHbKzhUKrTHummhCzTMDkyre', 'MEIDA RASMITA', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1995-05-10', NULL, NULL, '2025-06-27 06:56:32', NULL),
(679, '3304052707880004', '$2y$12$cuikoE/hXFK2f.F0zXLpcuJGkRE5.Rj4mM6MeheUtiI0pgAD7iXI.', 'SAEFULAH', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1988-06-27', NULL, NULL, '2025-06-27 06:56:32', NULL),
(680, '3304054909910002', '$2y$12$n7o4NOB.2M7Zs8jRDB1hEenYfq8et.jm3zaLMHHNVqyaKiSfC.dHq', 'SENI PARYATI', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1991-09-09', NULL, NULL, '2025-06-27 06:56:33', NULL),
(681, '3304055504740001', '$2y$12$JmwVmeRHYcn.kvsILCof2OG/P3kDJhN8ItedyP5zugA6Rp51xw0Le', 'SUMIYATI', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1974-04-15', NULL, NULL, '2025-06-27 06:56:33', NULL),
(682, '3304054507730003', '$2y$12$gJ3PxCImPmYiIaRZwua4euP623J8fQY/GSGkDMKp/ux2ZJNoAxyf2', 'TUMINEM', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1973-07-05', NULL, NULL, '2025-06-27 06:56:33', NULL),
(683, '3304052103030001', '$2y$12$v2Ca0NXCRYj8ajHPHWkvAevQmtyzP3jB9h36Pqg0TbjiQ.WJidd0S', 'SLAMET RIYADI', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1993-03-21', NULL, NULL, '2025-06-27 06:56:33', NULL),
(684, '3304051103830005', '$2y$12$fSYjylypz5tm4Od3jOPTSOO1E9XxtokTCJVWGgRhYzk1TFP7AgwHq', 'TRIYONO', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1983-03-10', NULL, NULL, '2025-06-27 06:56:34', NULL),
(685, '3304085407800001', '$2y$12$Fm9zROGk3vbP/QmIprP1UeUMDiPlGaOutYFGpIzY.o2dbLLrLuEv.', 'SAKINGAH', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1980-07-14', NULL, NULL, '2025-06-27 06:56:34', NULL),
(686, '3304081311990002\'', '$2y$12$paKy7YClY0JnMecAhb09rOZ0YxgzRCsmIfqwcDH.VbZaBE3lazWVa', 'FIKRI ROMADHON', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1999-11-13', NULL, NULL, '2025-06-27 06:56:34', NULL),
(687, '3304051904750001', '$2y$12$v9bJna7VLObbu0hG5i7EqOPJCCWc4j3rL9stjI.ZxTRPqYSY9EA96', 'TOBIRUN', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1975-04-18', NULL, NULL, '2025-06-27 06:56:35', NULL),
(688, '3304054410890007', '$2y$12$9CH6B7Qww2yuqadrLQlnV.ROnONKDm8Qf3B.yuX3t8EgZnuqeAQU.', 'VINA VIYANTI', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1989-10-04', NULL, NULL, '2025-06-27 06:56:35', NULL),
(689, '3304055307810002', '$2y$12$skH0tUYLicfEu.VvwEsSieXZrEH9z/mQOq9iN5YhH2ffDcc3X17ce', 'UMRONAH', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1981-07-13', NULL, NULL, '2025-06-27 06:56:35', NULL),
(690, '3304052711970003', '$2y$12$nV1VWfWd0mF08Uh0yW1VRu2DoeCrctxFzHW/6NuhQB834ChOZdyYa', 'NASIHIN', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1997-11-27', NULL, NULL, '2025-06-27 06:56:35', NULL),
(692, '3304050604880013', '$2y$12$L2kPOYVEQ6wMeHzUMFF8w.51banP7wC6veYqqSKDp3w5PGPTbbneW', 'ELING APRI SAPUTRO', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S', 'Banjarnegara', '1988-04-06', NULL, NULL, '2025-06-27 06:56:36', NULL),
(693, '3304055108930002', '$2y$12$JPlGd.2wTpmp72Acaao8jubr3DBoGiCt28Qd6jHND5jXthfPZNWvO', 'TITI SUPRAPTI', 'Perempuan', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S', 'Banjarnegara', '1993-08-11', NULL, NULL, '2025-06-27 06:56:36', NULL),
(694, '1408072607770001', '$2y$12$BXth2akwH37WJmz5Gf70s.svnvEP8RWnz10Qv.v5fs7YCMc/5r06G', 'HAPID', 'Laki-laki', 'Wiramastra, RT 03/RW 02 Kec. Bawang', 'Islam', 'Cerai Mati', 'Petani', 'Banjarnegara', '1977-07-26', NULL, NULL, '2025-06-27 06:56:36', NULL),
(695, '3304056709760001', '$2y$12$9QmN6ngjDKP8lHDYrhPxPOtzxM7tn4QWKKGpjaS91vDJyFQYd8Y/S', 'RUSMIATI', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1976-09-27', NULL, NULL, '2025-06-27 06:56:37', NULL);
INSERT INTO `pengguna` (`id`, `nik`, `password`, `nama`, `j_kel`, `alamat`, `agama`, `status`, `pekerjaan`, `tmp_lahir`, `tgl_lahir`, `remember_token`, `created_at`, `updated_at`, `nomor_hp`) VALUES
(696, '3304057010920003', '$2y$12$GTOt1RMSSRSrbHJAvCm1D.bhBZ0HaquKoZr213.2A7eUDZ.WbSsz6', 'AMINAH', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Wiraswasta', 'Banjarnegara', '1992-10-30', NULL, NULL, '2025-06-27 06:56:37', NULL),
(699, '3304052005730002', '$2y$12$xL3iW7J3o7VepckSwM5QUuDCT/wkYlpPZ/ookHuGbcqPMNlwiDWCG', 'TURIMAN AL JUMANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Swasta', 'Purbalingga', '1973-05-20', NULL, NULL, '2025-06-27 06:56:37', NULL),
(700, '3304054911770001', '$2y$12$39QIo7AsSeglo8LjaAxC2Ohok1yOINfMQXT2.aCQR7QhRw8fQZQyK', 'KASINI', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1977-11-09', NULL, NULL, '2025-06-27 06:56:38', NULL),
(701, '3304052404950001', '$2y$12$36DKgIAt1bKU1T/cx7KzCeq2oUFaWt5fgQLo8iOnPKZh3wEreC9Ca', 'SIDIK ARDIANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Buruh', 'Purbalingga', '1995-04-24', NULL, NULL, '2025-06-27 06:56:38', NULL),
(702, '3304050209880001', '$2y$12$Y7.sOC03hvog7oorMVi2peC9KpHhick2PNhjPhys2hiNP3W1Pp09K', 'NASIR', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1988-06-06', NULL, NULL, '2025-06-27 06:56:38', NULL),
(703, '3304055707960001', '$2y$12$05czOC7HyVdYbyWRlXxV3.XCSE3b7biex8HPj6Lnc6DO.kbPBeY4a', 'YULIANTI', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1996-07-17', NULL, NULL, '2025-06-27 06:56:38', NULL),
(704, '3304050107730077', '$2y$12$wIV8L33BfsNWA3lbEkvl4OR5XAqbV9xHQMRnin9PuyLPMyxBgVyhe', 'SARIFUDIN', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Pekerjaan Lainnya', 'Banjarnegara', '1973-07-01', NULL, NULL, '2025-06-27 06:56:39', NULL),
(705, '3304056905780004', '$2y$12$OcXl5Zez1yvO9lcvqkB5oeAQHFbBhMCOV3xTqeZ6IOKyDxqqak00i', 'WASIEM', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1978-05-29', NULL, NULL, '2025-06-27 06:56:39', NULL),
(706, '3304050101870004', '$2y$12$cGlVAYwX9nKgmhHhYCP4dO7SW6dN8bDIEj430FTPT07R/yE90IRKG', 'FARIKHUN', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1987-01-01', NULL, NULL, '2025-06-27 06:56:39', NULL),
(707, '3304057005970001', '$2y$12$Sh5wMCd4Aftjziaa5NL9f.rdmQ/TAMaqI4eRV6oLqY2FWrRrtvjV6', 'LUTFIATUN N.', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1997-01-30', NULL, NULL, '2025-06-27 06:56:40', NULL),
(709, '3304055110740001', '$2y$12$zN.0jvkutS7yF70fEjBYLODHgkFocA2J5ZjT88H7Z1BShq4qJGi1S', 'SULIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1974-10-11', NULL, NULL, '2025-06-27 06:56:40', NULL),
(710, '3304050601960001', '$2y$12$2xMdARuqy6ipKWJGSdNeOuo.uw4aHdZ2OF12DymBAHrI6PRp4/Ohy', 'TOTO PAMUNGKAS', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Buruh', 'Banjarnegara', '1996-01-06', NULL, NULL, '2025-06-27 06:56:40', NULL),
(711, '3304055808740001', '$2y$12$g1hHF9ZSgqIUgbUmrNE1ou/.k9z6UuvNbWHNDmL6hd1xjXV05uT7W', 'RATMINI', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1974-08-18', NULL, NULL, '2025-06-27 06:56:41', NULL),
(714, '3304052206950004', '$2y$12$kXeOTfk.CmMqPiYxwXwB5Om0h7iXmHlAa1Z6cm6VKKSExSbS2QZb2', 'NURUL ARIFIN', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Buruh', 'Banjarnegara', '1995-06-22', NULL, NULL, '2025-06-27 06:56:41', NULL),
(715, '3304055005950001', '$2y$12$cU9T0JcapFJepcnBdjKgA.X7DfySVn8ZCFWnw751GOh3YSwYa/LzO', 'TRI SUSILOWATI', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1995-05-10', NULL, NULL, '2025-06-27 06:56:41', NULL),
(717, '3304054503730006', '$2y$12$ZRiIbYSIOoVNER1S.dqZ..HYS2SuE6OywfvP.iLDoEONr4Sp9wnIW', 'KASIH', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1973-03-05', NULL, NULL, '2025-06-27 06:56:41', NULL),
(718, '3304051302870008', '$2y$12$0R4vVOsuRJyLzMIPMRoTwOIhIwbBDpNFd/QmDRo1YJwYNe.t/88XO', 'ABDUL BASIR', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Buruh', 'Banjarnegara', '1987-02-13', NULL, NULL, '2025-06-27 06:56:42', NULL),
(719, '3304054911910003', '$2y$12$ySGXFQo5q0DUXCdgeTUYIO9ZvQptdGt9xIuQpq4Mfvwv15IBnJZ/.', 'SITI ALIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1991-11-09', NULL, NULL, '2025-06-27 06:56:42', NULL),
(720, '3304052111810002', '$2y$12$4NaR8sVAcAhIWnxxllV7DOKYh3x2pJME2OY3p46xAxdye99JiWDX2', 'SMARNO', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1981-11-21', NULL, NULL, '2025-06-27 06:56:42', NULL),
(721, '3304054604830004', '$2y$12$YviGBY3.rWXiByK4IH7qvuIPp.EWD4yagffqqsYHdiUA1rDLCQlcy', 'NAFINGAH', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1983-04-06', NULL, NULL, '2025-06-27 06:56:43', NULL),
(722, '3304050905710007', '$2y$12$tWD5FpjWbiyv/QPOK6s7ZOL0XwvBWwZu4AjSQkym6fj5SLmUENhjy', 'ROHIDIN', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1971-05-09', NULL, NULL, '2025-06-27 06:56:43', NULL),
(723, '3304055002750005', '$2y$12$jG.ImisBRV49WLlRoVxbF.dgpuL1h6/Fp5Ivaf29s.Nn2LbnR2/R6', 'KOMISAH', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1975-02-10', NULL, NULL, '2025-06-27 06:56:43', NULL),
(725, '3304050404950004', '$2y$12$Iexa4O58DNv/9ooIQcNcKufg.HSnus9Bjhc/miFivc/3Cca1cZXs2', 'FAISAL  ADI NUGROHO', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Semarang', '1995-04-04', NULL, NULL, '2025-06-27 06:56:44', NULL),
(726, '3304046110950002', '$2y$12$6KtZ8veUfwukFKsmouKWheKcxGIepLXZbRnBuBixKwH6JAqptTrPa', 'ROKHANIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1995-10-21', NULL, NULL, '2025-06-27 06:56:44', NULL),
(727, '3304051011770001', '$2y$12$dVPDJLXOL/XmCKswjkcAeOgobR4BLvIOqaR44AL2N6nJIAaNGfVvm', 'NURHIDAYAT', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1977-11-10', NULL, NULL, '2025-06-27 06:56:44', NULL),
(728, '3304054107840044', '$2y$12$sDOjgqF4xiTmURmqZ.zQqesSxenY7OUxp4klhtuqWVqJEL1uJ0gm6', 'KHASANAH', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1984-07-01', NULL, NULL, '2025-06-27 06:56:44', NULL),
(729, '3304054309950005', '$2y$12$CFr3jZRVoZKF3KiF/kyHbuq1SH/3lKPHhxBduGrYWrecle0sOYeZG', 'NURUL MUDRIKAH', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1995-09-13', NULL, NULL, '2025-06-27 06:56:45', NULL),
(734, '3304051611780002', '$2y$12$hkuyaimR35Ta.Olf27qQn.Pm7vRVS.vtf/FXqrMk.hoAVZXRGCe8y', 'SAROPAH', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1978-11-16', NULL, NULL, '2025-06-27 06:56:45', NULL),
(735, '3304050406850005', '$2y$12$itDknaQBKD.klJjCNORYB.AhjktC9izlYadqwYrD.p3TJhGriW2pm', 'SOHIRON', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1985-06-04', NULL, NULL, '2025-06-27 06:56:45', NULL),
(736, '3304055807890005', '$2y$12$BmLcA.u8zrFz2ggKfpXWQO9e3v5ySJ4tVVuI8yN6mlqKcRCj.dLjK', 'IIS WIGIANTI', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1989-07-18', NULL, NULL, '2025-06-27 06:56:46', NULL),
(737, '3304050506730002', '$2y$12$AIxGl2D9cmdxqe4d8f/qFeHyAhN/RN24/W8xEfADUid7jLnhAvkYm', 'WASIDIN', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1973-06-05', NULL, NULL, '2025-06-27 06:56:46', NULL),
(738, '3304055607830007', '$2y$12$tHPw4NQQwofT3..8Ftchi.C/kd5rfj0rBFEOPbnUnB/qqqKaNDpBa', 'AMALIAH', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1983-07-16', NULL, NULL, '2025-06-27 06:56:46', NULL),
(740, '3304054609930006', '$2y$12$99dB/aZFjEDM40Lnz6N9v.pus.QWw3KwSzDFuziGV7WdKR4IKn2Tu', 'ELISA', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1993-09-06', NULL, NULL, '2025-06-27 06:56:47', NULL),
(741, '3304056206800001', '$2y$12$1T4Eg2Yb0pnE9AcxCDtkf.86es7stjJmfeRMdvY6TTRdJyOv5KfVa', 'DARSINI', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1980-06-22', NULL, NULL, '2025-06-27 06:56:47', NULL),
(744, '3304055607780007', '$2y$12$OpEpm5elFd4HQLPy7KKO/OEv96AsmgjTkqbQz4zYIK3m2GEF0Vlhu', 'KUSMIATI', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1978-07-16', NULL, NULL, '2025-06-27 06:56:47', NULL),
(749, '3304051301860001', '$2y$12$rcYdVSD6mBRgMGvczBF5se6KGD8Ta24MiBlNoMLAGPCFkLKUxrwkK', 'ABDULOH', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1986-01-13', NULL, NULL, '2025-06-27 06:56:48', NULL),
(750, '3304055304900006', '$2y$12$/paShEaGpXna6OucKKi/eOhLcximiE7NgHEyd.mkwDmwmWGldZASC', 'WARSITI', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1990-04-13', NULL, NULL, '2025-06-27 06:56:48', NULL),
(751, '3304055012700009', '$2y$12$m8ATbQrDVw.hHpIk4vgsKeK1WasvX2CAZ7svWGDF6pLMmdibOHmxK', 'SA\'DIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1970-12-10', NULL, NULL, '2025-06-27 06:56:48', NULL),
(754, '3304050211800004', '$2y$12$w6oPY.uJsOdb8sfoir5ICORZQlZ8smQH05GBpa3T3bc7bFZ85qmTW', 'SUDARYANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1980-11-02', NULL, NULL, '2025-06-27 06:56:48', NULL),
(755, '3304055004810002', '$2y$12$lQ7SNyAHGychxPqRCpELseOzBHcgyxY9V6hFuIfXD4fo1dtJ3GS52', 'KHOMSIATUN', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1981-04-10', NULL, NULL, '2025-06-27 06:56:49', NULL),
(756, '330405050820007', '$2y$12$CWi8FeecLI8bBYtUAFCR7uTeUoQuUcmJQsTIucqJTqe6C5x/G7lYu', 'RACMAT UDIN', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Pekerjaan Lainnya', 'Banjarnegara', '1982-05-05', NULL, NULL, '2025-06-27 06:56:49', NULL),
(757, '3304054201880004', '$2y$12$cAbppxy1R62td6dcfShGzur1WCenItUG2CAuEK861C/ZxKhrGN4Pi', 'MUNGAWANAH', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1988-01-02', NULL, NULL, '2025-06-27 06:56:49', NULL),
(758, '3304022403860001', '$2y$12$e0xT5oEqV1KYuVhlGEYgR.HRyFnukFg.H.DZQnIPAI5esfHglB7cm', 'SUTARNO', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1986-03-24', NULL, NULL, '2025-06-27 06:56:50', NULL),
(759, '3304057010940002', '$2y$12$2k.NIO60b5RHFDYtqOcn.OgWrSEpTQ4kNZUGJd0tETiZn5MNL.LsK', 'MU\'MINAH', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1994-10-30', NULL, NULL, '2025-06-27 06:56:50', NULL),
(760, '3304054704770003', '$2y$12$7RyYk2u7a3scEQbt4iMO8OyLoTTD2HG4SdQobykr9vY4454O1w1AG', 'DASIEM', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1977-04-07', NULL, NULL, '2025-06-27 06:56:50', NULL),
(762, '3304055807740001', '$2y$12$mndiTFpdeVNEt/E3U0ZgvOJpvVZ2I70SUsnqcT9WVe1O0LMfqGWea', 'SUJARNI', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1974-07-18', NULL, NULL, '2025-06-27 06:56:51', NULL),
(766, '3304054303730002', '$2y$12$TMd8czCkvT3qU63F7HX4X.usJP/TuxrMJru0QA0yRw/OGE92pM2oq', 'SARWI', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1973-03-03', NULL, NULL, '2025-06-27 06:56:51', NULL),
(767, '3304051005810010', '$2y$12$xMHYE3qMFxMyh/dKz0.fpexrECFoWVxlh9iKEMikyBYT6/oTacmhW', 'KASIRON', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1981-05-10', NULL, NULL, '2025-06-27 06:56:51', NULL),
(768, '3304055007850005', '$2y$12$pm/iML05E/A8YMzK01LFOOBC82AoKGwbHrZ.Y3qXETOqq5O7PHNAW', 'SUTARMI', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1985-07-10', NULL, NULL, '2025-06-27 06:56:51', NULL),
(769, '3304052010820001', '$2y$12$tGbbbH2KHjzliEy6tjSo8eNyKZCdkZR0E18O2mHlGX/O.dzHApKnO', 'SUPADI', 'Laki-laki', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1982-10-20', NULL, NULL, '2025-06-27 06:56:52', NULL),
(770, '3304056004850002', '$2y$12$kp6hCmdpsuTrJH048n8ZNOf64j/RUJ8AyYTrity/NptfzALJ4FVnu', 'WATISAH', 'Perempuan', 'Wiramastra, RT 02/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1985-04-20', NULL, NULL, '2025-06-27 06:56:52', NULL),
(772, '3304050107930005', '$2y$12$WpKcDqFeFGjddODmILR/HedFSmEgnoKcWAiN73OlB7o3fntOK4sm6', 'MUJAZIN', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan S.', 'Banjarnegara', '1993-07-01', NULL, NULL, '2025-06-27 06:56:52', NULL),
(773, '3304051806830004', '$2y$12$uiqRJAFCyFBHyRlc1.YPyOJazXngWAAUi5jdwJONFLyInKlbBDbIi', 'AGUS SALIM', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1983-06-18', NULL, NULL, '2025-06-27 06:56:53', NULL),
(774, '3304055707870001', '$2y$12$/FDvJniheiqkcZy6TJ6cQ.h94qEV0qVN4ZtdpU8Aa602Cyenlvk7W', 'DAIROTUN KHOIRIYAH', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1987-07-17', NULL, NULL, '2025-06-27 06:56:53', NULL),
(775, '3304050204850001', '$2y$12$xFRnwNhgVh/0MzcetoGRdO.BXcFXfh7PdcVar.Bu4sstnpsuzoWV2', 'ARIF SUMARLIN', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S.', 'Banjarnegara', '1985-04-02', NULL, NULL, '2025-06-27 06:56:53', NULL),
(776, '3304050306900001', '$2y$12$nJdRqM4Vint1KxoHtUSyW.jsE8Q/dyk74.umdNTneqjdYdyF65bom', 'ISROFIK RIDWAN', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan S.', 'Banjarnegara', '1990-06-03', NULL, NULL, '2025-06-27 06:56:54', NULL),
(777, '3304051212850008', '$2y$12$rqTWgU7a3I43LauJ.G9Zcu0kZHllIdi1I4w9AzT7Ze/NG27u5LUSS', 'YUDIONO', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S.', 'Banjarnegara', '1985-12-12', NULL, NULL, '2025-06-27 06:56:54', NULL),
(778, '3304054704790009', '$2y$12$BizeRTyXIAByKurVuZadRe0s8G2vMN7robnOXJgiwa7Q4OnaBWWRa', 'NURAINI', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1979-04-07', NULL, NULL, '2025-06-27 06:56:54', NULL),
(779, '3304054306750006', '$2y$12$M1ks.ZJyxI8keNAA1DuDxeOxg52BK34Q55WhzERothCE6FpZgkQAa', 'WARSEM', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1975-06-03', NULL, NULL, '2025-06-27 06:56:54', NULL),
(780, '3304051202880001', '$2y$12$/fjQvgqvp2rYL9XzAF4ECOpQ2SiiTIhAUSypWHkTQpIVWNc5d9MaO', 'KUSTANTO', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S.', 'Banjarnegara', '1988-02-12', NULL, NULL, '2025-06-27 06:56:55', NULL),
(781, '3304056609940004', '$2y$12$x/rJK6HOCSimGbgCZpJcJeXD2rGsipI5boTRHAyKorhtGb/XvC352', 'SAFITRI', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1994-09-26', NULL, NULL, '2025-06-27 06:56:55', NULL),
(782, '3304051405800001', '$2y$12$ZMwM0l9EDyE4R964J5XEf.D3mbeDJtjDkOszun4DdgXYxtQVd0pJe', 'EKO ZAENAL ABIDIN', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan S.', 'Banjarnegara', '1980-05-14', NULL, NULL, '2025-06-27 06:56:55', NULL),
(783, '3304050207830004', '$2y$12$Eq1jx1ZI4bHctaFqje1NFuJMLK0cVkRtOvdg2UJs/PpTcZOHLX4km', 'SAEUN', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1983-07-02', NULL, NULL, '2025-06-27 06:56:56', NULL),
(784, '3304054805910004', '$2y$12$IlbwpPQxbXAGI2Jb7Uakl.YOooogfE8NMqjk5zEg07YcznSnj6t.K', 'RUSMIATI', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1991-05-08', NULL, NULL, '2025-06-27 06:56:56', NULL),
(785, '3304054207810001', '$2y$12$n2LtmuHRQEfGxQkCIrkv5uXNWEHRjfW.fZNx4eDMIpVJ4ifEl.zrS', 'SULASMI', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1981-07-02', NULL, NULL, '2025-06-27 06:56:56', NULL),
(786, '3304052002800003', '$2y$12$/iCo4DA1u8bEKC/UeO3LA.HKLK8zU0nhsuWb1uT7HqsJiT02P89MS', 'BISLAM', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1980-02-20', NULL, NULL, '2025-06-27 06:56:57', NULL),
(787, '3304050211770001', '$2y$12$1fd74UPt5YDcf5bihe3o9ukEZMmChapvW.jhJsmk.kq4A0WwqZ0dG', 'WANDI', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S.', 'Banjarnegara', '1977-11-02', NULL, NULL, '2025-06-27 06:56:57', NULL),
(788, '3304054309740003', '$2y$12$YO8d/LH1I7tu6by1/Q/igOWwfv3fgUn3s5FTpPyQfIuUp8xZbjdL2', 'ROSIDAH', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1974-09-03', NULL, NULL, '2025-06-27 06:56:57', NULL),
(789, '3304052910810001', '$2y$12$U0UsEK.AGBBAbmrdbeHKBOPf0whfADF.uAPVy6FgfYfYSUHf4TgdS', 'SAMUDIN', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S.', 'Banjarnegara', '1981-10-29', NULL, NULL, '2025-06-27 06:56:57', NULL),
(790, '3304056411900001', '$2y$12$X8hGl5uIgC.QiwJZWWj3GeWzAFkO5Q/DSwD0Z/cVCjvWoKXx79Ua2', 'KOMARIYAH', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1990-11-24', NULL, NULL, '2025-06-27 06:56:58', NULL),
(791, '3304051010830006', '$2y$12$x8YtAVNecr4M.dbACr4NOebhSE3BsQCt9ErTQefUYmytCa04nDcmm', 'KHOERUROHIM', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Karyawan S.', 'Banjarnegara', '1983-10-10', NULL, NULL, '2025-06-27 06:56:58', NULL),
(792, '3304052909930001', '$2y$12$lo7WeYfmEQLFLVf.LQf3ye65ehWz7V4CBvj8sgiaL9okPzzW/fgeG', 'JAZULI', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan S.', 'Banjarnegara', '1993-09-29', NULL, NULL, '2025-06-27 06:56:58', NULL),
(794, '3304056308990004', '$2y$12$BJFUPB4.TfFWkP2KQbCWvuUjAKPjaAo6AbeOynuFitCezReKDQZA.', 'UMSILAH', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Belum Bekerja', 'Banjarnegara', '1999-08-23', NULL, NULL, '2025-06-27 06:56:59', NULL),
(795, '3304050201880007', '$2y$12$FZ4ZZ/r4JDxv1TcAVVYqauZZmI8rlMvHEFMQGCMSAts07EFP2tmWC', 'AHMAD WAHIB', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S.', 'Banjarnegara', '1988-01-02', NULL, NULL, '2025-06-27 06:56:59', NULL),
(796, '3304057012930001', '$2y$12$CMUigqpJ0HcwSyI197gpGOddzogYF6StZHFyXgWYDg.l0QWQe6gbW', 'DESI ISWANDARI', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1993-12-30', NULL, NULL, '2025-06-27 06:56:59', NULL),
(797, '3304052709930003', '$2y$12$9azmx0PFnXUXdMTAnFOX6e7spa/y.8rVfqDCjb8nkXIBRvpMhKAiy', 'NUR SAHID', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan S.', 'Banjarnegara', '1993-09-27', NULL, NULL, '2025-06-27 06:57:00', NULL),
(798, '3304052106760004', '$2y$12$uhr3ktTE7TZJUyzgIbp3Heild2y/KtF6oTnbdv9qwayTzO67IeXbm', 'KHAFIDIN', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1976-06-21', NULL, NULL, '2025-06-27 06:57:00', NULL),
(799, '3304054107820056', '$2y$12$z0vDuu1cSJBtOjTjVHkpwuuQLiSn8bsPN1Bc8tmr3WJblbydArymS', 'WAROAH', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1982-07-01', NULL, NULL, '2025-06-27 06:57:00', NULL),
(800, '33040510100750001', '$2y$12$zr54YBer3RsJZQm.lYwz7eAVRQmvxJtmndM83smy3lJZ.Q2/KZebC', 'WALUYO', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S.', 'Banjarnegara', '1975-10-10', NULL, NULL, '2025-06-27 06:57:00', NULL),
(801, '3304055107800001', '$2y$12$0roU9Z70aKBP17j1rQCqaebMcXsoCNWoNkDdFWad4m78GFiiJEOqO', 'DARIYAH', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1980-07-11', NULL, NULL, '2025-06-27 06:57:01', NULL),
(802, '3304052801980004', '$2y$12$poPnTwt1G2ywRfRDRHpWCubZrCM7TCfr2xxNUT1LlY60vZzJPe1i6', 'ARIF NURHIDAYAT', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan S.', 'Banjarnegara', '1998-01-28', NULL, NULL, '2025-06-27 06:57:01', NULL),
(803, '3304056505750003', '$2y$12$uIUPnB5pC7rqtgLZ.Wt8pebZ8dwOpvf1KxqSvgRJVJEkhSHk4xT1S', 'SAROPAH', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1975-05-25', NULL, NULL, '2025-06-27 06:57:01', NULL),
(804, '3304054501730003', '$2y$12$PVt/o1ftKe.7vw9RvUTg5u4QzfgnfyeMjwh.HfdMW/wmukjwCz/JW', 'SATINEM', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1973-01-05', NULL, NULL, '2025-06-27 06:57:02', NULL),
(805, '3304055005930002', '$2y$12$adg1STeQo4Lnzjk173OgBuxgdofG15tEN9Lgm0ZhY3LypnLP.17Mi', 'SITI HIDAYAH', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan S.', 'Banjarnegara', '1993-05-10', NULL, NULL, '2025-06-27 06:57:02', NULL),
(806, '3304052309830003', '$2y$12$clZQ67GjLSzc/rqkzcuwMuCjS92Tl04XPYFE10kSvqvYgEmj70sUu', 'DWI SANTOSA', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S.', 'Banjarnegara', '1983-09-23', NULL, NULL, '2025-06-27 06:57:02', NULL),
(807, '3304054304890003', '$2y$12$zJhTBHgkm0HCaD2xhOwNO.nwKXYoEUeTVMAdFxHQuOwVF4Hz4dUrG', 'SITI AMANAH', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1989-04-03', NULL, NULL, '2025-06-27 06:57:03', NULL),
(808, '3304057007900001', '$2y$12$9.DfJvA5RvFKVRXfJ8ljm.29kISTdwdbjCsr5WY4d014zVTT/GcBS', 'NASKOZIMAH', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Karyawan S.', 'Banjarnegara', '1990-07-30', NULL, NULL, '2025-06-27 06:57:03', NULL),
(809, '3304056908950003', '$2y$12$GrKFjy0PVRxlz4TqGz6VOea3Dw6Qsn4vJCH8jcQoEqIC7MM1jVg0O', 'USIYATUS SOLIHAH', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan S.', 'Banjarnegara', '1995-08-29', NULL, NULL, '2025-06-27 06:57:04', NULL),
(810, '3304052607800003', '$2y$12$EdB244AUsy0nQr7WmzXAN.jHfzVninOiZ67MvVsxR0kN8hplsRafa', 'SAMALI', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Jasa Lainnya', 'Banjarnegara', '1980-07-26', NULL, NULL, '2025-06-27 06:57:04', NULL),
(811, '3304054402850003', '$2y$12$em/PGVpf7GEgEj9MTuQC9.uTyuOnuTwAHJFNdLWBH51NbB9YpNW8K', 'KHOERU YATUN', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1985-02-04', NULL, NULL, '2025-06-27 06:57:04', NULL),
(812, '3304051702850006', '$2y$12$b7AfxYq28hWSW1zPnmA9cOB/40RiuwtViL8S6lmWwMLM/lPMT599m', 'SARYO', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1985-02-17', NULL, NULL, '2025-06-27 06:57:04', NULL),
(813, '3304054808900003', '$2y$12$JUQKyGkU2Fd1azp4.VQfD.bojZphT2Jc2U17iRQRnIojTMf8YuWAC', 'MA\'RIFAH', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1990-08-08', NULL, NULL, '2025-06-27 06:57:05', NULL),
(814, '3304052006770003', '$2y$12$w/cFV3x6JScRl5DUe7q8b.yXKSLWzo7zqgf2Ci5M2PtwGduLrRJVW', 'SOFUDIN', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S.', 'Banjarnegara', '1977-06-20', NULL, NULL, '2025-06-27 06:57:05', NULL),
(815, '3304055111810002', '$2y$12$lQEehCqs2yOyyYx2eMoGXOquzo1RPqWckUeTWaLx0oHg8EjLpiQbq', 'ARSIDAH', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1981-11-11', NULL, NULL, '2025-06-27 06:57:05', NULL),
(816, '3304051106990002', '$2y$12$dYQKYEjfFRTssCqfreleKeyh7PmmIn.Z8cvfR/VLPh.4jONquUPge', 'ULIL FADLI', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan S.', 'Banjarnegara', '1999-06-11', NULL, NULL, '2025-06-27 06:57:06', NULL),
(817, '3304050101880005', '$2y$12$K7pxE.3QaYSYJYfzDNy54.0PWD4LGilTl0ocPQHvIggEMGFmF2mgO', 'WASIS', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan S.', 'Banjarnegara', '1988-01-01', NULL, NULL, '2025-06-27 06:57:06', NULL),
(818, '3304055101960004', '$2y$12$IA4tNBu5G0KEic.lxyzKfus0z9BMBNg2mB5gqPeZsk3Glb5YaagkO', 'FITRIYANI', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan S.', 'Banjarnegara', '1996-01-11', NULL, NULL, '2025-06-27 06:57:06', NULL),
(819, '3304050708770002', '$2y$12$S4IY66DcG4KPnAxiAGRvT.rMnnFqszV7C4rOxOg8bXxvUhPFfDN8.', 'KUMERI', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S.', 'Banjarnegara', '1977-08-07', NULL, NULL, '2025-06-27 06:57:07', NULL),
(820, '3304054202750001', '$2y$12$hRx92e7wzha2nA179L.53uhsqGnJ6iONc9pcdwZKRYS9M5SzvjRQC', 'YATI ISNAENU', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1975-02-02', NULL, NULL, '2025-06-27 06:57:07', NULL),
(821, '3304051307780001', '$2y$12$2VX94cfp1znTsznL0CGx..PqzvxLMuujqZXJEJez26AWbLeJpcNji', 'AHMAD MISTOD', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Pekerja Lainnya', 'Banjarnegara', '1978-07-13', NULL, NULL, '2025-06-27 06:57:07', NULL),
(822, '3304056807820001', '$2y$12$5ubgLFauZy5q4ye5Y8A2/uhhr6Pbl1CjSsEW.Io.lgcyVE6fWP7x6', 'FAIZAH', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1982-07-28', NULL, NULL, '2025-06-27 06:57:07', NULL),
(823, '3304052008820002', '$2y$12$7IzwBq/ypqpnJmF0K83pMeHCJOpHTkxu9sWKIqdfFmzvD6Q5Yqm0K', 'CARSAN TRIATMO', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Pekerja Lainnya', 'Banjarnegara', '1982-08-20', NULL, NULL, '2025-06-27 06:57:08', NULL),
(824, '3304056703890001', '$2y$12$qImAl.0sp4D2fdaUlIns5OUQtmEhZBRXFUxbGqPytta8rW85JR9S.', 'SITI FATIMAH', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1989-03-27', NULL, NULL, '2025-06-27 06:57:08', NULL),
(825, '3601021702900004', '$2y$12$RHzNNP1LxSp0dTi5SsEj6uOotN2J4imoPYpEwUntnyIHQ3fCPN0gi', 'DUDU HERMAWAN', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1980-05-05', NULL, NULL, '2025-06-27 06:57:08', NULL),
(826, '3304054511830002', '$2y$12$PpIaWPxMYgdscKhNYbcFs.XYzeTUxcBlhaGyR8S5U4K7jE.oCAu5m', 'SULASTRI', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1983-11-05', NULL, NULL, '2025-06-27 06:57:09', NULL),
(827, '3304052001010001', '$2y$12$4G7fsUDpePePXriOXGanb.4EgwqQ1sjPdmtSQlWWuLEe5mebZPDdS', 'FATHUL MU\'MIN', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2001-01-20', NULL, NULL, '2025-06-27 06:57:09', NULL),
(828, '3304054502800003', '$2y$12$GCAiqz8mJwdQjJJ7AKWT3uZP/PbfeYwhmDHAEx59yRdlu38FmDefy', 'SURIMAH', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Buruh Harian Lepas', 'Banjarnegara', '1980-02-05', NULL, NULL, '2025-06-27 06:57:09', NULL),
(829, '3304055505960001', '$2y$12$glZmWhPVm142t33vfTGn7O.2plHdbhh.IxP5Cs.6fYoSeYFzg.1gq', 'UMU KHAYATUN', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan S.', 'Banjarnegara', '1996-05-15', NULL, NULL, '2025-06-27 06:57:10', NULL),
(830, '3304054811830005', '$2y$12$K3.7ip7Z/R8EwjxkKF8bQ.xINfPhhBv3JiwpAwBg7rw81FqI4tKVe', 'PARYATI', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1983-11-08', NULL, NULL, '2025-06-27 06:57:10', NULL),
(831, '3304052503890007', '$2y$12$.cxXo/SL3qnd2WHAkXoNSOfkeKLrIuOA44YMpOdTqXGr7Id2PBuqy', 'KATAM', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S.', 'Banjarnegara', '1989-03-25', NULL, NULL, '2025-06-27 06:57:10', NULL),
(832, '3304016106860002', '$2y$12$HBFkapkGY90iGK4ht7TIgep8D8RkJY7WQ68.v5YTSzmktgbEBomae', 'SETIANINGSIH', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1990-07-27', NULL, NULL, '2025-06-27 06:57:10', NULL),
(833, '3304052207830001', '$2y$12$nYikDKe9xKFo9FyWwBXXIeV1LbIoYJUpdcBFvjvu1raODk8mKMOF.', 'TARJAN', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Karyawan S.', 'Banjarnegara', '1983-07-22', NULL, NULL, '2025-06-27 06:57:11', NULL),
(834, '3304050107900023', '$2y$12$70RoC6N/tdwweEtdZ3uFxO4DgMraZFCpfbIyfYoWJi2QM0AuSpR9a', 'MUKTAFIN', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan S.', 'Banjarnegara', '1994-07-13', NULL, NULL, '2025-06-27 06:57:11', NULL),
(835, '3304054312720001', '$2y$12$IqnXnZuFNNuttJy.i2/o6uilgVT8V1RVFjfq80CK19kO/bbKV.hjG', 'ARWANI', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1972-12-03', NULL, NULL, '2025-06-27 06:57:11', NULL),
(836, '\'3304050603730009', '$2y$12$PBci25AFVnc1wo98OGbeYOsVhj3ap4ab4Amr0og7tjVzenZr7KM1m', 'BAROLI AL ARIEF R.H.', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Perangkat Desa', 'Banjarnegara', '1973-03-06', NULL, NULL, '2025-06-27 06:57:12', NULL),
(837, '3304050607980001', '$2y$12$OamnN1Ft0Ts.2zMGTO0reefo/VzDUR8crUauZglMd0xyc6jngl/Si', 'M.CHOERUN NAJIB', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan S.', 'Banjarnegara', '1998-07-06', NULL, NULL, '2025-06-27 06:57:12', NULL),
(838, '3304052001820001', '$2y$12$v.Uei7lKXv5W7wT0Imluo.H3qDaNajxsjuUzVUzZ0Pugss4uY37ti', 'TUSLAM', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S.', 'Banjarnegara', '1982-01-20', NULL, NULL, '2025-06-27 06:57:12', NULL),
(839, '3304054705900004', '$2y$12$3GwgDQ0Ymn64W/72A6EjFOfnYBUZuVkkmGFKQFWlw/Gg10TwDjirq', 'WINARNI', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1990-05-07', NULL, NULL, '2025-06-27 06:57:12', NULL),
(840, '3304052001970002', '$2y$12$/HtRY/ciXO0RNx21jpfOUeieB3Qezcv.kuZ12mk3Y6/qs1SpW42cm', 'NGUMUL HAKIM', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan S.', 'Banjarnegara', '1997-01-20', NULL, NULL, '2025-06-27 06:57:13', NULL),
(841, '3304054201920002', '$2y$12$XcPcRkUBvheA0yzZvueaXe4tCll3sb9kcCNZXte3CEO.wp34k9nTi', 'FANIATUN', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1992-03-02', NULL, NULL, '2025-06-27 06:57:13', NULL),
(842, '3304050206850001', '$2y$12$rps/P0ZKfLe.WqMTVgkSD.vYRPSBhNwntwm0otDcifjD0CBSlVnwK', 'TOFIK', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Karyawan S.', 'Banjarnegara', '1985-06-02', NULL, NULL, '2025-06-27 06:57:13', NULL),
(843, '3304044901950003', '$2y$12$GPyuNvY8ADJzrcbAuWpMkO2rIbHpmtm4QOD6ZIBLOBeXoZGjKIgha', 'PUJI DESI SUSANTI', 'Perempuan', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1995-01-09', NULL, NULL, '2025-06-27 06:57:14', NULL),
(844, '3304051808950002', '$2y$12$Foo/Ca0ULi8sbzlv.3GO/.FIrbo0.YMk1jmUea4UmQNIkFX0da34a', 'ABDULOH SYAFINGI', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan S.', 'Banjarnegara', '1995-08-18', NULL, NULL, '2025-06-27 06:57:14', NULL),
(845, '3304052505750002', '$2y$12$Ji83UV8UxRnAnfiQdgOT7.ZW6i6J7vzwenYB5cwgFMMxqDBOd7rPq', 'MASRUHAN', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan S.', 'Banjarnegara', '1975-05-25', NULL, NULL, '2025-06-27 06:57:14', NULL),
(848, '3304051103820011', '$2y$12$de8KJSp/IEaMWjRHBsqfA.pwAyhUwHS0nHpub8OCKkMDQ.svJqSHC', 'SARIF HIDAYAH', 'Laki-laki', 'Wiramastra, RT 03/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Guru', 'Banjarnegara', '1982-03-11', NULL, NULL, '2025-06-27 06:57:15', NULL),
(891, '3304051812960003', '$2y$12$3Bf35j6ZtiKFuCcoATCCo.7NO.XC8YKz8LbQhnhN56uUuAsJUPRN2', 'MUNTAFID', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1996-12-16', NULL, NULL, '2025-06-27 06:57:15', NULL),
(892, '3304055412970002', '$2y$12$G4ofq3F/o7J2u/ELhd.NL.B20Kvbiv0LjtaddhTXDr3Q7/.q0p3HK', 'NAFISATUN', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1997-12-14', NULL, NULL, '2025-06-27 06:57:15', NULL),
(893, '3304050607900001', '$2y$12$DWzx0srf4ph7.wARJ5UvVejD2z7h0.DWonnpuQoYNaBgS0YQSsGKu', 'WAHIDIN', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1990-06-07', NULL, NULL, '2025-06-27 06:57:15', NULL),
(894, '3304106903990001', '$2y$12$LLy1IRm4mjnZmVX.5aRw7ut8VTP2W62FwGih4dzRgDNqNLLp/NJRS', 'FENTINA NUR.H', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1999-03-29', NULL, NULL, '2025-06-27 06:57:16', NULL),
(895, '3173050907750015', '$2y$12$GTR0SvopTtrY.4uTotD0Ue5jzuFHCH1VV4s8nFRW2.yGErjNoiQiq', 'ROYADI', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Jakarta', '1975-09-07', NULL, NULL, '2025-06-27 06:57:16', NULL),
(896, '3173054306841001', '$2y$12$n/S0YWuza3pL61q3Z.YEIOlvwSmAuUZPBjmilW44wkA/y5IB/p/ZG', 'NASIYAH', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1984-03-06', NULL, NULL, '2025-06-27 06:57:16', NULL),
(897, '3216130603840006', '$2y$12$XcWJTYdCFQxLT74g0xvvDeuC4VZwbUkf3Q.lUvxRrP/K56IFPQhPq', 'SAIPUL', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Bekasi', '1984-05-03', NULL, NULL, '2025-06-27 06:57:17', NULL),
(898, '3216135206910007', '$2y$12$EKqUHhJsoc3dbVtta4hoT.t5oiaQET1KGfhB/8/p5ULpX7IlULLr.', 'RANISAH', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Bekasi', '1991-12-05', NULL, NULL, '2025-06-27 06:57:17', NULL),
(899, '3304054107810006', '$2y$12$bC227V4gaOrrdcmoHZxGy.8Plri8I1tVxZwcdwYbdcE.PxHVGnuO2', 'ROHYATI', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1981-01-07', NULL, NULL, '2025-06-27 06:57:17', NULL),
(900, '3304050712880001', '$2y$12$1UqRL6pVrrvLqPvx2M8mkeBXcI0YvWpo.YE0ntOkfMZS0UQT0ayjO', 'ZAEDUN ANWAR', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1988-07-12', NULL, NULL, '2025-06-27 06:57:17', NULL),
(901, '3304051601780001', '$2y$12$i0hgp/pYpbnOANfblC6Vw.a.g7tRX/1TcWRFKRu7bdnlRlOIzLTGC', 'SURATMONO', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1978-01-16', NULL, NULL, '2025-06-27 06:57:18', NULL),
(902, '3304054404880001', '$2y$12$kq8YeE9CBVA9WWIHiNb6RO1LGHBSoYaNBwebdJjRi4tQPEPRu2k.q', 'ROHYATI', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1988-04-04', NULL, NULL, '2025-06-27 06:57:18', NULL),
(903, '3304051709850004', '$2y$12$y775wqMFcRV/4Rf5RGzO6.S2hGh2TbHiOJex9EGyHg0h.UjJ.cZ9q', 'MAHBUB AL KHUSNA', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1985-09-17', NULL, NULL, '2025-06-27 06:57:18', NULL),
(904, '3304055104880004', '$2y$12$Y6o6HM7xa09ik1jfIC0UBehbO2vCkfrhM4HrkbpzgXQInUuFLVgSK', 'DAROTUN', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1988-11-04', NULL, NULL, '2025-06-27 06:57:19', NULL),
(906, '3304050605880002', '$2y$12$SR/HYLA9CIufc9VNrGJwsuxyL2kaTush7nsaZ7j8yKQEVHgJnWWu6', 'KHAFANDI', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1997-02-18', NULL, NULL, '2025-06-27 06:57:19', NULL),
(907, '3304056505750001', '$2y$12$cdVv8OR/OmxbZfXKr/MmS.24SCVLPQiTxhK8gVuNoyMHZYBZXR75y', 'MAUNATUL KHASANAH', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1994-05-25', NULL, NULL, '2025-06-27 06:57:19', NULL),
(908, '3304052109940001', '$2y$12$WGkfmj0VannDB8wiASW4CuZHnqAVCsk/6pAzJqXG4RcoEdEHwbHNa', 'AHMAD HUSNUL HUDA', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '2009-12-12', NULL, NULL, '2025-06-27 06:57:20', NULL),
(909, '3304052904810002', '$2y$12$sngfpCt8efH5roS.q6Lfz.dlWpbJAD0Fm.t6aQMfA6QmzWMcvdrXy', 'MASNGUDI', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1981-04-29', NULL, NULL, '2025-06-27 06:57:20', NULL),
(910, '3304055511840003', '$2y$12$1TT1S1g8NVEfuU60.kvEq.UwlzwMkaY8z5Ra67zi5bTbdcUmtWAh6', 'SURTIYAH', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1984-11-15', NULL, NULL, '2025-06-27 06:57:20', NULL),
(911, '3325130303860001', '$2y$12$O.wPxj8GRQjzZL/7/XVhv.GvntsAcTIA8goKfOmtS2EDmWUE6O5mC', 'SABAR', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1986-03-03', NULL, NULL, '2025-06-27 06:57:20', NULL),
(912, '3325135305850001', '$2y$12$94L4kcbuRjLXTu11X4iRW.IaP4WeviUpTUmv2mdki0LZKhThTVvTG', 'AGUS PRATIWI', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Batang', '1985-08-13', NULL, NULL, '2025-06-27 06:57:21', NULL),
(913, '3304054411790003', '$2y$12$d8n8cjBYjlt4GJc/7ir7.ulQQUev/F.wTMUrKKESFRfmiLDoLLO1e', 'SUKINI', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1979-04-11', NULL, NULL, '2025-06-27 06:57:21', NULL),
(914, '3304054107810002', '$2y$12$.nuEm2NGDXW70qsK.Brqcuy0JUyDwfQv9KBRAk.LQxQdKcEgwIRju', 'AMINAH', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Cerai Mati', 'K.Swasta', 'Banjarnegara', '1981-01-07', NULL, NULL, '2025-06-27 06:57:21', NULL),
(915, '3304042003890001', '$2y$12$NVCkmS4IFJ.u0fp7/trxieNCZONna4UQDt1nGEXA3UuieG5oT7PNa', 'BADARRUDIN', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1989-03-20', NULL, NULL, '2025-06-27 06:57:22', NULL),
(916, '3304057112830001', '$2y$12$ivnoBl1GXsyPyrRP2dn0GO6rnsLwsVUmYDax7WtrNSoHBjAUo8r/u', 'UMU KHASANAH', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1983-12-31', NULL, NULL, '2025-06-27 06:57:22', NULL),
(917, '3304050512760004', '$2y$12$eHk382UXa4swtpsGNyDtGOpGq0jZYmViE4ZEMV1YlQ7YgBGiZpe6K', 'KOHIRUN', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Uztadz', 'Banjarnegara', '1976-05-12', NULL, NULL, '2025-06-27 06:57:22', NULL),
(918, '3304054808820009', '$2y$12$4KflAI7xz6AYj7gW18dX4eXjOMJm0xahOmzHmpTzj3uf1tRuZEWCu', 'NURIYATUM MAFTUCHAH', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Demak', '1982-08-08', NULL, NULL, '2025-06-27 06:57:23', NULL),
(919, '3304055805790001', '$2y$12$F5d.MZuUC8H1SkBnIPKZUeYxKmyH.OgZdIqbJ9u8CfJWiGk8w0pJK', 'DARSUCI', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Irt', 'Banjarnegara', '1979-05-18', NULL, NULL, '2025-06-27 06:57:23', NULL),
(920, '3304054605750003', '$2y$12$9zxeWRcpAIKtwwjmPlKfM.4tLzLB2fpYCs8DrNLk./FQfvMLpQ2rO', 'SULASTRI', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1975-06-05', NULL, NULL, '2025-06-27 06:57:23', NULL),
(921, '3304056809970002', '$2y$12$1YmT2tJkHeRnMGY86a.zFu23f7rxVT2v.ZtYk3n516IEXamB43Yaq', 'YULI DEWI YANTI', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1997-09-28', NULL, NULL, '2025-06-27 06:57:23', NULL),
(922, '3304051200830001', '$2y$12$M8twmrOUOnPdR1dpUG6S/uMfxOwlBe9S7oo8JDE5nuz6kdqKlvjs.', 'NGUNWANULLOH ', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1983-12-11', NULL, NULL, '2025-06-27 06:57:24', NULL),
(923, '3304051711910001', '$2y$12$.86dPTT/NN/UdBagfkNKROaaWslTVvgjeKfX269CkohTlxZBM3.66', 'CHAMAMU ROFIK', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1991-11-17', NULL, NULL, '2025-06-27 06:57:24', NULL),
(924, '3304050707880002', '$2y$12$l64Qii/d0z6SwYgw79DD0e8rlqe8kBGqaciv1zKw3gDFFqvT/CawC', 'ALI MUBASIR', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1987-07-07', NULL, NULL, '2025-06-27 06:57:24', NULL),
(925, '3304050702930001', '$2y$12$C5AUXiWS/7EQFq.9/IiBp.moLGNQ3Yph5LOrIPXG.JUUkLbc/C6Y6', 'AHMAD HAFIZIN', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1994-05-01', NULL, NULL, '2025-06-27 06:57:25', NULL),
(926, '3304050501950001', '$2y$12$.H5F.67noAsc1alL4ImZse7wK349r4MyGW8KL8AnCMnXJbKEJD1hm', 'CHOLIP', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1995-05-01', NULL, NULL, '2025-06-27 06:57:25', NULL),
(927, '3304051107910002', '$2y$12$ub1qr1jWJRkhOvx7vYQoY.Iog841FD9bmvh.y8ThQqiME8sfLvFQK', 'DWI AGUNG YOGA UTAMA', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1991-11-07', NULL, NULL, '2025-06-27 06:57:25', NULL),
(928, '3304051001940001', '$2y$12$UOAGn.sF6kFyu1qfenpAXO.LB1J.6B6eBJaoi9mpwl5BFJTFL8djy', 'ADITYA PRASETYA UTAMA', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1994-10-01', NULL, NULL, '2025-06-27 06:57:26', NULL),
(929, '3304051807960001', '$2y$12$/EjTm8vTQ3O7AzmkmcrjUeHJ9GTtwsq6cC5Y/fZ9AkzMSNOV8/Mti', 'SAPTO ANDIKA PANJI UTAMA', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1996-07-18', NULL, NULL, '2025-06-27 06:57:26', NULL),
(930, '3304050207770001', '$2y$12$4rP02fe7j/r1TLUisSoIoOjKO1atlqldkIsN42D9pMaZ4Q5YXSo7i', 'SOPAN ', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1977-02-07', NULL, NULL, '2025-06-27 06:57:26', NULL),
(931, '3304054510780002', '$2y$12$mfEXfwI6oJm2sZFZJ6chVum3uNz1JN/ilxWF3Xe4crnUHvJgW4.2u', 'JAMILAH', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1978-05-10', NULL, NULL, '2025-06-27 06:57:26', NULL),
(932, '3304053005930001', '$2y$12$Zrc3v1AZ9j/fjXXihqhIs.PS/hXpFOrDzBumh/vEM5sdSiOcj0BBa', 'HAMID MUHTAIN', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pedagang', 'Banjarnegara', '1993-05-30', NULL, NULL, '2025-06-27 06:57:27', NULL),
(933, '6207030102851001', '$2y$12$/F/i.aVATKyp9U8XL/FG8esndWOBeYoIJzO9JkKDHZZS7.JM0.zie', 'SUDARSO ', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1985-01-02', NULL, NULL, '2025-06-27 06:57:27', NULL),
(934, '6207034107941001', '$2y$12$wMiqP9ektG1jAuSV4WL9p.1ifTl4b9eXX4f5/4bh29EGJD5eXz1Zq', 'UNI SUMIROH', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1994-01-07', NULL, NULL, '2025-06-27 06:57:27', NULL),
(935, '3304055406730002', '$2y$12$iZJXOyaVC1Bs8HFKA9a0hODkolvOXquhuwwh546vRUNxFjFcWXNzW', 'MARFUNGAH ', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1973-06-14', NULL, NULL, '2025-06-27 06:57:28', NULL),
(936, '3304051411950001', '$2y$12$OwarYdNl25PgZcHSKy5VleHPLxcaeajSg3kNOANFpAo6mgWf7JkK2', 'MUKROMIN', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1995-11-14', NULL, NULL, '2025-06-27 06:57:28', NULL),
(937, '3304051111840001', '$2y$12$Km78pvgYWygs.zQRzTmcZu61YuD65ISFU4pGi.FB0wRWdRYmTIY9q', 'FAHRUR', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1984-11-11', NULL, NULL, '2025-06-27 06:57:28', NULL),
(938, '3304051308900001', '$2y$12$jwZ3jb2pyeLGuWUUVq/wZOC.TTs0Q/r2XcXTDG3dJMOcBHeShqBEK', 'SANGIDUN', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1990-08-13', NULL, NULL, '2025-06-27 06:57:29', NULL),
(939, '3304050106800001', '$2y$12$FlWO7xSEPnbpuiBx3XFLpOi00iwfadjwmX9Q.XB2lHEM8GzFTN.fu', 'SUTANTO', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1980-01-06', NULL, NULL, '2025-06-27 06:57:29', NULL),
(940, '3304056711790003', '$2y$12$suCWD6EThMtbyPKBj0PmnORh4RugkufPF5AyC8Vqy8ciYJNOhiadW', 'RUSMIATI', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1979-11-27', NULL, NULL, '2025-06-27 06:57:29', NULL),
(941, '3304050103740005', '$2y$12$4WXDr06OT.EBXO2ZXC5xYujvB5imQn7J9PAetfZLN3Nd7oC0aPW0C', 'MUSRIFIN ', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Cerai Hidup', 'K.Swasta', 'Banjarnegara', '1974-01-03', NULL, NULL, '2025-06-27 06:57:29', NULL),
(942, '3304050108920001', '$2y$12$CHc46QEBgQA25yCOrRTlWuHtRY6rkNieo1E01MAtJHsQAdSRU6pLe', 'KHADIK', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1992-01-08', NULL, NULL, '2025-06-27 06:57:30', NULL),
(943, '3304050102900003', '$2y$12$JwwyiOzAuBKEB5oeC79HLeUHqhVlAHHyTIuVlH2R4u0wy7GuvRqe6', 'NASIHUDIN', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1990-01-02', NULL, NULL, '2025-06-27 06:57:30', NULL),
(944, '3304042511750003', '$2y$12$kFJKpay68wC49ZH6CyDNKey.RsKzijnv9j/SCSUE4VAeS362cThwi', 'MIFTAHUROJI', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1971-08-15', NULL, NULL, '2025-06-27 06:57:30', NULL),
(945, '3304046403870001', '$2y$12$op80PTTicY.4uesFnNxAS.PtBxBm77YfcyZ06f.KDh2JjDvdR2ULm', 'NUR HIDAYATI', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1987-03-24', NULL, NULL, '2025-06-27 06:57:31', NULL),
(946, '3304051605900002', '$2y$12$df2fMJj/0UpVrX7QF8RcV.tYda4WB22G2cJIqu82mo1tpyGV8WGia', 'RUDIS', 'Laki-laki', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1990-05-16', NULL, NULL, '2025-06-27 06:57:31', NULL),
(947, '3304054706910003', '$2y$12$tqusW3akXkh8p6HxcI3V2OPNdvV3H1ZJzOomF./3Sk.bAn.dPfYpi', 'LILIS UMAROH', 'Perempuan', 'Wiramastra, RT 01/RW 03 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1991-07-06', NULL, NULL, '2025-06-27 06:57:31', NULL),
(948, '3304051406890003', '$2y$12$gpy36f7RFkSO86//Z8Of6O2ZfJCysNL0Pk18CIzknc91gwOpg9LC.', 'MUSTOFA ', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1989-06-14', NULL, NULL, '2025-06-27 06:57:32', NULL),
(949, '3304054111910004', '$2y$12$E79tHyMl5OX8RbfKp/Oa1OTMgxogtJLoAX/sf2NNWA6h1DiHHagCS', 'ANIS NGAMIROH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1991-01-11', NULL, NULL, '2025-06-27 06:57:32', NULL),
(950, '3304050609710001', '$2y$12$AWa.bXvs7rg8XdCbBRTPXOyM5fVVZvGoFBjtpe4WyUIE8xc9niO4y', 'CHAMID MUJAHID', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1971-06-28', NULL, NULL, '2025-06-27 06:57:32', NULL),
(951, '3304054603800003', '$2y$12$HmlaRSJ0.iBzvhAIN17xDeBnWfM4QRd3SqBUWxGEaJNeh/LIaFA7a', 'WASILAH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1976-04-07', NULL, NULL, '2025-06-27 06:57:32', NULL),
(952, '3304050308990001', '$2y$12$ga.WRbfg9vwquvbp3HgnYu4ZN17QPCaLOSOgNcWhiUEwLulq/3ugC', 'SOHIBUL ANWAR', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Bhl', 'Banjarnegara', '1998-11-08', NULL, NULL, '2025-06-27 06:57:33', NULL),
(953, '3304055109810002', '$2y$12$mU7lbUET.1LwM8kY7N1sy.vD5gQ7yZ5T5pOICgSivx6t.HIcnMALi', 'SULIMAH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1981-11-09', NULL, NULL, '2025-06-27 06:57:33', NULL),
(954, '3304052411000001', '$2y$12$7mG6uOw6iLdfh0G2d27iFOBDkbGESGRtdKIx8TqBMiY5clcoxnPPa', 'ROSIDI', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Bhl', 'Banjarnegara', '2000-11-24', NULL, NULL, '2025-06-27 06:57:33', NULL),
(955, '3304051804910004', '$2y$12$nyVnNboO42uZIoBZVZ1LuupXoDYOtw.EJapmdFZNobSXE3YftGOYC', 'SUWAR', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1991-04-18', NULL, NULL, '2025-06-27 06:57:34', NULL),
(956, '3304055510950001', '$2y$12$l9ZGMY.ZoSHsJGZRzcu./uzsfus1J5w7ADqXJLfLP1SVj2mHim/7O', 'BADRINGAH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'T/Bekerja', 'Banjarnegara', '1995-10-15', NULL, NULL, '2025-06-27 06:57:34', NULL),
(957, '3304052708960002', '$2y$12$Ghn0EO2I8H2Tzrhg4koxaO8mgXD6kt6xzP67L3OXXsZ6DmF8negbC', 'HARNO', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1996-06-27', NULL, NULL, '2025-06-27 06:57:34', NULL),
(958, '3304051110890001', '$2y$12$XZv5Yiv0UIsa69ooWHumUeulhvWeY3bwvYS7P1netPRVoPgdwxowy', 'NADIF', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1989-11-10', NULL, NULL, '2025-06-27 06:57:35', NULL),
(959, '3304056206930002', '$2y$12$FjaSb6vQ1AGQEVPO7yJe8.Q4z3R0exAD2x0xv.4kZrmSb0u5G87lS', 'PRIHATIN ', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1993-06-22', NULL, NULL, '2025-06-27 06:57:35', NULL),
(960, '3304050107750071', '$2y$12$VCzuhRkY04pwnt/.Zg/X2./qHx0OOlnAbO6MKDL/vH2roZVk3GqOa', 'AHMAD DASNO', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1975-01-07', NULL, NULL, '2025-06-27 06:57:35', NULL);
INSERT INTO `pengguna` (`id`, `nik`, `password`, `nama`, `j_kel`, `alamat`, `agama`, `status`, `pekerjaan`, `tmp_lahir`, `tgl_lahir`, `remember_token`, `created_at`, `updated_at`, `nomor_hp`) VALUES
(961, '3304055603700002', '$2y$12$QCqFXONplbqdT/AzAKgOhejfnZbtziYm7v5rbusKBWxfglf.M5NaK', 'KARISAH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1970-03-16', NULL, NULL, '2025-06-27 06:57:35', NULL),
(962, '3304051708980001', '$2y$12$2muuh5IAF3b/wfWdYUlv5OQoAIxXgl/LqHTC0SrTmsBswhpqPQyta', 'HIDAYATUSSALAM', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Bhl', 'Banjarnegara', '1998-08-17', NULL, NULL, '2025-06-27 06:57:36', NULL),
(963, '3304051104850001', '$2y$12$PmXRgqarB5QaMMlRQBZcfuFuaWMBOyonR4C.cNPzaLAa9qUQCZsXS', 'MISNO', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1985-11-04', NULL, NULL, '2025-06-27 06:57:36', NULL),
(964, '3304054911870004', '$2y$12$8R6/KVZeFwNQiTpB9bD3Murz/NUnTqPX9U8PofNZ7KcdVuS/xKwWy', 'HOMSATUN', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1987-09-11', NULL, NULL, '2025-06-27 06:57:36', NULL),
(965, '3304050903700001', '$2y$12$6vpFJq55m5flfKv2WI.ysuROjfsgFV.hHvhK3smwGFUEIdih.n3tO', 'RASTAM', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1970-09-03', NULL, NULL, '2025-06-27 06:57:37', NULL),
(966, '3304054603810002', '$2y$12$EAKw62Aba7Yc..Xjpe3eguI43xz2HHtyPRlWC99Ki5wnPRUKN2Ram', 'SITI MAISAH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1981-06-03', NULL, NULL, '2025-06-27 06:57:37', NULL),
(967, '3304050112780001', '$2y$12$t4QBj0Gu6WP6LFDuMMn6l.d3/DtuhSJuVret2oAqonfaMUiFBwMnG', 'DALAIL', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Bhl', 'Banjarnegara', '1976-01-12', NULL, NULL, '2025-06-27 06:57:37', NULL),
(968, '3304053007910003', '$2y$12$t5ioS.P6iT0oUH.3xKd32uM9EqEg7GLE3XPYYIGlBeH3TXKF.vVAO', 'DARUS', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Bhl', 'Banjarnegara', '1992-04-18', NULL, NULL, '2025-06-27 06:57:37', NULL),
(969, '3304050511940001', '$2y$12$aY6YZW/nhEi/iQXFGX41je95/YIrM8R0d1DQ1R2D7lssAUs9WC4vW', 'EKA LUASI', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Bhl', 'Banjarnegara', '1994-10-06', NULL, NULL, '2025-06-27 06:57:38', NULL),
(970, '3304054407980001', '$2y$12$Axz/BbJ6tR1mtp4sSw.qLuR/gsFFRwdpbf9Uv4o75sJYhmkSpX6jG', 'DELA HARTATI', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1998-09-06', NULL, NULL, '2025-06-27 06:57:38', NULL),
(971, '3304050811660002', '$2y$12$sa8QsZWyJQmPmNir8MDWxeEgiynV0kSDhrdhq/T9XfLrKHAJ/YC6K', 'ALI SARENGAT', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'P.Lainnya', 'Banjarnegara', '1966-08-11', NULL, NULL, '2025-06-27 06:57:38', NULL),
(972, '3304057012770004', '$2y$12$OstZsPgMjLF2.J0cT422luEcsCGuTYaJvvmUG.QRLqfxa9KLjNbd2', 'SITI WAROAH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1977-12-30', NULL, NULL, '2025-06-27 06:57:39', NULL),
(973, '3304050405950002', '$2y$12$ZX3iONh0lR1lAkxU8WJC9O1Yfr1VOqVha1QGIva9dLbnzoF42Faay', 'MUSDRIS SUBHAN', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1995-04-05', NULL, NULL, '2025-06-27 06:57:39', NULL),
(974, '3304050701980002', '$2y$12$uUwG0SmO6.Oi1LXHw/DEd.I/w5a63FBMIwMoJ8I7kuTF7FCNaurhC', 'NURHAMIM', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1998-07-01', NULL, NULL, '2025-06-27 06:57:39', NULL),
(975, '3304052004800001', '$2y$12$BPgtIS4gJSgOW1pTI18VAuLDWwyxUJ8QbNX5K4yAX3i052u.t0tMm', 'MUALIM', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1980-04-20', NULL, NULL, '2025-06-27 06:57:40', NULL),
(976, '3304054606840002', '$2y$12$KulIDkG0rkruUWo3zJabPe5dF8ydrmQJppHEHg8fPbKDGgposzx0e', 'ROFIKOH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1984-06-06', NULL, NULL, '2025-06-27 06:57:40', NULL),
(977, '3304054304830000', '$2y$12$S7efAqQ8Vgn6aBY9LaKCkuFCS.kUr41KfUa/L5g20sOZ/X3sJxLam', 'ISTI', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1983-03-04', NULL, NULL, '2025-06-27 06:57:40', NULL),
(978, '3304052811890002', '$2y$12$MNvEQSSN8Do4.vhx9P.sXuL8GkOc9W8uNTvM0V32deQTa53xWN/ri', 'ROYAN NASRUHA', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Sopir', 'Banjarnegara', '1989-11-28', NULL, NULL, '2025-06-27 06:57:40', NULL),
(980, '3304051001830001', '$2y$12$VtMdXu8Tlg1g0NxbNPTnZuT5aCTqgnGBrejxh6kAdvkdJRGfDth8.', 'ISHAK', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1983-10-01', NULL, NULL, '2025-06-27 06:57:41', NULL),
(981, '3304050107730020', '$2y$12$x5ANXrdkhpnxW4r3xjfCxeS7PEE9ReFS6Zoaya4XY1.UzQAWIBnwO', 'SUKARYO', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1967-09-15', NULL, NULL, '2025-06-27 06:57:41', NULL),
(982, '3304054111740003', '$2y$12$073xyr88Mc/GbglJnBQDAO0.nl3YnQVXCsZj0WpHlzBzenyYP9ik2', 'KUSTINI', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1974-01-11', NULL, NULL, '2025-06-27 06:57:41', NULL),
(983, '3304054212970001', '$2y$12$t1XmNR/qdDA6wipJYucHKuDjsDTtoAboBKBFiDhGJRTgxdhH1IzJa', 'KHAMAMI', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Bhl', 'Banjarnegara', '1995-06-10', NULL, NULL, '2025-06-27 06:57:42', NULL),
(984, '3304054302000002', '$2y$12$NsqRgcnCKOHndVocC9wrnuPiIdrprQ3NHhHybKWWnkZdrmlMrEeDi', 'SAMROAH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'T/B Bekerja', 'Banjarnegara', '2000-10-23', NULL, NULL, '2025-06-27 06:57:42', NULL),
(985, '3304051008740005', '$2y$12$XWJWp.u4d3O4MpJ5aQOGY.CHDY8QdouQrh7ujb41ITCSZzi/py6y6', 'TUHYAT', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1974-10-08', NULL, NULL, '2025-06-27 06:57:42', NULL),
(986, '3304056702820001', '$2y$12$Bu7CtsYq2S3syqtpKH40vuKmDierz1DXMh5Cl8CTl0aETGTD0FHhe', 'SITI HOERIYAH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1982-02-27', NULL, NULL, '2025-06-27 06:57:43', NULL),
(987, '3304056912950002', '$2y$12$E8W7e7H4wtrgyz8nO2grz.yV1TNzmevuJT3sQ6b8Jpe4/jpOrTz16', 'MUNFARIJAH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1995-12-29', NULL, NULL, '2025-06-27 06:57:43', NULL),
(988, '3304054802150001', '$2y$12$ZeK0BXaG0CD6Ld0tNLzBMOQX/efK4TEy8VT6eHgRYbmOSpQHOUq4e', 'MAULIDA RIANI KH.', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'T/B Bekerja', 'Banjarnegara', '2015-08-02', NULL, NULL, '2025-06-27 06:57:43', NULL),
(989, '3304052302730002', '$2y$12$UA/9tv631p2QIalcrgH8Z.cXPGcI2jnnFCep2.IFMC518DLUYwpK6', 'MUFID', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1973-02-23', NULL, NULL, '2025-06-27 06:57:43', NULL),
(990, '3304055303770003', '$2y$12$gXFuowDZurK1XwPfY2Eby.oGfAJra4iL64SWRrASaR8f6DidFzrlO', 'RUANAH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1977-03-13', NULL, NULL, '2025-06-27 06:57:44', NULL),
(991, '3304055302990003', '$2y$12$Kdk/wsaBiNKS7Dy7d2c9V.qvMumZZqr1MIS6qUptCwP6autIzhJ1.', 'UMI ROFINGAH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1999-02-13', NULL, NULL, '2025-06-27 06:57:44', NULL),
(992, '3304051601810001', '$2y$12$tFHGMomjQoigqnKfYDfAXOHrIZz32Jd2YYpmmDln0/i9xW6Ljc1Qq', 'SUWASIS', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1981-01-16', NULL, NULL, '2025-06-27 06:57:44', NULL),
(993, '3304055310840001', '$2y$12$d963BTxSRZXtHLPS7239v.3iUOF31FfAkcClZ9N2.TzeQ4I1Fouc2', 'WILASTRI', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1984-10-13', NULL, NULL, '2025-06-27 06:57:45', NULL),
(994, '3304050502700001', '$2y$12$qVc4SIIsKtPs9gXxFaWeouaDn4xudyKoJrITWHLzn.Xi786p08E4i', 'AHMAD ZAIM', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1970-05-02', NULL, NULL, '2025-06-27 06:57:45', NULL),
(995, '3304054307760005', '$2y$12$sFb3PWpzAIhua5e88EGu1uRv7R2Bb3d77mmAhtEXWYZMGwtsGmlz.', 'SUIROH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1976-03-07', NULL, NULL, '2025-06-27 06:57:45', NULL),
(996, '3304057006940003', '$2y$12$5N90Xc60.a/f.C85qLCMge6OT/if1.bvQFulbXB8G3a1FbW/FpDMm', 'YUNI NAZIFAH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1994-06-30', NULL, NULL, '2025-06-27 06:57:46', NULL),
(997, '3304053007990001', '$2y$12$C6/rHosGJDaUS2vSZCxZqeQiVDDglUVncTOCEaWrtSIj5eFhqNWwu', 'NAIBUL KHOIR', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Bhl', 'Banjarnegara', '1999-07-30', NULL, NULL, '2025-06-27 06:57:46', NULL),
(998, '3304051509330002', '$2y$12$9B1.zUSwKt/nrcqWvbaQ.e3xe3N0vzh4YyDfWtiuXhSmvy9ww5i5u', 'SLAMET', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1993-03-15', NULL, NULL, '2025-06-27 06:57:46', NULL),
(999, '3304051106890001', '$2y$12$XKP3ti4qasd6a.fGKO0z6ePXVLgzqRTEBWjtuwr9gTKmQzzlPVXm.', 'RUDI HAMZAH', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1989-11-06', NULL, NULL, '2025-06-27 06:57:46', NULL),
(1001, '3304050207980003', '$2y$12$mEvMyso6ND5G/sV6dR1azOxpQkj95Q9x29JC.EmbArWnO/Rfb1gF.', 'SELDI T.', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1998-02-07', NULL, NULL, '2025-06-27 06:57:47', NULL),
(1002, '3304050107360005', '$2y$12$8ODyXyNNwXe.N.40GjLMYewxd3hhxV2JTxECp150c5E5yEhL1pcsa', 'ASHARI', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1936-01-07', NULL, NULL, '2025-06-27 06:57:47', NULL),
(1003, '3304054107470005', '$2y$12$3v8Je5qGGB7beItPXRCzc.vTPStHxUp1.SMGqrbF6l7G/L1mVGx8C', 'ROMINI', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1947-01-07', NULL, NULL, '2025-06-27 06:57:47', NULL),
(1005, '3304051710700003', '$2y$12$kk/biznPTwi5L/ZpGqDUoeuHZ0M92zmkC7UeyV8kntu.1jXBP8q/u', 'NGABDUL LATIF', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1970-10-17', NULL, NULL, '2025-06-27 06:57:48', NULL),
(1006, '3304054512710001', '$2y$12$DfBfXCjR5sZ.orpEl9SBUOgj5V6fkPOWmXHYXylboHmPQrXjnrXhS', 'TUMIRAH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1971-05-12', NULL, NULL, '2025-06-27 06:57:48', NULL),
(1007, '3304054606960001', '$2y$12$E8LXow6wv0GwrC7OJfPW2OWS3yPYgQzFj.78jylQ36d3EEY0ZIeh2', 'SOBIB ALFAJA', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Bhl', 'Banjarnegara', '1996-06-25', NULL, NULL, '2025-06-27 06:57:48', NULL),
(1008, '3304054803060001', '$2y$12$nFvuXu0lQTCmeATYd6n72OdUEbEHzufQz0lh7vtMYMUm9qyp34pnq', 'ALI MA\'SUM', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2006-08-03', NULL, NULL, '2025-06-27 06:57:49', NULL),
(1009, '3304051503480001', '$2y$12$99GkcBa1Oix0N8cdIw5KTOqH2XLn.TGnA8PURdn/idmNkGOdVOHZS', 'SUMIJO', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Petani', 'Banjarnegara', '1948-03-15', NULL, NULL, '2025-06-27 06:57:49', NULL),
(1010, '3304052002860002', '$2y$12$3z0EIykhCdFAEL02k5Zjj.W5MYvixXKs3nPr8j0yt0u1RKZwVfl3O', 'ARI ZAKARIA', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Bhl', 'Jakarta', '1986-02-20', NULL, NULL, '2025-06-27 06:57:49', NULL),
(1011, '3304054711840002', '$2y$12$zC9q9XaF7yv5jx6DQ4EsO.pq6Z2LOa2joOKs8NZAa/OW7AqAPImEi', 'AL HIKMAH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1984-07-11', NULL, NULL, '2025-06-27 06:57:50', NULL),
(1012, '3304050204830006', '$2y$12$AMNcXE67W4jrAKLBigMMMO2XrmVvaDzOVANX14D3TtHPy5p76jA2.', 'TAJIRIN', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1983-02-08', NULL, NULL, '2025-06-27 06:57:50', NULL),
(1013, '3207366707890002', '$2y$12$Qy1WNE4TvKi8uhQ7iMGrsubPyiVxiwLN1LWWRBnW3OzEEUl4k01/a', 'SRI MUFLIHAH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Ciamis', '1990-07-27', NULL, NULL, '2025-06-27 06:57:50', NULL),
(1014, '3304056303120001', '$2y$12$85ZRP0dapIc.RAQzFLA8q.aiYtU4w6UsIeSJWhLIeSjY3Pok/cf3S', 'ROFIQOH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Irt', 'Banjarnegara', '1987-10-04', NULL, NULL, '2025-06-27 06:57:50', NULL),
(1015, '3304050309800007', '$2y$12$CAiOW5tuuh0agZIMT2LoHOAfDvY4L00tLpYRcdAlmiN0znhC3GfNu', 'MUSTAJIB ', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Cerai Hidup', 'K.Swasta', 'Banjarnegara', '1980-03-09', NULL, NULL, '2025-06-27 06:57:51', NULL),
(1017, '3304052912800002', '$2y$12$ehkAkvLiAyZUN317JSYMi.KH3udGBwssgy3LYsvCM5c8sZb/wEXYy', 'SULAEMAN', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1980-12-29', NULL, NULL, '2025-06-27 06:57:51', NULL),
(1018, '3304055207810003', '$2y$12$96jMjXzKBv2gocvA7W9by.BUO46OBBVg7kyRJnSe3wsG8eo4ndKWy', 'DARSINI', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1981-12-07', NULL, NULL, '2025-06-27 06:57:51', NULL),
(1019, '3304055002880005', '$2y$12$H2rD2mn0ypogwjUp2W6QNOAL9blH.CNKo/ga4T7aB73B40KGJZ5pa', 'SUWARTI', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Irt', 'Banjarnegara', '1988-10-02', NULL, NULL, '2025-06-27 06:57:52', NULL),
(1020, '3304050206900002', '$2y$12$4smsbDwt6AQ.dAMHvvXQpeUB3ZFbuOHy.CjAYzY3GNxoq63hAh0jm', 'MABRUR ANFAT', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1990-02-06', NULL, NULL, '2025-06-27 06:57:52', NULL),
(1021, '3304055704930003', '$2y$12$u8fUNgV7yp5KVlPUL72ni.xmUVth60x0iFDXIeLgshXzMMXrKxuJi', 'NAFINGAH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1993-04-17', NULL, NULL, '2025-06-27 06:57:52', NULL),
(1022, '3304051507950004', '$2y$12$ztZffJ2daTp4mNnfk1OOp.50nBa.tnLDNv7RLNzqXKWCg0O9iBeR.', 'MAFTUHIN', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1995-07-15', NULL, NULL, '2025-06-27 06:57:53', NULL),
(1023, '3307120607770009', '$2y$12$s5b.jIAVsPA4D/bh5bqzIOsSg7QR2fD6qdHf7N9xtrTocRb0Hoha6', 'MASRUHIN', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Bhl', 'Wonosobo', '1977-06-07', NULL, NULL, '2025-06-27 06:57:53', NULL),
(1024, '3307125607780004', '$2y$12$RMzkLC1gXxTcLGhRtz3fIuU77sqJ4nieUXN6FSOSRQDaEHel8R/mW', 'DASWI', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Wonosobo', '1978-07-16', NULL, NULL, '2025-06-27 06:57:53', NULL),
(1025, '3304051711800005', '$2y$12$GtRj/dx7Sey44FjvzfR8XeSkf2yDQ38Bkb/XtaC6KBN0ZBi67MsiW', 'CARTAM', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Petani', 'Banjarnegara', '1980-11-17', NULL, NULL, '2025-06-27 06:57:53', NULL),
(1026, '3304050810950001', '$2y$12$wJVhcQeBPVmS2I13j3mk0uf1Xaxb3NpLOUPfn5nffGbrreN4ZuF7e', 'SAMSI MUSIRI', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Bhl', 'Banjarnegara', '1995-08-10', NULL, NULL, '2025-06-27 06:57:54', NULL),
(1027, '3304050802070001', '$2y$12$gfTyFysSMNhlwyecXWWQfO/1BsSiZKZgEF2zfhqhGPUPhjD0gdkSu', 'FIRMAN FAUZI ADIL FIQI N', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2007-08-02', NULL, NULL, '2025-06-27 06:57:54', NULL),
(1028, '3304052611900004', '$2y$12$xh.AUqKEQxX7d2kH5Y1a/e3yI4BUy4bAv2VGnYTzwOKFkCjQgT1Xe', 'IIS NUR FATAH', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1990-11-26', NULL, NULL, '2025-06-27 06:57:54', NULL),
(1029, '3304051106910005', '$2y$12$LyYeJJ87buh/20WbA8YruenVNbOaz2AtJQdrTSswrEH2GvjEyeuIi', 'MASNUR AZWAR', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1991-11-06', NULL, NULL, '2025-06-27 06:57:55', NULL),
(1030, '3304050107920003', '$2y$12$mnBplgpHlkTiu/hA9RK64.HOBIQIWUn7x40hH472wTtiC7K1l59UG', 'SAHID AL MA\'SUM', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1992-01-07', NULL, NULL, '2025-06-27 06:57:55', NULL),
(1031, '3304054804920002', '$2y$12$F9GX7wn01DYizlp1uTyB1unjBcI.8DGI.XeXhAG.HF4AJ8O3uJyZi', 'ALFI MUAWANAH', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Cerai Hidup', 'K.Swasta', 'Banjarnegara', '1992-08-04', NULL, NULL, '2025-06-27 06:57:55', NULL),
(1032, '3304051203650006', '$2y$12$vLIaffc0LQSQqNG4QTWm3eiIoZQl8P0d2UBq0pV5bXcq8a6Atwf.G', 'MARLAN', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1965-12-03', NULL, NULL, '2025-06-27 06:57:56', NULL),
(1033, '3304054209720001', '$2y$12$OLI3krdpNZHmIjS.gRt8bO8FYefEe3WSrIfQqZoqSj.8URpbUiiQ6', 'ROHINI', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1972-02-09', NULL, NULL, '2025-06-27 06:57:56', NULL),
(1034, '3304050505930002', '$2y$12$erSS/zSGrj9LX.SPwkMp5O0U0/U/Aj2biujylGVLsfgLVY9rRRBZ6', 'USTADUN MUZAKI', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1993-05-05', NULL, NULL, '2025-06-27 06:57:56', NULL),
(1035, '3304050802990003', '$2y$12$SJ43MAMHApy2Dqf12AjLcuT1ff7F9lbFPRApsqyXdRVNfU5UGb3Bu', 'ROMADON', 'Laki-laki', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1999-08-02', NULL, NULL, '2025-06-27 06:57:56', NULL),
(1036, '3304054311960004', '$2y$12$WIjDdqLrOJ0.YA5Pb2SjtexqLfV9A7FnDBcj0YyyiNQutRTcGwhTa', 'TAKBIROTUN', 'Perempuan', 'Wiramastra, RT 03/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1996-03-11', NULL, NULL, '2025-06-27 06:57:57', NULL),
(1037, '3304050107700006', '$2y$12$w2htQdM8Teo.4e6v9/oK/ud76qwFipQgyxxG/bPosk3Vrldi3u5Gu', 'KASTIM', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1970-01-07', NULL, NULL, '2025-06-27 06:57:57', NULL),
(1038, '3304054805750001', '$2y$12$GUEJj6iMV75pNDNlv4sz7OA2/h7oMgnZ09Vh0jGv/GtRm86zhVCmu', 'HATINI', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1975-08-05', NULL, NULL, '2025-06-27 06:57:57', NULL),
(1039, '3304056803950001', '$2y$12$HHtvQTpEAPMASJeHNagqd.uXtY97y8okCOnhbXD1bJ3JWF8YUWSJ.', 'MUNTOFINGAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1995-03-28', NULL, NULL, '2025-06-27 06:57:58', NULL),
(1040, '3304042106860002', '$2y$12$vIXv1NcIRweYgre3Dn4JJOwOyZJy1XnOzwnxl7SkTi0eO1Y7upjQW', 'DARYO', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1986-06-21', NULL, NULL, '2025-06-27 06:57:58', NULL),
(1041, '330405505900001', '$2y$12$F28.woKUYfxPhmXPBLcHiu2/pq3N/acbdbOOPyVdM3t.KFRn9Tz6q', 'TASRIYAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1990-05-15', NULL, NULL, '2025-06-27 06:57:58', NULL),
(1042, '3304050603630005', '$2y$12$O87D2i1m0GZw5FyQReh1Du4kmLM9la0JLGaLRbcSS4Ubk/I.XmJKi', 'ROHADIN AL DASLIM', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1963-06-03', NULL, NULL, '2025-06-27 06:57:58', NULL),
(1043, '3304055304670004', '$2y$12$NZ99Vrh8K1h02gV0CLvQnO696TUeKGc5/E0bFh3YLSPmowM326y6W', 'ROSIAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1967-04-13', NULL, NULL, '2025-06-27 06:57:59', NULL),
(1044, '3304050105930005', '$2y$12$mnOYEGgix0hIcdsAauPhbOlTLw1Em//lo8GSwPBpivV8mY7.NexDG', 'BANDELCAHYONO', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1993-01-05', NULL, NULL, '2025-06-27 06:57:59', NULL),
(1045, '3304050406990002', '$2y$12$OXLcpnuNvURwh0690nwBxOKk50pCE8PlEWlSF4HDu1weXZRKjZV3u', 'AHMAD SURAHYO', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1999-04-06', NULL, NULL, '2025-06-27 06:57:59', NULL),
(1046, '3304056008720001', '$2y$12$W7472paJQyRV6MTq4J0YP.qUvWOXnQpnRK2LnDv/CHQdQ37brvBoq', 'MUNTOMAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Petani', 'Banjarnegara', '1965-01-07', NULL, NULL, '2025-06-27 06:58:00', NULL),
(1047, '3304050703870004', '$2y$12$lvBX1q1Cg/TZSmG5KIg4QugSQw/cEcj9mX/C7ZWkluivXGV9gMAeW', 'AWALIN', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1987-07-03', NULL, NULL, '2025-06-27 06:58:00', NULL),
(1048, '3304056110890002', '$2y$12$d7wtTdwhDy9aMyuf2hdbce37AfKPbH.DUpILTvGPCubrcz2bKcF/K', 'SANGADAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1989-10-21', NULL, NULL, '2025-06-27 06:58:00', NULL),
(1049, '3304050501670003', '$2y$12$7i4U8S6KHufxmJm5Ig6fluYsVFuI5YBwJZE1ZwuTXToiWbVwEKl6C', 'NUR HASAN', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1967-03-01', NULL, NULL, '2025-06-27 06:58:01', NULL),
(1050, '3304054702700002', '$2y$12$Y2vvnCdF3KU7mdtwUPfKm.zlZRkbTL3dajprow3zHHFU0woeA4G4.', 'SITI FATIMAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1970-07-02', NULL, NULL, '2025-06-27 06:58:01', NULL),
(1051, '3304050607940003', '$2y$12$r1X66JJ6oG1I7TeGzxWc/OLgZCdGCV4IfztdLZz7ntcjF8bfT/DF6', 'IBNU NAJIH', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'B/T Bekerja', 'Banjarnegara', '1992-08-08', NULL, NULL, '2025-06-27 06:58:01', NULL),
(1052, '3304050603810006', '$2y$12$svhL1SD4tHG8sK7wcF36eenKE7vqIJxIdeE31DaTH.hrvDAISVXm2', 'ACHMAD SUYATIN', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani ', 'Banjarnegara', '1981-06-03', NULL, NULL, '2025-06-27 06:58:02', NULL),
(1053, '3303054310830001', '$2y$12$cyf7i0T8iDg9k2bH/uC7tu96dMGaurzjwUPwWSe40hwGk.AFk3gve', 'ISAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1983-03-10', NULL, NULL, '2025-06-27 06:58:02', NULL),
(1054, '3304050704750003', '$2y$12$AUYdD36W4csi1kEvvDyQ3eBXOFy14kmfE/1EL9h.o0EVI37yrBPFe', 'RATMO', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1976-07-04', NULL, NULL, '2025-06-27 06:58:02', NULL),
(1055, '3304054701820002', '$2y$12$9vXLvUDBwir3farCzteKueGyvCrCdl1v/ET1vZDRP3RPTQtokaIXO', 'KURIAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1982-07-01', NULL, NULL, '2025-06-27 06:58:03', NULL),
(1056, '3304052012880001', '$2y$12$jW86T00yNmL6MQ/6yFA46OqLyczp7MEKSjgd6N2aBWgjW0yg/I4ri', 'RIANTO', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1988-12-20', NULL, NULL, '2025-06-27 06:58:03', NULL),
(1057, '3304050609790001', '$2y$12$OeN2R87MA1NzAn6L8jnp0e1de6NMyHcGwcWv6k23.oMJkkutu3ulm', 'WARSO', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Petani', 'Banjarnegara', '1079-09-06', NULL, NULL, '2025-06-27 06:58:03', NULL),
(1058, '3304054609790002', '$2y$12$bNfj9X9RJtYRzFY0fDC20.nO2VaMh1PLUCp8ns8ubmsl7/UqsIU0i', 'SALAMAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Cerai Hidup', 'B/T Bekerja', 'Banjarnegara', '1979-05-09', NULL, NULL, '2025-06-27 06:58:04', NULL),
(1059, '3304051105500002', '$2y$12$HRio7OiYi5jnKTZ5aCajJ.5KZXhnAWwgLSxdW5w5HoNfPZzktnHNO', 'DUL HOLIK', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1950-11-05', NULL, NULL, '2025-06-27 06:58:04', NULL),
(1060, '3304051410660001', '$2y$12$73NQgQgH8iOPFSs8.xrKYOEzO9/nlxHoMTK7RHaxbgjUwmRHv7jWC', 'KHOERUDIN', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1966-12-31', NULL, NULL, '2025-06-27 06:58:04', NULL),
(1061, '3304054812810002', '$2y$12$DaBI6q3svC01V8dH35sLGuNDkgqlWvf7NptE0uPlI47R9hIL91HWe', 'JAENAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1981-12-30', NULL, NULL, '2025-06-27 06:58:05', NULL),
(1062, '3304050608810004', '$2y$12$NqPPdTLtZSTcIjnY7806hexXcpn9c9IoLhfocwLfvU.nEj/38ZOqy', 'MUSOLI', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani ', 'Banjarnegara', '1981-06-08', NULL, NULL, '2025-06-27 06:58:05', NULL),
(1063, '3304055106880001', '$2y$12$K4YUR7l3Ng6ZHDTw.O6oT.VxIE.TUC0RVU8ym5j3iBgY.2uppoSzW', 'RUQOYAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1988-11-06', NULL, NULL, '2025-06-27 06:58:05', NULL),
(1064, '3304050107930002', '$2y$12$BrzVVkXc6WKVK4ajnat2f.mkAB2q41gtGfh2ACldwr6LI7X5uoa5W', 'MAHMUB', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1993-01-07', NULL, NULL, '2025-06-27 06:58:05', NULL),
(1065, '3304051207920001', '$2y$12$50X4t02ghLwLwhCCc.XDf.8pIdD3tDgvcySCFOaCeCgVsHxXJk9vO', 'FAKIH MUZAKI', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1992-12-07', NULL, NULL, '2025-06-27 06:58:06', NULL),
(1066, '3304041306910003', '$2y$12$lMV4tFKnxtmFUveAiOfVrOAWK.43.aEt8NqIaJLFoKj1OtnDuInaa', 'RAFIQUL HASAN ', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1991-06-13', NULL, NULL, '2025-06-27 06:58:06', NULL),
(1067, '3304057110930001', '$2y$12$31JrOxdnot3UVfiQVjUgpeOT27gmkqsN3KivZDafMWgZX8p478LNC', 'NAFIS KHUMAIROH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Guru', 'Banjarnegara', '1993-03-11', NULL, NULL, '2025-06-27 06:58:06', NULL),
(1068, '3304051906720004', '$2y$12$fhfNn7oQBNLTNuh7tqIgu.E/FgRFD0ofZK2DL8p./1bVABTTp6A.y', 'MUHAMMAD MUHALIP', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Perangkat Desa', 'Banjarnegara', '1972-06-19', NULL, NULL, '2025-06-27 06:58:07', NULL),
(1069, '3304054611730002', '$2y$12$uEcbfp2hi53Oc0.HssVCfujhyN3H1Zeu4IDEaSFsI6Sx3ZZw7Wybq', 'MAINAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Penjahit', 'Banjarnegara', '1973-06-11', NULL, NULL, '2025-06-27 06:58:07', NULL),
(1070, '3304050101920008', '$2y$12$6ElWD8Y44jb81ptV87KtvuTqoPyZ94uYcfXO/vms32Nd9ThEfLBfK', 'AHMAD KHOZIN', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1992-01-01', NULL, NULL, '2025-06-27 06:58:07', NULL),
(1071, '3304051904800004', '$2y$12$u97OVhdPTwiP1D31iMzVqOYrMXoXWpTnz3umN0V3TK6shpFrXji/C', 'WASIS', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1980-04-19', NULL, NULL, '2025-06-27 06:58:08', NULL),
(1072, '3304056212820001', '$2y$12$j5oGWPCwldcQs.GyZX4MLu.ArU0EuQzaMIXdzICb9mdshxjex9QSe', 'NUR AENAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1982-12-22', NULL, NULL, '2025-06-27 06:58:08', NULL),
(1073, '3304051410790002', '$2y$12$cF6VVv4AG6Dnil41/psYeuuHWNpUGj9NkFfIM1GvRxBR4txgOcw/6', 'TARYO', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1979-10-14', NULL, NULL, '2025-06-27 06:58:08', NULL),
(1074, '3304056105850002', '$2y$12$IKGmFNeOA/xS0mkjF2MjfOgIpIUHqu4dGMdwsgANNQFbkhesAZzwG', 'SUWAIBAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1985-05-21', NULL, NULL, '2025-06-27 06:58:08', NULL),
(1075, '3304055601980003', '$2y$12$qKhO0qJptcfEwzvNR9NOfuqprh8n6nQJt6fSUtVM.8SuTItcn.tsW', 'MAR\'ATUS SAMANIYAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'B/T Bekerja', 'Banjarnegara', '1998-01-16', NULL, NULL, '2025-06-27 06:58:09', NULL),
(1076, '3304055607990005', '$2y$12$jY2xEsxOYZswv8swG1k3q.OdGe9.qO3PDKpFNtqfua1QfppNucSK2', 'TISNGATUN KHASANAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1999-07-16', NULL, NULL, '2025-06-27 06:58:09', NULL),
(1077, '3304051204840005', '$2y$12$QnwLHYArxT1C3utI2nYD3eL7hdm0.93Ba6WA2.wfvI06DBjroaabq', 'KUMERI', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1984-12-04', NULL, NULL, '2025-06-27 06:58:09', NULL),
(1078, '3304054301900003', '$2y$12$lfqzD0bVoqxKJcN9T4gew.IFl4PARjmi2yJ3VZWHnAQuH2xt9Vej2', 'NURLAELI', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1990-03-01', NULL, NULL, '2025-06-27 06:58:10', NULL),
(1079, '3304054103630001', '$2y$12$mKkumUKhOOA5woEBXDy2KulgyJ1uJti8QsTWjc2UHXlfFs0NTptfK', 'WASIEM', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1963-01-03', NULL, NULL, '2025-06-27 06:58:10', NULL),
(1080, '3304050606830005', '$2y$12$K6UXIOTDJ57mK8tPVXHmN.sxjrqUXRXSvH7SsJmohPBtsKIQXqSKS', 'ROSIKUN', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1983-06-06', NULL, NULL, '2025-06-27 06:58:10', NULL),
(1081, '3304051303870001', '$2y$12$TX9lLuIxAh..jbM.iqsEJuDo0UXR/sTcCwUFhktcsI2SBymdfc5TW', 'AGUS SUSANTO', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1987-03-13', NULL, NULL, '2025-06-27 06:58:10', NULL),
(1082, '3304056707930004', '$2y$12$ENwj/NXZpl/a/rO7.WNTjO1vwo3SktEYSSGw/1Eke/UtsHuMIDuNy', 'SOLIHATUN', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1993-07-27', NULL, NULL, '2025-06-27 06:58:11', NULL),
(1083, '3304051030200001', '$2y$12$.W0Wedalw9.jK.WZcD60L.LIMbYjNd44JM9LOviWUUfLvCTYy2ZKC', 'MUFLIHUN', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '2002-03-31', NULL, NULL, '2025-06-27 06:58:11', NULL),
(1084, '3304051206700007', '$2y$12$biMiOFDr5ue7aP4qovwBku6PRrVH.tL9fX90FWuRtQDlc9XZrnPN.', 'ARJO SUROSO', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1970-12-06', NULL, NULL, '2025-06-27 06:58:11', NULL),
(1085, '3304055509760001', '$2y$12$fZW9gm.8ko.7EKRC.cQhWur8olTXmQrv2wSHFCdiVqv6BE6Z4JIZ2', 'UMSIKAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1976-09-15', NULL, NULL, '2025-06-27 06:58:12', NULL),
(1086, '3304050512980002', '$2y$12$uBKCfLEaQgn7fG8o3M1qqu4XMA267EgckMuLIat4rcEwJvtgQp5jC', 'AMAD NUSUR', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'B/T Bekerja', 'Banjarnegara', '1998-05-12', NULL, NULL, '2025-06-27 06:58:12', NULL),
(1088, '3304044507930002', '$2y$12$zeSWtscP1Kq6ixsuJ6hfcuLnBSeZH2M/tuJmZq1E1sIAOgXTn3YM.', 'NGAJIJAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1993-05-07', NULL, NULL, '2025-06-27 06:58:12', NULL),
(1089, '3304051602800006', '$2y$12$wlH2lAIxQ9tzcQPUgypZpOmDilJpM0Omw5CwmZ.vttBtQSyQlFcK.', 'AHMAD RIPTO', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1980-02-16', NULL, NULL, '2025-06-27 06:58:13', NULL),
(1090, '3304055005850003', '$2y$12$IeU41ghQ4KfaS4k4PgszSOswpM/L44mEAK9UcUHUCtwYWctPpEwYa', 'TUKIJAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1985-10-05', NULL, NULL, '2025-06-27 06:58:13', NULL),
(1091, '3304051406860001', '$2y$12$XgTlS6U6r9C8HG1Ane2bk.PtGOho3j30j4XEPqW1njjFvcmGonDNi', 'BADAR', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Bhl', 'Banjarnegara', '1984-11-13', NULL, NULL, '2025-06-27 06:58:13', NULL),
(1092, '3304055603920001', '$2y$12$yKbIO6olcUNm4bvpsPBA6egAAn5vRJfDl96Y6q.OAmj65GTbHSOw6', 'LISA NOFANI SUPRIYANTI', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1992-03-16', NULL, NULL, '2025-06-27 06:58:14', NULL),
(1093, '3304051306860001', '$2y$12$GISqiKAKxErM.mAzSd5KD.dPgA8NDVS/tH0lTKvMgAIVC0En/iUxm', 'WARISMAN', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Bhl', 'Banjarnegara', '1986-06-13', NULL, NULL, '2025-06-27 06:58:14', NULL),
(1094, '3304055706850001', '$2y$12$TXFWp8U5I2hiqRNXuXsg5.LMFaCXoVcb8iLtC4ocYtD2.DVMDldXy', 'RUMIDAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1985-06-17', NULL, NULL, '2025-06-27 06:58:14', NULL),
(1095, '3304051002870002', '$2y$12$pH1mhHtWzMv8KiCK9BrZjOFmB6IC7KJTz.n4.B2dbQEB57/pQD86S', 'TASRIFIN', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'T.Batu', 'Banjarnegara', '1987-10-02', NULL, NULL, '2025-06-27 06:58:14', NULL),
(1096, '3304054106930006', '$2y$12$1HmVPJX/Msf0KqOKVJ51UOyQXi5ziFAd0HtM1/dr8OfvzjCBmceGe', 'MARHAMAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1995-01-06', NULL, NULL, '2025-06-27 06:58:15', NULL),
(1097, '33040507-4740007', '$2y$12$Eya0itllRsEcfKrdyKptJeNtgjvmItkG8oJvWVTu8sjUqFbwcSJvq', 'NUROHMAN', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1974-07-04', NULL, NULL, '2025-06-27 06:58:15', NULL),
(1098, '3304054107730072', '$2y$12$s3sasfZ1y2oN/byz7dSnn.GBxfA7iycsDZwjgPC6F9m2f9oL9l5fS', 'KIPTIYAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1973-01-07', NULL, NULL, '2025-06-27 06:58:15', NULL),
(1099, '3304054807000005', '$2y$12$J9UAY9Mewg.gMIQnRxCg3OS4Rb8WG2ye3EVdOdnXq5QOLRaT8HmMO', 'JULIYAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '2000-08-07', NULL, NULL, '2025-06-27 06:58:16', NULL),
(1100, '3304050104760002', '$2y$12$EsHEond3CisF.G.lU/QQ4OeLSjBa7LBTtGDH.wb2YnOqEHy0f4qdm', 'SARENGAT ', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1976-01-04', NULL, NULL, '2025-06-27 06:58:16', NULL),
(1101, '3304055201830007', '$2y$12$Y.E3b4askof1e1q43WKhqu2EgGpy9HW6f7MXJhb5LVcSmbeqFZ7XW', 'ALFILAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1983-12-01', NULL, NULL, '2025-06-27 06:58:16', NULL),
(1102, '3304050709730001', '$2y$12$t4hD.9V.6T/jpz/gSBMIq.wb55WPp7pAsx2N7djNiW1KJgJRc/nW2', 'MUHTAR', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1973-07-09', NULL, NULL, '2025-06-27 06:58:16', NULL),
(1103, '3304056111780001', '$2y$12$t/70oUddIAe8r6VLW/Ac5OXq/feu5XVFoMSsVuAbY.8gtM1Remhxi', 'WAKINGAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1978-11-21', NULL, NULL, '2025-06-27 06:58:17', NULL),
(1104, '3304052906970001', '$2y$12$9rit3H9VAm6m.WZgqIqzzOGQKo29rVHMToVnzGt8SkRKkpBiPHC9q', 'RIFKI ALFAIZAH ', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1997-06-29', NULL, NULL, '2025-06-27 06:58:17', NULL),
(1105, '3304055706990003', '$2y$12$9w0UEuvSX2pWJef/H6NNKelPQMML8AWZruFvMjsgLiUOWwQl28hSa', 'NAELATUS SA\'ADAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1999-06-17', NULL, NULL, '2025-06-27 06:58:17', NULL),
(1106, '3304050608810001', '$2y$12$S.Axaj2lSqR7yusrs6F2IOWgTlVN6Wb2OBJTaWoT02srJ5euc7r/O', 'DARIYO', 'Laki-laki', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani ', 'Banjarnegara', '1981-06-08', NULL, NULL, '2025-06-27 06:58:18', NULL),
(1107, '3304055503850001', '$2y$12$HVim3jFKKMl/7CjZ/QmcnuklTUPa7XYkiJvB1sV20xpEb9RBZBaci', 'SUILAH', 'Perempuan', 'Wiramastra, RT 04/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1985-03-15', NULL, NULL, '2025-06-27 06:58:18', NULL),
(1108, '3304050104840009', '$2y$12$zjwhWcm3PHJ0o3XxW2qicuUTHYsc2isZ.IBb0Xf.goVttEbqUDWwW', 'ROHMAN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1984-01-04', NULL, NULL, '2025-06-27 06:58:18', NULL),
(1109, '3304054210860003', '$2y$12$YHjIAE4WTkXaKPy2UwLyNOiD5QCoMTsA9zEx8mCgyjdl3GkzZwuUu', 'RODIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1986-02-10', NULL, NULL, '2025-06-27 06:58:19', NULL),
(1110, '3304050202870001', '$2y$12$WyNgtZa/r9/80un44FhgFeJC4su4haOUS5nmB1h9nYlnLFFJdkQXW', 'SUNARMIN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1987-02-02', NULL, NULL, '2025-06-27 06:58:19', NULL),
(1111, '3304055507910001', '$2y$12$pHSSd2fPtC2vitlJEZ83ROK5AS0InClEeAHsGHvumbojRbRlGikAy', 'SUSIYANTI', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1991-07-15', NULL, NULL, '2025-06-27 06:58:19', NULL),
(1112, '3304051709820001', '$2y$12$0VuIUEgwUabXUFOh4iTkQOS5H.9kEx4/kHMqkA3cNLFGgsPEJwdZ.', 'MUJIB', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1982-09-17', NULL, NULL, '2025-06-27 06:58:19', NULL),
(1113, '3304054807840003', '$2y$12$iiIO6p8yaurLEBdQlpkvjuVQ7BaEET8PARMC2vsbzNSIy8NipuBVq', 'RUWIYATI', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1984-08-07', NULL, NULL, '2025-06-27 06:58:20', NULL),
(1114, '3304050212800004', '$2y$12$XZBgPFNZNoivUNZWxgAY8edbvxNBTI21F5Eet76ArHaKz2N8C4xHS', 'ACHMAD RUKUN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1980-02-02', NULL, NULL, '2025-06-27 06:58:20', NULL),
(1115, '3304055705830007', '$2y$12$jRx5YP9BgwsK5riD6B43uOfstEyCxbBm04uki0STZve1nlhuLmKvm', 'O\\PONIYATI', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Purbalingga', '1983-05-17', NULL, NULL, '2025-06-27 06:58:20', NULL),
(1116, '3304051611940001', '$2y$12$PkZJ/aGmCek9ft7qKfMyf./5uPS86S5eIHSU.NTQBeuknVqtXaocS', 'KHOIRON', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1994-11-16', NULL, NULL, '2025-06-27 06:58:21', NULL),
(1117, '3304050709830005', '$2y$12$AoxSAqIpshepmS6yMyJYqOw.qLo6dTOkBRqZYC/ApUyF.8DWWozru', 'TASRIP WIBOWO', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Bhl', 'Banjarnegara', '1983-07-09', NULL, NULL, '2025-06-27 06:58:21', NULL),
(1118, '3304056707840002', '$2y$12$.6cJsMU/BmCSzNUmwFJwxerxY/yn.mVMn3a5C8ehbd4PvyWAICTuS', 'TARBIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1984-07-27', NULL, NULL, '2025-06-27 06:58:21', NULL),
(1119, '330405120380001', '$2y$12$d0nk/3oEqhoetSO5ZjcN0.c5rY37/hiuqnkZIyVvD5QbUKEPmjq5G', 'ACHMAD SUTRISNO AL PARSAM', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1980-12-03', NULL, NULL, '2025-06-27 06:58:21', NULL),
(1120, '3304056707840003', '$2y$12$kimnw5hXMZqZqYEXz9uPa.9iAwdgNnEe3Tga5zdy4FPrnZQShP60.', 'TARLIAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1984-07-27', NULL, NULL, '2025-06-27 06:58:22', NULL),
(1121, '3304050705670002', '$2y$12$i1ob4RhRcMgVORwzjywoPuk1RPonw39AueaARBrrnVR.8j5U54RF.', 'HUFRON ', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Perangkat Desa', 'Banjarnegara', '1967-07-05', NULL, NULL, '2025-06-27 06:58:22', NULL),
(1122, '3304054205730005', '$2y$12$g9Zci.73X/ozhFp1gqGU3OHPEY6tppjg0mC8alL6/VG9zKNkzkkZ6', 'FARO\'AH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1973-02-05', NULL, NULL, '2025-06-27 06:58:22', NULL),
(1123, '3304055003000004', '$2y$12$Yk3dXbyaYswkZzuTUAR7hu0u67DSDlImb3MFKtTW8yVwOyVkLZygG', 'LISA NURNGAENI', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Mahasiswa', 'Banjarnegara', '2000-10-03', NULL, NULL, '2025-06-27 06:58:23', NULL),
(1124, '3304050201820003', '$2y$12$BrPu5g0HBFww57eL0K8zBeKMRDZqDL7xpkhLmXv9/m/LTN.639MCC', 'ACHMAD CHUSNAN .A ', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1982-02-01', NULL, NULL, '2025-06-27 06:58:23', NULL),
(1125, '3304054809820005', '$2y$12$WUeMbxkHGop6fYOyLQoqw.4sc/BRzI3Es1KSeJawpFG893DBdz4OW', 'SITI NGAISAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1982-08-09', NULL, NULL, '2025-06-27 06:58:23', NULL),
(1126, '3304051810840002', '$2y$12$wVVwgNFTJTQ7mbCYyvlZquA15S/g83H880vRFBN9Kg/6vYY7PEaBK', 'PUROMAH', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Sopir', 'Banjarnegara', '1984-10-18', NULL, NULL, '2025-06-27 06:58:24', NULL),
(1127, '3304056010830002', '$2y$12$8unFBU23UURhIyO7KwvBfuTyXS2dN4I.zCOs6gYa6784ttzaBSB7K', 'MUNINGAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1983-10-20', NULL, NULL, '2025-06-27 06:58:24', NULL),
(1128, '3304051202110003', '$2y$12$bDF776hL1C7gWGayiaDtVeTMix4UOnR7Fz0/5BJ068.3IyA3XpWBC', 'ANUGRAH NAUFAL F.P', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2011-12-02', NULL, NULL, '2025-06-27 06:58:24', NULL),
(1129, '3304051005750006', '$2y$12$kUe9lxbpTk9nOfKSQnVpY.3qEIb7Lvj.A6SfBXupddegR/pegMFRe', 'AHMAD SAMUDI', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1975-10-05', NULL, NULL, '2025-06-27 06:58:24', NULL),
(1130, '3304055102890001', '$2y$12$8bryyhj9Hh2QrIJyp8rGdeSzjdFMqY0mYenWjgLcB800.76OAyhdW', 'DAIMAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1989-11-02', NULL, NULL, '2025-06-27 06:58:25', NULL),
(1131, '3304051204750005', '$2y$12$1yp0RFdoaZenIxM32AqJP.InXA9d7U1QpcRsBpXl8eDwy/o0jADAu', 'TARMAN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1975-12-04', NULL, NULL, '2025-06-27 06:58:25', NULL),
(1132, '3304054103700003', '$2y$12$FQyjj3r.01l/GyLnWag3WOCXPNU8KeWn/qHtzf0JaaW2j6QB3uh3y', 'MANISEM', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1970-01-03', NULL, NULL, '2025-06-27 06:58:25', NULL),
(1133, '3304050506000002', '$2y$12$pSjGO1oL4UDmluDwCnSQte.vHzfHqhbQxr6TEh/pVqG.rv0YW76TO', 'SUTARMI', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1998-05-06', NULL, NULL, '2025-06-27 06:58:26', NULL),
(1134, '330405169680003', '$2y$12$HgUpI/VB9/JBqDMhOoHSVegtRHVjWasmY2Okz66E5Nc3p8klwPUf6', 'NANGIM', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1968-09-16', NULL, NULL, '2025-06-27 06:58:26', NULL),
(1135, '3304055011690003', '$2y$12$JCC/oYDfUm4w3wydEoStv.6SSkTVX5eEFgo4/LbqUXp8KiYcHVZNa', 'UMUL MUMINAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1969-10-11', NULL, NULL, '2025-06-27 06:58:26', NULL),
(1136, '3304051605710004', '$2y$12$B0b2UN48DzHcFwEStpVkhOFwlo/wDWiJej6NdS5d1X4xTQ0Li3t4y', 'MUHARIS AL RATAM', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1971-05-16', NULL, NULL, '2025-06-27 06:58:27', NULL),
(1137, '3304054101740001', '$2y$12$u2b/6fKFLEas6sFZnNeSQOf.3prxhl6u946scZTWMSxszJh17ypPW', 'BADIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1974-01-01', NULL, NULL, '2025-06-27 06:58:27', NULL),
(1138, '3304051209780006', '$2y$12$/8Tf/Q0IyrQUYxpNKcLzO.ZxrOEoFhliMfJWhzl2w9qGG0dWBRK2W', 'HADI TARYOO', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1978-12-09', NULL, NULL, '2025-06-27 06:58:27', NULL),
(1139, '3304055012800005', '$2y$12$rirdrMmMgMn8e2fMUrkpD.2HvM2yRy31spdy0rC3Du8Wa6ersHN3i', 'SUTARNI', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1980-10-12', NULL, NULL, '2025-06-27 06:58:27', NULL),
(1140, '3304050107760040', '$2y$12$0IYDjxGyd6y7xPBgZjW1eeGToqr9JKvwY1.xDLN6x6311P2IBe3jS', 'AHMAD ROSIDI', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1976-01-07', NULL, NULL, '2025-06-27 06:58:28', NULL),
(1141, '330405106800003', '$2y$12$vCVkMqrL9M3Ax.g0i2pULOokxxNoGz3NFwcliA3qhXsiiLYKPVkaa', 'ROSIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1980-01-06', NULL, NULL, '2025-06-27 06:58:28', NULL),
(1142, '3304050107830076', '$2y$12$VaWL3axzpv1I.JjEpqo4/.4Jdc1I5AboPhMB.xtd.gRENrkI.60/y', 'ACMAD SUTANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1983-01-07', NULL, NULL, '2025-06-27 06:58:28', NULL),
(1143, '3304055606840004', '$2y$12$PZuDRCgI28x2vbRlxMnabukHfwxhDUXBbA7g8.bAF8qaZtDeoXoA6', 'TASRIFAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1984-06-16', NULL, NULL, '2025-06-27 06:58:29', NULL),
(1144, '3304050305990001', '$2y$12$s0j0smlo1Eop0b3w5cNzR./q9ZpoYu.94LaYToYcL89tieJ0IPBYK', 'ACHMAD FAOZI', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1999-03-05', NULL, NULL, '2025-06-27 06:58:29', NULL),
(1145, '3304051101890001', '$2y$12$CD.3dIwaQevU72W8l2LwDeJNwYYmlbuhgvyCekp4HaGJ.51FzbCcS', 'KASIRUN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1989-11-01', NULL, NULL, '2025-06-27 06:58:29', NULL),
(1146, '3304051011960002', '$2y$12$sQH7/ArenxkihVOo0q2AGeJgySx5G.FnwvDQDem5J9pYdIjDWThzy', 'NASRULOH', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1996-10-11', NULL, NULL, '2025-06-27 06:58:30', NULL),
(1147, '3304051112750004', '$2y$12$zpQeKQNFwcM2ADqJuRvq.uZvp0owikf4gl1aOBxiNCAll4O0v0IXC', 'MUNAWAR', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1967-11-12', NULL, NULL, '2025-06-27 06:58:30', NULL),
(1148, '3304051102850004', '$2y$12$D2rpA2CjZHVh/vnWr8SeI.8X8IIYDdgjJh87cHKRs85Q/yUI6868i', 'FUADI', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1985-11-02', NULL, NULL, '2025-06-27 06:58:30', NULL),
(1149, '3304050607940005', '$2y$12$dLh56ZJaUckDDlWnBMedNOu0fvMecSCgiuJOgXgt9twLC2zidjkRy', 'MISBAKHUN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1994-06-02', NULL, NULL, '2025-06-27 06:58:30', NULL),
(1150, '3304050808860008', '$2y$12$jDJC/hjmNZTwXPZ9nPgDC.ThVVK1Ic9/mh5IUQVOnE1LGsPJ1vV.u', 'ERON', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Gombong', '1986-08-08', NULL, NULL, '2025-06-27 06:58:31', NULL),
(1151, '3304052302860002', '$2y$12$AiV05qwK6Era2fbDKwndT.aUq3j549NjcwFZNDuuQFEw1gdUgq0sS', 'WASLAM', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1986-02-23', NULL, NULL, '2025-06-27 06:58:31', NULL),
(1152, '3304055102870001', '$2y$12$uvGsNSaa6wZh3sam1qGSFe5hkte.RY6pEVABrDbDtV/4Vx9gWHzJG', 'ESI NARFINGAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1987-11-02', NULL, NULL, '2025-06-27 06:58:31', NULL),
(1153, '3304051712890007', '$2y$12$6SlCtxSabWMvKk7dRQH.me0LGv1L/EsWrvz7bitQWfxLXe1xkQRf2', 'MUSTAQIM', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Bhl', 'Banjarnegara', '1989-12-17', NULL, NULL, '2025-06-27 06:58:32', NULL),
(1154, '3304115710950002', '$2y$12$jI3lFCI9E4ChdMzINJyIZ.O7r/sTLx3nj1zFTceXBIOMiE8qQz0T2', 'FATIYATUN SOLIKHAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1995-09-17', NULL, NULL, '2025-06-27 06:58:32', NULL),
(1155, '3304051010700001', '$2y$12$PYT2mHwjI/Q3eceSuO5CZe5KH2fU0XyjhMeh16AAtDPc5r/hibE1u', 'NUR HAFID', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1970-10-10', NULL, NULL, '2025-06-27 06:58:32', NULL),
(1156, '3304055704740004', '$2y$12$gcbZ3MG/SKnK2EY0.RK7Mu.MxKw9OibWGndw9/qym4Jt1.rTOlTI6', 'NAFSIHI', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1974-04-17', NULL, NULL, '2025-06-27 06:58:33', NULL),
(1157, '3304051712920001', '$2y$12$YCH8Ar87l03YomFP9U7Xhu.MJoS.Dxe.QbF.5G44veBcMJfF/xiUy', 'ANAS MUHYIDIN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1992-02-17', NULL, NULL, '2025-06-27 06:58:33', NULL),
(1158, '3304050404960001', '$2y$12$OVxjsRDbvxcq8ZHxYqHbGuPllMrXha5oufbCkepwMn0dpusodJoP2', 'SAFIK MUJAMIL', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1996-04-04', NULL, NULL, '2025-06-27 06:58:33', NULL),
(1160, '3304054107670037', '$2y$12$gND.TkbHvij2ssf7r83sDezfxC/hAJuxcScr0LDbuDQWd9fT111Bm', 'WARYANTI', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1967-01-07', NULL, NULL, '2025-06-27 06:58:34', NULL);
INSERT INTO `pengguna` (`id`, `nik`, `password`, `nama`, `j_kel`, `alamat`, `agama`, `status`, `pekerjaan`, `tmp_lahir`, `tgl_lahir`, `remember_token`, `created_at`, `updated_at`, `nomor_hp`) VALUES
(1161, '3304050105900001', '$2y$12$9vKbVABKEEr3zXH2Py8IPeHlKmmZ/bvepj/ej7LXWs0FmWjwwniDu', 'MOHAMMAD KHOERUN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Bhl', 'Banjarnegara', '1990-01-05', NULL, NULL, '2025-06-27 06:58:34', NULL),
(1162, '3304052207940001', '$2y$12$S0NCoYJQzp3/VSp9GttQsO8WBmFep5edt5euZVImpNuc6NoCKOr8G', 'KHOLIS SAILIN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1994-07-22', NULL, NULL, '2025-06-27 06:58:34', NULL),
(1163, '3304051212850002', '$2y$12$KRjZ0olgfL7vV/TEJ4GFYuBJcsrur3BUtHzDnRFjxhQNjDi8dZLE6', 'KODIRIN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1985-12-12', NULL, NULL, '2025-06-27 06:58:34', NULL),
(1164, '3304054609920002', '$2y$12$m9bBk5sEOS0MO/CivkbJJ.iquratQGB6weo45rjPUGBd7xF87m3uW', 'HIKAYATUN NI\'MAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1992-06-09', NULL, NULL, '2025-06-27 06:58:35', NULL),
(1165, '6207030404831001', '$2y$12$3y4FkfdxLw2wVNtzO7Jc2.BESfYtEXKDrcbf2.9GJ40/YNaQvmOtu', 'MUSOLI', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Bhl', 'Banjarnegara', '1983-04-04', NULL, NULL, '2025-06-27 06:58:35', NULL),
(1166, '6207035007891001', '$2y$12$EFKYSm3imDjlkOxEyRAT7O65MHRTLfLK.p6cnSAtJR3U1n83tk8cy', 'KHOTUN NAFIS', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1989-10-07', NULL, NULL, '2025-06-27 06:58:35', NULL),
(1167, '3304052508780001', '$2y$12$Y5HR7As/3eu6Mgpm/z22YeUsRRKH19.vDQWiN1WYu5iLMtqVX3IDG', 'TURYAN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1978-08-25', NULL, NULL, '2025-06-27 06:58:36', NULL),
(1168, '3304054104820002', '$2y$12$SVx3SpQRVto3nOwtTDBWU.l9u0C27xhM26mz6eeNXipM7dDyMOhPy', 'ROIMAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Prt', 'Banjarnegara', '1982-01-04', NULL, NULL, '2025-06-27 06:58:36', NULL),
(1169, '3304054805900001', '$2y$12$dg7jbP60qLE9awDpXAY92uTjlGF41Xv6hQqHNWW.2GLBhBwXh20M6', 'FAIDAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Irt', 'Banjarnegara', '1990-08-05', NULL, NULL, '2025-06-27 06:58:36', NULL),
(1170, '3304051205760003', '$2y$12$tzs5BfwbWv3xwvVsFxAxbO6sT1FoCwRRWpP7ey2tXeDYx0FJ8ul72', 'AHMAD JAENUL', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1976-12-05', NULL, NULL, '2025-06-27 06:58:37', NULL),
(1171, '3304054307770004', '$2y$12$yC5Ips8tkawyZEv0jzQlaei1he.TJnm.Jbr6QFW7SCZO3j262Dubm', 'SANGADAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1977-03-07', NULL, NULL, '2025-06-27 06:58:37', NULL),
(1172, '3304052304970001', '$2y$12$ZLPbSxYI0Wbr4Dc2dPBM5OCxjugHeFgx0bhiEOc5mGo6GqxJlK5/G', 'MUHIBIN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Bhl', 'Banjarnegara', '1997-04-23', NULL, NULL, '2025-06-27 06:58:37', NULL),
(1173, '3304052602000004', '$2y$12$hGm.Yx./JymDXFwuVPY/Euv16pj20WLbZ6sTtcY//5cncqqlW58Ki', 'TABINGIN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Bhl', 'Banjarnegara', '2000-02-26', NULL, NULL, '2025-06-27 06:58:37', NULL),
(1174, '3304051601780002', '$2y$12$EGGYbRzTDoSZDs3iZAv2G.d7PcfxX9cGL47oSVvF6pLIDXNiR8If2', 'MUTOHIR SOBRI', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1978-01-16', NULL, NULL, '2025-06-27 06:58:38', NULL),
(1175, '3304054908800003', '$2y$12$mpw.zlFt9RZuG0AheWmJteN8IXpPMq0KXRKh8eVfrwJwW6fjpkuiK', 'TRIMO SENDARI ', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1980-09-08', NULL, NULL, '2025-06-27 06:58:38', NULL),
(1176, '3304052407980003', '$2y$12$JBxN65sLHdWH0/W9lHF5bO2McQBaT/pHb5vBNYlzQC9X7E0IRtxs6', 'SAMSUL MA\'ARIF', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1998-07-24', NULL, NULL, '2025-06-27 06:58:38', NULL),
(1177, '3304051506830007', '$2y$12$C6YX7Yj.id0yTuqKOr85TuYy5vS4t/U5gScKdFkWGkwpMsmR1Ttma', 'MISWAN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Petani', 'Banjarnegara', '1993-06-15', NULL, NULL, '2025-06-27 06:58:39', NULL),
(1178, '3304055002500003', '$2y$12$OlPoaZEgDt04n8UwWuND5OMbZfVkWovlK8KFuG8Yr9odOTzh9yOu.', 'SENEN', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Cerai Mati', 'Petani', 'Banjarnegara', '1950-10-02', NULL, NULL, '2025-06-27 06:58:39', NULL),
(1179, '3304052303900001', '$2y$12$oVdvJ8YWnENT8gFhkVyuaeIDExaL/lPhNXqsyzJRzJfyTZKw8kNKC', 'HAIS MUNGFASIL', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Bhl', 'Banjarnegara', '1990-03-23', NULL, NULL, '2025-06-27 06:58:39', NULL),
(1180, '3304050310130001', '$2y$12$.I4IPcvrvt1PUdu84kjgEuehWBFkd3FYC6O6WWItanDP1Ik5BfNdi', 'WINATTA MESYA', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'B/T Bekerja', 'Banjarnegara', '2013-10-23', NULL, NULL, '2025-06-27 06:58:39', NULL),
(1181, '3304051605680001', '$2y$12$bG1M40w4ALS/iLcbPcWSC.5lcG4purARQH2SQQ2qqx15pwdInM/ei', 'MUSWANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1968-05-16', NULL, NULL, '2025-06-27 06:58:40', NULL),
(1182, '3304050509820004', '$2y$12$HotsKecMW1c4OxbB2d4yCOP528hNoK0SuqnOLigB1R.uLehD6YAoW', 'MUFIDIN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1982-05-09', NULL, NULL, '2025-06-27 06:58:40', NULL),
(1183, '3304056706860004', '$2y$12$PYLw59qFg7tMXJo1ZxJfF.3yYJTnYV1C/cfCu3ZHDPkGhIQ2E4Ja2', 'TARSIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1986-06-27', NULL, NULL, '2025-06-27 06:58:40', NULL),
(1184, '330405017650001', '$2y$12$mBCFBWqOjtgBkbSbSfxYneQFvPCX6OQJ1/N.jJ1dxdMwcUIWWKhYK', 'MUHARSO', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1865-07-01', NULL, NULL, '2025-06-27 06:58:41', NULL),
(1185, '3304055204730003', '$2y$12$uMOf8NR34oFm0XJhWcjd.ebH6ckcT2aMuomT91Dva2IOfKCHNMlvK', 'WASEM', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1973-12-04', NULL, NULL, '2025-06-27 06:58:41', NULL),
(1186, '330405605980001', '$2y$12$bhOivN2oGSE8q5bqcDaWA.IC5y5yxS.s38UPC3bW/uh6RYARZqJD6', 'RUDI SUKUR', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1998-06-05', NULL, NULL, '2025-06-27 06:58:41', NULL),
(1187, '330405080400001', '$2y$12$oomPJCMNk7qG1EHgYF9QVumhQGgb93P22.ccD/0t9uup7qS/i92ki', 'WAIS', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '2000-08-04', NULL, NULL, '2025-06-27 06:58:42', NULL),
(1188, '3304050205840005', '$2y$12$oinZWgLG2Uky9ddbsixr4OTFQCTeAB.NDcqtfrabLQ17Bhw5WYoyy', 'ALI IMRON', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1984-02-05', NULL, NULL, '2025-06-27 06:58:42', NULL),
(1189, '3304124602880001', '$2y$12$Qnvt/DLVub/oCWh3yyfmIu18gPL4UsJt48Rnxy9tWFLlzZeiEc1YK', 'SURIFAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Trenggalek', '1988-06-02', NULL, NULL, '2025-06-27 06:58:42', NULL),
(1190, '330405043670001', '$2y$12$hAkTQfn8ek.MgMtNFmGJcObJOLXPeUDbMqi0CqOuRAOLBBVReybZK', 'SAHLAN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Kebumen', '1967-04-03', NULL, NULL, '2025-06-27 06:58:42', NULL),
(1191, '3304054106730003', '$2y$12$7PePBHHKrHDafl6oXVlN9.vLSVaclO2eSjOpxhOAKCGQWRp0VBDM.', 'NURIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1973-01-06', NULL, NULL, '2025-06-27 06:58:43', NULL),
(1192, '3304055509980001', '$2y$12$WQAEsccKd1wfxZ6fhnbghu.St1Mn77VKUh/5H.yh6CKbtjif1oJqK', 'ULFIATUN NISA', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Mahasiswa', 'Banjarnegara', '1998-09-15', NULL, NULL, '2025-06-27 06:58:43', NULL),
(1193, '3304053006800001', '$2y$12$akjG4bDxWvG6d.sMncWUfuT105JsPZNrxxg8Z.Gz/zPOKFV4Q81Ri', 'MUHAMMAD IHWAN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Bhl', 'Banjarnegara', '1980-06-30', NULL, NULL, '2025-06-27 06:58:43', NULL),
(1194, '3304054110920005', '$2y$12$G3agYTnO6VZUBwWzbqlG.e3jFPwR4xdtwsSAFsOq1btrFk5.tA5Ty', 'KUSRIH', 'Perempuan', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1992-01-10', NULL, NULL, '2025-06-27 06:58:44', NULL),
(1195, '3304052011950001', '$2y$12$/1VhaBGqlmjmd.KzkqUzgOahGMT/HyGRodrvq/5tHgBLqYhIi5I6y', 'ZAKIRUDIN', 'Laki-laki', 'Wiramastra, RT 02/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1995-10-05', NULL, NULL, '2025-06-27 06:58:44', NULL),
(1196, '3304050203930001', '$2y$12$REWr8u9eyhX49W6kQQ1Y2e0econ04btojWX6BNYfLPlJV8VEv31F2', 'MUHLIS', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1993-03-02', NULL, NULL, '2025-06-27 06:58:44', NULL),
(1198, '3304052106860002', '$2y$12$c4JU.d/Z.smW2LrGTaXZ6OlZSys2y6T4h4/e7NDVCa07eRFmolKyC', 'FAIZIN ', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Bhl', 'Banjarnegara', '1986-06-21', NULL, NULL, '2025-06-27 06:58:45', NULL),
(1199, '3304057011930002', '$2y$12$E6Ve8EG7dhwYgTVYkM1gIeeuONws4jI7zGpWNKJUaJHwap0xIdr9u', 'SOIMAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1993-11-30', NULL, NULL, '2025-06-27 06:58:45', NULL),
(1200, '3304056203780001', '$2y$12$QRPk8TrUtxWQVehnqMwPWO/bVS.hAc8BVWRmQY.n1YUjjqdTGSGGa', 'SARI UTAMI', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Cerai Mati', 'Petani', 'Banjarnegara', '1978-03-22', NULL, NULL, '2025-06-27 06:58:45', NULL),
(1201, '3304052403970003', '$2y$12$NyY4wmFCopOR/3P8QNGLkuJgbE7wJ6UyKOuH2qJJJklHt0SFjrtge', 'KEFRI MK', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Bhl', 'Banjarnegara', '1997-03-24', NULL, NULL, '2025-06-27 06:58:45', NULL),
(1202, '3304050704800006', '$2y$12$nNNX7E.G4NfwQljo30yh9eF65qAGeds6XuGOq0xOsEeuVpgo7mthu', 'DARSO', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1980-07-04', NULL, NULL, '2025-06-27 06:58:46', NULL),
(1203, '3304054102820007', '$2y$12$fCZq66uCPWzCYnAGBNuSE.hTalgAXz4yP8Da2mFYA2twHeeoNc0zK', 'RASINI', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1982-01-02', NULL, NULL, '2025-06-27 06:58:46', NULL),
(1204, '3304050206890005', '$2y$12$3/6Z7DisS8GshVyWk8mAme9l9bEiQXURDYnoXNLjfD.iciYcEbZ9q', 'MUNSORIP', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'P.Lainnya', 'Banjarnegara', '1989-02-06', NULL, NULL, '2025-06-27 06:58:46', NULL),
(1205, '3304055202910002', '$2y$12$iDXm.nYgZRZHWgMH/cZinOcR1NzDtchC84L5JJ7NgKPPT1lBgg3lC', 'NUROHMAN', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1991-12-02', NULL, NULL, '2025-06-27 06:58:47', NULL),
(1206, '3304050109790001', '$2y$12$JzwZfNlG.06H9A3BF3JtkObYR4I/XBJBsqs45nRrU84yzOyL65PUi', 'DAHLAN ', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'P.Lainnya', 'Banjarnegara', '1975-04-09', NULL, NULL, '2025-06-27 06:58:47', NULL),
(1207, '3304054303790003', '$2y$12$81W0r7QhxfrW8Gt/ahApVemS4fsShq5gSWj9mgnb4qmXNnSZB51Eq', 'SITI AWALIYAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1979-03-03', NULL, NULL, '2025-06-27 06:58:47', NULL),
(1208, '3304050905850001', '$2y$12$iX//BM/yByclL6dcHpIhOu7.fO6zunMhAuW5yI7K/q98r9PXbEGm.', 'NGAFIF ', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1986-09-05', NULL, NULL, '2025-06-27 06:58:48', NULL),
(1209, '3304054712870001', '$2y$12$0aTJZfvPurmxkCSFiLotae.MoOH3/4I7JNUpJiveFWjWeLHkk5RSS', 'RUTIFAH ', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1987-07-12', NULL, NULL, '2025-06-27 06:58:48', NULL),
(1210, '3304051009850003', '$2y$12$z4dUPauEV8uAPAFGJYesVeofhIXEMwsHxpgJl1kuZEbuknXV31vnS', 'JATMIKO', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1985-10-09', NULL, NULL, '2025-06-27 06:58:48', NULL),
(1211, '3304054804850012', '$2y$12$SXpLjj3T51SPbkaFwQpXnO3IaehD1WWPjwmYLoA03ttqN/mEMn2Ra', 'NIYEM', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1985-08-04', NULL, NULL, '2025-06-27 06:58:48', NULL),
(1212, '3304051503730007', '$2y$12$7s0noDYFvhbOqiHXiYmleuYcW6GZ3B06IYXBX7QkI8szQAsw5AY.S', 'ALEXDARTO SANTOSO', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Jasa Lainnya', 'Jakarta Barat', '1973-03-15', NULL, NULL, '2025-06-27 06:58:49', NULL),
(1213, '3304055104780013', '$2y$12$W/o3ozIgX1rmgWsu2Xi9aesvuD6qAtiOIIFFup.gxLM82BDcw.3yK', 'SAMIDAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1978-11-04', NULL, NULL, '2025-06-27 06:58:49', NULL),
(1214, '3304051908800004', '$2y$12$GuEM11FWuJ8K7h/xqo6dOOW966K9K81.1XrwJ3fPA98/hmojrSlBG', 'MUHAMMAD AFANDI', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1980-08-19', NULL, NULL, '2025-06-27 06:58:49', NULL),
(1215, '3304055405810002', '$2y$12$e6OpvuzUu76YKkW4AIBn4.ezjsF17qlrGNtccYrbM1wpFfpJHi6aC', 'SUTIMAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1981-05-14', NULL, NULL, '2025-06-27 06:58:50', NULL),
(1216, '3304052205710005', '$2y$12$ViTEjg8jg/yxixrE8EkMQODu5B3lrEKcVcOqDGH5rwoZEoiA.Tz6K', 'ABDUL ROKHIM', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1971-05-22', NULL, NULL, '2025-06-27 06:58:50', NULL),
(1217, '3304055403770002', '$2y$12$w29aTFecqescBbeYrZSYcOkowNw.BFLR65NJ.vYsEerf9mWfaitri', 'SUKERI', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1977-03-14', NULL, NULL, '2025-06-27 06:58:50', NULL),
(1218, '3304050103940004', '$2y$12$yHmBgzmVF1XepsbQR6m8f.Y6uWmeK51l2ErleyQez1QmAuLvPbePW', 'FARIHUN NASEH', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1994-01-03', NULL, NULL, '2025-06-27 06:58:50', NULL),
(1219, '3304056010980010', '$2y$12$9v4wlYfeFAaYWMfXR5jLj.Wnqmb1atz.vT1nZ.CYBkgodVlVcgfA.', 'SITI ROJANAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1998-10-20', NULL, NULL, '2025-06-27 06:58:51', NULL),
(1220, '3304055212850007', '$2y$12$43iINODDjh/xs5RgaP5U.eJyX3x9B5btyInovhiw.fyJckUDwpAqC', 'RAMINI', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1985-12-12', NULL, NULL, '2025-06-27 06:58:51', NULL),
(1221, '3304055507080001', '$2y$12$sUNzV.VX5cIlfIOqenFa6OrUEPILWOMj7S1yMvVNhafrOkvsgqlCW', 'CHAELA RAISTY VINATA', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2008-07-15', NULL, NULL, '2025-06-27 06:58:51', NULL),
(1222, '3304050311950001', '$2y$12$G0YdOfxhNfW1m6iTNB.I9OfP3RllpmrTTS8YNONnySagHPS9yBNEe', 'ROFANGI', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1995-03-11', NULL, NULL, '2025-06-27 06:58:52', NULL),
(1223, '3304052709790005', '$2y$12$xM8D.Atpv7mx.m/sDEpnBOFNdpmJVtWEKjk5ZFWxsFAbmbNPyc4eW', 'SRI KUNTORO', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Jasa Lainnya', 'Banjarnegara', '1979-09-27', NULL, NULL, '2025-06-27 06:58:52', NULL),
(1224, '3304054307820004', '$2y$12$Iw94D.hGpv..5vkcNJ8gTOD94s0wEFJ97H6HoKIev88cNj2Hr/uCq', 'ISTI KOMAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1982-03-07', NULL, NULL, '2025-06-27 06:58:52', NULL),
(1225, '3304051011750012', '$2y$12$4JWZmI/IaRgK4XX8DNLXxO.d2ebdGgmQ0dF1fyDZ2nSiav8Fs64YK', 'AHMAD TURIP', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1975-10-11', NULL, NULL, '2025-06-27 06:58:53', NULL),
(1226, '3304055301800002', '$2y$12$KMmPkSGs4kMHbRiFW3oN0OyiVLUliTbcYXOEJBI.dC7vEK.yWAqeu', 'RUPINAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1980-01-13', NULL, NULL, '2025-06-27 06:58:53', NULL),
(1227, '3304051207840004', '$2y$12$Un34Kcv9pwSvGEDJ/fyP1.Z1.OF1xUft.jCey3LqucDWA5QnSDzlS', 'MISWANTO', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1984-12-07', NULL, NULL, '2025-06-27 06:58:53', NULL),
(1228, '3304054212860001', '$2y$12$6gSGkLpV4cG7M4M0ZFQV4OOLbsFxPjzD5GIDeYkv6E538u/VIwVRK', 'RATI', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1986-02-12', NULL, NULL, '2025-06-27 06:58:54', NULL),
(1229, '3304051611910001', '$2y$12$CrlXnGeD3GQfGM3f.JUC3.pBD..oQMW0fF/0p/uv4VQ8vG3qc260K', 'KADIR', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Petani', 'Banjarnegara', '1991-11-16', NULL, NULL, '2025-06-27 06:58:54', NULL),
(1230, '3304130805820001', '$2y$12$jyuV1ngSp1I1QUtxsVS.cO.jFxgf6DXlByIf57iCyoxw3zKRKHRde', 'SUMAN', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1982-08-05', NULL, NULL, '2025-06-27 06:58:54', NULL),
(1231, '3304054907870006', '$2y$12$yGB5Uno1oYEZbg0kZhK9j.a5h3UfMrOmXu3xrOVyXNTem1nsyb8fi', 'WURYANTI ', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1987-09-07', NULL, NULL, '2025-06-27 06:58:54', NULL),
(1232, '3304051001880003', '$2y$12$5V61Hb9551TJXj/aRKht8eiOaFO9CDSmkPi3gUtpDwfzW5L5fI84S', 'WARIDIN', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1988-10-01', NULL, NULL, '2025-06-27 06:58:55', NULL),
(1233, '3304055011990004', '$2y$12$q/UGga24lr.sjzKtkH7ZQeOpCaWCw0VaiYc8ZAQWiifC0yorYAvW.', 'ISTINGANAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1999-10-11', NULL, NULL, '2025-06-27 06:58:55', NULL),
(1234, '3304055011930003', '$2y$12$0OqT9v9DXxiJg6AlyVYU0O7Y7ZKwch5ZtWBFOjoIvnM054f50EeWi', 'WANI\'MAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1993-10-11', NULL, NULL, '2025-06-27 06:58:55', NULL),
(1235, '3304052310820002', '$2y$12$VLsgnH091lPMD5JvoiQRFOcf0ZBUeOH3bUIhNdGgdmcDrun4OvjDW', 'MOHAMAD ARIFIN', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1982-10-23', NULL, NULL, '2025-06-27 06:58:56', NULL),
(1236, '3304054302740002', '$2y$12$gB5HGMPeMH8K5HtYIi7XQ.VoH1BeZKPqDdQWpVD7B6doCVmTIIgka', 'RISKEM', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1974-03-02', NULL, NULL, '2025-06-27 06:58:56', NULL),
(1237, '3304052308880001', '$2y$12$AKyrOFj6sUSRSZUlCN5Vf.Mqj3fx1XkgQeSgFc7BTsCA7akOWVSy.', 'SUTARNO ', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1988-08-23', NULL, NULL, '2025-06-27 06:58:56', NULL),
(1238, '3304055605910002', '$2y$12$GP5C/mPzSHCvVRNowJuVzO89vPYJg3D0ukO5zyszGWaNroMUmhyh2', 'MUSLIMAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1991-05-16', NULL, NULL, '2025-06-27 06:58:56', NULL),
(1239, '3304054903800004', '$2y$12$NssdWYz08vVAGmuaesvxDO597PoUpuIsdaKu64pjd/g1aWmuxMIDC', 'TJAROAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1980-09-03', NULL, NULL, '2025-06-27 06:58:57', NULL),
(1240, '3304055303020001', '$2y$12$HII6c89QOZGJ7TSwLn9oxu/BQ1YRhitrFmGAFw5cth4yk53E98VLC', 'FANIA AYU MARGARETA', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2002-03-13', NULL, NULL, '2025-06-27 06:58:57', NULL),
(1241, '3304050808880006', '$2y$12$/WgDFW3VMSAg4t70lGPZJePPpnku/fj.TZPOVmYxf/9CsHviL8Fha', 'DZIKRON', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Petani', 'Banjarnegara', '1988-08-08', NULL, NULL, '2025-06-27 06:58:57', NULL),
(1242, '3304052706970003', '$2y$12$20BpeL0AZ2HpAk3hrHIayuwQWHpBytzZ6/IBrMQjVMUW7wDV5VSB2', 'TARHIM', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1997-06-27', NULL, NULL, '2025-06-27 06:58:58', NULL),
(1244, '3304054505870003', '$2y$12$Gkgg7Dd/84NGnpZRzoNksex2tA52pb7iOCLWlKzXUeDQ9LuIJdChK', 'SUFIYATI', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1987-05-05', NULL, NULL, '2025-06-27 06:58:58', NULL),
(1245, '3304050404940005', '$2y$12$T/BHATXj2xNCjOjBJ1faE.uyDSrW70FVXxCq1ESxDUP6p/CWo9TYu', 'JAHIDUN', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1994-04-04', NULL, NULL, '2025-06-27 06:58:58', NULL),
(1246, '3304054910970001', '$2y$12$SLgbiTJseCVBXR7n8Xn54.OM4HOZvOiPjJiT1l6OuvMcZYKm2.qL.', 'WALIMAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1997-09-10', NULL, NULL, '2025-06-27 06:58:59', NULL),
(1247, '3304056111910002', '$2y$12$X6kNKDhL6fjbQnjrtM0vX.a3vSX5rju84BK.x86/E1XpxIlT19B.W', 'NURAFIK HIDAYAH', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1991-11-21', NULL, NULL, '2025-06-27 06:58:59', NULL),
(1248, '3304051101940001', '$2y$12$3P1uPwPooTt0pd9O1weROu/8I6TVR3/WGD1Wk5wNxth3v4o0cuNZC', 'NUR HAMIM', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1994-11-01', NULL, NULL, '2025-06-27 06:58:59', NULL),
(1249, '3304055901960002', '$2y$12$D4tjntDyG90hlACl3Y7kB.Ql/wn1vz09.eAUdGfq96L6nVXEKCvxK', 'IMROATUN HABIBAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1996-01-19', NULL, NULL, '2025-06-27 06:59:00', NULL),
(1250, '3304055804990002', '$2y$12$poRljB4H5YQBSy/8FqUrmO0M8UMcIM/GQfdY2MfotgShqeAbWZANi', 'HURMATUL FAIZAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1999-04-18', NULL, NULL, '2025-06-27 06:59:00', NULL),
(1251, '3304050046870003', '$2y$12$M0gc9JLnsijg1RgYpKnSR.uYQWnqyKV4hVDcIGIBo5yY2onca4A7.', 'IRSADUN', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1987-04-06', NULL, NULL, '2025-06-27 06:59:00', NULL),
(1252, '3304055512870003', '$2y$12$qxinNILzJDTuKZm55ZiDUuutuOOl55vhrzatmQAVEDEGYftzErCFu', 'KAMILAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1987-12-15', NULL, NULL, '2025-06-27 06:59:00', NULL),
(1253, '3304050210910004', '$2y$12$z4x7ivRy3KIC7vJj258Bz.stmdlWcFMk9cu/CjFmS7VvRD.lxGZtm', 'IFMAM MUDIN', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1991-02-10', NULL, NULL, '2025-06-27 06:59:01', NULL),
(1254, '3304054107940016', '$2y$12$JMNXG2AX.9h23/KCzLiTHuPKgO3to8HRr7bUBXlzfrkSUTXPzlkUa', 'SAFAUL JANAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1994-01-07', NULL, NULL, '2025-06-27 06:59:01', NULL),
(1255, '3304052606790005', '$2y$12$IDiO3qGZF8b.n9w8FeAxoe5NDxs5fmPrVNY4lyMUB8u7ZMugak31.', 'AHMAD SAKUN', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Bhl', 'Banjarnegara', '1979-06-26', NULL, NULL, '2025-06-27 06:59:01', NULL),
(1256, '3304054204820007', '$2y$12$0o7eLO3lJf6hDvuNnd0X.ezD32R5.Gx9q11lKkHycba9W5c8cKgau', 'CHASBUNAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1982-02-04', NULL, NULL, '2025-06-27 06:59:02', NULL),
(1257, '3304051208790005', '$2y$12$vFHNsIJ/ToI8RI9y/UblkOLR727uO.wtB5icHwEEJINE81XGcjqye', 'ROHMAN', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Petani', 'Banjarnegara', '1979-12-08', NULL, NULL, '2025-06-27 06:59:02', NULL),
(1258, '3304050803870002', '$2y$12$vFEQBt0tQna9Z.wZp0jC2eDdd1SYvx0rR1sjaAmRyNHZqHhpB8oM6', 'DARISUN', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1987-08-03', NULL, NULL, '2025-06-27 06:59:03', NULL),
(1259, '3304050110840006', '$2y$12$RE0Ko5V85RndV7eZ8tN6TO3k8ETwvKcDFNA9jcoqrDn0Uis2c9iz6', 'ABRON MIFTAHUDIN', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1984-01-10', NULL, NULL, '2025-06-27 06:59:03', NULL),
(1260, '3304055106820005', '$2y$12$xFgTz7XnQX1D/2G5KcfdmOZoHGdjfiqiVRautpQktSNowNN.dGidq', 'DAIMAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1982-11-06', NULL, NULL, '2025-06-27 06:59:03', NULL),
(1261, '3304050907770004', '$2y$12$rSegrVtmw8BXZM6DhdHnOOVYtCaG/1fYe6MUG/nCsERY1ri/0O7Xu', 'NURUDIN', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1977-09-07', NULL, NULL, '2025-06-27 06:59:04', NULL),
(1262, '3304055010800003', '$2y$12$x3cC4xhTo5iVDGNJjaxfEOBQgCTmbWqc4r/QEpyR86Cs00iG2o76C', 'KOMARIYAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1980-10-10', NULL, NULL, '2025-06-27 06:59:04', NULL),
(1263, '3304052908980003', '$2y$12$TwalcgqSZFtRpN.USsRhpeGepJz7iFGpmc4479Oqc1BBlxZmBZj.W', 'FARID SOFYAN', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1998-08-29', NULL, NULL, '2025-06-27 06:59:04', NULL),
(1264, '3304051004780001', '$2y$12$Xn27/oUKagWmxmgjexlzqOM9p9Rl3ntNT/x2ar5rH4Y0V7Rftjrj.', 'SUDIN', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1978-10-04', NULL, NULL, '2025-06-27 06:59:04', NULL),
(1265, '3304056207760003', '$2y$12$Lys1NcyIJAyIQnEZ3zB/b.0mYupSS4hLzOK3u6JNgCyvZBj22a62O', 'MUFIDAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1976-07-22', NULL, NULL, '2025-06-27 06:59:05', NULL),
(1266, '3304055101820005', '$2y$12$gpxGj0jjFIqH5i8f8Gsl3uXf0uTPANH9hs7AwfVeMF32sADxz0b3q', 'KASMINAH ', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Petani', 'Banjarnegara', '1982-11-01', NULL, NULL, '2025-06-27 06:59:05', NULL),
(1267, '3304055006000003', '$2y$12$o7OcWSYu3nOXC/eEOemZOe2KduwUcv9v1.z32AbvIqepTjA2BHpRO', 'WINDI NUR HARTATI', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '2000-10-06', NULL, NULL, '2025-06-27 06:59:05', NULL),
(1268, '3304041508930004', '$2y$12$k0d2tG8.eBatbk3zBy3J2OqBHlhPsHuIOzw1ssCqA/Fb6z6F1t5cu', 'KHAFID', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1993-08-14', NULL, NULL, '2025-06-27 06:59:06', NULL),
(1269, '3304055507940005', '$2y$12$PeIQElUXMVq7abq3GNHqRextkrduZsBzOaRbBFVi/KBhS1uZd.2dG', 'YULIATUN', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1994-07-15', NULL, NULL, '2025-06-27 06:59:06', NULL),
(1270, '3304051006710005', '$2y$12$H0smHwHsdil3bJL8dXndu.zEWV5/hnP1n0OUS1oyJYWMMbiYuW9gG', 'ABDUL JABAR', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1971-10-06', NULL, NULL, '2025-06-27 06:59:06', NULL),
(1271, '3304054301760004', '$2y$12$KRmSU2VSUCpbI13HK.hnC.zFV3yrO15GRvgzm2eYYoXKhvvj7hUaO', 'PURWATI', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1976-03-01', NULL, NULL, '2025-06-27 06:59:07', NULL),
(1272, '3304052504970003', '$2y$12$2izstfBaQF4Y8AtRfNgRme723IxjAwSMEWmQJBWDfHpkLgOhNO9KO', 'DENI PRASETIOKO', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1997-04-25', NULL, NULL, '2025-06-27 06:59:07', NULL),
(1273, '3304050502920001', '$2y$12$7.KR6Dcc0z3PFA3I7o9ubO2RgIM8PcAaJ2BEUfP37ajPkgZowuy4i', 'PRIYANTO', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Bhl', 'Banjarnegara', '1997-05-02', NULL, NULL, '2025-06-27 06:59:09', NULL),
(1274, '3304051203970002', '$2y$12$YQBF2x4nv5GtpU8BKKT2EO23M5IZUwd2m39n/ufpS8gWuuI4rFfsC', 'TOHIBIN', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Bhl', 'Banjarnegara', '1997-12-03', NULL, NULL, '2025-06-27 06:59:09', NULL),
(1275, '3304056405000001', '$2y$12$WGsqQ4y3e8/JX11g/dW0q.MlXeOIQ7F00cbQf0NbUXGk5MTkmIICO', 'TITI NURFIATUN', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '2000-05-24', NULL, NULL, '2025-06-27 06:59:10', NULL),
(1276, '3304050711860001', '$2y$12$XkHyZSIzqicS/XmKjnIspO6Yco4qYQMQvPmS/SmT9pNjpkAHlZqKe', 'KUROHIM', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1986-07-11', NULL, NULL, '2025-06-27 06:59:10', NULL),
(1277, '3304055608800004', '$2y$12$EkVzZe5.YDtTCmonP96kKuNDJ/H/S.UIVLB66s/HKh3LHWpAb0rxy', 'WATINI', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1980-08-16', NULL, NULL, '2025-06-27 06:59:10', NULL),
(1278, '3304055308740001', '$2y$12$NwT2avKJeFj7fZtb.R9kfuESSoDZrm88hWP4IsC7DdnB18Z1BuUYG', 'SULISAH', 'Perempuan', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1974-04-04', NULL, NULL, '2025-06-27 06:59:11', NULL),
(1279, '3304052609940001', '$2y$12$1OjmkwMQambfaR3bxmyaZelN0Q7lqVQrO6amuwRucrKeOwCKGunIO', 'MUKHTARUL ANAM', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1994-09-26', NULL, NULL, '2025-06-27 06:59:11', NULL),
(1280, '3304051605960001', '$2y$12$x6pDhWZUrhcTtFpRBkhusevHVpEtIfexz4JwPWB/vsfzUxQ8Jt5wK', 'NUR ARIFIN', 'Laki-laki', 'Wiramastra, RT 01/RW 06 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1996-05-16', NULL, NULL, '2025-06-27 06:59:11', NULL),
(1281, '3304050404840008', '$2y$12$iWhmBPtvIWjWywtyI82XdOdSgFyTEKy0HZLHkX9tOTqvXTdENZ3PK', 'NUR ROHMAT', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1984-04-04', NULL, NULL, '2025-06-27 06:59:12', NULL),
(1282, '3304055010860002', '$2y$12$p3PCc5DKPyDZm4N9g8mJ4utt2YETu18OYe5AS9IuQoFDpNAVulMNO', 'SITI NURBAYA SYAM', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Jakarta', '1986-10-10', NULL, NULL, '2025-06-27 06:59:12', NULL),
(1283, '3304056004770002', '$2y$12$WodhO7R9Q9gVxBf6QvSYhu5w8j539a6sDwlAV9dTSSxCFbUZMCJLi', 'TRI YOGI SULISTYATMI', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1977-04-20', NULL, NULL, '2025-06-27 06:59:12', NULL),
(1284, '3304054906980005', '$2y$12$MfKE3HGa79xzcQ1iqKtTseBlLEdQMEBQRpW2oZftwFPJHAGfqaX4W', 'FITA KUSUMA DEWI', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Mahasiswa', 'Banjarnegara', '1998-09-06', NULL, NULL, '2025-06-27 06:59:13', NULL),
(1285, '3304051511940001', '$2y$12$SRUO1PPK7.lzodRIbW3ymuEcEJlLAflL77HRs863ESJvCLO9C3ec.', 'EDI SUJIANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pekerja Lainnya', 'Banjarnegara', '1994-11-15', NULL, NULL, '2025-06-27 06:59:13', NULL),
(1286, '3304056508960001', '$2y$12$4gvnMElr5VodwGzYtJy/mOKTnOc3T9g.qF75uu9bGk8ra3F9TIlcS', 'ENI SARINI', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pekerja Lainnya', 'Banjarnegara', '1997-11-25', NULL, NULL, '2025-06-27 06:59:13', NULL),
(1287, '3304054103770002', '$2y$12$M.dB5nXeMRUVQsaB9OTyE.Wws3EFVy1hPuAYAzbuk9IXu2fViWvtG', 'SUPINAH', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1977-01-03', NULL, NULL, '2025-06-27 06:59:13', NULL),
(1288, '3304054911990002', '$2y$12$oy76NtkCb1fuDe7JbRLBqesLuDE99M9VMoQYDIvACtnpxD8qnURy6', 'LITA SETIA NALIT', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1999-09-11', NULL, NULL, '2025-06-27 06:59:14', NULL),
(1289, '3304050208770008', '$2y$12$rv6/11O94iUcW/3TVuoxOeOzgeneVILFTq6WeA.JhPIYzKFFemEVS', 'AGUS TARUNO', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Petani ', 'Banyumas', '1977-02-08', NULL, NULL, '2025-06-27 06:59:14', NULL),
(1290, '3304054809810001', '$2y$12$xd9qR0aVxv3rLRNsBLb4je.5pfFN7uMZBeyxmKYR8lCYh2CxL04Gm', 'SAMIDAH', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Petani ', 'Banjarnegara', '1981-08-09', NULL, NULL, '2025-06-27 06:59:14', NULL),
(1291, '3304052110010002', '$2y$12$PRSiKrwGhH/ChmnAYpU0ledp6gibd2aVBUDnRg2Qr84nUsIG8ZtZ.', 'FATHU ROHMAN', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2001-10-21', NULL, NULL, '2025-06-27 06:59:15', NULL),
(1292, '3304054407780007', '$2y$12$kPAGwDSvxeHJd57u/XQxNORKE86jHV/hu2nFHjm9z9pJJpKTyvGWm', 'SARINNAH', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Petani ', 'Banjarnegara', '1978-04-07', NULL, NULL, '2025-06-27 06:59:15', NULL),
(1293, '3304050203000004', '$2y$12$VL7JWlk/piyOAZvrYLjU5OWXAJP2sDu1TNaRRIKaGupjQ.LWrzlgq', 'AGUN AFRIZAL', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2000-02-03', NULL, NULL, '2025-06-27 06:59:15', NULL),
(1294, '3304042411860001', '$2y$12$lzjymERUIqwrX3Q8Kq3djup1OxFJhUNpya9AIWPUmwA7Iij4ODXG.', 'WAHIDIN', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1986-07-26', NULL, NULL, '2025-06-27 06:59:16', NULL),
(1295, '3304056809930002', '$2y$12$tO0wQ4BJYpGDDg0AT85mLO/A/b7Zp1ikiiB/q67R2ViEG4/9gVNV.', 'IDA SUKANTI', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1993-09-28', NULL, NULL, '2025-06-27 06:59:16', NULL),
(1296, '3304053110770002', '$2y$12$Rk7FtMi2FYvPGR/Xqz79Le80ZM9ljQy1ulknaTMy5/opiDJTeQV0.', 'CHOTIBUL UMAM', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1977-10-31', NULL, NULL, '2025-06-27 06:59:17', NULL),
(1297, '3304054503830007', '$2y$12$5kbofo7/ddqXZLJSxDblsu8LSMsbO4WEXL1gdCvG3xr95I8iBdmea', 'SURYATI', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1983-05-03', NULL, NULL, '2025-06-27 06:59:17', NULL),
(1298, '3304051010940005', '$2y$12$1aq/DGOjYelhZ2mZULXn/el8Wk2T.TsXCs6kA/5Lkm8Vd4/1S75JW', 'RICHARD SETIAWAN', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Swasta', 'Banjarnegara', '1992-10-10', NULL, NULL, '2025-06-27 06:59:18', NULL),
(1299, '3304050310960002', '$2y$12$WXoua1ifpF.pRxahyTput.4J7RN/UUbgEX5bfkkUiTDYl4oQgP/VC', 'DICKY SETIAWAN', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Swasta', 'Banjarnegara', '1996-03-10', NULL, NULL, '2025-06-27 06:59:19', NULL),
(1300, '3304054608750003', '$2y$12$cXAdGe6FPYGBqbA/oVcFfephAQkkeWa5xPYdZuyWOYds/lpkAujSW', 'DASILAH', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1975-06-08', NULL, NULL, '2025-06-27 06:59:19', NULL),
(1301, '3304054105980004', '$2y$12$0Ys7./7B.WfOondv2NImnuJ1k5p98.RKPonW870P3Xc.ElGqoa2FK', 'DEA PAMELA ISKANDAR', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Mahasiswa', 'Banjarnegara', '1998-01-05', NULL, NULL, '2025-06-27 06:59:20', NULL),
(1302, '3304050304990004', '$2y$12$G2lB16z/1vYY6BP.9YLd0ONYwzCfKXSyIPTtl13fpMaFU8HOURqTK', 'DWI HANDIKA ISKANDAR', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1999-11-22', NULL, NULL, '2025-06-27 06:59:20', NULL),
(1303, '3304052802880003', '$2y$12$2UmVwHnrb9hnanFhS3YEEemeoxvtzRMRvIsNc2rBaOAgqp6BSQaxO', 'NURUL HAFID', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1988-02-28', NULL, NULL, '2025-06-27 06:59:20', NULL),
(1304, '330411018880002', '$2y$12$WCxnXoI5uBrss6XMWZkG3eMBqawa6a7M7T2gc.YHNDjHqkszSqaN.', 'KHAMID', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1988-01-08', NULL, NULL, '2025-06-27 06:59:21', NULL),
(1305, '3304054107780001', '$2y$12$me1Mi9zobp5eevBdG5JVsOSZrZAzCfG0ntDHzUmkDTlIjVgkMjLPi', 'SUSI SUWINARTI', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1978-01-07', NULL, NULL, '2025-06-27 06:59:21', NULL),
(1306, '3304050306840003', '$2y$12$ph8DCSrDwrimaettnFuoE.qeUFjekZlWgaqEHnuF5/ICKyj8Edbi.', 'AHMAD MUNDIRIN', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Sopir', 'Banjarnegara', '1984-03-06', NULL, NULL, '2025-06-27 06:59:21', NULL),
(1307, '3304056512900003', '$2y$12$K1q39Pyl.vyw1DYyuWQ4j.mGop4pp0zm4iwnJg45cmiyundo0Hzx2', 'ELING KURNIATI', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1990-12-25', NULL, NULL, '2025-06-27 06:59:22', NULL),
(1308, '3304050911960001', '$2y$12$4WVy14fdI5S6sVFZyrNA8uN.kurOrV03svGqHTYYE3eQ26tcEkU/6', 'IPAN WIDIANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pekerja Lainnya', 'Banjarnegara', '1996-09-11', NULL, NULL, '2025-06-27 06:59:22', NULL),
(1309, '3304051807760001', '$2y$12$SA.l6sVv/WIbfeQqVSpfJOJxEOBucPXYtR7yCiLQ5ZMEloCXzrHTu', 'KUNTORO', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1978-07-18', NULL, NULL, '2025-06-27 06:59:22', NULL),
(1310, '3304052405950001', '$2y$12$Z8t0B25jypM3bvscM5fO9e/czl8qiGxX3ASJOAuE9HtSGa2Ay8g96', 'NGILMANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pekerja Lainnya', 'Banjarnegara', '1995-05-24', NULL, NULL, '2025-06-27 06:59:23', NULL),
(1311, '3304050205780001', '$2y$12$9LoVOiGRmN0NYFAOj1xWZuRENJKKTQtcd7/JZ4z.dMGb8FEO87OX.', 'SUDIN', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Petani ', 'Banjarnegara', '1978-02-05', NULL, NULL, '2025-06-27 06:59:23', NULL),
(1312, '3304054309820005', '$2y$12$3J5FO4CC4fnuLkq.170lquVFy0YpEd/Qlk1k0bxdqxqmAQsHjtd4S', 'AMINAH', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1982-03-09', NULL, NULL, '2025-06-27 06:59:23', NULL),
(1314, '3304055611990003', '$2y$12$bq91kH4SqprMZu5cQapp0e9HiUeTr2dBFQbWks.Kn1p4hwYkm.7pm', 'WINDI NOVALINA', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1999-11-16', NULL, NULL, '2025-06-27 06:59:24', NULL),
(1315, '3304051912850002', '$2y$12$9EcgR42kt50o77gc4MlxZ.KxxbGq4McXxHAS8bF7KyD5MTBlScr7C', 'WATIM', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Petani ', 'Banjarnegara', '1985-12-19', NULL, NULL, '2025-06-27 06:59:24', NULL),
(1316, '3304054410890001', '$2y$12$4YGUrQmQMbG62yZRYuloWuhv7fknsVjcEc0t9TlA3/PBPhCSjcz9G', 'RATMINI', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1989-04-10', NULL, NULL, '2025-06-27 06:59:24', NULL),
(1317, '3304050208830001', '$2y$12$y91t8etDTmJ4PEgzsxUbROuoJtfATrivJUH5erUjjTr/UMl5Z1QtW', 'SUGIANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Pekerja Lainnya', 'Banjarnegara', '1983-02-08', NULL, NULL, '2025-06-27 06:59:24', NULL),
(1318, '3304055606910004', '$2y$12$0ROd/JuZ541RJlDHUChOye8TM2PJqlQg5t7Ld1DPbQiaqjcNOqpC.', 'LINDA', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Simalungun', '1991-06-16', NULL, NULL, '2025-06-27 06:59:25', NULL),
(1319, '3304055407960001', '$2y$12$Ur5P0v7Uvf0xYbXLEwBE..m7T6/ReoGcSkuyhBtMkQRKjpQ1lDLzi', 'IRMA YULIANTI', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1996-07-14', NULL, NULL, '2025-06-27 06:59:25', NULL),
(1320, '3208170707840003', '$2y$12$.klHnVta.6KXqKLPdPjIxeV4BxdpMy7ifnbJWq8Opgxmv8McQSG7S', 'UWEN SUHENDRIK', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Kuningan', '1984-07-07', NULL, NULL, '2025-06-27 06:59:25', NULL),
(1321, '3304056207830001', '$2y$12$nfLRLcPgoPCssksVrz7ALO9rAIAezd0zNiafvEOK2el3SXfx2BSt6', 'SITI MAEMUNAH', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1987-07-22', NULL, NULL, '2025-06-27 06:59:26', NULL),
(1322, '3304050706950004', '$2y$12$OwiLMrfaWvmLw2tAFOvtVeJ5IZPyXkykvPAAsvuCOsv//hhNSkMPm', 'MARGO WALUYO', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pekerja Lainnya', 'Banjarnegara', '1995-07-06', NULL, NULL, '2025-06-27 06:59:26', NULL),
(1323, '33040056404100006', '$2y$12$BRVnFCmdqdCe7STeg6agHeWfA8Wj9rNvshIFPJh1P5ZQTIw2wV2jS', 'HAPPY APRILIA .T.M', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2010-04-24', NULL, NULL, '2025-06-27 06:59:26', NULL),
(1324, '3304051710890002', '$2y$12$uXFEgRt30OVovm0xYxneiOIoekiOwYXZIEdgIAe3ZlH2RrQ5NFuv.', 'AHMAD MIKI SUPRIYANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pekerja Lainnya', 'Banjarnegara', '1984-10-17', NULL, NULL, '2025-06-27 06:59:27', NULL),
(1325, '3304056310930002', '$2y$12$rorzJDiiVqxsadngEb00vOc0VZnY4DODJDwdWI447CKPlJYFiq75G', 'TRI IMANI MIKANINGSIH', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pekerja Lainnya', 'Banjarnegara', '1993-01-23', NULL, NULL, '2025-06-27 06:59:27', NULL),
(1326, '3304041306920001', '$2y$12$rde1cZeVeS1SWSsqG3sy1O//YOQN4OzBTFaDOsLnaEb6vym6TTZhe', 'RIYANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Pekerja Lainnya', 'Banjarnegara', '1992-06-13', NULL, NULL, '2025-06-27 06:59:27', NULL),
(1327, '3304054410950005', '$2y$12$s/j3d8vu1ge6ncI72I9WLeyN.XtgT1Q5kXQnJ9H5jMR6k0QBb8QFK', 'WIWIT WIGATI', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Pekerja Lainnya', 'Banjarnegara', '1995-04-10', NULL, NULL, '2025-06-27 06:59:28', NULL),
(1328, '3304054107790047', '$2y$12$i/hdTWSH20PCS.nf7OoMbO0kbwll.uxsSy1YHyQX87/neSwNNvr4m', 'HATDIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Cerai Mati', 'Petani ', 'Banjarnegara', '1979-01-07', NULL, NULL, '2025-06-27 06:59:28', NULL),
(1329, '3304051108860003', '$2y$12$nWTyIEiX7B6cAB21x0ZUC.XhcQXfu8jVF9rg1i5DNqhpH6u/ajZRK', 'SUPEDI', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1986-11-08', NULL, NULL, '2025-06-27 06:59:28', NULL),
(1330, '3304056510870001', '$2y$12$BKinP/mh3FbEEIiiAZDBR.6R1MMu8uQtQ.r8l36nCWWFePnAUkQde', 'DATIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1987-10-25', NULL, NULL, '2025-06-27 06:59:28', NULL),
(1331, '1402112104900001', '$2y$12$35oXQbDhDnMZMHzpibiWRegPQ7LizSAuQEO0Xu6TAvYhfeTKoU0v6', 'DALIL PURNOMO', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1990-04-21', NULL, NULL, '2025-06-27 06:59:29', NULL),
(1332, '1402111404960001', '$2y$12$/uXGqn51RWcjOWXi5v8EGe.DZb4S6XTNX7ZCLSSbK7R/oVx/FQF6.', 'ISHAK', 'Laki-laki', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1996-04-14', NULL, NULL, '2025-06-27 06:59:29', NULL),
(1333, '1402114900790001', '$2y$12$5R2iyrsCEKxl/zcW6KwLb.nhjQp7.uYViNTfHlw.Peu2KUmhwdi9S', 'NINGRUM', 'Perempuan', 'Wiramastra, RT 02/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1999-09-07', NULL, NULL, '2025-06-27 06:59:29', NULL),
(1334, '3304051004720001', '$2y$12$ZlnbFHYGg5XykL3n1RloFO1KXPG7k12rsHTGmpYBZcg9M6cxpMsFG', 'IDRIS SUTANTO', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1972-10-04', NULL, NULL, '2025-06-27 06:59:29', NULL),
(1335, '3304055603700003', '$2y$12$67oSCrgg/ABmmnNumPqBBOIN4N5.2MBrEZbmPu9BItLz/GcpMZNLC', 'KUSRIATI', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1970-03-16', NULL, NULL, '2025-06-27 06:59:30', NULL),
(1336, '3304051601920002', '$2y$12$H0gGXU/EavpznhR2MJT96uIKzwkjE9PSscAbk35dvrkbBHxJFUKxK', 'ANGGIT SETIYOKO', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Mahasiswa', 'Banjarnegara', '1992-01-16', NULL, NULL, '2025-06-27 06:59:30', NULL),
(1337, '3304050205950006', '$2y$12$c8eJrXsag8wMDH5jrXg/4.SMdVustEhuEDGD7/fBC./8y.hWUSyT.', 'ANGGA PRASETYA', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Bekerja', 'Banjarnegara', '1995-02-05', NULL, NULL, '2025-06-27 06:59:30', NULL),
(1338, '3304056707910001', '$2y$12$VnX9wPmCODV3Y7JavJNUFOP8bMsWY1BO7y5IOimidKMfBgq3pV/YG', 'ALFIROH ', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Irt', 'Banjarnegara', '1991-07-27', NULL, NULL, '2025-06-27 06:59:31', NULL),
(1339, '3304050503000007', '$2y$12$p4UnnXijgUVOVKPMgv482OAR.3HX2uBkaiDVglahYUPzNmmrcu8Hu', 'ARI PURNOMO AJI', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2000-05-03', NULL, NULL, '2025-06-27 06:59:31', NULL),
(1340, '3304050107730082', '$2y$12$tCcYGE8aEQv0YCrz8fAZwuXR4A6bIrciw1I92UYQzfOjJblSv4v9y', 'RASMANTO', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1973-01-07', NULL, NULL, '2025-06-27 06:59:31', NULL),
(1341, '3304050306730004', '$2y$12$Jdufc80yJRSODH9nY5EK1egfvi/IR2VE3d4Ca/xQBv7/OyBifmrEu', 'HADI SUGITO', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1973-03-06', NULL, NULL, '2025-06-27 06:59:31', NULL),
(1342, '3304054107750065', '$2y$12$bP20EDtnswAzeVvJOOBa0uLmaJ3By6VQ6BDbgAKnmQpZiesRrkhjO', 'WARYANAH', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1975-01-07', NULL, NULL, '2025-06-27 06:59:32', NULL),
(1343, '3304055308000002', '$2y$12$osmEnwqR/GLFH5AzF.xoAez8zrMj5Pt2.z7ZxwgkRt4ffxSWGJ2Xy', 'DWI AGUSTIN', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pekerja Lainnya', 'Banjarnegara', '2000-08-13', NULL, NULL, '2025-06-27 06:59:32', NULL),
(1344, '3304056908780001', '$2y$12$3UfkOilWmTYu813BLle...Ehb7zD41E4aJvwlpRIPCBYznhQuPc/i', 'FARIDATUL NAFINGAH', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Pekerja Lainnya', 'Banjarnegara', '1978-08-29', NULL, NULL, '2025-06-27 06:59:32', NULL),
(1345, '3304052911960001', '$2y$12$vajg6xyfjWWXZbcpcpRxvOa5qGfVjya9VaxIxjmOnUddkYg.N7n5.', 'IRVAN SOFI', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan ', 'Banjarnegara', '1996-11-29', NULL, NULL, '2025-06-27 06:59:33', NULL),
(1346, '3304056702380001', '$2y$12$vZOuhOfFpzoDiMofEc4xPOZPIlueVyVbomjmvxPg/qLulSLW8DFAG', 'SUKINAH ', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1974-02-27', NULL, NULL, '2025-06-27 06:59:33', NULL),
(1347, '3304056202740002', '$2y$12$7PFM6JjIVIAL/JG3..sv7.c5NwCQYRdPCqpp//76NxaX./SvQ2BCS', 'SALIMAH', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1974-03-22', NULL, NULL, '2025-06-27 06:59:33', NULL),
(1348, '3304053108980002', '$2y$12$Wy3pPhYU8d9khFS5lpLxceyw1z9Mv4kia5mWJRkXFrY9y64ZzI/7u', 'ARIFIN NURROHMAT', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pekerja Lainnya', 'Banjarnegara', '1998-08-31', NULL, NULL, '2025-06-27 06:59:33', NULL),
(1349, '3304054609730004', '$2y$12$6A/UYBKSN7r7OQgFToQcGeXXyGR34ki.3IrxuxQ8nuy5E7V37N7vm', 'ADMINI', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1973-06-09', NULL, NULL, '2025-06-27 06:59:34', NULL),
(1350, '3304051010820009', '$2y$12$HGeOob7xClXWn10H90NW6.ggzNe1vlkF6GmdLdneVP0fZfogsrV3m', 'SUDARNO', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Bhl', 'Banjarnegara', '1982-10-10', NULL, NULL, '2025-06-27 06:59:34', NULL),
(1351, '3304050408800005', '$2y$12$17ujPGUrp6Ot00FPgwTjd.aVz/86uRT1EdMVCE5LMyJpmO5fJaCAe', 'MUNDIRIN', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1980-04-08', NULL, NULL, '2025-06-27 06:59:34', NULL),
(1352, '3304055909820002', '$2y$12$.kJJXKgKGXsxt7mkWI2.leeOBECxPTmdvm3KcqR4WhMB9ctv.c7le', 'MUNJARIYAH', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1982-09-19', NULL, NULL, '2025-06-27 06:59:35', NULL),
(1353, '3304054801740001', '$2y$12$5PhHM75ONlgLWjStjBblJeDfqRgBTu84FIqOJYZNjViQFFlTwIimS', 'SUKIYAH', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Petani', 'Banjarnegara', '1974-08-01', NULL, NULL, '2025-06-27 06:59:35', NULL),
(1354, '3304050407750003', '$2y$12$izPbq1TH87zso9untlt9GehE3b/Xcu3OXSKPQwh1g5GNVPTC8lCWC', 'KASMUDI', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Petani', 'Banjarnegara', '1975-04-07', NULL, NULL, '2025-06-27 06:59:35', NULL),
(1355, '3304051105760006', '$2y$12$3OIsFwokDQ8Iy5AJ.zJnv.4Dln23YM3YW1D.5hL7U.dLMpcWT.f46', 'IMAM SUGIRI', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Pekerja Lainnya', 'Banjarnegara', '1976-11-05', NULL, NULL, '2025-06-27 06:59:35', NULL),
(1356, '3304054509780005', '$2y$12$w6JFNik87Ap0Zyk8.xnThufMxvrpr0mZNijPsJxfA8XEwYEcRN8gi', 'FELY DONA SUSANA', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Guru', 'Banjarnegara', '1978-05-09', NULL, NULL, '2025-06-27 06:59:36', NULL);
INSERT INTO `pengguna` (`id`, `nik`, `password`, `nama`, `j_kel`, `alamat`, `agama`, `status`, `pekerjaan`, `tmp_lahir`, `tgl_lahir`, `remember_token`, `created_at`, `updated_at`, `nomor_hp`) VALUES
(1357, '3304054502970003', '$2y$12$lqTc6PXfTmiMCmCoxfmJsOjLM55yWYdJN4Dkcgdhgh7MpQ8KjdpM6', 'LHAEWY FELLYNDA', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan ', 'Banjarnegara', '1997-05-02', NULL, NULL, '2025-06-27 06:59:36', NULL),
(1358, '3304052312890003', '$2y$12$yI187gXoSkr9cG9mmFIefOPtvL9TKI2G7NG0XCwr6mLMVB2tZqRDW', 'WIRAWAN HUDI PRABOWO', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pekerja Lainnya', 'Banjarnegara', '1989-12-23', NULL, NULL, '2025-06-27 06:59:36', NULL),
(1360, '3304054406810005', '$2y$12$nlhTJCouq3ME1VHJtrnYDuDlhjoj.G71PKm5OpKy9EhD/7ZoooXRm', 'HADIISEM', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1981-05-06', NULL, NULL, '2025-06-27 06:59:37', NULL),
(1361, '3304054107010014', '$2y$12$FEMkla8OAmwUNymmIgfM/.rH9w.ne8J/BnG4uf5fzkm0yHnSOt6Pe', 'ANI SURANDI', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2001-01-07', NULL, NULL, '2025-06-27 06:59:37', NULL),
(1362, '3304050409880001', '$2y$12$taQcwSvrv70IN.g3B5SWX.Jz.twnTKy0sWBIgcdgGR1GQcZ1pFD.O', 'ARMASNYAH', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1998-04-09', NULL, NULL, '2025-06-27 06:59:37', NULL),
(1363, '3304044411880001', '$2y$12$qLpmQHZ0ggcM2jIGwfr3yuCW3IH/77vQlW1eIu4pbT9318DBX8Uza', 'JAHROTIN', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1988-04-11', NULL, NULL, '2025-06-27 06:59:37', NULL),
(1364, '6201042608850001', '$2y$12$3RUuec6a/dXg18cWhLNdc.m7zBvTBknI.TbThfsPSwuSvtSZXPHvW', 'RODIM', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1985-08-26', NULL, NULL, '2025-06-27 06:59:38', NULL),
(1365, '3304145102990001', '$2y$12$Iqe9hj/P9cCLWyut28iCuuelxOhL/8G1lXEYh08mhUE593BjEq9oO', 'SULASTRI', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1996-11-02', NULL, NULL, '2025-06-27 06:59:38', NULL),
(1366, '3304054506850007', '$2y$12$zsqXuwxCNHbl9v803nGJD.M.FNxzH7yEXDkYZYv/S4brOHBD3rqnq', 'JUMATUN ISWIYAH', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1985-05-06', NULL, NULL, '2025-06-27 06:59:38', NULL),
(1367, '3304050061174001', '$2y$12$DbTWVRKy0t82c1PR.sW38uVo0e0ti6.mAmhv581f6rW41Cw98PFcS', 'SUGENG RIYONO', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Tanggerang', '1974-06-11', NULL, NULL, '2025-06-27 06:59:39', NULL),
(1368, '3304055507760002', '$2y$12$OEl29S5MeLZ0l5veu1F5/eX/otxU8fiQjXqM77wFHqUIPX5f2FGgG', 'SAROH', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1976-07-15', NULL, NULL, '2025-06-27 06:59:39', NULL),
(1369, '3304051610010001', '$2y$12$NPMPQ.O7Ai6vGZaUsCRxl..7s9I7qnEwdKNbNfgiN8IFhXUKl.Bim', 'OKI FAJAR SAPUTRA', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2001-10-16', NULL, NULL, '2025-06-27 06:59:39', NULL),
(1370, '3304051712910001', '$2y$12$rBuyybhcwLi.MXpNnflSkORd9sbdbpAf4JBar3A9nzw/AUy9TVNl2', 'DESI ADI PURNOMO', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Pekerja', 'Banjarnegara', '1991-12-17', NULL, NULL, '2025-06-27 06:59:39', NULL),
(1371, '3304054505990006', '$2y$12$jUaykNgVWOO348zIhAcibeceeV7te5au9mhvxJU7F8CKFgJbi3PSO', 'SAKINAH', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1988-07-13', NULL, NULL, '2025-06-27 06:59:40', NULL),
(1372, '3304050105790004', '$2y$12$m84rAVD4/ZHfbBOxZ0vahei6sW7zxmBk1SwRTb0vuP1aSfPeCFB5K', 'MUTAJIN', 'Laki-laki', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1979-01-05', NULL, NULL, '2025-06-27 06:59:40', NULL),
(1373, '3304056009810002', '$2y$12$M.EEJMQPD8vknQhMawiETuycQ.lzvkl3WmYDPVbWCW.5k8K///toG', 'TUKIEM', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Kawin', 'Irt', 'Banjarnegara', '1981-09-20', NULL, NULL, '2025-06-27 06:59:40', NULL),
(1374, '3304054305960002', '$2y$12$fzfKk61LPFfAM4Ww6v4gzekh5Z3CMRsJivISoQJR6Ncdnkfug7ltq', 'ASWIYANTI ', 'Perempuan', 'Wiramastra, RT 01/RW 01 Kec. Bawang', 'Islam', 'Belum Kawin', 'Karyawan ', 'Banjarnegara', '1996-03-05', NULL, NULL, '2025-06-27 06:59:40', NULL),
(1375, '3304055103740001', '$2y$12$P4CB9mAVf5.xhZ1sWkpmnuiI3D8wCgg/BlYadPdNNcbJR.GhURtn6', 'RASINI', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1974-03-11', NULL, NULL, '2025-06-27 06:59:41', NULL),
(1376, '330405607920003', '$2y$12$jPrRQC7rELyD.e0dYlI9cOMiexlYyX/n9.8VX.rOx93q4f89kbGoy', 'NUR LAELI', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1992-07-16', NULL, NULL, '2025-06-27 06:59:41', NULL),
(1377, '3304055202930001', '$2y$12$xjlor3po13CrOOF4JXNXgu00vksCnRvFX64AgxyiTWieoTUrqXE4m', 'KHAMSILAH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1993-02-12', NULL, NULL, '2025-06-27 06:59:41', NULL),
(1378, '3304052104830002', '$2y$12$yEb98CDaiZRRXLF3hXuav.WKNdP.fft/hsLsmDGlZWo1MZ4mEYsyq', 'TAHMIDIN', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Peternak', 'Banjarnegara', '1983-04-21', NULL, NULL, '2025-06-27 06:59:42', NULL),
(1379, '3304056007860007', '$2y$12$Y2oHy4F0fdhZajQRyMZ/Yurs3EBGk3grgxwewKr31JcLpDNDq11e2', 'KHOERIYAH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1986-07-20', NULL, NULL, '2025-06-27 06:59:42', NULL),
(1380, '3304052810920002', '$2y$12$TNC0ZI1wCa46/okEh4KksOlzFA3TkVxPTWi1Vc0Ozt6UMeE20QF8u', 'FIRDIAN WISNU B.S', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1992-10-28', NULL, NULL, '2025-06-27 06:59:42', NULL),
(1381, '3304055006930004', '$2y$12$vCa4ue4E97UtlfnizfsLYOWRoX9c7g/N0a97LH9ElQdAE9C8i60qq', 'NURUL WAJRIAH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1993-06-10', NULL, NULL, '2025-06-27 06:59:43', NULL),
(1382, '3304051111800004', '$2y$12$FJAUUNzIlI6aRsO3nVKhC./dfZN3PcNRRtalytcXvaQ5I0PyTg4xS', 'SUPARYO', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Petani', 'Banjarnegara', '1979-05-02', NULL, NULL, '2025-06-27 06:59:43', NULL),
(1383, '6201041207860002', '$2y$12$I7T6oDEmSCXjy2YQd4r7.Ox2dagLaLXcE257CmZv4f6//i5W8LoC6', 'MIFTAKHUL', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1986-09-12', NULL, NULL, '2025-06-27 06:59:43', NULL),
(1384, '6201040909880001', '$2y$12$7Pv3xVEOzeCltKzyYjJbR.S8j6xozrovR2gw9Ae3QkriilQboVNTa', 'MUNSORIF', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1989-02-27', NULL, NULL, '2025-06-27 06:59:43', NULL),
(1385, '3304050908940003', '$2y$12$tetkRbkY4H7ITiIHJqzDG.7GbD.FX.HZ1sRW7nzbE6NfG9YxMlo7.', 'MUFIDIN', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1994-08-09', NULL, NULL, '2025-06-27 06:59:44', NULL),
(1386, '3304052005920001', '$2y$12$BDtWZ9s7wFa9PTzOxMVfgeEoPAx9zfgyO4wp4Gmvc7u89dCvs8/Cu', 'RANDY EKO L.', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1992-05-20', NULL, NULL, '2025-06-27 06:59:44', NULL),
(1387, '3304051011940001', '$2y$12$S1lUSWZznkOjT/CbgvstIuZxlgoWU3OsyuKdoLUEqmwxYXE3PiKVK', 'VERDY ARDIYANTO', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Mahasiswa', 'Banjarnegara', '1994-11-10', NULL, NULL, '2025-06-27 06:59:44', NULL),
(1388, '3304052502870004', '$2y$12$3xDQZKpKtwgSym6S5n/62.hSnxiGItSyldWosqy3ZyxE0WE36CtB.', 'SOBIRON', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1987-02-25', NULL, NULL, '2025-06-27 06:59:44', NULL),
(1389, '3304051708810001', '$2y$12$wM.oJEl.nht47o3vR6.AIuyXa3rJJ5m0acWNuxS5HYYAh7TDjx/PG', 'ABDUL ROHMAN', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1981-08-17', NULL, NULL, '2025-06-27 06:59:45', NULL),
(1390, '3304054806860001', '$2y$12$2Y4dqRlH4UdGfBPDbRPK1OfdKmFtBni1KPiLIaKnhOPeRfgDROw8W', 'ROHIMAH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1986-06-08', NULL, NULL, '2025-06-27 06:59:45', NULL),
(1391, '3304050301930001', '$2y$12$/AqdtGx5KAK2H3goag2aCe17N2Wl9GCwBE28d0BvrNcTo0I.XXCWy', 'UMAR SAID', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Petani', 'Banjarnegara', '1993-01-03', NULL, NULL, '2025-06-27 06:59:45', NULL),
(1392, '3304056006970001', '$2y$12$EOZY0cF9/xcKsENiq3fZZ.PoFlASopCKPgEXkPWhjyNFXnUK3uFJy', 'NISFI HOLISAH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1997-06-20', NULL, NULL, '2025-06-27 06:59:46', NULL),
(1393, '33040506044810002', '$2y$12$WkluIPYh57KC8XyK7UkJyeOMSMW8WAEmCOlWMtsbd8ObL/2dyNQWi', 'YATIRIN', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1981-04-06', NULL, NULL, '2025-06-27 06:59:46', NULL),
(1394, '3304054718870002', '$2y$12$vuaQCJ/CguA/NI8kBOF/ZOAaUKHx5gCLgXbKqn9jn1KsaF.gHz0e.', 'SULIYANTI', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1987-10-07', NULL, NULL, '2025-06-27 06:59:46', NULL),
(1395, '3304051404760006', '$2y$12$wuI.0AUr2dnGdoKHy490CuzYashUs6xczqA3IVo.xYOz6hmwCdcuu', 'DULHAMID', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1976-04-14', NULL, NULL, '2025-06-27 06:59:46', NULL),
(1396, '3304055404780005', '$2y$12$ImgKMI9CcT7HjgeGu6V.muBp40Dj2e8AmvveO6suQucmBQQW16Xeq', 'WAJILAH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1978-04-14', NULL, NULL, '2025-06-27 06:59:47', NULL),
(1397, '3304051603770001', '$2y$12$UbJpP2cZKMCl6LrPBWCMmev0HqIMDXxIQclz7JwDpeAH6/Vq8cesO', 'SOFAN', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1977-03-16', NULL, NULL, '2025-06-27 06:59:47', NULL),
(1398, '3304056007830004', '$2y$12$KveS/j/U2gF93MAS8EfYouIDhtNoQhrcjUSOTIYBNTnbFKBlMBTSW', 'ALFIKOH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1983-07-20', NULL, NULL, '2025-06-27 06:59:47', NULL),
(1399, '3304056311960001', '$2y$12$Pcor8f29zHh3C3iE0UOPxeweETOKsr0w4v4PeOGTathx61gP0Q52O', 'WAHYU NUR HIDAYAH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1996-11-23', NULL, NULL, '2025-06-27 06:59:48', NULL),
(1400, '3304050709000002', '$2y$12$qdA0zfO1wjHM6xvuy0iCaeETPmsFARCipjYOJEp0v1uf4gGezRgeS', 'SAPTO HASBULOH', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2000-09-07', NULL, NULL, '2025-06-27 06:59:48', NULL),
(1401, '3304051003810006', '$2y$12$fktlK2.V4mxJ2WWEnVsu7.2ud4e2c/LzxYFSZS5GP5be9a9HtuI7y', 'SARNO', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1981-03-10', NULL, NULL, '2025-06-27 06:59:48', NULL),
(1402, '3304052098400009', '$2y$12$qJ8Kly4XlxjAkSgLFW9Siebo9ZpG2rXHGKXUqog09VII9ac6Hl8tS', 'KHASANAH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1984-09-07', NULL, NULL, '2025-06-27 06:59:48', NULL),
(1403, '3304050411920003', '$2y$12$jgOcHx62lJzvWSpVMxeHGOt3RB1KS2RKt6k1CZnC1v3Nz3.nwO2fG', 'SODIKIN', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Mahasiswa', 'Banjarnegara', '1992-11-02', NULL, NULL, '2025-06-27 06:59:49', NULL),
(1404, '3304056604960003', '$2y$12$gSJoIehUMNVz/a8.uqDj6up9EAN17/SIvefFs0q1GpClWLdJ8yGIu', 'NURHIJAH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Mahasiswa', 'Banjarnegara', '1996-04-26', NULL, NULL, '2025-06-27 06:59:49', NULL),
(1405, '3304056509000003', '$2y$12$IW/C9nrcOEHE9ar/MlW4jeeSg1MT7TLtx7KEHxg.iA5XyLzLeveJq', 'RENI FATMAWATI', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2000-09-25', NULL, NULL, '2025-06-27 06:59:49', NULL),
(1406, '3304051103890006', '$2y$12$zV9puVeUb1cIvqvPRvb4ee8ouiWB1ZmoYeJ/C.3hZaiY.gup2I.Xq', 'NAJIB', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1989-03-11', NULL, NULL, '2025-06-27 06:59:49', NULL),
(1407, '3304055204930005', '$2y$12$kzoOPDMDxSmJkicD3x6ge.NV1zvLodPIajHMkuBn/75dK5vRaZ1VK', 'KASTITIN', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1993-12-14', NULL, NULL, '2025-06-27 06:59:50', NULL),
(1408, '3304055108850004', '$2y$12$eRfUbXQPPAvwCsD.GfBQHO.VwKw3z5spJ5N.KAaGqqa1cVJtmwWgW', 'SUTARTI', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1985-08-11', NULL, NULL, '2025-06-27 06:59:50', NULL),
(1409, '3304050604890003', '$2y$12$P0VHe0E7MD.GhmIwzgXZGe/xg7YLqDV01PS1pLP3bYfN.Nw7wmPUe', 'MUNDIR', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1989-04-06', NULL, NULL, '2025-06-27 06:59:50', NULL),
(1410, '3304051205890001', '$2y$12$oz3HNNhvTk/QdVPJV.rXE.cHS/xTj2laXPk1C6gnoU3.qKhKmhxt6', 'TA\'YIN', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1989-05-12', NULL, NULL, '2025-06-27 06:59:51', NULL),
(1411, '3304055202950004', '$2y$12$Y0zT2rIXup0FeqaWelJ8PuMcQCfYVi8QMFqRUb3jDDVOmTPV6Lxc6', 'NAPSIYAH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1995-04-12', NULL, NULL, '2025-06-27 06:59:51', NULL),
(1412, '3304052607860002', '$2y$12$UykkUbnEE7wXTD7KF5D0n.DjR6hl.bCSxZwAg3rWkJIez2gCdo5Gq', 'SOLIHUN', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1986-07-26', NULL, NULL, '2025-06-27 06:59:51', NULL),
(1414, '3304051051750003', '$2y$12$01K8.xAQKaQ5J6XTbmzwUellkTBskRk5y1Bxm1tz4lbKzxJMe3syO', 'TOHIRIN', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1975-01-10', NULL, NULL, '2025-06-27 06:59:51', NULL),
(1415, '3304050407740005', '$2y$12$sFUX9i5q7bgATLvobdcF7ehXw9O0icXwo3akCM6ErxZr.FAqiYN.C', 'TOHARUN', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1974-07-04', NULL, NULL, '2025-06-27 06:59:52', NULL),
(1416, '3304055705770001', '$2y$12$46YoO0k63kMc5RMxzP1K3O6jtN2JdVPijwrRZdyoqP2WwkIxnzg9a', 'RATINI', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1977-08-27', NULL, NULL, '2025-06-27 06:59:52', NULL),
(1417, '3304056107000001', '$2y$12$b6BbKhZ1x7AqPW98BSo0K.fITOuKbxTXgmoagRyGdlgzt7gwP46TC', 'LIKA HAWANI', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2000-07-21', NULL, NULL, '2025-06-27 06:59:52', NULL),
(1418, '3304054309770003', '$2y$12$RFdVtqBLTOnTPAGsHxTbKeXDiDX7rPfkXSq0Y1U6kTwHWRlkVi4Um', 'KARISAH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Petani', 'Banjarnegara', '1977-09-03', NULL, NULL, '2025-06-27 06:59:53', NULL),
(1419, '3304052503770003', '$2y$12$vFMotLuxTP3v/eEVBKYpBu//JrAwNBipPlLWa09ltfOM7kpeEraOC', 'KHARIS', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1977-03-25', NULL, NULL, '2025-06-27 06:59:53', NULL),
(1420, '3304055901790001', '$2y$12$6CrL.zklP7luNqr/HBhoAuQvyB98kJ.2p/7TVPI8y0/ihEmi0E7lS', 'TOWIYAH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1979-01-19', NULL, NULL, '2025-06-27 06:59:53', NULL),
(1421, '3304051107900003', '$2y$12$GkoAMVEmw113zcxe992MrOvNIbAiVeAcIz2oiqagKjSrAtpbSRY/m', 'MUZANI', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1990-07-11', NULL, NULL, '2025-06-27 06:59:53', NULL),
(1422, '3304050704700005', '$2y$12$3ntCPCUPds8JcNLlJ1flsOW2H0AUhlhNFU/dK6tj3ECo2tjJvhYhG', 'AMIN SYUFA\'AT', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1970-04-07', NULL, NULL, '2025-06-27 06:59:54', NULL),
(1423, '3304056606780003', '$2y$12$bmxziJGSdJsZATWJm1SqsuaE2tL4SEtaXSPf6P6kqjR4A9oIFnK5y', 'WURSIAH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1978-06-26', NULL, NULL, '2025-06-27 06:59:54', NULL),
(1424, '3304055205970001', '$2y$12$a08V/ELJ2cIzopdPAraAr.QaVz8W2q3JXiJm7SkuAo5e.c9zii8Mq', 'AISYAH NURAINI', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Mahasiswi', 'Banjarnegara', '1997-05-12', NULL, NULL, '2025-06-27 06:59:54', NULL),
(1425, '3304055110790003', '$2y$12$9zF/zDCiJGrCIt5TsrIImuKQ3b5PEy413M09ex6xGp7roRdbdh0Oa', 'TARIYAH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Cerai Hidup', 'K.Swasta', 'Banjarnegara', '1979-10-11', NULL, NULL, '2025-06-27 06:59:55', NULL),
(1426, '3304054104930002', '$2y$12$hI1bI2vu9hvJxRO8adC2POJ/UUGHWwsftd32HCB0y9GugQI26Cy5m', 'TARYATI', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1994-08-08', NULL, NULL, '2025-06-27 06:59:55', NULL),
(1427, '3304054101800008', '$2y$12$HDQARlP2zTTTDzfmlqn0ge2xWzGaLCUAvce15FHbZISU8qVJbtJOS', 'ISTIQOMAH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1980-01-01', NULL, NULL, '2025-06-27 06:59:55', NULL),
(1428, '3304050712100004', '$2y$12$GIpn4UVy5f6HAy52nYaxhOR64EFmqRFEUlCWKkzLqOI1nEZZyKX8y', 'ALIFULLOH', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2010-12-07', NULL, NULL, '2025-06-27 06:59:55', NULL),
(1429, '3304052310910002', '$2y$12$k9GSrZXruhjEjwu/TdRYxOPwm0aBgosoo960xcVmUn6kk5pVINvrS', 'MUSAKIF', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar Lainnya', 'Banjarnegara', '1991-10-23', NULL, NULL, '2025-06-27 06:59:56', NULL),
(1430, '3304051210930003', '$2y$12$t7cfjoTU7UNmssyL.iKKEOCZEn..l7.CZTb9ulO79dit8p6.2cNPK', 'MUHAMMAD IRKHAS', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1993-10-18', NULL, NULL, '2025-06-27 06:59:56', NULL),
(1431, '3304054208950002', '$2y$12$q.kor1U6Sanq21AK0Jl8tODMhpwcdHXHwrc8JNhK6Gi9pgtJQobNG', 'MULIFAH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1995-08-10', NULL, NULL, '2025-06-27 06:59:56', NULL),
(1432, '3304055504970001', '$2y$12$JgYCDuAwxw2TwbGjYe59buFKuKAF6PRRQk8wvzqbO2O5PVNbD/CSS', 'FAIQOH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1997-01-14', NULL, NULL, '2025-06-27 06:59:57', NULL),
(1433, '3304054401990003', '$2y$12$yo82iUCNEK3PQbR8FjHTcu1zdabKj9VK9lTBK71j7qEUaQ02y1Bhi', 'BAETI JANNATI', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2000-03-01', NULL, NULL, '2025-06-27 06:59:57', NULL),
(1434, '330405908810001', '$2y$12$5DfVRqZqekN/zHiNEu75U.sDMAS4FbK1XPRE16TGENjELilJVt4vC', 'MUHASAN', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Jasa Lainnya', 'Banjarnegara', '1981-08-09', NULL, NULL, '2025-06-27 06:59:57', NULL),
(1435, '3304054606870006', '$2y$12$hnkEDBF16ywBoVwKT5/eR.z52YfGsfClQeBX/hYGm7ZTpyvET7dRq', 'ROFIDAH', 'Perempuan', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1987-06-06', NULL, NULL, '2025-06-27 06:59:58', NULL),
(1436, '3304041008830009', '$2y$12$Teqhh1IP12WifB2LiiiB9e/y1ERCn9XDWzEm3BzNOABJ4aMS0eU8i', 'WASIS', 'Laki-laki', 'Wiramastra, RT 01/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Swasta', 'Banjarnegara', '1983-08-10', NULL, NULL, '2025-06-27 06:59:58', NULL),
(1437, '3304055606780007', '$2y$12$Nls/j0CNiD.T2xYSrv0guueOcAqOMMnjHtX6pFrrSseEI4WbcRME.', 'WAHYU WASILAH', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1978-08-16', NULL, NULL, '2025-06-27 06:59:58', NULL),
(1438, '3304050604950006', '$2y$12$MO.EDAldGvsrQWvc5hluw.DxWr2u8izVDWaCDylA067GMSkcHu/Gu', 'EKO NUR HIDAYAT', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1995-04-06', NULL, NULL, '2025-06-27 06:59:59', NULL),
(1439, '3304051808780002', '$2y$12$U7Q4CfBXTkGISbQfp75LyugldsBWoCFhMngcO63MHTzESD/ikZSny', 'SUTARYO', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Transportasi', 'Banjarnegara', '1978-08-18', NULL, NULL, '2025-06-27 06:59:59', NULL),
(1440, '3304050409780002', '$2y$12$qKqF1sYBNqYUrN55Y25K3O8HsQpib3KFpJgL5e/uFwaYg708n9zcO', 'SUPENI', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1978-09-24', NULL, NULL, '2025-06-27 06:59:59', NULL),
(1441, '3304051110810002', '$2y$12$OOFD3G8tBt3iavavWfyocu1JvowT/z2rG.Lo7w9fQMcASmLLCSXyO', 'TASMAD', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1981-10-11', NULL, NULL, '2025-06-27 07:00:00', NULL),
(1442, '3304054106780008', '$2y$12$n2ayZeA90xFNKcLBqlP/xeXKBMOcJS9Ka3eXxVUWRb0QFAqHFjTwO', 'RUNTAH', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1978-06-01', NULL, NULL, '2025-06-27 07:00:01', NULL),
(1443, '3304054201780001', '$2y$12$IADBnU4rqTG0JntPTJBqb.CAiv70NfGg/bZq.dwpKcwdjKY8rxZ6a', 'TUKISAH', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1978-01-02', NULL, NULL, '2025-06-27 07:00:01', NULL),
(1444, '3304051503960003', '$2y$12$vc2J8.mnJk4V8nsjykLXguBZE5W7Ft9gNLr2xxA4UsXTJNaujRg.m', 'DALHAR RIFANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1996-03-14', NULL, NULL, '2025-06-27 07:00:02', NULL),
(1445, '3304056705000002', '$2y$12$eUAPiC0k61B/6OuYD5Dd.Oyh811YZ5oAJ3i9WP95ELvHtJ7Sj1cGq', 'FAIKA MELINI', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2000-05-27', NULL, NULL, '2025-06-27 07:00:03', NULL),
(1446, '3304055503980001', '$2y$12$gNjhX6f9luKOqI2sd./WUOao1/dHYh/IDS8L7mpN5QJmohDxLhokG', 'IIS KAROMAH', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1998-03-15', NULL, NULL, '2025-06-27 07:00:03', NULL),
(1447, '3304054907740001', '$2y$12$Wmn.hN0OMeznw..Zgt28W.YoRdoVV1YGkt48E2Tnq1MwJlDLtsvYe', 'TARMIATI', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1974-07-09', NULL, NULL, '2025-06-27 07:00:04', NULL),
(1448, '3304054711760007', '$2y$12$TPnGMfXZ5pDmLQeZ6NSM.OE/j/3ooVjkykuAnknAaA.DgyavAae6C', 'TUMINAH', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1976-11-07', NULL, NULL, '2025-06-27 07:00:05', NULL),
(1449, '3304050501930005', '$2y$12$DrJYD6mOl2aEarUWRWD.8umiCSWvQDdZv05JCO6PU9fdLj0HQlyZK', 'CHOLIL ANWAR', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1993-01-05', NULL, NULL, '2025-06-27 07:00:05', NULL),
(1450, '6207070805980001', '$2y$12$kc3ZeAP8HCGQHuHI/b/IB.D8uMvlDUwRMSLfMgcOaxJbPlz.LtWx.', 'SUNARTO', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1998-05-08', NULL, NULL, '2025-06-27 07:00:06', NULL),
(1451, '3304054804760004', '$2y$12$h22Jc3bdKvKiN5.vKBzUJOgGTuSEKz8UXbKvBm9ToM/H7bGaCA5kq', 'SUMINEM', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1976-04-08', NULL, NULL, '2025-06-27 07:00:06', NULL),
(1452, '3304051906980001', '$2y$12$ZtHE/SsKs9nrJ98VrdtTuevpU74f6SGGPeuG5y5MowVZ74ig80agS', 'RAFI', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1998-06-19', NULL, NULL, '2025-06-27 07:00:07', NULL),
(1453, '3304050809800004', '$2y$12$5o/1eHASJSlZ0QpRbEMXcObbrU5DR2lhxIBrAeF9RUmXcXxag7EOa', 'IRIN', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Belum Bekerja', 'Banjarnegara', '1983-09-06', NULL, NULL, '2025-06-27 07:00:07', NULL),
(1454, '3304050303890006', '$2y$12$yHqNKph7zGWY4Nh6K2Aby.mPjoaTWWcOa8UmrjKMNTCF9ZynAeH8e', 'TRISMAN', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1989-03-03', NULL, NULL, '2025-06-27 07:00:08', NULL),
(1455, '3304055007770006', '$2y$12$GEvm0AlaUFcsG4.Q80f6COvqC17GUPmRScUwgikoB.jP9Rn9AR4AC', 'SITI KAROMAH', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1977-07-10', NULL, NULL, '2025-06-27 07:00:08', NULL),
(1456, '3304052803810001', '$2y$12$fQgsUqoixIXM0/LaQn1CWeuUA1.dMEugOQM/xZf/MFpgiO8gLO/wO', 'AMIN CHAJATI', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1981-03-19', NULL, NULL, '2025-06-27 07:00:08', NULL),
(1457, '3304055908820007', '$2y$12$NFehzARyIMAwWckJjcel4.EFZ7yaq8TG.MjwFakOK1VzlUeqEAmlm', 'MUAWANAH', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1982-08-19', NULL, NULL, '2025-06-27 07:00:09', NULL),
(1458, '3304050908820003', '$2y$12$lKwsk1rr6PWjHRhzGMYap.CE66PmJdHjii8Kb89tejT1x94fof2zq', 'MAHSYUR', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1982-08-09', NULL, NULL, '2025-06-27 07:00:09', NULL),
(1459, '3304056610850002', '$2y$12$l8T7xYa2VeFqkSuFnXJsYuVdfKn6DrnNbWw7csBuF0SzbbpZV08si', 'MUNAWAROH', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1985-10-26', NULL, NULL, '2025-06-27 07:00:09', NULL),
(1460, '3304052108860002', '$2y$12$fvQ7LZYcARXmaRa2zVYXnevMN8iULTWO5U2Kum1IMlzf.D6UeDc8a', 'ARIF SETIONO', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Peternak', 'Banjarnegara', '1986-08-21', NULL, NULL, '2025-06-27 07:00:10', NULL),
(1461, '3304054403890004', '$2y$12$lDiV1KnJyiD2ctejFSW9eeDXzzhjw/szxB5ZmhN3392lul7IouUre', 'ATIK WAHYUNIATI', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1989-03-04', NULL, NULL, '2025-06-27 07:00:10', NULL),
(1462, '3304055002760002', '$2y$12$PiFaPcMRGVJpEdYoFfvEhue4dYvQWXsldviSr9RPaI.3ah95s3ca.', 'JAENAH', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1976-02-10', NULL, NULL, '2025-06-27 07:00:10', NULL),
(1463, '3304052507680004', '$2y$12$Bo2YCTdGHx33XJJsaAL2oemYHyv.RQsKoDV2aoVKkOOSCdEjNwe16', 'KHOLISUN', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Pns', 'Banjarnegara', '1968-07-25', NULL, NULL, '2025-06-27 07:00:11', NULL),
(1464, '3304050808050003', '$2y$12$H3OpSW0k8S/JSF/sTCi/ueEXI9zPdSjuBjKnq/cwBOTtOfL1Xmtuq', 'FARHAN DWI P.', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2005-08-08', NULL, NULL, '2025-06-27 07:00:11', NULL),
(1465, '3304050902790001', '$2y$12$DW4i8W7V6zIRRvKxueAlkugXm/fGLB5/Va26U81SwITwkmYAMXnbm', 'KASMAD SUPRIYATO', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Buruh Harian Lepas', 'Banjarnegara', '1979-02-09', NULL, NULL, '2025-06-27 07:00:11', NULL),
(1466, '3304051910880001', '$2y$12$r.9w4biiGOf7z9gJN9kdGum1gZvqLPDD6tIwrjRInO1hLb3EDIw3.', 'SAEFUL AMRI', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1988-10-19', NULL, NULL, '2025-06-27 07:00:12', NULL),
(1467, '3304055701730005', '$2y$12$8AQeb6QxpiliHwUZNX464uA2fprSMzzyMrdfJafmqEsVZxxyzDyzO', 'SITI KHOERIYAH', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1973-01-17', NULL, NULL, '2025-06-27 07:00:12', NULL),
(1468, '3304050804970001', '$2y$12$ZnkWXcZl7z/BbDpzHyC9v.iQgITIn53r89PcPt99g3MU71N0QA4.y', 'HIDAYAT', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1997-04-08', NULL, NULL, '2025-06-27 07:00:13', NULL),
(1469, '3304051209000001', '$2y$12$FoOt4bBITb6v93AYy8sU8e56ctGr.ewApWWWmqrv7WDXmMaRYR0Xm', 'SAFANGAT', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2000-09-12', NULL, NULL, '2025-06-27 07:00:13', NULL),
(1470, '1118024703750001', '$2y$12$d4i9SP7dWsdW0cUEnjEBN.4xVBjn2cfjsQffrsPKwTpAB6iJDOCwy', 'KUSWANINGSIH', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Pemalang', '1973-03-07', NULL, NULL, '2025-06-27 07:00:13', NULL),
(1471, '1118020602990001', '$2y$12$PzpTRVYUBgBQAQA8aTxgMuoUXB6.SeFy7PNH2IjZbbg/z30oyaQYy', 'IMAM YUDIANTO', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1999-02-06', NULL, NULL, '2025-06-27 07:00:14', NULL),
(1472, '3304057107960001', '$2y$12$KHjF46MTnAULF.sbN1Fx1us7Of71.KrNDQSGR.fEY9GRsqHQ53zT.', 'ZULAIKHAH', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Belum Bekerja', 'Banjarnegara', '1996-07-31', NULL, NULL, '2025-06-27 07:00:14', NULL),
(1473, '3304051111950001', '$2y$12$AtZJ28NgOGVHod73CypK2eJZnQtndf2cW3iAraBU8g/y2yTCvuEwK', 'G.ANGKAT AJI WIDODO', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1995-11-11', NULL, NULL, '2025-06-27 07:00:15', NULL),
(1474, '3304200107870006', '$2y$12$6XTH.ZHLPU3XAUgxfd7r9u3lWw/IijImgyn2JlwaEcCYqO6Mb60vy', 'SUWANDI', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1987-07-01', NULL, NULL, '2025-06-27 07:00:15', NULL),
(1475, '3304206204920001', '$2y$12$g/goOqWFedrgIBAishkO0ecwGAcri13HFqM41Zike/qfXn6F3LDye', 'APRIYANI', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1992-04-22', NULL, NULL, '2025-06-27 07:00:15', NULL),
(1477, '3304052308910001', '$2y$12$.AEJ/CAKljqL48r3CCvPN.oFOBPDrzb4Y15Dn0s9mbjy6JrsKarqi', 'DANI ADI SAPUTRA', 'Laki-laki', 'Wiramastra, RT 02/RW 02 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1991-08-23', NULL, NULL, '2025-06-27 07:00:16', NULL),
(1478, '3304056311980001', '$2y$12$u9EC5q2RVOnjnah19UFOPODsxlAwSSoS3xMZdp05oKBPGnwTdaf5S', 'NOFIA DWI ANDRIANI', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1998-11-23', NULL, NULL, '2025-06-27 07:00:16', NULL),
(1479, '3304050406810008', '$2y$12$ynS/OxcFtYeB43zdqPl0.uc58deMRVpdXoHZwQSToGmn5t7i023Na', 'KOHARUN', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1981-06-04', NULL, NULL, '2025-06-27 07:00:16', NULL),
(1480, '3304054809880006', '$2y$12$pJBjb46z433Iqila94k99unTa7IRa7OxmD1DgQCPFlJ4B3ni/PgVC', 'ATUN SETYOWATI', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1988-09-08', NULL, NULL, '2025-06-27 07:00:17', NULL),
(1481, '3304052111810005', '$2y$12$tzm8ljipGoRzDQ18nuIck.tpv5kHdWsarx.z4krfUpCpS0q5kYcge', 'HENDRI BUDI S.', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1991-11-21', NULL, NULL, '2025-06-27 07:00:17', NULL),
(1482, '3304054709920001', '$2y$12$KSQfoGjthMobI0WmPKb8eudu4w1ov0FC.nY.23TTlgEX6rov6bf7y', 'SEPTI MUGI RAHAYU', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1992-09-07', NULL, NULL, '2025-06-27 07:00:18', NULL),
(1483, '3519033011890003', '$2y$12$WUm79NAqXOyUTVbKqp6R/u/rb/PPAK0Jqb0GzNezoZzOUB8LTpreu', 'NOVA PRASTIYO', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Madiun', '1989-11-30', NULL, NULL, '2025-06-27 07:00:18', NULL),
(1484, '3304054406810003', '$2y$12$K9GUSHmPZ3EQR4lUSWqCguUIJ26.KuL/NNS4Y3JRiw1uXceodv0sS', 'IROH RIYANTI', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1981-06-04', NULL, NULL, '2025-06-27 07:00:19', NULL),
(1485, '3304042808900007', '$2y$12$bLFLwFlcwxn91E8T8749ZeRFv2o.XPW8OnH5FxDmP25LwQZ/3pLiK', 'ADI PUTRA S.', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1990-08-28', NULL, NULL, '2025-06-27 07:00:19', NULL),
(1486, '3304056403930002', '$2y$12$kjwZ5fZ2OqwrYoizyOc9du8Xu89I2IkgPAxUCHhHEzYmpDoYaE.sq', 'SUPENI FITRIATI', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1993-03-24', NULL, NULL, '2025-06-27 07:00:20', NULL),
(1487, '3304051602880003', '$2y$12$27UarvLGlSP2NGf1YkjPSeTid5y4IxPf74xLapEwLSFBsPQcTj4I.', 'PRAYITNO', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'P. Lainnya', 'Banjarnegara', '1988-02-16', NULL, NULL, '2025-06-27 07:00:20', NULL),
(1488, '3304056812910004', '$2y$12$vW5IytAGa43vUPauUPh2ZOGd2UpTebQ0D8EEbh38Hekbdy/I92kSO', 'SUKENTI WULANDARI', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1991-12-28', NULL, NULL, '2025-06-27 07:00:21', NULL),
(1489, '3304053004920002', '$2y$12$g3U0N2FX3TI0RUnUNVpVRuw5wEqN5RJbWVnOF861hGP2llgB.MfUu', 'WASIL', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1992-04-30', NULL, NULL, '2025-06-27 07:00:21', NULL),
(1490, '3304056510920001', '$2y$12$5LuhQ8DiYAUdbm2u3nJkG.7OmrvOkF9bWIFTyXrUXEOLQQQxbqBz.', 'KUROMAH', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Kmrt', 'Banjarnegara', '1992-10-25', NULL, NULL, '2025-06-27 07:00:21', NULL),
(1491, '3304050807810009', '$2y$12$yjwZqJUw2PIyzDycXUVGyewCFPwvIZ4oNIaVoisXBlI6pSzkxgjNi', 'RUDI WARDOYO', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1981-07-08', NULL, NULL, '2025-06-27 07:00:22', NULL),
(1492, '3304055908870003', '$2y$12$c7rpQjAxkzlz7z5B5HxSaebaUp2GRW6UiiUL7VWfNbA1IscrpwVrS', 'NUROHMAH', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1987-08-19', NULL, NULL, '2025-06-27 07:00:22', NULL),
(1493, '3304054811930002', '$2y$12$4s1C4A6OGi2ArPzGdaawV.t2DYTqfIKef1TI1sK51Qod.VD0VY6mS', 'HIJRI ANITA DESI', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Jakarta', '1993-11-08', NULL, NULL, '2025-06-27 07:00:22', NULL),
(1494, '3304052301900003', '$2y$12$Z.X3.usntNUj...ZfDtKeuRoMrjLFI6Ime1nKIPnpKl9SKmjre6Hy', 'DEDI PURWAKA CHAIRUDIN', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Magelang', '1990-01-23', NULL, NULL, '2025-06-27 07:00:23', NULL),
(1495, '3304055702910002', '$2y$12$TMKaPbSpi01p5CchSE1.AOHeSS.87DfO/zpMshduVjEtAbil26ANm', 'SUPRIHATIN', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1991-02-17', NULL, NULL, '2025-06-27 07:00:23', NULL),
(1496, '3304051307920003', '$2y$12$YqmG/Kl5ZtIABQKtrun7C.83X/QPfhMwrSbkr/M78LfTrvParU4bi', 'SUHAYAT', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1992-07-13', NULL, NULL, '2025-06-27 07:00:23', NULL),
(1497, '3304056606950003', '$2y$12$Eyk.t27JELKdsdk2YhQf4uaR5ilPUQO0hBS.PZcb.9bLiNVLwx6MG', 'TITI WIDAYATI', 'Perempuan', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1995-06-26', NULL, NULL, '2025-06-27 07:00:23', NULL),
(1498, '3304057049300002', '$2y$12$xj1FmDY/Rb8baw2DjyMGueBFczcsYJVt48Aso5nuuuxAgjKD8tUvu', 'RAGILIN', 'Laki-laki', 'Wiramastra, RT 02/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1993-04-07', NULL, NULL, '2025-06-27 07:00:24', NULL),
(1499, '3304054503830004', '$2y$12$cQk3hNxvi1xevhtnIgultu2aJkg68yXL2QZ9AlWQL/u9T7BCGK7M6', 'KHOTIJAH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Cerai Hidup', 'Petani', 'Banjarnegara', '1983-03-05', NULL, NULL, '2025-06-27 07:00:24', NULL),
(1500, '3304050604880007', '$2y$12$3N6HMxQYJPLGO4ThGAqW1eaqq4iydg1ZkYORdSROL6yyxrZoglGgS', 'JALIL', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1988-04-08', NULL, NULL, '2025-06-27 07:00:24', NULL),
(1501, '3304050702900002', '$2y$12$3ZBndSPzma5L1PXHReRxxemodSy0YnqH0n3BTgvE5QyvY5YQfj0ee', 'ISWANTO', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1990-04-13', NULL, NULL, '2025-06-27 07:00:25', NULL),
(1502, '3304056602000001', '$2y$12$vh/CO4cWi9zKwYW/8.ulEewyzrFJWBi7A0txDrij/tRgwb5SwA0E.', 'IFTIYAH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '2000-04-22', NULL, NULL, '2025-06-27 07:00:25', NULL),
(1503, '3304054810820001', '$2y$12$E3piEs3voFwgS3IQelB94.w754n8Btyo/g3Ipw1VcvLSIX34WmGdq', 'KAROMAH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1982-10-08', NULL, NULL, '2025-06-27 07:00:25', NULL),
(1504, '3304051311990001', '$2y$12$ivA4J9D1qwTPg4PWDAcKrOsR/uh0z3TVAb3BNkNdYImMBnEaVvucm', 'FIKI ARDIATAMA', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Belum Bekerja', 'Banjarnegara', '1999-11-13', NULL, NULL, '2025-06-27 07:00:26', NULL),
(1505, '1405011801890001', '$2y$12$KYQSWlo13wl1XiU6z5HWhuAy.uu2KablVywxX9Mf8jMPVjbqxsRjy', 'MUKOROBIN', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1989-01-18', NULL, NULL, '2025-06-27 07:00:26', NULL),
(1506, '1405016206920002', '$2y$12$IKXO2MvuzOfUWIm6qs8Hde/JX.2pnoPsP9hOwI0.RvwTBn3sO22YW', 'RIYANTI', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1992-06-22', NULL, NULL, '2025-06-27 07:00:27', NULL),
(1507, '3304050206740004', '$2y$12$C0NwtWZJ1SyddiDc9VBQB.siumbl8GSveBMRvMggI0/80bepcFuDK', 'KASIRON', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1974-06-02', NULL, NULL, '2025-06-27 07:00:27', NULL),
(1508, '3304054109880003', '$2y$12$xa7.UH0..GjLs1dPAzhlwOe6nNV8atKbTd1tfP9nyF4ZdLxUBapCi', 'DARWI', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1988-09-01', NULL, NULL, '2025-06-27 07:00:28', NULL),
(1509, '3304055505990001', '$2y$12$K3q0FehjlzivnZwqY/88d.ZtUktWvBwNGxOilhSwDjZFf/RN4rfgW', 'NARIMAH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Belum Bekerja', 'Banjarnegara', '1999-05-15', NULL, NULL, '2025-06-27 07:00:28', NULL),
(1510, '3304052305890001', '$2y$12$FADELlyg35k7pEJAqNfFle6cyXFZUcGJrHTWS9WRndGh6Xzm65RCG', ' ROFIK', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1982-05-23', NULL, NULL, '2025-06-27 07:00:29', NULL),
(1511, '3304055108890001', '$2y$12$gmWg8vOvTVmPQINGKLhyGuajJM.CMjEGoV7VdCBw813eudEQL3jYe', 'NISWATIN MUALIFAH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1989-08-11', NULL, NULL, '2025-06-27 07:00:30', NULL),
(1512, '3304052311780005', '$2y$12$ScxkWhnN9fhe5p1eEmJSleIilAgiFMnKseKLkpStOTnxgr41NFPz6', 'SUKRON HIDAYAT', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'P.Lainnya', 'Banjarnegara', '1978-11-23', NULL, NULL, '2025-06-27 07:00:30', NULL),
(1513, '3304055608810004', '$2y$12$d48B3jCzFwo5LOEabd/6juVtBwUFrZ9SGbLzlKBGooBzcIrKGAha6', 'ENI WIDAYATI', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1981-08-16', NULL, NULL, '2025-06-27 07:00:31', NULL),
(1514, '3304051711960002', '$2y$12$Vcs.GuOARNsniFfsS7L8de0PF5H.5aVqFOoqJ6snPwQBgfBVcKqTi', 'ANDI SETIAWAN', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1996-10-17', NULL, NULL, '2025-06-27 07:00:32', NULL),
(1515, '3304053108860001', '$2y$12$bdnOB60JS3fziw0GJgJiI.czdX4r9beEqGU0rRn4uGGt1cNDY1ePO', 'MURIDUN', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1986-08-31', NULL, NULL, '2025-06-27 07:00:32', NULL),
(1516, '3304107003920001', '$2y$12$n1aIUhZiZaU063kVhkV.Ye4EzeOyS9bRl66ZoS/4x5x9dQOnyr/Su', 'FITRIYAH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1992-03-30', NULL, NULL, '2025-06-27 07:00:33', NULL),
(1517, '3304051612920002', '$2y$12$OBbmmHbUx9T3gSoXqpNVhu7Knzjrocpkl09tT/wp1YoM7lT3s8I4a', 'NURYANTO', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1992-12-16', NULL, NULL, '2025-06-27 07:00:33', NULL),
(1518, '3304056710930001', '$2y$12$HX.8vG/edl0fKHAGjXCmueFOtZsDM66A6eu8LO6IQoQDg2Oe3x1n6', 'HIDAYAH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1993-10-27', NULL, NULL, '2025-06-27 07:00:34', NULL),
(1519, '3304050511990001', '$2y$12$rSVvTKmYi2c/M5fG01maH.NEPnpiEwkx5eZg0VV6GzytuU.i5XHsO', 'IRFAN SUBEKTI', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1999-11-05', NULL, NULL, '2025-06-27 07:00:35', NULL),
(1520, '3304051110730005', '$2y$12$Ez67H/snmv6.hwVdLhZeOOwaph6KPjsQUy5B3qNUNk9SduZMkMxJ2', 'ROHMAT WALUYO', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1973-10-11', NULL, NULL, '2025-06-27 07:00:35', NULL),
(1521, '3304055009760004', '$2y$12$EUVFCTGRR.hqxxo7AHy6nem9ylxj4ER7yTb.gqNVddUVQpMeFOlnS', 'SRI PURWANTI', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1976-09-10', NULL, NULL, '2025-06-27 07:00:36', NULL),
(1522, '3304052907950003', '$2y$12$wfqxkrLFlvGRmJ7R84CCfexppdcgzz7K/6AWuACZ0226KdjpN1U4O', 'RIFKI HIDAYATULOH', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1995-07-29', NULL, NULL, '2025-06-27 07:00:37', NULL),
(1523, '3304050401980003', '$2y$12$/xxFPnLwkJIyVFDQMydjo.ZatZUe0z.KmPIHZJHVNu.0JIxVi/2ia', 'FERI SETIYA BUDI', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1998-01-04', NULL, NULL, '2025-06-27 07:00:37', NULL),
(1524, '3304055911990001', '$2y$12$j0Q0nzxpqpG2yqNydSVZA.HzPOGgc7ygedR15t867ZzsoJxKbkd2e', 'WIDARYATUN', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Belum Bekerja', 'Banjarnegara', '1999-11-19', NULL, NULL, '2025-06-27 07:00:38', NULL),
(1525, '3304050485760004', '$2y$12$kM7.vFXTWV34CCMtoZRP1.1Jq0BokMVM3nKdu/K6RsIvNuOxOr7oe', 'RATIM SYARIFUDIN', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Sopir', 'Banjarnegara', '1976-05-04', NULL, NULL, '2025-06-27 07:00:38', NULL),
(1526, '3304056108800001', '$2y$12$0Md.fjX5K693VVzJALi2sOeZDF5Cv/NB41.4iMQZVcNohRtymPG4G', 'SITI NGAMROH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1980-08-21', NULL, NULL, '2025-06-27 07:00:38', NULL),
(1527, '3304050102990004', '$2y$12$Sr147krWgcA5dqJcElmwb.Dz2vU/xUXOK1L3ZT301I7dJSz2MZyPu', 'SOFIYAN RIYADI', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1999-02-01', NULL, NULL, '2025-06-27 07:00:39', NULL),
(1528, '3304050706840007', '$2y$12$naBeeiMkv7ZR0AssoKLQaerM0Fz7xTa/gBlLjuHRx7JVmz4ilnoUW', 'AHMAD WAJID S.', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1984-06-07', NULL, NULL, '2025-06-27 07:00:39', NULL),
(1529, '3304054812870003', '$2y$12$kaUTCLPmq39c8pbwdm/Xf.lhoeC4sbHARILJms4ezNi4zYFVyaGRO', 'SUSI ERNAWATI', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1987-12-08', NULL, NULL, '2025-06-27 07:00:40', NULL),
(1530, '3304050406920007', '$2y$12$cU7PQOAe7D.YLuet..Hk..TlVFiiDUrTJOlC5s7yoAWAEKhOU/W5y', 'DENI BUDIANTO', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Belum Bekerja', 'Banjarnegara', '1992-06-04', NULL, NULL, '2025-06-27 07:00:40', NULL),
(1531, '3304052912890002', '$2y$12$j1eDCmDCqf99AJNYHfYhz.W8yom8pZW4Ebxx2kvexXMATe6L2NjcK', 'MUDRIK', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1989-12-29', NULL, NULL, '2025-06-27 07:00:41', NULL),
(1532, '3304055306950001', '$2y$12$UyUSypV1Ffidx9/.rafdQu3BJCPX2Vwa00ZS3hh3JrDpv3WAkNTua', 'YUYUN ERMINA', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1995-06-19', NULL, NULL, '2025-06-27 07:00:41', NULL),
(1533, '3304051402850004', '$2y$12$urSgDt.i4mBzT5N1Voe3EuXvCPjA5/Y0Pj4p1eoLQyEDH7Iy2Wt.u', 'MUADIB', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1985-02-14', NULL, NULL, '2025-06-27 07:00:41', NULL),
(1534, '3304054711870003', '$2y$12$XX069y.c3oHYkez2k99qxecwwI4xCpxQdSvijAW9jtZQqyAYayF.i', 'ETIKAH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1987-11-07', NULL, NULL, '2025-06-27 07:00:42', NULL),
(1537, '3304051701890008', '$2y$12$8xNnRYX7yomrNEVaMWccwO8J.6lZtlCbIDEvqoTOhbvdMTgvbKb9K', 'ABDUL AFIF', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Swasta', 'Banjarnegara', '1989-01-07', NULL, NULL, '2025-06-27 07:00:42', NULL),
(1538, '3304051204910007', '$2y$12$4FI9zp98KQ8Yx3fmWOJty.Qt5SeaoSLYDAd5v1qVXFCRKHZx4ayQC', 'M.ARIF NASRULLOH', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1991-04-12', NULL, NULL, '2025-06-27 07:00:43', NULL),
(1539, '3304050107940001', '$2y$12$ni46P1cbn3/.Q8Q5Sp27aOrtSzoFDK0iWtX5S6L0z2GugXU5AXWzG', 'MUTOFIF', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1992-11-05', NULL, NULL, '2025-06-27 07:00:43', NULL),
(1540, '3304055801940002', '$2y$12$9j7TpsBiVeuMkrwxmaDe3enOlLPLDldVmo0DTOB7pcLP2VqKhsYXa', 'NANING WIDIYANTI', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1994-01-18', NULL, NULL, '2025-06-27 07:00:43', NULL),
(1541, '3304051107820003', '$2y$12$AxR4tc12km96P.5O/lP3Kum7NWAkvbqpSRcwb.3vLtSTECSfaAQLa', 'ANDI SUSILO', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1982-07-10', NULL, NULL, '2025-06-27 07:00:44', NULL),
(1542, '3304056510800003', '$2y$12$bd5KjDeEXQIV4.EA8AAKS.rsU1a9somPeo8AIyk2s3DF8krayet3u', 'AMSILAH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1980-10-25', NULL, NULL, '2025-06-27 07:00:44', NULL),
(1543, '3304050310840003', '$2y$12$1MOQVbe/QlWpswjhk0vpseAb9UqAJUAL/ro8fIbo4pwv9hSNic4Qm', 'A.HARTANTO', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1984-10-03', NULL, NULL, '2025-06-27 07:00:44', NULL),
(1544, '3304054807860001', '$2y$12$dGI3/2guDnBYryAA1FTKJuAkGO9WIsKDsXTG2M/odMkrfSasVTnw6', 'MUDRIKAH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1986-07-08', NULL, NULL, '2025-06-27 07:00:45', NULL),
(1545, '3304054903780003', '$2y$12$UMJ6azavTwW7eP41NCxbY.MydeQyJ9Tg1K6gw744j5sfo0xWO1yyi', 'SITI MASITOH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1978-03-09', NULL, NULL, '2025-06-27 07:00:45', NULL),
(1546, '330405251200002', '$2y$12$ez.VKoK3t2eWaDEFxRy3LOom12iw/.SuK09xK2MK8tz3IJQX1Fd7K', 'MIFTAHUL HIDAYAT', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2000-12-25', NULL, NULL, '2025-06-27 07:00:45', NULL),
(1547, '3304052707840003', '$2y$12$vz9E2OKZOUZxngTa2GHpWeGao/qI.qL8Rh6Nyv4qBhS7ODb6WHiJK', 'SUGIANTO', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Sopir', 'Banjarnegara', '1984-07-27', NULL, NULL, '2025-06-27 07:00:46', NULL),
(1548, '3304054809930003', '$2y$12$U.lU/hiYp8On0CtwOIqOf.EDtigtSGZK/mhE7eaodxkxz8S3rG1NW', 'ELISA', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1993-09-06', NULL, NULL, '2025-06-27 07:00:46', NULL),
(1549, '3304051202950004', '$2y$12$Z4rq.5hvaviZmLzvSXzfZ.S5J3ohl5SfwqxuWe0akeB7aRi1UUa6e', 'TAMROHUN', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1995-02-12', NULL, NULL, '2025-06-27 07:00:46', NULL),
(1550, '3304054504740002', '$2y$12$a3Xkv.Z60zf9okYZrKP87ucAsOh4KaVidXPEdK310Z43KjfY63DAO', 'HARTATI', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1974-04-05', NULL, NULL, '2025-06-27 07:00:47', NULL),
(1551, '3304050607950002', '$2y$12$eQsIrQnex99axX6FrGmDvOWiyl1QJEhvYbFTdM9UgIv/VIlNJ9HrW', 'WIDI SETIAWAN', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1995-07-06', NULL, NULL, '2025-06-27 07:00:47', NULL),
(1552, '3304051312950002', '$2y$12$/9VjIlHp8140D.bVFVo5jOTeZ8z1pR4Qxaf5MwXRGEPUFqwQM/7YW', 'AHMAD NASUHA', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Belum Bekerja', 'Banjarnegara', '1996-12-13', NULL, NULL, '2025-06-27 07:00:47', NULL),
(1553, '3304052410820001', '$2y$12$J1yVDcxqJEnP1mWiyi3ckem9pHHSEyup.e11qNfMi.tVFrTZnKCeu', 'SUTARYO', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1982-10-24', NULL, NULL, '2025-06-27 07:00:48', NULL);
INSERT INTO `pengguna` (`id`, `nik`, `password`, `nama`, `j_kel`, `alamat`, `agama`, `status`, `pekerjaan`, `tmp_lahir`, `tgl_lahir`, `remember_token`, `created_at`, `updated_at`, `nomor_hp`) VALUES
(1554, '3304054102840008', '$2y$12$LjFZF4j8J0CdN6V3Jv4XLOfbChp16a70uWy/WzICPb5Lj852w3RYm', 'NURHIDAYAH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1984-02-01', NULL, NULL, '2025-06-27 07:00:48', NULL),
(1555, '3304052103780001', '$2y$12$gNuSts5mafDYOGiO35HHpu69EiubpPlGs8b83JCD4XvrmDxvkwzB2', 'SANIM', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1978-03-21', NULL, NULL, '2025-06-27 07:00:48', NULL),
(1556, '3304054802830001', '$2y$12$e62fowgX884vQSzFBAIK7ekJQgeGv/hUpXBAhy0iVesbiEKaEUTmy', 'KUSNIYATI', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1983-02-08', NULL, NULL, '2025-06-27 07:00:48', NULL),
(1557, '3304050203000005', '$2y$12$hvXcqCNLAuBH10Mcyzv7C.3KKsS9HF8fgw1bygGNbop0jeyP8e9je', 'NURUL LATIF', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Belum Bekerja', 'Banjarnegara', '2000-03-02', NULL, NULL, '2025-06-27 07:00:49', NULL),
(1558, '3304051208830002', '$2y$12$3S72akhXGxInsiNZpCVNq.80XprUVb24FQ5tHlW9rzgcUEJr8t60W', 'NUR ALIF JAHIDI', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Pemalang', '1983-08-12', NULL, NULL, '2025-06-27 07:00:49', NULL),
(1559, '3304054112860003', '$2y$12$fFK2rCexIpnTrxM6Qxow8OL.kmf4jNxurRs/.D14BzcYjTT/P38Im', 'MUTOLANGAH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1986-02-01', NULL, NULL, '2025-06-27 07:00:49', NULL),
(1560, '3304055009090001', '$2y$12$x5TokCKy57oxlZOcFoG6JO05th8oVoFoDtJ7ISUyMwpwYmmxRdiWm', 'SAHWA ALYA FITRI', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2009-09-10', NULL, NULL, '2025-06-27 07:00:50', NULL),
(1561, '3304053010890003', '$2y$12$XynsKJrossUR9.HWcNw3zOGhUQILBCjxU.qNhBLV/IB1gLjYXFNU6', 'MUHTAR', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'P\'Lainnya', 'Banjarnegara', '1989-10-30', NULL, NULL, '2025-06-27 07:00:50', NULL),
(1562, '3304050407850006', '$2y$12$qht6q.5bB5Sa33B0xn.bwObmZYFucShwYunK6Wwhik1m39xRMVxii', 'TURI AL TURIYANTO', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1985-07-04', NULL, NULL, '2025-06-27 07:00:50', NULL),
(1563, '3304056809910003', '$2y$12$RS/8W6dDkfksrpqxPf.prOQRuKKt9ajKmV40MCRbMWhLEaJMPoUQa', 'UNISAH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1991-09-28', NULL, NULL, '2025-06-27 07:00:51', NULL),
(1564, '3304051204860005', '$2y$12$SrQlYU8ERjm.OHetH1ATgOT5ZRPFNCSehdG11TOechKsifOPSDn5S', 'CHAKIM M.', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Swasta', 'Banjarnegara', '1986-04-12', NULL, NULL, '2025-06-27 07:00:51', NULL),
(1565, '3304050107900003', '$2y$12$CnyDqXZP5cLYVOkrCThaR.2F8Z1.rdO1QhGpDIMEAzJ6PPguziJYS', 'HOLIBIN', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Swasta', 'Banjarnegara', '1990-07-01', NULL, NULL, '2025-06-27 07:00:51', NULL),
(1566, '3304050301880002', '$2y$12$kLpaIgOpfdpi4X.A/COv/uW7eipfJFYgK693A8M6Ka5sxrA.hsRXe', 'MISNO', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1988-01-03', NULL, NULL, '2025-06-27 07:00:51', NULL),
(1567, '3304055006920002', '$2y$12$rQ459Tcc3XgPdOGF4GsMSO.0zfxUNqB0kRyy5d4W6GcauJaMLeJfm', 'YUNIATI', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1992-06-10', NULL, NULL, '2025-06-27 07:00:52', NULL),
(1568, '3304057005770001', '$2y$12$cNVpn5FjaBK7VxKCa3kryObaFwcvTrZj.k0pMLO5Rou5r8UwesgGm', 'MURNIYATI', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1977-05-30', NULL, NULL, '2025-06-27 07:00:52', NULL),
(1569, '3304052408880001', '$2y$12$RBtPNzvALWC.JYhn1EypQ.oqzBQPgrrWaH7Fkik4SQCOk384MLxza', 'LUJENG RONIYANTO', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1998-07-24', NULL, NULL, '2025-06-27 07:00:52', NULL),
(1571, '3304050301900002', '$2y$12$nEiU2qUoXA1PPy9hhcG3XOznRsvV8.d5xuyL5anfd.9gFpETI6mOG', 'MOHAMAD ISTAD', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1990-01-03', NULL, NULL, '2025-06-27 07:00:53', NULL),
(1572, '3304054603930001', '$2y$12$bmMOzOLmSGoIx66Dy9Gvi.3yeJqLLHnpmbbn6YjZpoo2kFwccURPC', 'TITI RUKOYAH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1993-03-06', NULL, NULL, '2025-06-27 07:00:53', NULL),
(1573, '3304056812960003', '$2y$12$2ROdgdQIqbbbDQjmTCInyehx52bcYFrqDjoV2hFl7HRREu.dEgR7W', 'NUR ZAKIYAH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1996-12-29', NULL, NULL, '2025-06-27 07:00:53', NULL),
(1574, '3304056802990003', '$2y$12$VnRx6Vdj4oG3FjxR5akEJe1MW.g0zjUp0fc3CRpkNaCQyN44y1962', 'SUMARSIH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1999-02-28', NULL, NULL, '2025-06-27 07:00:53', NULL),
(1575, '3304041501860001', '$2y$12$hWDi2vQoQWkhQp/i5l7EQuOLraHHGOMGQivKWdmWdtos.VcPTC0MO', 'ASTOTO ADI', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Guru', 'Banjarnegara', '1986-01-15', NULL, NULL, '2025-06-27 07:00:54', NULL),
(1576, '3304055906930002', '$2y$12$FkP/vZlwYMWsy9rUpDRFLOTVY6iyRYqjx/WQo3y8/NxyJCBc4AFle', 'MUNGFARIJAH', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1993-06-19', NULL, NULL, '2025-06-27 07:00:54', NULL),
(1577, '3304051901830002', '$2y$12$2wh1.UroswbaJrR0KlxN7ON0t3a4MIJzs.zyH1AMWh9m08mjgmRNu', 'PURWANTI', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1997-08-17', NULL, NULL, '2025-06-27 07:00:54', NULL),
(1578, '3304052205770003', '$2y$12$J9rxAShy/Fea7XdPTa9x1ugDZjG1DBIyKTiv/qR8JMg50Of52JFRa', 'DARNO', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1977-06-22', NULL, NULL, '2025-06-27 07:00:55', NULL),
(1579, '3304054209810003', '$2y$12$Eij3fR10sibQqwSQO5SREOE3z7zXH4hshY1bP2oMMb0SHr4YEYdty', 'CARTINI', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1981-09-02', NULL, NULL, '2025-06-27 07:00:55', NULL),
(1580, '3304051004770001', '$2y$12$8RpcVNX8.wNGV3gxC0WaBOybAk9eSD26Kzxm2G6y1BomjRUXYtm/m', 'SUPRIYONO', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1977-04-10', NULL, NULL, '2025-06-27 07:00:55', NULL),
(1581, '3304055802780001', '$2y$12$45.KWu/0co1GiLErC8CGzOFgNPufelDILo8K0VPz8jXtAxtjIpcZ2', 'RATINI', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1978-02-18', NULL, NULL, '2025-06-27 07:00:56', NULL),
(1582, '3304051205820008', '$2y$12$LEuxU/n6IDpMpb.7rfIoI.Y2cCr7Xdoyv06nIxEbx7B3WtXsRHfTG', 'BASIRI', 'Laki-laki', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Lainnya', 'Banjarnegara', '1982-05-12', NULL, NULL, '2025-06-27 07:00:56', NULL),
(1583, '3304054806850006', '$2y$12$k.5S7qBxluoxUK6Rw16mPu/QWCqTacoZzLL5KsO/V6XAounoP3p3e', 'DARTI', 'Perempuan', 'Wiramastra, RT 03/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1985-06-08', NULL, NULL, '2025-06-27 07:00:57', NULL),
(1584, '3304052608860003', '$2y$12$ZC2D4nTmQ3pJcF9SjPqsXed5npSNcg2r1Pv3bZVJ0TwbHgK/XgT9e', 'SAMSUL  ANAM', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'P.Lainnya', 'Banjarnegara', '1986-08-26', NULL, NULL, '2025-06-27 07:00:57', NULL),
(1585, '3304056209850002', '$2y$12$FwEvgUrOFyI5LrEDDQw5g.zb/R7.3jS1vqVntP8pxTetW5VTRxuaG', 'SEPTIANA AYUDIYASARI', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'P.Lainnya', 'Banjarnegara', '1985-09-22', NULL, NULL, '2025-06-27 07:00:58', NULL),
(1586, '3304055507930006', '$2y$12$3kIqXipxJQ1EyNmbUKsLqukRDTHimOtdLNyFHUY/I2KXVeLXzvrRu', 'USWATUN SOLIHAH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1993-07-16', NULL, NULL, '2025-06-27 07:00:58', NULL),
(1587, '3304050506620001', '$2y$12$lpDmT7zXRTQnlqgaKt0AWeF03f5TpTZM0eWUtXmj6NeggsbfyVIR6', 'TURIMIN', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Sopir', 'Cilacap', '1975-06-05', NULL, NULL, '2025-06-27 07:00:58', NULL),
(1588, '3304054806720003', '$2y$12$wCPd2ABC.onAeXf4XXAkFegcYwIzNL8a4vzDvCjhNF9US1XvdYfFS', 'TURYATI', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1972-05-08', NULL, NULL, '2025-06-27 07:00:59', NULL),
(1589, '3304056006930001', '$2y$12$.pl.MQe2ifBsYvf6T9c.bORlenhxUurQcM9WPKokV1nFUnR.FNek2', 'ARYANI', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1993-06-20', NULL, NULL, '2025-06-27 07:00:59', NULL),
(1590, '3304051911970001', '$2y$12$i89bCgJnfcPmNTXhONvo9.1CZIr5XLy4HbQ1mY3zGPuRHO62QB2MO', 'TEGAR SAFANGAT', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1997-11-19', NULL, NULL, '2025-06-27 07:00:59', NULL),
(1591, '3304050107930032', '$2y$12$B8gf0wstMGPJkAoKDtTtNeI2cOCmGzyqvHIwQ/bkQUGzZexGVcSB6', 'SARNO', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1993-07-01', NULL, NULL, '2025-06-27 07:01:00', NULL),
(1592, '3304053011960001', '$2y$12$.jkbs3pAby6qUSDN3ZcHUu6OuL95xeCac0vALHKc8lTlbfQ0RKFBC', 'SAMSUL MUBAYAN', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1996-11-30', NULL, NULL, '2025-06-27 07:01:00', NULL),
(1594, '3304050905830003', '$2y$12$IALfK3baghndLkr90s.w7OyxZ4gQ88Q9xHe1PpFRxh1L9uRbA5R6C', 'ILHAN', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Petani', 'Banjarnegara', '1983-05-09', NULL, NULL, '2025-06-27 07:01:00', NULL),
(1595, '3304056906980002', '$2y$12$XSWYY2N52lQZlxq3gKN8ZOMS8eODEJlIDcGhQHpVMSE5sW1.1vmv6', 'JAMILAH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1998-08-29', NULL, NULL, '2025-06-27 07:01:01', NULL),
(1596, '3304201605920001', '$2y$12$LlbIbQbnSRxx/SQn/G3Ppu.lMz0B0d5Vy1M/.QxbiQ/CJebdGnG4G', 'SUDAR', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1992-05-16', NULL, NULL, '2025-06-27 07:01:01', NULL),
(1597, '3304056612950002', '$2y$12$8bU29W7E7B/OX.GxEL2bvOxXc0oCKuc7WfUMYEpxsM1KE5h09xcXi', 'FAJIROH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1995-12-26', NULL, NULL, '2025-06-27 07:01:01', NULL),
(1598, '3304051302780001', '$2y$12$2KJPvh6FZH3geSKcfEb60elMF8Wx7rSwOYK/5DURCDdjMybNaKb5C', 'NASIMIN', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1978-02-13', NULL, NULL, '2025-06-27 07:01:02', NULL),
(1599, '3304054809830013', '$2y$12$Qm2EoSIuNuuOEXLnEYgP2eheO27sirR8uDK5cc5a4c5D1DWGJCKzG', 'RUTIPAH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1982-10-04', NULL, NULL, '2025-06-27 07:01:02', NULL),
(1600, '3304052007830005', '$2y$12$vX0Nitp171V9DyiU9P4gXu9siZHgpaCbOw3m9XXjHW3x5ZO3Q4ufK', 'NINTO HADI', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1983-07-20', NULL, NULL, '2025-06-27 07:01:03', NULL),
(1601, '3304056612850003', '$2y$12$m8X1t1cZhWVfHG4Pmi.8Ped8go11SV/9.2p7459VU2c.5sVFZ0uCq', 'MAHMUDAH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1985-12-26', NULL, NULL, '2025-06-27 07:01:03', NULL),
(1602, '3304052301960003', '$2y$12$jNmWI2WwiJzt8av86cGtiOx24oAI.02YhrGY.bZWZpDvv6E2T7HbK', 'SAHIDUN MUNIB', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Tidak Kerja', 'Banjarnegara', '1996-01-23', NULL, NULL, '2025-06-27 07:01:04', NULL),
(1603, '330405270891002', '$2y$12$enI3r4c4XWWZFe6AbOdJC.l9o4lXxQ8gxdIXS.8RgPqrHRIF2WMbu', 'SARNO', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1991-08-27', NULL, NULL, '2025-06-27 07:01:04', NULL),
(1604, '3304055805930001', '$2y$12$jwgnMTKNUEGVrrMu2hdvDezzB68328RzmYd3yetLXYQ9QksCrXmD.', 'KASMINI', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1993-05-18', NULL, NULL, '2025-06-27 07:01:04', NULL),
(1605, '3304052507960003', '$2y$12$U1WECaKOZSmKIW.wUEkXfOmUerzl8hTi5KcsUnxoggPlsSN70rWAW', 'M.FAROID', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Belum Kerja', 'Banjarnegara', '1996-07-25', NULL, NULL, '2025-06-27 07:01:05', NULL),
(1606, '3304051907810001', '$2y$12$.mTb.XgJzRzFctpGsIMyxe5uAql7ip8iHKvbzfRVjKrXEWEQokEb.', 'SUPRAPTO', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Sopir', 'Banjarnegara', '1981-07-19', NULL, NULL, '2025-06-27 07:01:05', NULL),
(1607, '3304054512870002', '$2y$12$hjgfWTX/rHgN6L6SmDFOLeaDLUxyf0OmNKhVWsELSZRaBKDmc/pkm', 'IDA PANGESTRI', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1987-12-05', NULL, NULL, '2025-06-27 07:01:05', NULL),
(1608, '3304051003920003', '$2y$12$HhIccpjDuyqHAF7QlCm1UuXiV8SqifygJMyudxq5XRZogR2y11dXO', 'FAJAR SODIK', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1992-03-10', NULL, NULL, '2025-06-27 07:01:06', NULL),
(1609, '3304054406950003', '$2y$12$Uz7ZWpwfIE5XG6/wxXbDZu/.ppH3Uq2IIREvrzh4ltZZPY4GzbOR2', 'TITIN SUGIANTI', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1995-06-04', NULL, NULL, '2025-06-27 07:01:06', NULL),
(1610, '3304050307830002', '$2y$12$D91WZxzRzdaqccEGtDMgfeUYnuECuWaExyXDn3kscAoqP22Fa4RNG', 'PRIYO PRIHATIN', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1983-07-03', NULL, NULL, '2025-06-27 07:01:06', NULL),
(1611, '3304056704840005', '$2y$12$tUP47RN7.KSYnJaW21xjCO8PNxvXNPIh6mwfIDOTfvHUuqgX7B7ES', 'SUSI YUWANINGSIH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1984-04-27', NULL, NULL, '2025-06-27 07:01:06', NULL),
(1612, ' 3304050312780002', '$2y$12$iN1p2ikkJtpWj1YABW74cegqDZ6J9HN3SSNaHbK3ZFNSBjCZFQhMG', 'TAMRIN AL SAMSUL F.', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1978-12-03', NULL, NULL, '2025-06-27 07:01:07', NULL),
(1613, '3304055504800002', '$2y$12$cBpEoXskoL16gsZWjE9pIu94T.chfEyudsdM3orjTBpRZdCPPFQr.', 'UMI KHUROTUN', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1980-04-15', NULL, NULL, '2025-06-27 07:01:07', NULL),
(1614, '3304051112850007', '$2y$12$Vv4wq6aE8/WYVET/G1WDF.kGcQi4EgDQh04skNpyRtr726Kb0Q9BW', 'AMAD KHOERUDIN', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1985-12-11', NULL, NULL, '2025-06-27 07:01:07', NULL),
(1615, '3304058002860005', '$2y$12$ezLlZh.B4obU9hwT0I7fR.dNurh8SvJ6Ar/ZoRjgLYpuA0zKepROK', 'IDAH KHOEROMAH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1986-02-20', NULL, NULL, '2025-06-27 07:01:08', NULL),
(1616, '3304051312940003', '$2y$12$kITMi6wDAzfzbUXs07MS7.A/Zndm9o4KFL2YUD/wXBe9RljZ2PQUq', 'NASRON', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Petani', 'Banjarnegara', '1994-12-13', NULL, NULL, '2025-06-27 07:01:08', NULL),
(1617, '3304051009850004', '$2y$12$0OOVS27MiDkg7HcFuIDMyefS804nkFaAekHYcKlGuU0ZI62Tzi3C6', 'SARNO', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1985-09-10', NULL, NULL, '2025-06-27 07:01:08', NULL),
(1618, '3304056012860008', '$2y$12$YJhyNStokrey0noVYwPW7.2tB3WMSjppuTZEfOXLaIxVRw/4oCYOO', 'YULI WIDAYANTI', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1986-12-20', NULL, NULL, '2025-06-27 07:01:09', NULL),
(1619, '3304054510950004', '$2y$12$V1H5O9y6gybnLoe8nDV56OTvOjolskJqjLdOZiLSuLTj65xYP3bCm', 'NANI USTAPI', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1996-10-05', NULL, NULL, '2025-06-27 07:01:09', NULL),
(1620, '3304200312900002', '$2y$12$nn.rP/mH8ywKQ/KCV9401ulK5P8DFEV2CmFGmgc3MXZjOp3TKQaqy', 'CHAJAT SUDRAJAT', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1990-12-03', NULL, NULL, '2025-06-27 07:01:09', NULL),
(1621, '330405405000004', '$2y$12$OFjUJ40Q0TOjY8ztYfBPE.WdjNSeqFkz2dsC3NXirDiWaAPPhk/fq', 'SUPRIYATIN', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '2000-05-05', NULL, NULL, '2025-06-27 07:01:09', NULL),
(1623, '3304051012980000', '$2y$12$AWdJrgiL2AZgTcF.uqxIvOfooj7eb7yh0n8LgdNmYcQjBDQ09MHi.', 'JAMINGIL ANWAR', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Belum Kerja', 'Banjarnegara', '1999-06-02', NULL, NULL, '2025-06-27 07:01:10', NULL),
(1624, '3304042006840002', '$2y$12$ubkqxJ2NNjChZqlmG86A3.mOQZHa3AFxI/eqchv2aPdiuiYoBQ6T.', 'SUYONO', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1984-06-20', NULL, NULL, '2025-06-27 07:01:10', NULL),
(1625, '3304055104970001', '$2y$12$6zY90lmw4oeLlun7ir9PhezQREfYDUEJ/Eb6vg0jBf3/TpD9UqxzS', 'MAESI ROSINAH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1997-04-11', NULL, NULL, '2025-06-27 07:01:10', NULL),
(1626, '3304051612830002', '$2y$12$CA8Afa94bY3DTJVY.qge.eAM9AG4bvKyXI5jntS57ltk7dCeDvV1.', 'KATIM', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1983-12-16', NULL, NULL, '2025-06-27 07:01:11', NULL),
(1627, '3304054407820001', '$2y$12$ZSS62v9IfQP/zd4Pkk4vb.XF8EjGIqWwLR81ZzGNAY98FgOX4MjW.', 'ROKIDAH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1982-07-04', NULL, NULL, '2025-06-27 07:01:11', NULL),
(1628, '3304051306780001', '$2y$12$cB0hFyS/PqMZN/UodnrpC.84WaGSeHatdvnIOpjAeAtuQX7T5i83S', 'MISLUM', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1978-06-13', NULL, NULL, '2025-06-27 07:01:11', NULL),
(1629, '3304054209780001', '$2y$12$7/TB6t8tRPRLh0RJuEKd.ORjsK7I7OLKffma.KilKPjpobRCg2dM6', 'SALIYAH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Kebumen', '1976-09-02', NULL, NULL, '2025-06-27 07:01:11', NULL),
(1630, '3304054401770003', '$2y$12$StRIeIUHdjsCg6Cv05RzSOPiCRqLEZAHGbZkU1ftP/xR/ciOwYjqW', 'SITI AMINAH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1977-01-04', NULL, NULL, '2025-06-27 07:01:12', NULL),
(1631, '3304054107000016', '$2y$12$/jg1zyzRKnJY6AhSAkDEWuRXOwtHt8/wpQw0uU3q8L0h1juHGN1am', 'FINA MR.', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '2000-07-01', NULL, NULL, '2025-06-27 07:01:12', NULL),
(1632, '3304052712890001', '$2y$12$6es4PQPjV3ienYPRpBKnfucoNrv06j13VYPT.oxoPgLphz5OfVORe', 'SOHIRON', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1989-12-27', NULL, NULL, '2025-06-27 07:01:12', NULL),
(1633, '3304052806990001', '$2y$12$TTgnfTd.FpJ5dFfjiVxROem5mCx70RM.Kl2QbwJfECMae1mZmP0K2', 'PRIMA SANTOSO', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1999-07-28', NULL, NULL, '2025-06-27 07:01:13', NULL),
(1635, '3304055010850004', '$2y$12$.rwUcn5khpKl0G2dCqu8/.3E.nv2l1.i/8P/4lIHNkiBz/fXegD4W', 'KHOMSAH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1985-10-10', NULL, NULL, '2025-06-27 07:01:13', NULL),
(1636, '3304050408970002', '$2y$12$OGDwhddqhlXRdMqumNvmYuzAklJ8C3Mg2FEE15bE0TGdOqKKycuMq', 'SOHIBUL ANAM', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Belum Kerja', 'Banjarnegara', '1997-08-04', NULL, NULL, '2025-06-27 07:01:13', NULL),
(1637, '3304052104830001', '$2y$12$cZAsptX.2O86.68AeSlOee2rAd1ceIsSCFv9aT5XWp2.DTlKc2lDS', 'WARISUN', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1983-04-21', NULL, NULL, '2025-06-27 07:01:13', NULL),
(1638, '3304054107870040', '$2y$12$UIHXyw/o3jlYdXruA.Fg7OHL33ySCcTr1SAyNcYix3C4ruJEOUUaa', 'KHAFIROH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1987-07-01', NULL, NULL, '2025-06-27 07:01:14', NULL),
(1639, '3304056307730003', '$2y$12$Alu/WX7z7P/lXnF0SzEfoulVMXQunzCh1fJd/zDKaN1KW4OzFLqI.', 'RUSYATI', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1973-07-23', NULL, NULL, '2025-06-27 07:01:14', NULL),
(1640, '3304052107890003', '$2y$12$qXYtyQUiuMrEtjG9fq.jYOGCJZdCDUHL8fc3CrBfNss0L9Bi2FvF.', 'WIWIT YULIANTO', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1989-07-21', NULL, NULL, '2025-06-27 07:01:14', NULL),
(1641, '3304056706910001', '$2y$12$7BswqUsDuAHhm0UJgFXEZeHFzG8D1Tz/upQTb0f8R78nkHwX8gRw6', 'TITIK YULIANA', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1991-06-27', NULL, NULL, '2025-06-27 07:01:14', NULL),
(1642, '3304051603990001', '$2y$12$YfrduWpu7fRyMs9zelUbqOMnnEYMBhnDFM/iQ3jUb7VDec3dFy.SS', ' WIDAYANTO Y.', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'K.Swasta', 'Banjarnegara', '1999-03-16', NULL, NULL, '2025-06-27 07:01:15', NULL),
(1643, '3304054401740003', '$2y$12$l5MnhkZhVWdPzvw4aIAw.uHJkvkpS6MlTiX4ICBWmlLwSz3mvTENG', 'SAMINEM', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1974-01-04', NULL, NULL, '2025-06-27 07:01:15', NULL),
(1644, '3304051604960004', '$2y$12$vwmrKVStMmJkQMF0FJ1X3Ou98r916K7GE2Wd6jw.1.NBjYNG5t0ii', 'MANGFURI', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1996-04-16', NULL, NULL, '2025-06-27 07:01:15', NULL),
(1646, '330405', '$2y$12$BxBB2b1yP2GXsel82XQAVOsxphKJ5iWDBNs5y1K6QRj0TWCXo3./.', 'A.BAYU WIBOWO', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1999-06-02', NULL, NULL, '2025-06-27 07:01:16', NULL),
(1647, '3304040402870003', '$2y$12$T2Q2o22fsYxJjMBmoy/B2.cZavEcU/6p7lYxa424yWFui4M2Fpo0y', 'EDI RIANTO', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1987-02-04', NULL, NULL, '2025-06-27 07:01:16', NULL),
(1648, '3304055506930002', '$2y$12$YDrqCDKsR6Fv4oEZmyVSFu3HAtl9tDnPwg.EWG6nDO6G5ni5svzWm', 'LILIS HAMDIYAH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1993-06-15', NULL, NULL, '2025-06-27 07:01:16', NULL),
(1650, '3304050402800004', '$2y$12$/0B8DHnVbaao0aK2K8vz7.qxTaboT52YPwTHkJwUK0ddTGtYp1xT.', 'DASIRUN', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1980-02-04', NULL, NULL, '2025-06-27 07:01:16', NULL),
(1651, '3304054403880002', '$2y$12$1DXxPgh3kKEniD.9JgtLN.AnPUsWTBf0EDbbNAVGlCM3HF31vklBa', 'FITA RIANY', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1988-03-04', NULL, NULL, '2025-06-27 07:01:17', NULL),
(1652, '3304054404740003', '$2y$12$hXWeB7FOEf951aS0J5EDRuAcCgwH/13ktxWiVPIoJ/J5.9mAEsHxu', 'ALFAIZAH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1973-08-03', NULL, NULL, '2025-06-27 07:01:17', NULL),
(1653, '302220501830004', '$2y$12$rMaOx67AQGDQZdIZXbbi1uwrTRjVd09LsK7sx1XsHyRvN5TpLz3I6', 'TRISNO', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Harian Lepas', 'Banyumas', '1983-01-05', NULL, NULL, '2025-06-27 07:01:17', NULL),
(1654, '3304055307710002', '$2y$12$IyHl.XiPM0m5wt8q5Sx6wumxhN3PiofHvT1zGvmphB0NAudXLpg8y', 'RUBES', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1971-07-13', NULL, NULL, '2025-06-27 07:01:18', NULL),
(1655, '3304051002840003', '$2y$12$sl1iMVIJ2rNa.AA9DSBga.BeEl4JB11rwXtffRUq4pzLBoy9vEp/W', 'SUKMONO', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Wonosobo', '1984-02-10', NULL, NULL, '2025-06-27 07:01:18', NULL),
(1656, '3304055805920002', '$2y$12$iH2JEC.5kwK2QsPLv889QOHuBu0dfWdgvQxdVTxcL9F6TxRo6465O', 'SITI  ALMA AISYAH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1992-05-18', NULL, NULL, '2025-06-27 07:01:18', NULL),
(1658, '3304050706930001', '$2y$12$kNZPtppJ1X9NN4n166CrkOMIsTzKIJTNe6jp6LFq5.vyi9rlAv25O', 'ALI SUYITNO', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1993-06-07', NULL, NULL, '2025-06-27 07:01:18', NULL),
(1659, '3304056309940003', '$2y$12$DK4.Y/0f9XrNS/Y9Cv54Q.1X/fAJqxFDKAaZ0ofgbM/zoeTAQWU22', 'NENENG SEPTIYANA', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1995-09-23', NULL, NULL, '2025-06-27 07:01:19', NULL),
(1660, '3304050507910004', '$2y$12$6OtTmFwzYzJPKplD5uCxMueuwp8rS2gYJdVa9M72w/8wfLkSEXnHq', 'ISTAJIB', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1991-07-05', NULL, NULL, '2025-06-27 07:01:19', NULL),
(1661, '3304055509950004', '$2y$12$yYONOdG7JBmR0Yb.A5XnYOQnCUvVTqS9kScATPSQgSL2DEr2kFvhm', 'LISTIANTI', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1995-09-15', NULL, NULL, '2025-06-27 07:01:19', NULL),
(1662, '3304051705760007', '$2y$12$9bee6CHzi3S6WUCfhb1mH.i7u/ALfM9VgfVppMSqNvotDcbxk.dSa', 'RASDI', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Petani', 'Banjarnegara', '1976-05-17', NULL, NULL, '2025-06-27 07:01:19', NULL),
(1663, '3304055506790007', '$2y$12$d1ryF8lAjb53NJy0gqBtzuYwESvS.IhHdU1czPv7itRsQbeYJH0R.', 'MISTEM', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1979-06-15', NULL, NULL, '2025-06-27 07:01:20', NULL),
(1664, '3304051701790002', '$2y$12$nwThhBseo6wNZaqQbDol/OqnvYzgNEF41HFnbEHabCB8.9DzTNFPC', 'RATIM AL R.R.H', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1979-01-17', NULL, NULL, '2025-06-27 07:01:20', NULL),
(1665, '3304055301780003', '$2y$12$V2C2pjeACczjkcMW1k0yAu/QKo.0MdDRKtW0.mLdrL0q/yYMChAIC', 'SURATMI', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1978-01-13', NULL, NULL, '2025-06-27 07:01:20', NULL),
(1666, '3304050407830001', '$2y$12$Ck4EAQYT11t0OlEVh0CL1.1hRL1w6CG.VfJCqxx/tv4nItXgRcYru', 'HERI MULYANTO', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'K.Swasta', 'Banjarnegara', '1983-07-04', NULL, NULL, '2025-06-27 07:01:21', NULL),
(1667, '3304055003870002', '$2y$12$9/d32nVBderK/KVnDmoEs.WPyAHDDi7niWw8G87zDP9nHz2AYlJUq', 'ALFIYAH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1987-03-10', NULL, NULL, '2025-06-27 07:01:21', NULL),
(1668, '3304200111900002', '$2y$12$zdhzy66THc4cBs3neaoNcOuErzidIWclJugNn7jjfhS.jcqNrQosO', 'IMAM FAOZANZEN', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Guru', 'Banjarnegara', '1990-11-01', NULL, NULL, '2025-06-27 07:01:21', NULL),
(1669, '3304054803940001', '$2y$12$TIplXaC6ARctjSf6wrkNbu1JYtX/rJW2ohsYyim2mFmlO.VLckR/W', 'UMU SANGADAH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Pedagang', 'Banjarnegara', '1994-03-08', NULL, NULL, '2025-06-27 07:01:21', NULL),
(1670, '3304050809880008', '$2y$12$3pKzE2b8.bmmBhc.cBBY4.QphUGy.gI5Se/b0LmFuUkXDB3cDAjiW', 'TOTO TRI W.', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1988-09-08', NULL, NULL, '2025-06-27 07:01:22', NULL),
(1671, '3304050809880001', '$2y$12$t5lCvdmGrBO01zgzLxptiurmpZxwviJXX.FfSfX.5wI2fwkXNndQO', 'KOKO DWI W.', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1988-09-08', NULL, NULL, '2025-06-27 07:01:22', NULL),
(1672, '3304053007980002', '$2y$12$btgBTythb1PnytQH31wHTOJzhRjNvjkU2.Q0xdXe3d6/AAhus7bJC', 'MUHAMAD AL ASRI', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Pelajar', 'Banjarnegara', '1998-07-30', NULL, NULL, '2025-06-27 07:01:22', NULL),
(1673, '3304050404770009', '$2y$12$jyYJ7vmK1iZ4tBNbi4mFGu6GfgITayy8TrFw8L1cOrF1iuS5x4m7K', 'EDI SUWARSO', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Buruh Harian Lepas', 'Banjarnegara', '1977-04-04', NULL, NULL, '2025-06-27 07:01:23', NULL),
(1674, '330405460280005', '$2y$12$VZXgLp4EzwAsMr.g1zpYQeSWYuDhqzA0hprI1prVQtUDCvTtHJ3tK', 'KHOERIYAH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1980-02-06', NULL, NULL, '2025-06-27 07:01:23', NULL),
(1675, '3304050211740001', '$2y$12$RUh4KvIdqmaahelkxb7SOeQVwUVM2/96rDh9lJK0XeV7ym7qtBkkS', 'ROHAJAT', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Wiraswasta', 'Banjarnegara', '1974-11-02', NULL, NULL, '2025-06-27 07:01:23', NULL),
(1676, '3304056808780006', '$2y$12$XJD2XJ3INBud3uG68qt4D.hct8rE9/VY4oOLnQb9PrilAxZnr9GtO', 'SIMAH CHASANAH', 'Perempuan', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Kawin', 'Mrt', 'Banjarnegara', '1978-08-26', NULL, NULL, '2025-06-27 07:01:23', NULL),
(1677, '3304051607990001', '$2y$12$qwcCUhsN0y7FsmTpF8dwJOyJD83LwPBuyN6ClWCbtqbYmIixyH/jC', 'ANAM PRADIKA PUTRA', 'Laki-laki', 'Wiramastra, RT 04/RW 05 Kec. Bawang', 'Islam', 'Belum Kawin', 'Wiraswasta', 'Banjarnegara', '1999-07-16', NULL, NULL, '2025-06-27 07:01:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pesan_pengguna`
--

CREATE TABLE `pesan_pengguna` (
  `id` bigint UNSIGNED NOT NULL,
  `pengguna_id` bigint UNSIGNED NOT NULL,
  `subjek` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `balasan` text,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pesan_pengguna`
--

INSERT INTO `pesan_pengguna` (`id`, `pengguna_id`, `subjek`, `isi`, `balasan`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 1, 'Lupa Password', 'Tolong bisa reset password, lupa min...', NULL, 1, '2025-06-24 00:16:39', '2025-06-24 09:48:11'),
(2, 1, 'koplak', 'tolong surat saya acc', NULL, 0, '2025-06-25 23:53:38', '2025-06-25 23:53:38');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` longtext NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('y1fSsDhZdxrln9VfPFERehfeAaKcZmKmZCOHfH3d', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoid21tdjhkUGZPQUFQTktYbVZzTFRTejAzMjBod0xhTHA2cWRTcEZKSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9wZWxheWFuYW4tc3VyYXQudGVzdDo4MDgwL3Byb2ZpbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjU1OiJsb2dpbl9wZW5nZ3VuYV81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1751186447);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_username_unique` (`username`);

--
-- Indexes for table `berkas_surat`
--
ALTER TABLE `berkas_surat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `berkas_surat_no_surat_unique` (`no_surat`),
  ADD KEY `berkas_surat_pengajuan_surat_id_foreign` (`pengajuan_surat_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `jenis_surat`
--
ALTER TABLE `jenis_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laporan_berkas_surat_id_foreign` (`berkas_surat_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_otp`
--
ALTER TABLE `password_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengajuan_surat`
--
ALTER TABLE `pengajuan_surat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengajuan_surat_jenis_surat_id_foreign` (`jenis_surat_id`),
  ADD KEY `pengajuan_surat_pengguna_id_foreign` (`pengguna_id`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pengguna_nik_unique` (`nik`),
  ADD UNIQUE KEY `pengguna_nomor_hp_unique` (`nomor_hp`);

--
-- Indexes for table `pesan_pengguna`
--
ALTER TABLE `pesan_pengguna`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pesan_pengguna_pengguna_id_foreign` (`pengguna_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `berkas_surat`
--
ALTER TABLE `berkas_surat`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `jenis_surat`
--
ALTER TABLE `jenis_surat`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `password_otp`
--
ALTER TABLE `password_otp`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pengajuan_surat`
--
ALTER TABLE `pengajuan_surat`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1679;

--
-- AUTO_INCREMENT for table `pesan_pengguna`
--
ALTER TABLE `pesan_pengguna`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `berkas_surat`
--
ALTER TABLE `berkas_surat`
  ADD CONSTRAINT `berkas_surat_pengajuan_surat_id_foreign` FOREIGN KEY (`pengajuan_surat_id`) REFERENCES `pengajuan_surat` (`id`);

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_berkas_surat_id_foreign` FOREIGN KEY (`berkas_surat_id`) REFERENCES `berkas_surat` (`id`);

--
-- Constraints for table `pengajuan_surat`
--
ALTER TABLE `pengajuan_surat`
  ADD CONSTRAINT `pengajuan_surat_jenis_surat_id_foreign` FOREIGN KEY (`jenis_surat_id`) REFERENCES `jenis_surat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengajuan_surat_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pesan_pengguna`
--
ALTER TABLE `pesan_pengguna`
  ADD CONSTRAINT `pesan_pengguna_pengguna_id_foreign` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
