-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2018 at 06:11 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_10_03_131822_create_posts_table', 1),
(4, '2018_10_07_095819_add_user_id_to_posts', 2),
(5, '2018_10_07_122927_add_cover_image_to_posts', 3),
(6, '2018_11_03_073342_create_tags_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `cover_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `created_at`, `updated_at`, `user_id`, `cover_image`) VALUES
(10, 'Post One', 'This is Post one', '2018-10-07 08:07:13', '2018-10-07 08:07:13', 2, 'noimage.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES
(10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'music', '2018-11-01 00:00:31', '2018-11-01 21:50:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'sharad', 'sharadpandey.pandey77@gmail.com', '$2y$10$M.UR5SncbwqlQrJ3SUa1bOOxvN21CHYVY8um4LEcr2wFzCffWwE66', '1hNuOh5dGk4j5Pb32xkBslOkTksKXjlCBeNOe7cQ2hW7gZevVG7di0rf7Tjj', '2018-10-07 04:09:40', '2018-10-07 04:09:40'),
(2, 'rocky', 'rocky@gmail.com', '$2y$10$Tk.1xje7XT5FAAjnPxHx.uHGpErzM9fwKlgrNrsNQkWJxCp3D8nxK', 'yaECIPX6xRTtoJkWY3lTk7HubytdZ3ivutcdoNe3hJnBHkF6EX825ZXoueVi', '2018-10-07 04:33:58', '2018-10-07 04:33:58'),
(3, 'shivansh', 'malasishivansh@gmail.com', '$2y$10$gUxZ7elzwni5jNkY5YqqHuIw20Vr.Ab0EyM9WfpZXstKBJJFBpnj2', 'La8y1zUQIUUVF2YElyxQRxbpYMstg7KO5Nt6r9PiWl11MlHns5nbIuagXgCU', '2018-10-07 17:35:54', '2018-10-07 17:35:54'),
(5, 'adam', 'adam1@gmail.com', '$2y$10$2tNjAGJYSHf/nINwNydbEuIhg0RDYm3FL97ErbGkMU8TgSXMqHZve', 'qOZQy43tNs8zwA4MclxDLNBfDK6KCasCrMz9R9wQCKkXGYLkXyZjoTohXF9a', '2018-10-14 11:52:04', '2018-10-14 11:52:04'),
(10, 'sharad', 'sharad@gmail.com', '$2y$10$0/Ss7udvEYydrvGRGWTVe.97u.SHY5II7R7/sQBDkjfL3tKjwTtry', 'ogLGUOxLh4RHBWOlOXlIF1rnMuIRDk5eEsanO4pUggZVKcl7DSxjlSidXiFA', '2018-10-14 13:51:10', '2018-10-14 13:51:10'),
(11, 'sharad', 'sharad1@gmail.com', '$2y$10$/9I3UBcU2pbxjhJpqaOkjemCPEkFXmKileVoAAcfUn8Hqzkukz8BW', 'GQv4Ra4jm2F3R4htnjXp9kxHDlu8w2KZHbVMDiLBDdidFVrN6v9XexkziFX3', '2018-10-15 02:56:08', '2018-10-15 02:56:08'),
(12, 'sharad', 'sharad12@gmail.com', '$2y$10$M4J4bnTrYlFkUQU3upXZfOwNUEl1nNYWX9y9fkRCTrDZ0k5FOc.26', 'G8bDdoqXUaBflnfBpoTqLpp1lqyPVx72urFGbw9BM9AeLQ1olZzlRAK6r4he', '2018-10-15 03:12:04', '2018-10-15 03:12:04'),
(13, 'sharad', 'sara@gmail.com', '$2y$10$NoEybJWCJAmhA3IoLmZf5OThkYjDS7MiDMQStcsS/Wuwl6MtfGnZi', NULL, '2018-10-15 03:39:37', '2018-10-15 03:39:37'),
(14, 'sharad', 'sara123@gmail.com', '$2y$10$GfbGJu1Nnwa/hja4piAM7OYak7I233qOWvtKTXr03gAy9XNhquPlW', 'k72pAP5l6eq2dxgL2F7HGfsGuhwxDrAXMxRVAMqipQhiogjvvwTbmvikalGP', '2018-10-15 03:40:44', '2018-10-15 03:40:44'),
(15, 'sara', 'sara1@gmail.com', '$2y$10$bS2G4toyijyxMRS0w18qVOeGX6cmyN6JQoa9lS7f2TAxWHEZLkN2K', 'RSyObCFNKku3ak9IuskQtQC3uOfpwZBKc2V6RcXlmDpmjp4kd93n5WRnVgxh', '2018-10-15 03:47:13', '2018-10-15 03:47:13'),
(16, 'robert', 'rob@gmail.com', '$2y$10$vIBdP6bkI3mBtf9wL64SIeiCswQx6Wp4KBg2ESrInKyH8Eq/UxzMO', 'ikh0Ucx5oFpP7vCgfpyQyLMA8yRLcdMxoa5V0FRFI5qoRgVrgJRVxN6RXJGL', '2018-10-15 03:58:45', '2018-10-15 03:58:45'),
(17, 'rob', 'rob1@gmail.com', '$2y$10$cclJ9xSD86YgDVDyOMrffeJtS3jXs1QX/Ds.5d6XXXtPBOAXtH73W', NULL, '2018-10-15 04:00:31', '2018-10-15 04:00:31'),
(18, 'manish', 'manish@gmail.com', '$2y$10$D/kfBYfFRSEwZrhN09qQDeSJbk.Fp8PBXrbtH0VFmCwP6.MTWC.CK', NULL, '2018-10-16 00:49:46', '2018-10-16 00:49:46');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`post_id`,`tag_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
