-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 10, 2023 lúc 03:19 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dreamteam_travel_web`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(14, '2014_10_12_000000_create_users_table', 1),
(15, '2014_10_12_100000_create_password_resets_table', 1),
(16, '2019_08_19_000000_create_failed_jobs_table', 1),
(17, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(18, '2023_04_09_141936_tour', 1),
(19, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(20, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(21, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(22, '2016_06_01_000004_create_oauth_clients_table', 2),
(23, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('c499e2ac91e802d2186ca84375d3c66ce90e27389395b5696fc30160625890125ae7b127ccddb5c8', 18, 1, 'travel', '[]', 0, '2023-04-10 04:32:57', '2023-04-10 04:32:57', '2024-04-10 11:32:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'sipPrAF8Yzx1Xr3Yud5kXZ34Z9yUhhfQWrvTzbJ1', NULL, 'http://localhost', 1, 0, 0, '2023-04-10 01:40:22', '2023-04-10 01:40:22'),
(2, NULL, 'Laravel Password Grant Client', '8xzDVU7VOnyIZquBGv022ksgo2mR5PGTj4moZCxl', 'users', 'http://localhost', 0, 1, 0, '2023-04-10 01:40:22', '2023-04-10 01:40:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-04-10 01:40:22', '2023-04-10 01:40:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
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
-- Đang đổ dữ liệu cho bảng `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 5, 'MyApp', '3e9cf95a4dd9502943b842acf26e5b47be1b68b5aaed0203c6f75b625f61d4b4', '[\"*\"]', NULL, '2023-04-10 02:25:51', '2023-04-10 02:25:51'),
(2, 'App\\Models\\User', 7, 'MyApp', 'e0fc7d06b8a4d9263d7dd8e82b324193b9442b2c67d788a15b4d30ddc88a5014', '[\"*\"]', NULL, '2023-04-10 02:33:10', '2023-04-10 02:33:10'),
(3, 'App\\Models\\User', 7, 'MyApp', 'd6e787c9a5fbcf92eae875e46934684e5d373841050a03db09f59890a94f037a', '[\"*\"]', NULL, '2023-04-10 02:41:34', '2023-04-10 02:41:34'),
(4, 'App\\Models\\User', 7, 'MyApp', 'c607115c96abffbb020efc89a6db57f47224d0e055d1ea9c64d3ada4ef352c24', '[\"*\"]', NULL, '2023-04-10 02:42:42', '2023-04-10 02:42:42'),
(5, 'App\\Models\\User', 9, 'MyApp', '514e1f63b258c4075e43b69a4d476b457966de8f383ba1646a544a2c8e34b5b0', '[\"*\"]', NULL, '2023-04-10 03:03:12', '2023-04-10 03:03:12'),
(6, 'App\\Models\\User', 11, 'MyApp', 'd386ab94e0cb970cc81a2e759776ee37bcb81f937d48fad379ef1dd1d469ae0d', '[\"*\"]', NULL, '2023-04-10 03:03:46', '2023-04-10 03:03:46'),
(7, 'App\\Models\\User', 13, 'Token', 'cffe355faefd74239a536a645731564d624fdaac2a95f4262d923670544f81f4', '[\"*\"]', NULL, '2023-04-10 03:10:30', '2023-04-10 03:10:30'),
(8, 'App\\Models\\User', 15, 'Token', 'aef37b4a05ae302a3487d6e0041e4d5738278c0327c6606447b0b9dcd6bc33eb', '[\"*\"]', NULL, '2023-04-10 03:13:51', '2023-04-10 03:13:51'),
(9, 'App\\Models\\User', 17, 'Token', 'cbf747251cd74aebfec8c20d99df7dcd604762bb64b297446ff9ec2ceb5331ca', '[\"*\"]', NULL, '2023-04-10 03:19:27', '2023-04-10 03:19:27'),
(10, 'App\\Models\\User', 7, 'Token', '69e440cf27fc2e4a1dff416d4ce20dc13bfc84c5fc3d9eac2cc1c98e2a5527fc', '[\"*\"]', NULL, '2023-04-10 03:25:17', '2023-04-10 03:25:17'),
(11, 'App\\Models\\User', 7, 'Token', 'ccc3ea66f71ebbaa14a39fc8f159e7e3a54b2ec94c8f6d3f147a9091b808fc4d', '[\"*\"]', NULL, '2023-04-10 03:25:33', '2023-04-10 03:25:33'),
(12, 'App\\Models\\User', 7, 'Token', '0b11b408a9b7b6c7e11935e857b3a8c199553be608eb87dfbbc9827814be39b5', '[\"*\"]', NULL, '2023-04-10 03:26:01', '2023-04-10 03:26:01'),
(13, 'App\\Models\\User', 7, 'Token', 'e4f3b3e30efbfa2361c2e5c3d7a3ceafb863abb15d8293ae694a85788db6dbfc', '[\"*\"]', NULL, '2023-04-10 03:32:59', '2023-04-10 03:32:59'),
(14, 'App\\Models\\User', 7, 'MyApp', '4f351fa197e07a292edf436c7edfd036b85493499ce12fb934e5936e0093fa3c', '[\"*\"]', NULL, '2023-04-10 03:33:44', '2023-04-10 03:33:44'),
(15, 'App\\Models\\User', 7, 'MyApp', '8f67369ff336ab1235109ba68232c0c961b95a7b76776e80779e443db93fd0ce', '[\"*\"]', NULL, '2023-04-10 03:36:22', '2023-04-10 03:36:22'),
(16, 'App\\Models\\User', 18, 'MyApp', '688829ccef768efafc937ce9812bd238fdcf038f73f8af10bab881e913762ded', '[\"*\"]', NULL, '2023-04-10 03:37:43', '2023-04-10 03:37:43'),
(17, 'App\\Models\\User', 18, 'MyApp', '8355c9caeb3f5c620a32af7d67b8367c1ba2e9a5022e8f9ec12609d466aa4705', '[\"*\"]', NULL, '2023-04-10 03:38:07', '2023-04-10 03:38:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'User'),
(2, 'Admin'),
(3, 'Parner');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tour`
--

CREATE TABLE `tour` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tour_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `max_people` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `detail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_tour` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tour`
--

INSERT INTO `tour` (`id`, `tour_name`, `img`, `description`, `date_start`, `date_end`, `max_people`, `price`, `detail`, `type_tour`, `location`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '123', 'a@gmail.com', '123', '2001-05-10', '2001-05-10', '5', 30000, 'ksdbfkhsdkfbksjdfbkjsdbfksdkfjbsdjkbfjkdsb', 'vipokknk', 'dn', NULL, '2023-04-09 19:17:54', '2023-04-09 19:17:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `phone`, `address`, `username`, `email`, `email_verified_at`, `password`, `system_role`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, NULL, NULL, NULL, 'a', 'a@gmail.com', NULL, '$2y$10$jlIlIz3S4s8EeRNt9m0a/.310Mwk1zN/L9EVQDq8.q5CgXoujrQPG', '2', NULL, '2023-04-09 08:08:09', '2023-04-09 08:08:09'),
(4, 'aaaaaaa', NULL, NULL, 'kun510', 'kun510@gmail.com', '0000-00-00 00:00:00', '$2y$10$jlIlIz3S4s8EeRNt9m0a/.310Mwk1zN/L9EVQDq8.q5CgXoujrQPG', '2', NULL, NULL, NULL),
(5, NULL, NULL, NULL, 'cuong', 'cuong@gmail.com', NULL, '$2y$10$6drhBIB3fvFHKcsJ9AkCauT7DAt5arCWZJhmONxEMt7gu.pjdSPzS', '1', NULL, '2023-04-10 02:25:51', '2023-04-10 02:25:51'),
(7, NULL, NULL, NULL, 'dat', 'datne@gmail.com', NULL, '$2y$10$i96L08irzrztx67QcyRe2e1B0YdvY4rto1isI3.V4yyxMwNx/eLN2', '1', NULL, '2023-04-10 02:33:10', '2023-04-10 02:33:10'),
(9, NULL, NULL, NULL, 'dat', 'lam@gmail.com', NULL, '$2y$10$IyOS5j6G68afV1GZCyBcteuUdXbHQw82IKqHGCrt1ouTW13ztSkAu', '1', NULL, '2023-04-10 03:03:12', '2023-04-10 03:03:12'),
(11, NULL, NULL, NULL, 'dat', 'lam1@gmail.com', NULL, '$2y$10$w2syRg2ZfEWBYCbSLbRDp.Jd6cPKANU/QVNqPTY7tNDVMkbkMhE9S', '1', NULL, '2023-04-10 03:03:46', '2023-04-10 03:03:46'),
(13, NULL, NULL, NULL, 'dat', 'lam2@gmail.com', NULL, '123', '1', NULL, '2023-04-10 03:10:30', '2023-04-10 03:10:30'),
(15, NULL, NULL, NULL, 'dat', 'lam3@gmail.com', NULL, '123', '1', NULL, '2023-04-10 03:13:51', '2023-04-10 03:13:51'),
(17, NULL, NULL, NULL, 'dat', 'lam4@gmail.com', NULL, '123', '1', NULL, '2023-04-10 03:19:27', '2023-04-10 03:19:27'),
(18, NULL, NULL, NULL, 'dat', 'cuongtran@gmail.com', NULL, '$2y$10$d0.8ooHSzx3jT1oufxLVFO5d0c5O0UmZ7MfivVJ/lSgWD9IMUkju2', '3', NULL, '2023-04-10 03:37:43', '2023-04-10 03:37:43');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tour`
--
ALTER TABLE `tour`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tour`
--
ALTER TABLE `tour`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
