-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 21, 2020 at 01:22 PM
-- Server version: 5.7.30-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `PO`
--

-- --------------------------------------------------------

--
-- Table structure for table `currency_types`
--

CREATE TABLE `currency_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currencyName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) DEFAULT NULL,
  `currencyAbbreviation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency_types`
--

INSERT INTO `currency_types` (`id`, `currencyName`, `currency`, `status`, `currencyAbbreviation`, `created_at`, `updated_at`) VALUES
(1, 'Gambian Dalasi', 'D', 0, 'GMD', '2020-07-09 13:44:55', '2020-07-09 13:44:55'),
(2, 'United Kingdom Pound Sterling', '£', 0, 'GBP', '2020-07-09 13:44:55', '2020-07-09 13:44:55'),
(3, 'United States Dollar', '$', 0, 'USD', '2020-07-09 13:44:55', '2020-07-09 13:44:55'),
(4, 'European Euro', '€', 0, 'EUR', '2020-07-09 13:44:55', '2020-07-09 13:44:55'),
(5, 'Canadian Dollar', '$', 0, 'CAD', '2020-07-09 13:44:55', '2020-07-09 13:44:55'),
(6, 'Chinese Yuan Renminbi', '¥', 0, 'CNY', '2020-07-09 13:44:55', '2020-07-09 13:44:55'),
(7, 'West African CFA', 'CFA', 0, 'XOF', '2020-07-09 13:44:55', '2020-07-09 13:44:55'),
(8, 'Nigerian Naira', '₦', 0, 'NGN', '2020-07-09 13:44:55', '2020-07-09 13:44:55');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2020-06-17 16:11:28', '2020-06-17 16:11:28'),
(2, 'Customer Care', '2020-06-28 13:11:30', '2020-06-28 13:11:30'),
(3, 'Finance', '2020-07-01 11:08:25', '2020-07-01 11:08:25'),
(4, 'Marketing', '2020-07-03 13:08:10', '2020-07-06 17:23:35'),
(5, 'Projects', '2020-07-03 13:08:10', '2020-07-07 04:11:13'),
(6, 'Sales', '2020-07-03 13:08:10', '2020-07-03 13:08:10'),
(7, 'IT and Billing', '2020-07-03 13:08:10', '2020-07-03 13:08:10'),
(8, 'Technical', '2020-07-03 13:08:10', '2020-07-03 13:08:10');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discountAmount` decimal(12,2) NOT NULL,
  `requisitionId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `discountAmount`, `requisitionId`, `created_at`, `updated_at`) VALUES
(1, '23.00', 59, '2020-07-10 10:58:47', '2020-07-10 10:58:47'),
(2, '324.00', 60, '2020-07-10 11:02:15', '2020-07-10 11:02:15'),
(3, '500.00', 61, '2020-07-10 12:14:53', '2020-07-10 12:14:53'),
(4, '200.00', 62, '2020-07-13 15:02:06', '2020-07-13 15:02:06'),
(5, '5000.00', 67, '2020-07-14 08:32:07', '2020-07-14 08:32:07'),
(6, '43.00', 68, '2020-07-15 11:35:27', '2020-07-15 11:35:27'),
(7, '23.00', 69, '2020-07-16 13:10:29', '2020-07-16 13:10:29'),
(8, '200.00', 72, '2020-07-17 10:29:48', '2020-07-17 10:29:48');

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `g_r_n_s`
--

CREATE TABLE `g_r_n_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `grnNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poId` bigint(20) UNSIGNED DEFAULT NULL,
  `supplierId` bigint(20) UNSIGNED DEFAULT NULL,
  `reqId` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `h_o_d_s`
--

CREATE TABLE `h_o_d_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departmentId` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `h_o_d_s`
--

INSERT INTO `h_o_d_s` (`id`, `name`, `departmentId`, `created_at`, `updated_at`) VALUES
(1, 'Oumie Ceesay', 1, '2020-06-17 16:27:36', '2020-06-17 16:27:36'),
(2, 'Anam Jah Jobe', 2, '2020-06-26 09:39:19', '2020-06-26 09:39:19'),
(3, 'Nyan Bhatt', 3, '2020-07-01 11:09:12', '2020-07-01 11:09:12'),
(4, 'Amie Ceesay', 4, '2020-07-03 13:28:16', '2020-07-03 13:28:16'),
(5, 'Nene Jah', 5, '2020-07-03 13:28:16', '2020-07-03 13:28:16'),
(6, 'Augustine Jatta', 6, '2020-07-03 14:31:37', '2020-07-03 14:31:37'),
(7, 'Lamin Yaffa', 7, '2020-07-03 14:31:37', '2020-07-03 14:31:37'),
(8, 'Ahamat Jah', 8, '2020-07-03 14:31:37', '2020-07-03 14:31:37');

-- --------------------------------------------------------

--
-- Table structure for table `justify_reason_requisions`
--

CREATE TABLE `justify_reason_requisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `officerId` int(11) NOT NULL,
  `Product_Id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `actionBy` int(2) NOT NULL,
  `userId` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `justify_reason_requisions`
--

