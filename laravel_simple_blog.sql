-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table laravel_simple_blog.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_simple_blog.cache: ~0 rows (approximately)

-- Dumping structure for table laravel_simple_blog.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_simple_blog.cache_locks: ~0 rows (approximately)

-- Dumping structure for table laravel_simple_blog.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_simple_blog.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table laravel_simple_blog.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_simple_blog.jobs: ~0 rows (approximately)

-- Dumping structure for table laravel_simple_blog.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_simple_blog.job_batches: ~0 rows (approximately)

-- Dumping structure for table laravel_simple_blog.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_simple_blog.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_05_15_072748_create_posts_table', 1);

-- Dumping structure for table laravel_simple_blog.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_simple_blog.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table laravel_simple_blog.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_draft` tinyint(1) NOT NULL DEFAULT '0',
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_simple_blog.posts: ~9 rows (approximately)
INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `content`, `is_draft`, `published_at`, `created_at`, `updated_at`) VALUES
	(3, 1, 'Contoh Post Active', 'contoh-post-active', 'at nibh blandit, vel commodo purus porta. Nullam ornare porttitor erat, eget ultricies ante rhoncus a. Morbi ac blandit tortor. Fusce vitae facilisis est. Suspendisse et sapien eu sem tempor ullamcorper vel eu tortor. Donec posuere diam elit, vel viverra neque maximus id. Praesent cursus magna vel eros elementum pretium. Aenean sed tristique dui. Integer et justo commodo, varius eros nec, iaculis nisi.', 0, '2025-05-10 17:00:00', '2025-05-15 06:51:46', '2025-05-19 05:14:34'),
	(4, 1, 'Contoh Post Scheduled', 'contoh-post-scheduled', 'Donec placerat ante nec sem lacinia, eu condimentum felis semper. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean et dapibus libero. Mauris aliquet sit amet lectus facilisis porttitor. Pellentesque est metus, consequat ac nisi eu, porttitor euismod nibh. Quisque orci ipsum, feugiat et tellus vel, sagittis convallis neque. Nunc eleifend lectus felis, vitae eleifend mauris pretium eu. Suspendisse quis quam molestie, tempor quam a, rutrum orci. Aenean massa lorem, condimentum et dolor et, faucibus viverra eros. Mauris tincidunt in sapien eget scelerisque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam condimentum turpis luctus ipsum imperdiet porttitor at sit amet lacus. Praesent rhoncus leo in lacus consequat, id condimentum nunc eleifend. Nulla massa velit, pretium eu viverra nec, ullamcorper at libero. Cras ut rhoncus elit, quis porta lectus. Nulla vel nisi nisl.', 0, '2025-05-30 17:00:00', '2025-05-15 06:52:50', '2025-05-19 05:14:41'),
	(5, 3, 'Post Article Active', 'post-article-active', 'Phasellus a vulputate sapien. Vestibulum vestibulum, lectus id convallis placerat, velit mauris tincidunt odio, vitae blandit libero dui vel tellus. Proin elementum metus in hendrerit volutpat. Nam efficitur scelerisque leo at dictum. Vestibulum ac velit blandit neque mollis iaculis. Phasellus id erat efficitur, tristique nisi vitae, sollicitudin lectus. Pellentesque vehicula lacinia porta. Sed rhoncus, mi vulputate gravida pulvinar, purus turpis egestas tellus, non imperdiet enim felis quis tortor. Nullam non justo at massa eleifend blandit. Suspendisse ac dictum urna. Suspendisse ligula quam, elementum sed sagittis eget, vehicula ac felis. Aenean elit nisl, convallis non eros vulputate, interdum tempor justo. Mauris sit amet lobortis lectus. Aliquam dignissim tempus arcu sit amet accumsan. Sed odio purus, consectetur non tortor blandit, tempor convallis diam.', 0, '2025-05-17 17:00:00', '2025-05-19 05:05:39', '2025-05-19 05:13:45'),
	(6, 3, 'Post Article Draft', 'post-article-draft', 'Vestibulum neque sapien, mattis nec molestie a, imperdiet vitae sapien. Pellentesque ac neque id lacus scelerisque feugiat. Morbi ultrices, velit ut imperdiet lacinia, dolor metus dignissim neque, eget pulvinar arcu neque scelerisque arcu. Donec fringilla odio nulla, facilisis rhoncus elit congue vel. Donec sollicitudin quis augue id luctus. Quisque sagittis viverra velit scelerisque pulvinar. Aenean rhoncus congue ligula in cursus. Aliquam erat volutpat. Fusce iaculis commodo lacinia. Cras facilisis quis massa at placerat. Integer tincidunt fermentum pellentesque.', 1, NULL, '2025-05-19 05:06:18', '2025-05-19 05:13:52'),
	(7, 3, 'Post Article Scheduled', 'post-article-scheduled', 'Curabitur eget est ornare, molestie lorem id, malesuada ipsum. Proin dapibus purus ac leo sollicitudin aliquam. Curabitur augue eros, suscipit eu dapibus et, tincidunt ut arcu. Fusce mattis, lorem quis interdum consectetur, erat elit aliquam diam, at lacinia lacus enim a enim. Mauris tempor malesuada enim, vitae fermentum nisi. Vestibulum eget augue in eros dignissim ultrices. Aenean mi mauris, pretium vitae diam nec, egestas sagittis erat. Quisque consectetur ex vel vehicula hendrerit. Donec sit amet metus eget velit maximus facilisis.', 0, '2025-05-27 17:00:00', '2025-05-19 05:08:06', '2025-05-19 05:14:02'),
	(8, 4, 'Article Blog Post Active', 'article-blog-post-active', 'Vestibulum purus eros, auctor eget dolor in, rhoncus ullamcorper ante. Pellentesque non risus vitae odio sodales accumsan in et neque. Donec lacinia risus risus, et suscipit risus faucibus quis. Ut malesuada euismod quam, quis fermentum justo laoreet ac. Maecenas pretium elementum nibh, non facilisis tortor interdum sit amet. Donec et hendrerit dui, eget rutrum arcu. Suspendisse molestie risus et tortor faucibus, in condimentum ligula posuere. Mauris cursus, arcu sed pretium aliquet, metus sapien sagittis arcu, vitae vehicula magna dui nec est. Aliquam aliquet sollicitudin velit ac tristique. Maecenas facilisis eros leo, sed euismod lorem tempus eu. Praesent fermentum, orci at suscipit finibus, leo lectus finibus ipsum, id imperdiet lectus quam finibus nulla. Morbi ultricies finibus efficitur. Aenean nisl ipsum, condimentum vel metus ac, facilisis maximus eros.', 0, '2025-05-16 17:00:00', '2025-05-19 05:09:42', '2025-05-19 05:11:53'),
	(9, 4, 'Article Blog Post Draft', 'article-blog-post-draft', 'Nam vel pulvinar leo. Cras eget dictum nisl. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at ultricies sem. Aliquam neque nulla, varius id magna eget, interdum blandit arcu. Proin pharetra id dui ut sodales. Aenean tincidunt est vel justo sodales bibendum sed ut augue. Aliquam hendrerit eu nulla eget gravida. Vivamus ac mi magna. Nunc eget nulla tempor, eleifend risus ut, commodo elit. Cras scelerisque ipsum eu auctor facilisis. Sed sit amet vestibulum lacus. Cras efficitur massa sed imperdiet facilisis.', 1, NULL, '2025-05-19 05:10:29', '2025-05-19 05:13:01'),
	(10, 4, 'Article Blog Post Scheduled', 'article-blog-post-scheduled', 'Morbi sit amet elementum dui. Nullam ultricies diam at purus suscipit dignissim. Quisque posuere tortor mauris, id viverra purus scelerisque quis. Suspendisse potenti. Nulla tempor felis libero, eget accumsan quam scelerisque vel. Nunc mollis elit nulla, ut porta ante tincidunt sed. Aenean in sem eu elit bibendum cursus et at augue. Donec tincidunt dui at risus mattis, nec posuere ipsum aliquam. Morbi id ultrices risus, et aliquam purus. Nunc at posuere neque. Fusce hendrerit arcu vel augue tempor, eget porta turpis posuere. Fusce varius eleifend sem.', 0, '2025-05-29 17:00:00', '2025-05-19 05:11:03', '2025-05-19 05:13:11'),
	(11, 1, 'Contoh Post Draft', 'contoh-post-draft', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu tincidunt leo. Suspendisse aliquam sed turpis non mollis. In fringilla felis non felis semper imperdiet. Integer lacinia libero quis est congue, ac volutpat dui ornare. Cras tincidunt eu sapien rutrum malesuada. Ut nec fermentum orci, sit amet ornare lorem. Vivamus tristique sapien ac orci rhoncus, id mattis ipsum malesuada. Donec egestas dolor mauris, accumsan bibendum quam bibendum eu. Phasellus laoreet justo non turpis egestas, ut dapibus lacus laoreet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aenean elementum ullamcorper pretium. In auctor tortor in varius semper. Ut ullamcorper massa eu diam euismod scelerisque. Suspendisse a accumsan est. Vestibulum purus lorem, pulvinar dictum viverra quis, vulputate sed nibh. Sed augue arcu, iaculis a aliquet nec, rutrum eu felis.', 1, NULL, '2025-05-19 06:16:18', '2025-05-19 06:16:18');

-- Dumping structure for table laravel_simple_blog.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_simple_blog.sessions: ~2 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('5Bsdx9hc25RBuGz4X4TSPW1YLNXYd4txO14usVVe', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUDlMZ2phaXJxM0hTaG5ITXgyTGgwZmt3ZFR5SlQ4MjRobkw4OWh6aSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sYXJhdmVsLXNpbXBsZS1ibG9nLnRlc3QiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6NToibG9naW4iO2E6MDp7fX0=', 1747664714);

-- Dumping structure for table laravel_simple_blog.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_simple_blog.users: ~3 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Test User', 'test@example.com', '2025-05-15 05:20:39', '$2y$12$fbGa.3IlucyxX9ZWb6jcg.Yl7EvAHZYIJACARAyfrIIAAjyVbO5HK', 'mj553kMcgqeVZ9VzNYaLBuq4hnyo7KE0b8PH4SAfCGrpjcM7n2xS2eQEF86F', '2025-05-15 05:20:40', '2025-05-15 05:20:40'),
	(3, 'Vika Arya', 'vikaarya@example.com', '2025-05-19 05:01:25', '$2y$12$IVSpqAmBavnjNgOCY9/f5.kYBLMKdTPnnEiizi8D4uvk/d3kH.hqW', 'uKbhM42mIZDe3PjUjLSjnuDCua1fJxLLbnsGi9l5Cssn6aPuUdxTCu1cD1mf', '2025-05-19 05:01:25', '2025-05-19 05:01:25'),
	(4, 'Janggar', 'janggar@example.com', '2025-05-19 05:01:25', '$2y$12$IVSpqAmBavnjNgOCY9/f5.kYBLMKdTPnnEiizi8D4uvk/d3kH.hqW', 'ke8bzk0ke0RdKY93RlKTdxuZklf9lGLoVFJm4OFvW2XUjTq43Xn5dSSUu3cF', '2025-05-19 05:01:25', '2025-05-19 05:01:25');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
