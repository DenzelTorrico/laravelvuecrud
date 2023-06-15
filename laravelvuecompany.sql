-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 24, 2023 at 07:46 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravelvuecompany`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Electric Meter Installer', '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(2, 'User Experience Manager', '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(3, 'Rigger', '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(4, 'Occupational Therapist Aide', '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(5, 'Bartender Helper', '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(6, 'Cleaners of Cars', '2023-05-16 01:20:26', '2023-05-20 07:26:09'),
(7, 'Appliance Repaire', '2023-05-16 01:20:26', '2023-05-20 07:28:14'),
(8, 'Optometrist', '2023-05-16 01:20:26', '2023-05-20 07:42:45'),
(11, 'Games', '2023-05-20 08:08:05', '2023-05-20 08:08:05');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departament_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_departament_id_foreign` (`departament_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `phone`, `departament_id`, `created_at`, `updated_at`) VALUES
(2, 'Prof. Margaretta Wehner', 'smitham.cleora@gmail.com', '+14427248556', 1, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(3, 'Troy Hackett IV', 'jaiden.klocko@hotmail.com', '+14105741237', 1, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(4, 'Triston Corwin', 'sophia.grimes@hermann.biz', '+12488511969', 4, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(5, 'Mr. Ryann Robel Sr.', 'schowalter.zetta@gmail.com', '+12693229850', 6, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(6, 'Abbigail Berge', 'newton.price@carter.info', '+19479345489', 2, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(7, 'Dr. Lindsey Mosciski', 'kay.simonis@goodwin.com', '+19319457588', 2, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(8, 'Dr. Paige Little DVM', 'elfrieda13@yahoo.com', '+14079644426', 5, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(9, 'Krystel Huel III', 'kuhn.justen@gmail.com', '+12565515854', 1, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(10, 'Emely Cormier', 'witting.raven@volkman.com', '+19382877746', 4, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(11, 'Stella Legros', 'verona68@yahoo.com', '+19155902247', 2, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(12, 'Grady Quigley', 'brayan.smitham@hotmail.com', '+12549854690', 6, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(13, 'Gonzalo Wisozk', 'torp.jermey@klocko.com', '+13466919584', 5, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(14, 'Sonia Bogan PhD', 'carroll.jenkins@kovacek.org', '+14758956017', 2, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(15, 'Dorris Wyman', 'enrico57@gmail.com', '+17147165890', 5, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(16, 'Monserrate Feeney', 'rokeefe@yahoo.com', '+15073162155', 6, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(17, 'Lea Bogan Sr.', 'zoey.ohara@hotmail.com', '+17013264068', 1, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(18, 'Carole Russel MD', 'ismael.bins@hotmail.com', '+19073023024', 6, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(19, 'Mr. Noah Hane II', 'renner.braden@stark.com', '+13804052187', 6, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(20, 'Evie Torp', 'connelly.brayan@cummings.biz', '+18659912109', 3, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(21, 'Vern Kling', 'berta44@corkery.net', '+17025459667', 5, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(22, 'Marquise Kulas', 'eliza.schowalter@hills.info', '+12627938924', 1, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(23, 'Prof. Elbert Greenfelder', 'kiana55@sauer.com', '+15622358966', 3, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(24, 'Miss Bettie Pfannerstill', 'turcotte.rudy@schneider.org', '+13528869286', 5, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(25, 'Joany Hill', 'jacklyn.koss@batz.com', '+16282804504', 4, '2023-05-16 01:20:26', '2023-05-16 01:20:26'),
(26, 'Denzel Caleb Silva Torrico', 'denzel_silva@hotmail.com', '2840013', 4, '2023-05-24 03:44:11', '2023-05-24 03:44:11');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_15_192258_create_departments_table', 1),
(6, '2023_05_15_192316_create_employees_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Denzel Caleb Silva Torrico', 'denzel_silva@hotmail.com', NULL, '$2y$10$3KSo0hbiDMCk6srtz3cOgewheQn9NNR54BM0pUX4XuvSptb5JNMVy', NULL, '2023-05-20 01:18:09', '2023-05-20 01:18:09');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_departament_id_foreign` FOREIGN KEY (`departament_id`) REFERENCES `departments` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