INSERT INTO `justify_reason_requisions` (`id`, `reason`, `officerId`, `Product_Id`, `created_at`, `updated_at`, `actionBy`, `userId`) VALUES
(1, 'Sorry I cannot as you hod approve request that are of no interest to the progress of the company. Hope you understand this. Thank you. ', 5, 2, '2020-07-21 12:01:33', '2020-07-21 12:01:33', 1, 8),
(2, 'NO. WE cannot proceed With this requisition in this institution. Thank you.', 7, 1, '2020-07-21 12:15:49', '2020-07-21 12:15:49', 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `justify_rejections`
--

CREATE TABLE `justify_rejections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `officerId` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `actionBy` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `justify_rejections`
--

INSERT INTO `justify_rejections` (`id`, `reason`, `officerId`, `product_id`, `created_at`, `updated_at`, `actionBy`) VALUES
(1, 'Sorry I cannot Approve this request. The Quantity requested is out of stock. Thank you...', 5, 1, '2020-07-21 11:56:47', '2020-07-21 11:56:47', 1),
(2, 'I am not accepting this Request. Thank you!', 5, 4, '2020-07-21 12:00:02', '2020-07-21 12:00:02', 1),
(3, 'Sorry Due to Covid19 Pandemic, This product is out of stock...', 7, 2, '2020-07-21 12:13:15', '2020-07-21 12:13:15', 2),
(4, 'I just don\'t want to proceed with this. Period. ', 4, 6, '2020-07-21 12:18:56', '2020-07-21 12:18:56', 1);

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
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_06_16_162141_create_suppliers_table', 2),
(4, '2020_06_16_162231_create_departments_table', 3),
(5, '2020_06_16_162214_create_h_o_d_s_table', 4),
(6, '2020_06_16_162107_create_officer_requicisions_table', 5),
(7, '2020_06_16_162252_create_requisition_orders_table', 6),
(8, '2020_06_16_162158_create_product_orders_table', 7),
(9, '2020_06_16_162001_create_p_o_s_table', 8),
(10, '2020_06_17_123105_create_g_r_n_s_table', 9),
(11, '2020_06_30_084228_create_pending_requests_table', 10),
(12, '2020_06_30_084444_create_pending_requisition_requests_table', 10),
(15, '2020_07_09_120216_create_currency_types_table', 11),
(16, '2020_07_10_093448_create_discounts_table', 12),
(17, '2020_07_16_143015_create_sub_deps_table', 13),
(18, '2020_07_20_084342_create_justify_rejections_table', 14),
(19, '2020_07_20_164849_create_justify_reason_requisions_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `officer_requicisions`
--

CREATE TABLE `officer_requicisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departmentId` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subDep` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `officer_requicisions`
--

INSERT INTO `officer_requicisions` (`id`, `name`, `departmentId`, `created_at`, `updated_at`, `subDep`) VALUES
(2, 'Lamin O. Touray', 1, '2020-06-17 16:21:56', '2020-06-17 16:21:56', 7),
(3, 'Sulayman Jawneh', 1, '2020-06-25 10:03:17', '2020-06-25 10:03:17', 1),
(4, 'Kebba Foon', 1, '2020-06-26 09:39:19', '2020-06-26 09:39:19', 1),
(5, 'Ahmat Jah', 8, '2020-07-01 11:09:12', '2020-07-01 11:09:12', 1),
(6, 'Lamin O Touray', 1, '2020-07-01 11:21:23', '2020-07-01 11:21:23', 8),
(7, 'Lamin O Touray', 3, '2020-07-01 11:23:35', '2020-07-01 11:23:35', 1),
(8, 'User123', 8, '2020-07-14 07:48:12', '2020-07-14 07:48:12', 2),
(9, 'Buba Sabally', 1, '2020-07-17 11:14:33', '2020-07-17 11:14:33', 9);

-- --------------------------------------------------------

--
-- Table structure for table `pending_requests`
--

CREATE TABLE `pending_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `productName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `productDescription` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `productQuantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `requisitionId` int(11) DEFAULT NULL,
  `hrApprovedStatus` int(2) NOT NULL,
  `hodApproveStatus` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pending_requests`
--

INSERT INTO `pending_requests` (`id`, `productName`, `productDescription`, `productQuantity`, `created_at`, `updated_at`, `requisitionId`, `hrApprovedStatus`, `hodApproveStatus`) VALUES
(1, '100A 1Phase + N Fase Cut Out', '100A 1Phase + N Fase Cut Out', 12, '2020-07-21 11:31:50', '2020-07-21 11:56:47', 1, 0, 0),
(2, '10 KVA Stabilizer', '10 KVA Stabilizer', 2, '2020-07-21 11:31:50', '2020-07-21 12:13:15', 1, 0, 1),
(3, '240w Solar Panel Large', '240w Solar Panel Large', 3, '2020-07-21 11:31:50', '2020-07-21 11:31:50', 1, 1, 1),
(4, 'Mobile Phone', 'For Personal Use', 23, '2020-07-21 11:59:19', '2020-07-21 12:00:02', 2, 0, 0),
(5, '100A Double Pole Breaker', '100A Double Pole Breaker', 2, '2020-07-21 12:17:47', '2020-07-21 12:17:47', 3, 1, 1),
(6, '16 mm² Black Single Core Rigid PVC Insulated Cable', '16 mm² Black Single Core Rigid PVC Insulated Cable', 3, '2020-07-21 12:17:47', '2020-07-21 12:18:56', 3, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pending_requisition_requests`
--

CREATE TABLE `pending_requisition_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hod_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dep_id` bigint(20) UNSIGNED DEFAULT NULL,
  `officer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reqDate` datetime NOT NULL,
  `purpose` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hodApproved` int(11) NOT NULL,
  `hrApproved` int(11) NOT NULL,
  `delivered` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pending_requisition_requests`
--

INSERT INTO `pending_requisition_requests` (`id`, `hod_id`, `dep_id`, `officer_id`, `reqDate`, `purpose`, `hodApproved`, `hrApproved`, `delivered`, `created_at`, `updated_at`) VALUES
(1, 8, 8, 8, '2020-07-21 11:31:50', 'This is urgently needed please...', 1, -1, 0, '2020-07-21 11:31:50', '2020-07-21 12:15:49'),
(2, 8, 8, 8, '2020-07-21 11:59:19', 'TEst ppp', -1, -1, 0, '2020-07-21 11:59:19', '2020-07-21 12:01:33'),
(3, 1, 1, 2, '2020-07-21 12:17:47', 'This is a test Purpose', 1, 1, 0, '2020-07-21 12:17:47', '2020-07-21 12:20:40'),
(4, 1, 1, 2, '2020-07-21 13:01:03', 'sas', 0, 0, 0, '2020-07-21 13:01:03', '2020-07-21 13:01:03');

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE `product_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` decimal(7,2) NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `requisitionId` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_orders`
--

INSERT INTO `product_orders` (`id`, `quantity`, `description`, `unit_price`, `total_price`, `requisitionId`, `created_at`, `updated_at`) VALUES
(1, 2, 'APC Ups Battery', '7400.23', '14800.46', 13, '2020-06-18 09:00:13', '2020-06-18 09:00:13'),
(2, 1, 'Dell Keyboard', '700.23', '1400.46', 13, '2020-06-18 09:00:13', '2020-06-18 09:00:13'),
(3, 2, 'Keyboard', '200.00', '400.00', 15, '2020-06-18 15:12:22', '2020-06-18 15:12:22'),
(4, 4, 'Mouse', '500.00', '2000.00', 15, '2020-06-18 15:12:22', '2020-06-18 15:12:22'),
(5, 64, 'HDMI Cables', '400.00', '25600.00', 15, '2020-06-18 15:12:22', '2020-06-18 15:12:22'),
(6, 2, 'Keyboard', '200.00', '400.00', 16, '2020-06-18 15:13:47', '2020-06-18 15:13:47'),
(7, 4, 'Mouse', '500.00', '2000.00', 16, '2020-06-18 15:13:47', '2020-06-18 15:13:47'),
(8, 64, 'HDMI Cables', '400.00', '25600.00', 16, '2020-06-18 15:13:47', '2020-06-18 15:13:47'),
(9, 2, 'test', '5.00', '10.00', 17, '2020-06-18 15:15:35', '2020-06-18 15:15:35'),
(10, 12, 'dfsd', '0.50', '6.00', 17, '2020-06-18 15:15:35', '2020-06-18 15:15:35'),
(11, 33, 'sdfs', '15.00', '495.00', 17, '2020-06-18 15:15:35', '2020-06-18 15:15:35'),
(12, 2, 'Test Description', '200.00', '400.00', 19, '2020-06-22 09:15:14', '2020-06-22 09:15:14'),
(13, 5, 'Test Description 2', '100.00', '500.00', 19, '2020-06-22 09:15:14', '2020-06-22 09:15:14'),
(14, 12, 'Title Description', '233.00', '2796.00', 20, '2020-06-22 16:07:05', '2020-06-22 16:07:05'),
(15, 12, 'Title Description', '233.00', '2796.00', 21, '2020-06-22 16:09:44', '2020-06-22 16:09:44'),
(16, 12, 'Title Description', '233.00', '2796.00', 22, '2020-06-22 16:10:01', '2020-06-22 16:10:01'),
(17, 12, 'Title Description', '233.00', '2796.00', 23, '2020-06-22 16:10:32', '2020-06-22 16:10:32'),
(18, 12, 'Title Description', '233.00', '2796.00', 25, '2020-06-22 16:15:18', '2020-06-22 16:15:18'),
(19, 1, 'sdfsdfsd', '400.00', '400.00', 25, '2020-06-25 16:15:27', '2020-06-25 16:15:27'),
(20, 3, 'TEst Description sdfsdfwe SWAT', '200.00', '600.00', 26, '2020-06-25 17:06:29', '2020-06-25 17:06:29'),
(26, 43, 'Black Qwerty', '2.00', '86.00', 32, '2020-06-01 09:29:05', '2020-07-01 09:29:05'),
(27, 1, 'sdfsd', '3.00', '3.00', 32, '2020-06-01 09:29:05', '2020-07-01 09:29:05'),
(28, 2, 'Desc', '2.00', '4.00', 34, '2020-06-01 11:54:32', '2020-07-01 11:54:32'),
(29, 233, 'sdfsd', '2.00', '466.00', 33, '2020-06-01 11:54:32', '2020-07-01 11:54:32'),
(30, 12, 'for Tutorials..', '23.00', '276.00', 39, '2020-06-01 16:30:34', '2020-07-01 16:30:34'),
(31, 1, 'Qwerty Keyboard ...', '2.00', '2.00', 40, '2020-07-01 16:56:49', '2020-07-01 16:56:49'),
(32, 2, 'Test Projector Description', '44.00', '88.00', 41, '2020-07-01 17:20:26', '2020-07-01 17:20:26'),
(33, 2, 'Highlighting the important Key Sections', '1000.00', '2000.00', 41, '2020-07-01 17:20:26', '2020-07-01 17:20:26'),
(34, 5, 'tEstdfs sdfsdf product name', '12.00', '60.00', 42, '2020-07-01 17:25:46', '2020-07-01 17:25:46'),
(35, 4, '15inch', '355.00', '1420.00', 42, '2020-07-01 17:25:46', '2020-07-01 17:25:46'),
(36, 1, 'fsdf', '3.00', '3.00', 43, '2020-07-06 15:47:55', '2020-07-06 15:47:55'),
(37, 1, 'sdsd', '250.00', '250.00', 44, '2020-07-07 05:00:12', '2020-07-07 05:00:12'),
(38, 12, 'for Tutorials..', '3000.00', '36000.00', 45, '2020-07-07 08:24:11', '2020-07-07 08:24:11'),
(39, 2, 'sdfs', '333.00', '666.00', 46, '2020-07-07 08:35:46', '2020-07-07 08:35:46'),
(40, 12, 'Test Description Customer CAre', '45.00', '540.00', 47, '2020-07-07 08:58:14', '2020-07-07 08:58:14'),
(41, 2, 'Test Description Customer CAre2', '30.00', '60.00', 47, '2020-07-07 08:58:14', '2020-07-07 08:58:14'),
(42, 33, 'gyy', '500.00', '16500.00', 48, '2020-07-07 09:20:35', '2020-07-07 09:20:35'),
(43, 45, 'fff', '35.00', '1575.00', 48, '2020-07-07 09:20:35', '2020-07-07 09:20:35'),
(44, 33, 'gyy', '500.00', '16500.00', 49, '2020-07-07 09:21:31', '2020-07-07 09:21:31'),
(45, 45, 'fff', '35.00', '1575.00', 49, '2020-07-07 09:21:31', '2020-07-07 09:21:31'),
(46, 33, 'gfgre', '42.00', '1386.00', 49, '2020-07-07 09:21:31', '2020-07-07 09:21:31'),
(47, 12, 'sdfsd', '5.00', '60.00', 50, '2020-07-07 09:32:21', '2020-07-07 09:32:21'),
(48, 1, 'Qwerty Keyboard ...', '6.00', '6.00', 51, '2020-07-07 09:55:03', '2020-07-07 09:55:03'),
(49, 23, 'sfsdfsef', '3.00', '69.00', 52, '2020-07-07 10:00:41', '2020-07-07 10:00:41'),
(50, 12, 'sdfsdf', '3.00', '36.00', 52, '2020-07-07 10:00:41', '2020-07-07 10:00:41'),
(51, 222, 'dtttt', '212.00', '47064.00', 56, '2020-07-08 13:38:46', '2020-07-08 13:38:46'),
(52, 222, 'dtttt', '1029.00', '228438.00', 58, '2020-07-08 13:41:59', '2020-07-08 13:41:59'),
(53, 12, 'sdfwwe', '12.00', '144.00', 59, '2020-07-10 10:58:47', '2020-07-10 10:58:47'),
(54, 21, 'ytyuty', '32.00', '672.00', 59, '2020-07-10 10:58:47', '2020-07-10 10:58:47'),
(55, 12, 'sdfwwe', '32.00', '384.00', 60, '2020-07-10 11:02:15', '2020-07-10 11:02:15'),
(56, 21, 'ytyuty', '12.00', '252.00', 60, '2020-07-10 11:02:15', '2020-07-10 11:02:15'),
(57, 12, 'sdfwwe', '100.00', '1200.00', 61, '2020-07-10 12:14:53', '2020-07-10 12:14:53'),
(58, 21, 'ytyuty', '300.00', '6300.00', 61, '2020-07-10 12:14:53', '2020-07-10 12:14:53'),
(59, 4, 'TEst Description', '200.00', '800.00', 62, '2020-07-13 15:02:06', '2020-07-13 15:02:06'),
(60, 5, 'sdfsdfwe', '1000.00', '5000.00', 62, '2020-07-13 15:02:06', '2020-07-13 15:02:06'),
(61, 43, 'Projecor Clips', '100.00', '4300.00', 63, '2020-07-13 16:42:55', '2020-07-13 16:42:55'),
(62, 5, 'Simcards for Demo...', '500.00', '2500.00', 63, '2020-07-13 16:42:55', '2020-07-13 16:42:55'),
(63, 2, 'Qwerty Keyboard White...', '1000.00', '2000.00', 64, '2020-07-14 08:20:36', '2020-07-14 08:20:36'),
(64, 2, 'Qwerty Keyboard White...', '6000.00', '12000.00', 65, '2020-07-14 08:26:40', '2020-07-14 08:26:40'),
(65, 2, 'awerr', '34.00', '68.00', 66, '2020-07-14 08:27:42', '2020-07-14 08:27:42'),
(66, 123, 'cxzds', '90.00', '11070.00', 66, '2020-07-14 08:27:42', '2020-07-14 08:27:42'),
(67, 134, 'Test Description 1', '90.00', '12060.00', 67, '2020-07-14 08:32:07', '2020-07-14 08:32:07'),
(68, 5, 'Test Description 2', '25000.00', '125000.00', 67, '2020-07-14 08:32:07', '2020-07-14 08:32:07'),
(69, 2, 'dssdf', '456.00', '912.00', 68, '2020-07-15 11:35:27', '2020-07-15 11:35:27'),
(70, 1, '100A Bushbar Chamber', '3.00', '3.00', 69, '2020-07-16 13:10:29', '2020-07-16 13:10:29'),
(71, 12, '2.5mm2 Three Core PVC Sheathed PVC Insulated Flexible Cable', '4.00', '48.00', 69, '2020-07-16 13:10:29', '2020-07-16 13:10:29'),
(72, 34, 'Active Cooling Optical Module,null,null,null,dkba0.485.2365,WD2XTEC05000SP', '5.00', '170.00', 69, '2020-07-16 13:10:29', '2020-07-16 13:10:29'),
(73, 3, 'dsdfsdf', '23.00', '69.00', 69, '2020-07-16 13:10:29', '2020-07-16 13:10:29'),
(74, 2, '1 Black Imaging Drum, 1 Cyan Imaging Drum, 1 Yellow Imaging Drum, and  1 Magenta Imaging Drum.', '23.00', '46.00', 70, '2020-07-16 13:23:30', '2020-07-16 13:23:30'),
(75, 12, '100A 1Phase + N Fase Cut Out', '4.00', '48.00', 70, '2020-07-16 13:23:30', '2020-07-16 13:23:30'),
(76, 3, '100A Fuse Cut Out', '23.00', '69.00', 71, '2020-07-16 16:33:51', '2020-07-16 16:33:51'),
(77, 23, '10A Legrand Fuse; 10mm x 38mm', '34.00', '782.00', 71, '2020-07-16 16:33:51', '2020-07-16 16:33:51'),
(78, 3, 'Test Description 123', '400.00', '1200.00', 72, '2020-07-17 10:29:48', '2020-07-17 10:29:48'),
(79, 23, '1 Black Imaging Drum, 1 Cyan Imaging Drum, 1 Yellow Imaging Drum, and  1 Magenta Imaging Drum.', '70.00', '1610.00', 72, '2020-07-17 10:29:48', '2020-07-17 10:29:48'),
(80, 2, '100A Double Pole Breaker', '34.00', '68.00', 73, '2020-07-21 12:20:40', '2020-07-21 12:20:40'),
(81, 23, '1 Black Imaging Drum, 1 Cyan Imaging Drum, 1 Yellow Imaging Drum, and  1 Magenta Imaging Drum.', '5.00', '115.00', 75, '2020-07-21 13:20:18', '2020-07-21 13:20:18');

-- --------------------------------------------------------

--
-- Table structure for table `p_o_s`
--

CREATE TABLE `p_o_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `poNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplierId` bigint(20) UNSIGNED DEFAULT NULL,
  `reqOrderId` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `p_o_s`
--

INSERT INTO `p_o_s` (`id`, `poNumber`, `poDate`, `supplierId`, `reqOrderId`, `created_at`, `updated_at`) VALUES
(2, 'QC2020/0001', '2020-06-18 15:12:22', 1, 15, '2020-06-18 15:12:22', '2020-06-18 15:12:22'),
(3, 'QC2020/0002', '2020-06-18 15:13:47', 1, 16, '2020-06-18 15:13:47', '2020-06-18 15:13:47'),
(4, 'QC2020/0003', '2020-06-18 15:15:35', 1, 17, '2020-06-18 15:15:35', '2020-06-18 15:15:35'),
(5, 'QC2020/0004', '2020-06-22 08:48:44', 1, 18, '2020-06-22 08:48:44', '2020-06-22 08:48:44'),
(6, 'QC2020/0005', '2020-06-22 09:15:14', 1, 19, '2020-06-22 09:15:14', '2020-06-22 09:15:14'),
(7, 'QC2020/0006', '2020-06-22 16:07:05', 1, 20, '2020-06-22 16:07:05', '2020-06-22 16:07:05'),
(8, 'QC2020/0007', '2020-06-22 16:09:44', 1, 21, '2020-06-22 16:09:44', '2020-06-22 16:09:44'),
(9, 'QC2020/0008', '2020-06-22 16:10:01', 1, 22, '2020-06-22 16:10:01', '2020-06-22 16:10:01'),
(10, 'QC2020/0009', '2020-06-22 16:10:32', 1, 23, '2020-06-22 16:10:32', '2020-06-22 16:10:32'),
(11, 'QC2020/0010', '2020-06-22 16:15:18', 1, 24, '2020-06-22 16:15:18', '2020-06-22 16:15:18'),
(12, 'QC2020/0011', '2020-06-29 16:18:12', 1, 13, '2020-06-29 16:18:12', '2020-06-29 16:18:12'),
(16, 'QC2020/0012', '2020-07-01 09:29:05', 1, 32, '2020-06-30 09:29:05', '2020-06-30 09:29:05'),
(17, 'QC2020/0013', '2020-07-01 11:54:32', 1, 33, '2020-07-01 11:54:32', '2020-07-01 11:54:32');

-- --------------------------------------------------------

--
-- Table structure for table `requisition_orders`
--

CREATE TABLE `requisition_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reqNo` varchar(111) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hod_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dep_id` bigint(20) UNSIGNED DEFAULT NULL,
  `officer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reqDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `purpose` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hodApproved` int(11) NOT NULL,
  `hrApproved` int(11) NOT NULL,
  `delivered` int(11) NOT NULL,
  `poStatus` int(2) NOT NULL,
  `supplier` int(5) NOT NULL,
  `poNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplierId` bigint(20) NOT NULL,
  `vatApplicable` int(1) NOT NULL,
  `currencyId` int(2) NOT NULL,
  `discountApplicable` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requisition_orders`
--

INSERT INTO `requisition_orders` (`id`, `reqNo`, `hod_id`, `dep_id`, `officer_id`, `reqDate`, `purpose`, `created_at`, `updated_at`, `hodApproved`, `hrApproved`, `delivered`, `poStatus`, `supplier`, `poNumber`, `supplierId`, `vatApplicable`, `currencyId`, `discountApplicable`) VALUES
(12, '0000006482', 1, 1, 2, '2020-06-18 08:57:58', 'Test Purpose...', '2020-06-01 16:30:34', '2020-06-18 08:54:02', 1, 0, 0, 0, 0, ' ', 0, 0, 1, 0),
(13, '0000006481', 1, 1, 2, '2020-06-17 23:44:20', 'Test Purpose.....', '2020-06-01 16:30:34', '2020-06-29 16:18:12', 1, 0, 0, 0, 0, ' ', 0, 0, 1, 0),
(14, '0000006480', 1, 1, 2, '2020-06-17 23:44:20', 'Test Purpose.....', '2020-06-01 16:30:34', '2020-06-28 02:42:14', 1, 0, 0, 1, 1, 'QC2020/0022', 0, 0, 1, 0),
(15, '0000006479', 1, 1, 2, '2020-06-17 23:44:20', 'Test Purpose.....', '2020-06-01 16:30:34', '2020-06-28 02:54:58', -1, 0, 0, 0, 0, 'QC2020/0013', 0, 0, 1, 0),
(16, '0000006478', 1, 1, 2, '2020-06-17 23:44:20', 'Test Purpose.....', '2020-06-01 16:30:34', '2020-06-28 02:55:01', -1, 0, 0, 1, 1, 'QC2020/0012', 0, 0, 1, 0),
(17, '0000006477', 1, 1, 2, '2020-06-17 23:44:20', 'Test Purpose.....', '2020-06-01 16:30:34', '2020-06-28 02:55:03', -1, 0, 0, 0, 0, 'QC2020/0011', 0, 0, 1, 0),
(18, '0000006489', 1, 1, 2, '2020-06-17 23:44:20', 'sdsds', '2020-06-01 16:30:34', '2020-06-28 02:27:21', -1, 0, 0, 1, 1, 'QC2020/0010', 0, 0, 1, 0),
(19, '0000006488', 1, 1, 2, '2020-06-22 09:15:14', 'Test Purpose', '2020-06-01 16:30:34', '2020-06-28 02:27:24', -1, 0, 0, 0, 0, '', 0, 0, 1, 0),
(20, '0000006487', 1, 1, 2, '2020-06-22 16:07:05', 'Testdfsdf dfwerw', '2020-06-01 16:30:34', '2020-06-28 02:55:05', -1, 0, 0, 1, 1, 'QC2020/0009', 0, 0, 1, 0),
(21, '0000006486', 1, 1, 2, '2020-06-22 16:09:44', 'Testdfsdf dfwerw', '2020-06-01 16:30:34', '2020-06-28 02:55:07', -1, 0, 0, 0, 0, '', 0, 0, 1, 0),
(22, '0000006485', 1, 1, 2, '2020-06-22 16:10:01', 'Testdfsdf dfwerw', '2020-06-01 16:30:34', '2020-06-28 02:55:09', -1, 0, 0, 0, 0, 'QC2020/0008', 0, 0, 1, 0),
(23, '0000006484', 1, 1, 2, '2020-06-22 16:10:32', 'Testdfsdf dfwerw', '2020-06-01 16:30:34', '2020-06-28 02:55:11', -1, 0, 0, 0, 0, '', 0, 0, 1, 0),
(24, '0000006483', 1, 1, 2, '2020-06-22 16:15:18', 'Testdfsdf dfwerw', '2020-06-01 16:30:34', '2020-06-29 15:35:22', 0, 1, 0, 1, 1, 'QC2020/0007', 0, 0, 1, 0),
(25, '0', 1, 1, 3, '2020-06-25 16:15:27', 'A Consignment To process', '2020-06-01 16:30:34', '2020-06-29 15:54:08', 1, -1, 0, 0, 0, '', 0, 0, 1, 0),
(26, '0', 1, 1, 3, '2020-06-25 17:06:29', 'LOT PURPOSE...', '2020-06-01 16:30:34', '2020-06-28 02:25:26', -1, 0, 0, 1, 1, 'QC2020/0006', 0, 0, 1, 0),
(32, '0', 2, 1, 2, '2020-07-01 09:29:05', 'Tsdfsd sdfewer', '2020-06-01 16:30:34', '2020-07-01 09:29:05', 1, 1, 0, 0, 0, 'QC2020/0005', 0, 0, 1, 0),
(33, '0', 2, 1, 2, '2020-07-01 11:54:32', 'Test Purpose...', '2020-06-01 16:30:34', '2020-07-01 11:54:32', 1, 1, 0, 1, 1, 'QC2020/0004', 0, 0, 1, 0),
(34, '0', 2, 1, 4, '2020-07-01 16:11:44', 'dfsdf', '2020-06-01 16:30:34', '2020-07-01 16:11:44', 1, 1, 0, 1, 1, 'QC2020/0014', 1, 0, 1, 0),
(35, '0', 2, 1, 2, '2020-07-01 16:19:52', 'Test Purpose Test Purpose...', '2020-06-01 16:30:34', '2020-07-01 16:19:52', 1, 1, 0, 1, 1, 'QC2020/0015', 1, 0, 1, 0),
(36, '0', 2, 1, 2, '2020-07-01 16:24:56', 'Test Purpose Test Purpose...', '2020-06-01 16:30:34', '2020-07-01 16:24:56', 1, 1, 0, 1, 1, 'QC2020/0016', 1, 0, 1, 0),
(37, '0', 2, 1, 2, '2020-07-01 16:26:07', 'Test Purpose Test Purpose...', '2020-06-01 16:30:34', '2020-07-01 16:26:07', 1, 1, 0, 1, 1, 'QC2020/0017', 1, 0, 1, 0),
(38, '0', 2, 1, 2, '2020-07-01 16:30:14', 'Test Purpose Test Purpose...', '2020-06-01 16:30:34', '2020-07-01 16:30:14', 1, 1, 0, 1, 1, 'QC2020/0018', 1, 0, 1, 0),
(39, '0', 2, 1, 2, '2020-07-01 16:30:34', 'Test Purpose Test Purpose...', '2020-06-01 16:30:34', '2020-07-01 16:30:34', 1, 1, 0, 1, 1, 'QC2020/0019', 1, 0, 1, 0),
(40, '0', 2, 1, 2, '2020-07-01 16:56:49', 'To Some Practical', '2020-07-01 16:56:49', '2020-07-01 16:56:49', 1, 1, 0, 1, 1, 'QC2020/0020', 1, 0, 1, 0),
(41, '0', 2, 1, 2, '2020-07-01 17:20:26', 'Qmoney Plugin Tutorials', '2020-07-01 17:20:26', '2020-07-01 17:20:26', 1, 1, 0, 1, 1, 'QC2020/0021', 1, 0, 1, 0),
(42, '0', 2, 1, 2, '2020-07-01 17:25:46', 'TESTug 123', '2020-07-01 17:25:46', '2020-07-01 17:25:46', 1, 1, 0, 1, 1, 'QC2020/0022', 1, 0, 1, 0),
(43, '0', 8, 8, 2, '2020-07-06 15:47:55', 'dfsdfs', '2020-07-06 15:47:55', '2020-07-06 15:47:55', 1, 1, 0, 1, 1, 'QC2020/0023', 1, 0, 1, 0),
(44, '0', 1, 1, 2, '2020-07-07 05:00:12', '123abc', '2020-07-07 05:00:12', '2020-07-07 05:00:12', 1, 1, 0, 1, 1, 'QC2020/0024', 1, 0, 1, 0),
(45, '0', 2, 1, 2, '2020-07-07 08:24:11', 'Test Purpose Test Purpose...', '2020-07-07 08:24:11', '2020-07-07 08:24:11', 1, 1, 0, 1, 2, 'QC2020/0025', 1, 0, 1, 0),
(46, '0', 2, 1, 4, '2020-07-07 08:35:46', 'dfsdf', '2020-07-07 08:35:46', '2020-07-07 08:35:46', 1, 1, 0, 1, 2, 'QC2020/0026', 2, 0, 1, 0),
(47, '0', 2, 2, 3, '2020-07-07 08:58:14', 'Test Purpose Customer Care', '2020-07-07 08:58:14', '2020-07-07 08:58:14', 1, 1, 0, 1, 2, 'QC2020/0027', 1, 0, 1, 0),
(48, '0', 1, 1, 2, '2020-07-07 09:20:35', 'tttttttttttttt', '2020-07-07 09:20:35', '2020-07-07 09:20:35', 1, 1, 0, 1, 2, 'QC2020/0028', 2, 0, 1, 0),
(49, '0', 1, 1, 2, '2020-07-07 09:21:31', 'tttttttttttttt', '2020-07-07 09:21:31', '2020-07-07 09:21:31', 1, 1, 0, 1, 2, 'QC2020/0029', 2, 0, 1, 0),
(50, '0', 2, 2, 4, '2020-07-07 09:32:21', 'dfsfsdf', '2020-07-07 09:32:21', '2020-07-07 09:32:21', 1, 1, 0, 1, 2, 'QC2020/0030', 1, 0, 1, 0),
(51, '0', 2, 1, 2, '2020-07-07 09:55:02', 'To Some Practical', '2020-07-07 09:55:02', '2020-07-07 09:55:02', 1, 1, 0, 1, 1, 'QC2020/0031', 1, 0, 1, 0),
(52, '0', 5, 5, 2, '2020-07-07 10:00:41', 'zsdasda', '2020-07-07 10:00:41', '2020-07-07 10:00:41', 1, 1, 0, 1, 1, 'QC2020/0032', 1, 0, 1, 0),
(53, '0', 1, 1, 2, '2020-07-08 13:30:52', 'dfsdf', '2020-07-08 13:30:52', '2020-07-08 13:30:52', 1, 1, 0, 1, 1, 'QC2020/0033', 1, 0, 1, 0),
(54, '0', 1, 1, 2, '2020-07-08 13:31:54', 'dfsdf', '2020-07-08 13:31:54', '2020-07-08 13:31:54', 1, 1, 0, 1, 1, 'QC2020/0034', 1, 0, 1, 0),
(55, '0', 1, 1, 2, '2020-07-08 13:35:24', 'dfsdf', '2020-07-08 13:35:24', '2020-07-08 13:35:24', 1, 1, 0, 1, 1, 'QC2020/0035', 1, 0, 1, 0),
(56, '0', 1, 1, 2, '2020-07-08 13:38:46', 'dfsdf', '2020-07-08 13:38:46', '2020-07-08 13:38:46', 1, 1, 0, 1, 1, 'QC2020/0036', 1, 0, 1, 0),
(57, '0', 1, 1, 2, '2020-07-08 13:39:09', 'dfsdf', '2020-07-08 13:39:09', '2020-07-08 13:39:09', 1, 1, 0, 1, 1, 'QC2020/0037', 1, 0, 1, 0),
(58, '0', 1, 1, 2, '2020-07-08 13:41:59', 'dfsdf', '2020-07-08 13:41:59', '2020-07-08 13:41:59', 1, 1, 0, 1, 1, 'QC2020/0038', 1, 0, 1, 0),
(59, '0', 1, 1, 2, '2020-07-10 10:58:47', 'vvbbb', '2020-07-16 16:30:34', '2020-07-10 10:58:47', 1, 1, 0, 1, 1, 'QC2020/0039', 1, 1, 2, 0),
(60, '0000006490', 1, 1, 2, '2020-07-10 11:02:15', 'vvbbb', '2020-06-25 16:30:34', '2020-07-10 11:02:15', 1, 1, 0, 1, 2, 'QC2020/0040', 2, 0, 2, 0),
(61, '0000006491', 1, 1, 2, '2020-07-10 12:14:53', 'vvbbb', '2020-07-01 16:30:34', '2020-07-10 12:14:53', 1, 1, 0, 1, 1, 'QC2020/0041', 1, 1, 1, 1),
(62, '0000006492', 8, 8, 2, '2020-07-16 16:30:34', 'Lain Purpose...', '2020-07-16 16:30:34', '2020-07-13 15:02:06', 1, 1, 0, 1, 2, 'QC2020/0042', 1, 1, 5, 1),
(63, '0000006493', 1, 1, 2, '2020-07-13 16:42:55', 'Purpose for demo', '2020-07-13 16:30:34', '2020-07-13 16:42:55', 1, 1, 0, 1, 1, 'QC2020/0043', 1, 0, 1, 0),
(64, '0000006494', 8, 8, 5, '2020-07-14 08:20:36', 'Test Purpose', '2020-07-01 16:30:34', '2020-07-14 08:20:36', 1, 1, 0, 1, 1, 'QC2020/0044', 1, 0, 3, 0),
(65, '0000006495', 8, 8, 5, '2020-07-14 08:26:40', 'Test Purpose', '2020-07-02 16:30:34', '2020-07-14 08:26:40', 1, 1, 0, 1, 1, 'QC2020/0045', 1, 0, 8, 0),
(66, '0000006496', 8, 8, 8, '2020-07-14 08:27:42', '345', '2020-07-14 16:30:34', '2020-07-14 08:27:42', 1, 1, 0, 1, 2, 'QC2020/0046', 2, 1, 2, 0),
(67, '0000006497', 8, 8, 5, '2020-07-15 16:30:34', 'Purpose 123', '2020-07-15 16:30:34', '2020-07-14 08:32:07', 1, 1, 0, 1, 2, 'QC2020/0047', 1, 1, 1, 1),
(68, '0000006498', 1, 1, 2, '2020-07-15 11:35:27', 'sdfsdfs', '2020-07-15 16:30:34', '2020-07-15 11:35:27', 1, 1, 0, 1, 2, 'QC2020/0048', 2, 0, 2, 1),
(69, '0000006499', 8, 8, 2, '2020-07-10 16:30:34', 'Lamin purpose', '2020-07-10 16:30:34', '2020-07-16 13:10:29', 1, 1, 0, 1, 2, 'QC2020/0049', 1, 0, 3, 1),
(70, '0000006500', 5, 5, 2, '2020-07-01 16:30:34', 'fsdweew sdfsdfsd LaMIN', '2020-07-01 16:30:34', '2020-07-16 13:23:30', 1, 1, 0, 1, 1, 'QC2020/0050', 1, 1, 1, 0),
(71, '0000006501', 8, 8, 3, '2020-07-02 16:30:34', 'dfsdfsd', '2020-07-02 16:30:34', '2020-07-16 16:33:51', 1, 1, 0, 1, 2, 'QC2020/0051', 1, 0, 4, 0),
(72, '0000006502', 8, 8, 2, '2020-07-01 16:30:34', '43erwedfs', '2020-07-01 16:30:34', '2020-07-17 10:29:48', 1, 1, 0, 1, 2, 'QC2020/0052', 1, 0, 2, 1),
(73, '0000006503', 1, 1, 2, '2020-07-21 12:20:40', 'This is a test Purpose', '2020-07-20 16:30:34', '2020-07-21 12:20:40', 1, 1, 0, 1, 2, 'QC2020/0053', 2, 1, 1, 0),
(74, '0000006504', 2, 2, 8, '2020-07-08 16:30:34', 'Test Purpose', '2020-07-08 16:30:34', '2020-07-21 13:19:21', 1, 1, 0, 1, 1, 'QC2020/0054', 1, 0, 1, 0),
(75, '0000006505', 8, 8, 3, '2020-07-09 16:30:34', 'dsd', '2020-07-09 16:30:34', '2020-07-21 13:20:18', 1, 1, 0, 1, 1, 'QC2020/0055', 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sub_deps`
--

CREATE TABLE `sub_deps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `depId` int(11) NOT NULL,
  `subDepName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subervisorId` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_deps`
--

INSERT INTO `sub_deps` (`id`, `depId`, `subDepName`, `subervisorId`, `created_at`, `updated_at`) VALUES
(1, 8, 'SWAT', 1, NULL, NULL),
(2, 2, 'Front Desk', NULL, '2020-07-16 15:21:36', '2020-07-16 15:21:36'),
(3, 2, 'Care Center', NULL, '2020-07-16 15:21:55', '2020-07-16 15:21:55'),
(4, 2, 'Call Center', NULL, '2020-07-16 15:22:23', '2020-07-16 15:22:23'),
(5, 8, 'NOC / IN', NULL, '2020-07-16 15:23:12', '2020-07-16 15:23:12'),
(6, 8, 'TRANSMISSION', NULL, '2020-07-16 15:23:26', '2020-07-16 15:23:26'),
(7, 8, 'ISP', NULL, '2020-07-16 15:23:42', '2020-07-16 15:23:42'),
(8, 8, 'OPTIMISATION / RF', NULL, '2020-07-16 15:23:55', '2020-07-16 15:23:55'),
(9, 1, 'ADMIN / HR', NULL, '2020-07-16 15:24:59', '2020-07-16 15:24:59'),
(10, 3, 'FINANCE & REVENUE ASSURANCE', NULL, '2020-07-16 15:25:28', '2020-07-16 15:25:28'),
(11, 3, 'DEPT COLLECTION', NULL, '2020-07-16 15:25:43', '2020-07-16 15:25:43'),
(12, 7, 'IT & BILLING', NULL, '2020-07-16 15:25:56', '2020-07-16 15:25:56'),
(13, 6, 'SALES', NULL, '2020-07-16 15:26:07', '2020-07-16 15:26:07'),
(14, 4, 'MARKETING', NULL, '2020-07-16 15:26:28', '2020-07-16 15:26:28');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `address`, `created_at`, `updated_at`) VALUES
(1, 'MP Trading', 'Lamin Village', '2020-06-18 15:10:23', '2020-06-18 15:10:23'),
(2, 'Unique Solutions', '31A Kairaba Avenue', '2020-07-07 08:23:48', '2020-07-07 08:23:48');

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `uId` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `department` int(11) NOT NULL,
  `uPassword` varchar(233) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subDep` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `uId`, `status`, `department`, `uPassword`, `subDep`) VALUES
(1, 'Sulayman Jawneh', 'sulayman.jawneh@qcell.gm', NULL, '123', NULL, '2020-06-25 10:03:17', '2020-07-14 09:59:09', 3, 1, 8, '123', 0),
(2, 'Lamin O. Touray', 'lamin.touray1@qcell.gm', NULL, '4472897', NULL, '2020-06-25 10:03:17', '2020-06-25 10:03:17', 2, 1, 1, '4472897', 0),
(3, 'Kebba Foon', 'k.foon@qcell.gm', NULL, '123', NULL, '2020-06-26 09:39:19', '2020-06-26 09:39:19', 4, 2, 1, '123', 0),
(4, 'Ahmat Jah', 'ahmat.jah@qcell.gm', NULL, '123', NULL, '2020-07-01 11:09:12', '2020-07-07 04:39:29', 5, 2, 8, '123', 0),
(5, 'Lamin O Touray', '2raymoori@gmail.com', NULL, '123', NULL, '2020-07-01 11:21:23', '2020-07-01 11:21:23', 6, 1, 1, '123', 0),
(6, 'Lamin O Touray', 'lo2raymoori@gmail.com', NULL, '123', NULL, '2020-07-01 11:23:35', '2020-07-01 11:23:35', 7, 3, 3, '123', 0),
(7, 'User123', 'user@user.gm', NULL, '123', NULL, '2020-07-14 07:48:12', '2020-07-14 07:48:12', 8, 1, 8, '123', 0),
(8, 'Buba Sabally', 'buba.sabally@qcell.gm', NULL, '123', NULL, '2020-07-17 11:14:33', '2020-07-17 11:14:33', 9, 1, 1, '123', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `currency_types`
--
ALTER TABLE `currency_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currency_types_currencyname_unique` (`currencyName`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `g_r_n_s`
--
ALTER TABLE `g_r_n_s`
  ADD PRIMARY KEY (`id`),
  ADD KEY `g_r_n_s_poid_foreign` (`poId`),
  ADD KEY `g_r_n_s_supplierid_foreign` (`supplierId`),
  ADD KEY `g_r_n_s_reqid_foreign` (`reqId`);

--
-- Indexes for table `h_o_d_s`
--
ALTER TABLE `h_o_d_s`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniqueDep` (`departmentId`);

--
-- Indexes for table `justify_reason_requisions`
--
ALTER TABLE `justify_reason_requisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `justify_rejections`
--
ALTER TABLE `justify_rejections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `officer_requicisions`
--
ALTER TABLE `officer_requicisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `officer_requicisions_departmentid_foreign` (`departmentId`);

--
-- Indexes for table `pending_requests`
--
ALTER TABLE `pending_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pending_requisition_requests`
--
ALTER TABLE `pending_requisition_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_orders_requisitionid_foreign` (`requisitionId`);

--
-- Indexes for table `p_o_s`
--
ALTER TABLE `p_o_s`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_o_s_supplierid_foreign` (`supplierId`),
  ADD KEY `p_o_s_reqorderid_foreign` (`reqOrderId`);

--
-- Indexes for table `requisition_orders`
--
ALTER TABLE `requisition_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `requisition_orders_hod_id_foreign` (`hod_id`),
  ADD KEY `requisition_orders_dep_id_foreign` (`dep_id`),
  ADD KEY `requisition_orders_officer_id_foreign` (`officer_id`);

--
-- Indexes for table `sub_deps`
--
ALTER TABLE `sub_deps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `currency_types`
--
ALTER TABLE `currency_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `g_r_n_s`
--
ALTER TABLE `g_r_n_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `h_o_d_s`
--
ALTER TABLE `h_o_d_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `justify_reason_requisions`
--
ALTER TABLE `justify_reason_requisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `justify_rejections`
--
ALTER TABLE `justify_rejections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `officer_requicisions`
--
ALTER TABLE `officer_requicisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `pending_requests`
--
ALTER TABLE `pending_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pending_requisition_requests`
--
ALTER TABLE `pending_requisition_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `product_orders`
--
ALTER TABLE `product_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT for table `p_o_s`
--
ALTER TABLE `p_o_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `requisition_orders`
--
ALTER TABLE `requisition_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `sub_deps`
--
ALTER TABLE `sub_deps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `g_r_n_s`
--
ALTER TABLE `g_r_n_s`
  ADD CONSTRAINT `g_r_n_s_poid_foreign` FOREIGN KEY (`poId`) REFERENCES `p_o_s` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `g_r_n_s_reqid_foreign` FOREIGN KEY (`reqId`) REFERENCES `requisition_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `g_r_n_s_supplierid_foreign` FOREIGN KEY (`supplierId`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `h_o_d_s`
--
ALTER TABLE `h_o_d_s`
  ADD CONSTRAINT `h_o_d_s_departmentid_foreign` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`id`);

--
-- Constraints for table `officer_requicisions`
--
ALTER TABLE `officer_requicisions`
  ADD CONSTRAINT `officer_requicisions_departmentid_foreign` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD CONSTRAINT `product_orders_requisitionid_foreign` FOREIGN KEY (`requisitionId`) REFERENCES `requisition_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `p_o_s`
--
ALTER TABLE `p_o_s`
  ADD CONSTRAINT `p_o_s_reqorderid_foreign` FOREIGN KEY (`reqOrderId`) REFERENCES `requisition_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `p_o_s_supplierid_foreign` FOREIGN KEY (`supplierId`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `requisition_orders`
--
ALTER TABLE `requisition_orders`
  ADD CONSTRAINT `requisition_orders_dep_id_foreign` FOREIGN KEY (`dep_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `requisition_orders_hod_id_foreign` FOREIGN KEY (`hod_id`) REFERENCES `h_o_d_s` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `requisition_orders_officer_id_foreign` FOREIGN KEY (`officer_id`) REFERENCES `officer_requicisions` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
