-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 23, 2020 at 05:17 PM
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
(3, 'Nayan Bhatt', 3, '2020-07-01 11:09:12', '2020-07-01 11:09:12'),
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
(7, 'Bakary Camara', 3, '2020-07-01 11:23:35', '2020-07-01 11:23:35', 1),
(9, 'Buba Sabally', 1, '2020-07-17 11:14:33', '2020-07-17 11:14:33', 9),
(10, 'Nayan Bhatt', 2, NULL, NULL, 10),
(11, 'Oumie Ceesay', 1, '2020-07-23 09:20:22', '2020-07-23 09:20:22', 9),
(12, 'Anam Jah Jobe', 2, '2020-07-23 09:32:25', '2020-07-23 09:32:25', 2),
(13, 'Augustine Jatta', 6, '2020-07-23 09:36:26', '2020-07-23 09:36:26', 13),
(14, 'Lamin Yaffa', 7, '2020-07-23 09:38:19', '2020-07-23 09:38:19', 12),
(15, 'Ahamat Jah', 8, '2020-07-23 09:40:08', '2020-07-23 09:40:08', 1);

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
(6, 'Bakary Camara', 'bakary.camara@qcell.gm', NULL, '447', NULL, '2020-07-01 11:23:35', '2020-07-23 09:44:44', 7, 3, 1, '447', 9),
(8, 'Buba Sabally', 'buba.sabally@qcell.gm', NULL, '123', NULL, '2020-07-17 11:14:33', '2020-07-17 11:14:33', 9, 1, 1, '123', 9),
(9, 'Oumie Ceesay', 'oumie.ceesay@qcell.gm', NULL, '123', NULL, '2020-07-23 09:20:22', '2020-07-23 09:20:22', 11, 2, 1, '123', 9),
(10, 'Anam Jah Jobe', 'anam.jah@qcell.gm', NULL, '123', NULL, '2020-07-23 09:32:25', '2020-07-23 09:32:25', 12, 2, 2, '123', 2),
(11, 'Augustine Jatta', 'augustine.jatta@qcell.gm', NULL, '123', NULL, '2020-07-23 09:36:26', '2020-07-23 09:36:26', 13, 2, 6, '123', 13),
(12, 'Lamin Yaffa', 'lamin.yaffa@qcell.gm', NULL, '123', NULL, '2020-07-23 09:38:20', '2020-07-23 09:38:20', 14, 2, 7, '123', 12),
(13, 'Ahamat Jah', 'ahamat.jah@qcell.gm', NULL, '123', NULL, '2020-07-23 09:40:08', '2020-07-23 09:40:08', 15, 2, 8, '123', 1);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
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
