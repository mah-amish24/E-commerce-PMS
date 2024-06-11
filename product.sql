-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for products
CREATE DATABASE IF NOT EXISTS `products` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `products`;

-- Dumping structure for table products.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table products.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table products.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table products.migrations: ~7 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2024_06_09_152120_create_products_table', 1),
	(6, '2024_06_09_152755_add_columns_to_users_table', 1),
	(7, '2024_06_09_153057_add_columns_to_products_table', 1);

-- Dumping structure for table products.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table products.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;

-- Dumping structure for table products.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table products.personal_access_tokens: ~0 rows (approximately)
DELETE FROM `personal_access_tokens`;

-- Dumping structure for table products.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_user_id_foreign` (`user_id`),
  CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table products.products: ~13 rows (approximately)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `created_at`, `updated_at`, `name`, `description`, `price`, `image`, `user_id`) VALUES
	(16, '2024-06-10 20:16:32', '2024-06-10 20:16:32', 'zx', 'zxc', 22, 'logo.jpg', 2),
	(18, '2024-06-10 23:05:21', '2024-06-10 23:05:21', 'ahmed', 'ahmed', 44, 'id 1.png', 3),
	(19, '2024-06-11 05:30:23', '2024-06-11 05:30:23', 'الاسم', 'الوصف', 22, 'logo.jpg', 2),
	(24, '2024-06-11 06:23:27', '2024-06-11 08:09:12', 'update_name', 'update_description24', 25, 'logo.jpg', 3),
	(25, '2024-06-11 06:39:47', '2024-06-11 06:39:47', 'update_name', 'update_description', 24, 'photo-1020478.jpg', 3),
	(26, '2024-06-11 06:45:41', '2024-06-11 06:45:41', 'update_name', 'update_description', 24, 'photo-1020478.jpg', 3),
	(27, '2024-06-11 06:57:20', '2024-06-11 08:04:50', 'update_name', 'update_description', 24, 'photo-1020478.jpg', 3),
	(28, '2024-06-11 06:57:38', '2024-06-11 06:57:38', 'update_name', 'update_description', 24, 'photo-1020478.jpg', 3),
	(29, '2024-06-11 06:58:21', '2024-06-11 06:58:21', 'update_name', 'update_description', 24, 'photo-1020478.jpg', 3),
	(30, '2024-06-11 07:01:30', '2024-06-11 07:01:30', 'update_name', 'update_description', 24, 'photo-1020478.jpg', 3),
	(31, '2024-06-11 07:02:59', '2024-06-11 07:02:59', 'update_name', 'update_description', 24, 'photo-1020478.jpg', 3),
	(33, '2024-06-11 07:07:30', '2024-06-11 08:17:53', 'update_name332', 'update_description332', 332, 'logo.jpg', 2),
	(36, '2024-06-11 09:23:15', '2024-06-11 09:23:15', 'name34', 'wasf34', 34, 'logo2.jpg', 2);

-- Dumping structure for table products.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table products.users: ~4 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(2, 'mahmoud', 'mah@yahoo.com', NULL, '$2y$10$uyCHZzZpXakWpCWMKeYOpukM9wOrx5UCjpB.GM9eucLl.4ZmgjJja', NULL, '2024-06-10 15:50:01', '2024-06-10 15:50:01'),
	(3, 'ahmed', 'ahmed@yahoo.com', NULL, '$2y$10$PtPu/sM.fJvq3so5NUwzZ.YBSWs3fSe6Pd6gg/RKpnR.Oxzd.e1LW', NULL, '2024-06-10 23:04:12', '2024-06-10 23:04:12'),
	(4, 'test', 'test@yahoo.com', NULL, '$2y$10$cagPNu6a6gcSlARazohBHeXpNHhFtNJFthUC9TkZQxOCK/YsKR0h.', NULL, '2024-06-11 11:51:35', '2024-06-11 11:51:35'),
	(5, 'test2', 'test2@yahoo.com', NULL, '$2y$10$x00nsHLhkOAz4GTuVR5QhefSFeelTu0Tfg6aoigclwTFZ7Z22Dw2a', NULL, '2024-06-11 12:11:28', '2024-06-11 12:11:28');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
