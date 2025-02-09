-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.2
-- Время создания: Фев 09 2025 г., 20:49
-- Версия сервера: 8.2.0
-- Версия PHP: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `laravel_blog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL),
(2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, NULL),
(3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, NULL),
(4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, NULL),
(5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, NULL),
(6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, NULL),
(7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2024-10-18 15:09:21', '2024-10-18 15:09:21');

-- --------------------------------------------------------

--
-- Структура таблицы `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$12$uQTm6EpN4KDC9JwEcD2ZQORxybvbeljubLQ/7Zr2KRtzyzXwKaj5m', 'Administrator', NULL, NULL, '2024-10-18 15:09:20', '2024-10-18 15:09:20');

-- --------------------------------------------------------

--
-- Структура таблицы `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Категория 1', 'kategoriya-1', '2024-09-20 13:49:55', '2024-09-20 13:49:55'),
(3, 'Категория 3', 'kategoriya-3', '2024-09-20 13:50:41', '2024-09-20 13:50:41'),
(4, 'Категория 4', 'kategoriya-4', '2024-09-22 12:22:39', '2024-09-22 12:22:39'),
(7, 'Категория 5', 'kategoriya-5', '2025-01-11 19:23:28', '2025-01-11 19:23:28'),
(8, 'Маркетинг', 'marketing', '2025-01-11 19:55:35', '2025-01-11 19:55:35'),
(9, 'Make Money', 'make-money', '2025-01-11 19:55:51', '2025-01-11 19:55:51'),
(10, 'Marketing', 'marketing-2', '2025-01-11 19:56:38', '2025-01-11 19:56:38');

-- --------------------------------------------------------

--
-- Структура таблицы `emails`
--

CREATE TABLE `emails` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `emails`
--

INSERT INTO `emails` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'd.lisachyov2013@yandex.ru', '2025-02-09 13:36:03', '2025-02-09 13:36:03');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(13, '2024_09_04_222402_create_categories_table', 1),
(14, '2024_09_04_222541_create_tags_table', 1),
(15, '2024_09_04_222606_create_posts_table', 1),
(16, '2024_09_04_222732_create_post_tag_table', 1),
(17, '2024_10_15_215708_alter_table_users_add_isadmin', 2),
(18, '2016_01_04_173148_create_admin_tables', 3),
(19, '2025_02_09_132158_alter_table_posts_add_title_index', 4),
(20, '2025_02_09_163010_create_emails_table', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `views` int UNSIGNED NOT NULL DEFAULT '0',
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `description`, `content`, `category_id`, `views`, `thumbnail`, `created_at`, `updated_at`) VALUES
(2, 'статья 2', 'statya-2', 'апапапв', 'аваываываываыв', 3, 0, NULL, '2024-09-30 22:15:16', '2025-02-08 11:39:54'),
(3, 'статья 3', 'statya-3', 'аываыав', 'ыавыавыавыа', 1, 0, NULL, '2024-09-30 22:17:35', '2024-09-30 22:17:35'),
(4, 'Статья 4', 'statya-4', 'екуек', 'купкпкупкуп', 4, 0, 'images/2024-10-07/UX2h7M00cGrwPmUx5opge5mV72JPlTIjpwUNmuVv.jpg', '2024-10-07 15:11:55', '2024-10-07 15:11:55'),
(5, 'статья 5', 'statya-5', 'впапва', 'пвпваапвпв', 3, 1, 'images/2024-10-07/RKiaTkm25F1EJMhZpKVDLyDPPZVnZ71fzXBKDHNQ.jpg', '2024-10-07 15:43:30', '2025-02-08 10:51:49'),
(7, '2024', '2024', '15616551', '665161', 1, 0, 'images/2024-10-30/LydLdrGSmn7huRibu0K4VfNbpHqnWkrgi8cTCrx8.png', '2024-10-30 20:00:12', '2024-10-30 20:00:12'),
(8, 'рпарпа', 'rparpa', 'папаап', 'тпаат', 1, 0, NULL, '2024-10-30 20:06:38', '2024-10-30 20:06:38'),
(9, '2025', '2025', '2025', '2025', 1, 0, 'images/2024-10-30/3K3fjQuMKmFrVgAfGBOnHnF0vGAWjWYIbBY5uxsP.png', '2024-10-30 20:12:05', '2024-10-30 20:12:05'),
(10, '2026', '2026', '2026', '2026', 1, 0, 'images/2024-10-30/WttdU8nujsJ6wZ2o9qsNwTnNk0u4oe5IZCixH6Pn.png', '2024-10-30 20:15:05', '2024-10-30 20:15:05'),
(11, 'Вика', '2026-2', 'In lobortis pharetra mattis. Morbi nec nibh iaculis,', 'Контент', 1, 10, 'images/2024-10-30/2QNkvpVqOjLQGtBlJYhpzVj2ErOqQdfRImrSBEA9.png', '2024-10-30 20:17:31', '2025-02-08 10:47:26'),
(12, 'The golden rules you need to know for a positive life', 'the-golden-rules-you-need-to-know-for-a-positive-life', 'In lobortis pharetra mattis. Morbi nec nibh iaculis, bibendum augue a, ultrices nulla. Nunc velit ante, lacinia id tincidunt eget, faucibus nec nisl. In mauris purus, bibendum et gravida dignissim, venenatis commodo lacus. Duis consectetur quis nisi nec accumsan. Pellentesque enim velit, ut tempor turpis. Mauris felis neque, egestas in lobortis et,iaculis at nunc ac, rhoncus sagittis ipsum.', 'Maecenas non convallis quam, eu sodales justo. Pellentesque quis lectus elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 10, 1, 'images/2025-01-11/irKEZKpkpx5jpT86cy5NNChHMj5kLOe5Tja0jjji.png', '2025-01-11 19:57:39', '2025-02-08 10:51:27');

-- --------------------------------------------------------

--
-- Структура таблицы `post_tag`
--

CREATE TABLE `post_tag` (
  `id` int UNSIGNED NOT NULL,
  `tag_id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post_tag`
--

INSERT INTO `post_tag` (`id`, `tag_id`, `post_id`, `created_at`, `updated_at`) VALUES
(2, 5, 3, '2024-09-30 22:17:35', '2024-09-30 22:17:35'),
(3, 18, 3, '2024-09-30 22:17:35', '2024-09-30 22:17:35'),
(5, 5, 4, '2024-10-07 15:11:55', '2024-10-07 15:11:55'),
(6, 5, 5, '2024-10-07 15:43:30', '2024-10-07 15:43:30'),
(7, 5, 7, '2024-10-30 20:00:12', '2024-10-30 20:00:12'),
(8, 6, 7, '2024-10-30 20:00:12', '2024-10-30 20:00:12'),
(9, 6, 10, '2024-10-30 20:15:06', '2024-10-30 20:15:06'),
(10, 54, 12, '2025-01-11 19:57:40', '2025-01-11 19:57:40'),
(11, 55, 11, '2025-01-16 09:53:03', '2025-01-16 09:53:03');

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(5, 'привет', 'privet-5', '2024-09-20 10:33:05', '2024-09-20 10:33:05'),
(6, 'привет', 'privet-6', '2024-09-20 10:34:03', '2024-09-20 10:34:03'),
(7, 'привет', 'privet-7', '2024-09-20 10:34:05', '2024-09-20 10:34:05'),
(8, 'привет', 'privet-8', '2024-09-20 10:34:06', '2024-09-20 10:34:06'),
(9, 'привет', 'privet-9', '2024-09-20 10:34:09', '2024-09-20 10:34:09'),
(10, 'привет', 'privet-10', '2024-09-20 10:34:10', '2024-09-20 10:34:10'),
(11, 'привет', 'privet-11', '2024-09-20 10:34:11', '2024-09-20 10:34:11'),
(12, 'привет', 'privet-12', '2024-09-20 10:34:51', '2024-09-20 10:34:51'),
(13, 'привет', 'privet-13', '2024-09-20 10:35:17', '2024-09-20 10:35:17'),
(14, 'привет', 'privet-14', '2024-09-20 10:47:42', '2024-09-20 10:47:42'),
(16, 'tag', 'tag-2', '2024-09-22 11:31:43', '2024-09-22 11:31:43'),
(17, 'привет', 'privet', '2024-09-22 11:35:23', '2024-09-22 11:35:23'),
(18, 'ку', 'ku', '2024-09-22 11:46:00', '2024-09-22 11:46:00'),
(19, 'привет', 'privet-15', '2024-09-22 12:22:32', '2024-09-22 12:22:32'),
(20, 'привет', 'privet-16', '2024-09-22 12:55:11', '2024-09-22 12:55:11'),
(21, 'привет', 'privet-17', '2024-09-30 21:58:33', '2024-09-30 21:58:33'),
(22, 'привет', 'privet-18', '2024-10-15 20:43:46', '2024-10-15 20:43:46'),
(23, 'привет', 'privet-19', '2024-10-15 20:44:35', '2024-10-15 20:44:35'),
(25, 'привет', 'privet-21', '2024-10-15 20:47:09', '2024-10-15 20:47:09'),
(26, 'привет', 'privet-22', '2024-10-15 20:54:59', '2024-10-15 20:54:59'),
(27, 'привет', 'privet-23', '2024-10-17 18:24:09', '2024-10-17 18:24:09'),
(28, 'привет', 'privet-24', '2024-10-17 19:01:51', '2024-10-17 19:01:51'),
(29, 'привет', 'privet-25', '2024-10-17 19:01:55', '2024-10-17 19:01:55'),
(30, 'привет', 'privet-26', '2024-10-17 19:02:01', '2024-10-17 19:02:01'),
(31, 'привет', 'privet-27', '2024-10-17 19:02:37', '2024-10-17 19:02:37'),
(32, 'привет', 'privet-28', '2024-10-17 19:06:58', '2024-10-17 19:06:58'),
(33, 'привет', 'privet-29', '2024-10-17 20:58:09', '2024-10-17 20:58:09'),
(34, 'привет', 'privet-30', '2024-10-17 20:58:34', '2024-10-17 20:58:34'),
(35, 'привет', 'privet-31', '2024-10-17 20:58:43', '2024-10-17 20:58:43'),
(36, 'привет', 'privet-32', '2024-10-17 20:58:44', '2024-10-17 20:58:44'),
(37, 'привет', 'privet-33', '2024-10-17 20:58:44', '2024-10-17 20:58:44'),
(38, 'привет', 'privet-34', '2024-10-17 20:58:45', '2024-10-17 20:58:45'),
(39, 'привет', 'privet-35', '2024-10-17 20:58:45', '2024-10-17 20:58:45'),
(40, 'привет', 'privet-36', '2024-10-30 19:08:08', '2024-10-30 19:08:08'),
(41, 'привет', 'privet-37', '2024-10-30 19:14:41', '2024-10-30 19:14:41'),
(42, 'привет', 'privet-38', '2024-10-30 19:19:01', '2024-10-30 19:19:01'),
(43, 'привет', 'privet-39', '2024-10-30 19:19:03', '2024-10-30 19:19:03'),
(44, 'привет', 'privet-40', '2024-10-30 19:19:24', '2024-10-30 19:19:24'),
(45, 'привет', 'privet-41', '2024-10-30 19:20:31', '2024-10-30 19:20:31'),
(46, 'привет', 'privet-42', '2025-01-05 17:33:52', '2025-01-05 17:33:52'),
(47, 'привет', 'privet-43', '2025-01-05 17:33:56', '2025-01-05 17:33:56'),
(48, 'привет', 'privet-44', '2025-01-05 17:33:57', '2025-01-05 17:33:57'),
(51, 'Marketing', 'marketing', '2025-01-11 19:56:03', '2025-01-11 19:56:03'),
(52, 'SEO', 'seo', '2025-01-11 19:56:07', '2025-01-11 19:56:07'),
(53, 'Digital Agency', 'digital-agency', '2025-01-11 19:56:19', '2025-01-11 19:56:19'),
(54, 'Blogging', 'blogging', '2025-01-11 19:56:25', '2025-01-11 19:56:25'),
(55, 'Video Tuts', 'video-tuts', '2025-01-11 19:56:30', '2025-01-11 19:56:30'),
(56, 'привет', 'privet-45', '2025-01-12 10:16:50', '2025-01-12 10:16:50'),
(57, 'привет', 'privet-46', '2025-01-16 09:52:48', '2025-01-16 09:52:48'),
(58, 'привет', 'privet-47', '2025-02-08 10:40:39', '2025-02-08 10:40:39'),
(59, 'привет', 'privet-48', '2025-02-08 11:01:58', '2025-02-08 11:01:58');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'uyuytu', 'd.liyrtryry013@yandex.ru', NULL, '$2y$12$JrDbVxik9JECsp0uliD6Oewaypehna2PqphmEwIjSPsPZlR/HchXi', NULL, '2024-10-15 20:16:42', '2024-10-15 20:16:42', 0),
(2, 'uyuytu', 'd.liytertert3@yandex.ru', NULL, '$2y$12$QXQ471WqW5N3k4xf/UYYFuEOD9/DMuSUNhPQZT1XYDAYOIaEAkf2W', NULL, '2024-10-15 20:17:24', '2024-10-15 20:17:24', 0),
(3, 'uyuytu', 'd.liyfsdfsdft3@yandex.ru', NULL, '$2y$12$rwBBlqeMzXI0luLzgbfp2OkA8Cmwb/J.d/SJrzU6asKNpdP0t6JGm', NULL, '2024-10-15 20:18:34', '2024-10-15 20:18:34', 0),
(4, 'uyuytu', 'd.lifdsfdsfs3@yandex.ru', NULL, '$2y$12$OcEjkkgwpESLFUM/3YXgweJzFbMwLNY4KcqCYs0ISEzTIkAzlTG3q', NULL, '2024-10-15 20:25:50', '2024-10-15 20:25:50', 0),
(5, 'admin', 'd.liffdsfsfss3@yandex.ru', NULL, '$2y$12$cpu1pCifqhX0sBkwCtN0bOqsRSu2uiR2TMbUE6no7vjoeqVznEgAC', NULL, '2024-10-15 20:26:05', '2024-10-15 20:26:05', 1),
(6, 'User', 'd.test2013@yandex.ru', NULL, '$2y$12$gkcA1PUjli3w6enB0CAeLeQi0cS3GNSpGSpVbb2/u3nAG2q9hPyjS', NULL, '2024-10-15 20:27:27', '2024-10-15 20:27:27', 0),
(7, 'test', 'd.testrttrtrr2013@yandex.ru', NULL, '$2y$12$1z6U9EOFlXUBkLokPEwZqOS3lhAsGr2CAuRL0vn63Pa5Vx3VNyUAi', NULL, '2025-02-09 13:41:48', '2025-02-09 13:41:48', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Индексы таблицы `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Индексы таблицы `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Индексы таблицы `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Индексы таблицы `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Индексы таблицы `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Индексы таблицы `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Индексы таблицы `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Индексы таблицы `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emails_email_unique` (`email`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_title_index` (`title`);

--
-- Индексы таблицы `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `emails`
--
ALTER TABLE `emails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
