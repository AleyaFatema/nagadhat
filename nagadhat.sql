-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2021 at 12:24 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nagadhat`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'illum', 0, 1, '2021-09-13 01:10:17', '2021-09-13 01:10:17'),
(2, 'et', 0, 1, '2021-09-13 01:10:17', '2021-09-13 01:10:17'),
(3, 'earum', 1, 1, '2021-09-13 01:10:17', '2021-09-13 01:10:17'),
(4, 'neque', 0, 1, '2021-09-13 01:10:18', '2021-09-13 01:10:18'),
(5, 'nihil', 1, 1, '2021-09-13 01:10:18', '2021-09-13 01:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
(4, '2021_09_13_052418_create_categories_table', 1),
(5, '2021_09_13_053104_create_products_table', 1);

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'unique SKU/code',
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `return_policy` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `base_unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'kg, liter, etc.',
  `thumbnail_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `title`, `product_code`, `detail`, `return_policy`, `price`, `quantity`, `base_unit`, `thumbnail_url`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 2, 'Nisi omnis qui dolore perferendis iste.', 'A bright.', 'Qui id atque doloribus et sit eligendi qui omnis. Et ipsa dolor pariatur dolor sit nisi. Et ex aut rerum aut quia quos accusantium ut.', 'Saepe eum tempore vitae eligendi quod aut a. Qui nihil quasi repellendus fuga ut. Autem delectus accusantium occaecati maiores.', 6780.00, 9, 'liter', 'https://via.placeholder.com/640x480.png/0011aa?text=omnis', 0, 1, '2021-09-13 04:02:19', '2021-09-13 04:02:19'),
(2, 4, 'Porro doloremque excepturi sint dolore.', 'Number.', 'Libero quidem voluptatem vitae reprehenderit. Dolores aperiam sit architecto perferendis beatae. Non aut at qui aspernatur sit esse. Quas enim asperiores doloribus itaque sit voluptates. Dolor consequatur quo nobis sit totam sed sequi doloremque.', 'Laborum alias fugit quaerat rerum omnis quas. Pariatur voluptas ea sunt aspernatur qui consequatur facere quasi. Enim molestiae in pariatur unde.', 8292.00, 13, 'piece', 'https://via.placeholder.com/640x480.png/001100?text=minima', 1, 1, '2021-09-13 04:02:19', '2021-09-13 04:02:19'),
(3, 1, 'Sapiente officiis quas quia et deserunt sit nostrum.', 'It was.', 'Dignissimos explicabo voluptas dignissimos quos corporis ea. Est fuga eius aliquid ad. Quod sit voluptatum sed fuga. Rem eum et maxime possimus.', 'Similique totam consectetur suscipit omnis tenetur debitis. Est optio nihil consectetur molestias molestias doloremque. Qui magnam sunt sequi cupiditate.', 6938.00, 6, 'piece', 'https://via.placeholder.com/640x480.png/004466?text=voluptatum', 1, 1, '2021-09-13 04:02:19', '2021-09-13 04:02:19'),
(4, 5, 'Et laudantium mollitia eos sed voluptatum.', 'Mock.', 'Corporis aut sint voluptatem voluptatem non odio. Non quis sint enim eveniet.', 'Quis est et repudiandae sed odio. Cumque explicabo quibusdam dignissimos qui unde. Molestias tenetur accusamus est deserunt non. Reiciendis qui similique eos.', 1394.00, 33, 'piece', 'https://via.placeholder.com/640x480.png/00eeff?text=ratione', 0, 1, '2021-09-13 04:02:19', '2021-09-13 04:02:19'),
(6, 1, 'Libero et rerum excepturi animi.', 'Duck.', 'Et voluptatem ut quod sapiente. Illo repellat nulla tenetur enim quidem optio sed. Est explicabo tempora possimus.', 'Animi nulla omnis reiciendis soluta accusamus in nobis. Velit labore sit rerum blanditiis optio sunt. Temporibus fugiat est et sed est voluptas. Perspiciatis laboriosam libero iure dolorem id aut tempora.', 8905.00, 3, 'piece', 'https://via.placeholder.com/640x480.png/004477?text=enim', 1, 1, '2021-09-13 04:02:20', '2021-09-13 04:02:20'),
(7, 3, 'Incidunt sit delectus voluptate.', 'Alice.', 'Adipisci ipsa quidem tenetur totam. Necessitatibus enim nemo esse commodi soluta sint reprehenderit ducimus. Quis ipsum voluptas et sit repudiandae. Magnam odit cum quod. Iusto et animi voluptatem.', 'Odit voluptatem illum est praesentium non corporis dignissimos qui. Sunt excepturi quasi ab excepturi. Fugiat alias cum molestias earum enim dolores. Sunt ut officiis nam iure vel ea dolor.', 584.00, 50, 'ml', 'https://via.placeholder.com/640x480.png/002200?text=velit', 1, 1, '2021-09-13 04:02:20', '2021-09-13 04:02:20'),
(8, 2, 'Provident alias et officia eum adipisci.', 'Mouse.', 'Blanditiis quaerat nulla voluptatem voluptates nostrum eligendi quaerat. Vel aut repellendus delectus et. Possimus possimus exercitationem numquam fuga quis. Et aliquam voluptatibus maxime et quam vel.', 'Necessitatibus qui est alias facere. Debitis quos qui qui sed facere. Sunt consequuntur qui et aut labore delectus voluptates. Rerum et voluptatem harum debitis porro aut rerum.', 8702.00, 24, 'mg', 'https://via.placeholder.com/640x480.png/0088dd?text=quae', 1, 1, '2021-09-13 04:02:20', '2021-09-13 04:02:20'),
(10, 3, 'At est a consequatur cumque.', 'So you.', 'Porro maiores tenetur dolores itaque eius dignissimos. Cupiditate et non quidem tenetur recusandae rerum. Qui repellendus ducimus et aspernatur autem.', 'Tempora labore quod voluptatem asperiores harum. Voluptatem et consequatur et sunt quos quia. Voluptatem soluta occaecati et autem.', 7840.00, 48, 'kg', 'https://via.placeholder.com/640x480.png/004455?text=dicta', 0, 1, '2021-09-13 04:02:22', '2021-09-13 04:02:22'),
(11, 4, 'Quo rerum quisquam et blanditiis modi est.', 'COULD.', 'Quia labore magnam et provident saepe alias. Inventore pariatur est officiis neque quo laudantium maxime sit. Sed ut magni commodi. Excepturi ut error in quisquam in sed voluptatum.', 'Adipisci repellat dolores quis suscipit laborum enim. Delectus voluptatem libero necessitatibus consequatur.', 3059.00, 16, 'liter', 'https://via.placeholder.com/640x480.png/00cc44?text=molestiae', 0, 1, '2021-09-13 04:02:22', '2021-09-13 04:02:22'),
(12, 5, 'Saepe esse et consequuntur consectetur error expedita laborum et.', 'And she.', 'Ut in voluptatem quod ullam aut. Recusandae incidunt ut eius iste aliquid inventore dolores molestiae. Nostrum omnis quidem rerum.', 'Quia labore ut ut ex natus ab consequuntur atque. Dolorum est adipisci quasi mollitia ut. Et excepturi ducimus quas ut natus ut aliquam. Cupiditate velit dicta in nam ullam quidem omnis.', 1981.00, 42, 'mg', 'https://via.placeholder.com/640x480.png/001199?text=magni', 1, 1, '2021-09-13 04:02:23', '2021-09-13 04:02:23'),
(13, 3, 'Veritatis consequuntur fugiat reiciendis eligendi ullam soluta eum.', 'I--\'.', 'Corporis molestiae est iure. Et dicta pariatur architecto soluta in veritatis ut. Et reiciendis deleniti et blanditiis ad. Aut quas asperiores earum tempore et et consequatur.', 'Doloremque amet inventore impedit inventore. Odit in et ut unde. Voluptatem nihil et blanditiis numquam perspiciatis eos. Saepe quia dignissimos ducimus quas. Maxime voluptatibus quod harum eum quo quaerat incidunt magnam.', 5416.00, 46, 'liter', 'https://via.placeholder.com/640x480.png/008899?text=ratione', 1, 1, '2021-09-13 04:02:24', '2021-09-13 04:02:24');

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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aleya Fatema', 'aleya.fatema@gmail.com', NULL, '$2y$10$RnxSeF4GwgYA4k3P1dh8zuJSMl9Mft5AHgHyaSQ6l8NqnhU5aCxve', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD KEY `categories_created_by_foreign` (`created_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_title_unique` (`title`),
  ADD UNIQUE KEY `products_product_code_unique` (`product_code`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_created_by_foreign` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_id_created_at_index` (`id`,`created_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
