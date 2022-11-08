-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2022 at 09:52 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `billtask`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cusid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `cusid`, `bill_month`, `year`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(6, '7', 'December', '2022', '500', 'Paid', '2022-11-07 11:48:14', '2022-11-07 14:23:21'),
(7, '9', 'March', '2022', '500', 'Paid', '2022-11-07 14:32:44', '2022-11-07 14:32:51');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_11_05_115857_create_bills_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'my-app-token', '12e0433d253d894406d02331932fcc81d65749c55a2f5fb129e5f39fb9f1f173', '[\"*\"]', NULL, '2022-11-05 05:05:15', '2022-11-05 05:05:15'),
(2, 'App\\Models\\User', 1, 'my-app-token', 'e15faa27c3ed20becb1b99a64addf08f52e139635dee5c9f96f28fab80c36fae', '[\"*\"]', NULL, '2022-11-05 05:06:11', '2022-11-05 05:06:11'),
(3, 'App\\Models\\User', 1, 'my-app-token', '787366658518c057a399401d6529daed9e1321db7f93c9371f4c6dc6469d22bb', '[\"*\"]', NULL, '2022-11-05 06:29:28', '2022-11-05 06:29:28'),
(4, 'App\\Models\\User', 1, 'my-app-token', 'e76bfed17e093798c9675b4dac805cc7de186630ba192d6ea76704763db79ce5', '[\"*\"]', NULL, '2022-11-06 11:57:34', '2022-11-06 11:57:34'),
(5, 'App\\Models\\User', 1, 'my-app-token', 'b4b274d86990c67c4c445b649e5a251cc06a621458aaff0f02225cfc8fc8525f', '[\"*\"]', NULL, '2022-11-07 03:41:13', '2022-11-07 03:41:13'),
(6, 'App\\Models\\User', 1, 'my-app-token', 'cef84977608ab0f9206db0e11018d68c70cd9a157e8e2548b8ec76fb533a1e33', '[\"*\"]', NULL, '2022-11-07 11:41:25', '2022-11-07 11:41:25'),
(7, 'App\\Models\\User', 1, 'my-app-token', 'fae915c425a006ced7d48d6a8e02655ff466c855bda731c361ed472f0b1e3448', '[\"*\"]', NULL, '2022-11-07 13:30:15', '2022-11-07 13:30:15'),
(8, 'App\\Models\\User', 1, 'my-app-token', 'abfbc172cba40ae3be31e6eeeab097d448a4044c169f9b26d46543f7fafaf577', '[\"*\"]', NULL, '2022-11-07 13:33:26', '2022-11-07 13:33:26'),
(9, 'App\\Models\\User', 1, 'my-app-token', '78aff5dd65854438a629e025f8c65ca46599067254b807c890b6b088a78be825', '[\"*\"]', NULL, '2022-11-07 13:38:47', '2022-11-07 13:38:47'),
(10, 'App\\Models\\User', 9, 'my-app-token', 'e47b81a0839be028bea619a705db011750d3b4abc23beb8090308cd30b7b4192', '[\"*\"]', NULL, '2022-11-07 13:41:36', '2022-11-07 13:41:36'),
(11, 'App\\Models\\User', 1, 'my-app-token', '2d7558bbf5f3eb6b05625463c5f52714ec7e310da404b1bf11bf5975f6b14b08', '[\"*\"]', NULL, '2022-11-07 13:55:35', '2022-11-07 13:55:35'),
(12, 'App\\Models\\User', 1, 'my-app-token', '02bc16659e5de4ca19507a4576adbf1f3140966455a63d68a73636801e804a56', '[\"*\"]', NULL, '2022-11-07 14:05:47', '2022-11-07 14:05:47'),
(13, 'App\\Models\\User', 9, 'my-app-token', '65fa7181cf997176938f94c1128c01e1296f3d9f84797e518b240fa72ed3bc31', '[\"*\"]', NULL, '2022-11-07 14:06:15', '2022-11-07 14:06:15'),
(14, 'App\\Models\\User', 1, 'my-app-token', '2e250f05359b9480926317fd1078a8254441964e5c0d7fb50378a31c100cc165', '[\"*\"]', NULL, '2022-11-07 14:09:17', '2022-11-07 14:09:17'),
(15, 'App\\Models\\User', 1, 'my-app-token', 'f653ba9b45f4493277cfb1b2c05cee86f34148b747be24ee55a01d9b8498dc9c', '[\"*\"]', NULL, '2022-11-07 14:31:35', '2022-11-07 14:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usertype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `usertype`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'oliullah', 'oliullah1565@gmail.com', NULL, '$2y$10$4RHj27z35zNWxnNkN3fDw.dGx41yoWjMQigqj88otfAeJVan.2AQy', 'user', NULL, NULL, NULL, NULL),
(7, 'rakib', 'rakib@asesgl.com', NULL, '$2y$10$D4y/r3sbpzlUnGPAXyfixug5DvW620hkM3CEJPNEUeMnaSF0yhOq.', 'customer', 'Dhaka122', NULL, '2022-11-07 04:08:34', '2022-11-07 12:37:53'),
(9, 'Mafia', 'mafia@gmail.com', NULL, '$2y$10$FclXXNkMQjn3K.LVRiq4Be5uCrvISqzeWctz2OOvndDLXjATHlP9O', 'customer', 'Dhaka', NULL, '2022-11-07 13:41:05', '2022-11-07 13:41:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
