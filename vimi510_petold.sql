-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 10, 2022 at 03:53 AM
-- Server version: 10.3.35-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vimi510_petold`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_type` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_main_account` tinyint(1) NOT NULL DEFAULT 0,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `default_account_id` bigint(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_account_id` int(10) UNSIGNED DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `disabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `business_id`, `name`, `account_number`, `account_type_id`, `note`, `asset_type`, `created_by`, `is_main_account`, `is_closed`, `deleted_at`, `default_account_id`, `created_at`, `updated_at`, `parent_account_id`, `visible`, `disabled`) VALUES
(1, 1, 'Cash', '101', 6, NULL, 5, 1, 0, 0, NULL, 1, '2020-06-19 07:34:50', '2020-06-19 07:34:50', NULL, 1, 0),
(2, 1, 'Petty Cash', '102', 6, NULL, 5, 1, 0, 0, NULL, 2, '2020-06-19 07:36:39', '2020-06-19 07:36:39', NULL, 1, 0),
(3, 1, 'Cheques in Hand', '103', 6, NULL, 6, 1, 0, 0, NULL, 3, '2020-06-19 07:37:44', '2020-06-19 07:37:44', NULL, 1, 0),
(4, 1, 'Accounts Receivable', '104', 6, NULL, NULL, 1, 0, 0, NULL, 4, '2020-06-19 07:46:08', '2020-06-19 07:46:08', NULL, 1, 0),
(5, 1, 'Company Deposits', '105', 6, NULL, NULL, 1, 0, 0, NULL, 5, '2020-06-19 07:46:42', '2020-06-19 07:46:42', NULL, 1, 0),
(6, 1, 'Raw Material Account', '106', 6, NULL, 1, 1, 0, 0, NULL, 6, '2020-06-19 07:47:24', '2020-06-19 07:47:24', NULL, 1, 0),
(7, 1, 'Finished Goods Account', '107', 6, NULL, 2, 1, 0, 0, NULL, 7, '2020-06-19 07:48:09', '2020-09-18 06:25:20', NULL, 1, 0),
(8, 1, 'Stock Account', '108', 6, NULL, 3, 1, 0, 0, NULL, 8, '2020-06-19 07:48:39', '2020-06-19 07:48:39', NULL, 1, 0),
(9, 1, 'Cards (Credit Debit)  Account', '120', 6, NULL, 7, 1, 0, 0, NULL, 9, '2020-06-19 07:50:46', '2020-06-19 07:50:46', NULL, 1, 0),
(10, 1, 'Fixed Assets', '150', 7, NULL, NULL, 1, 0, 0, NULL, 10, '2020-06-19 07:53:17', '2020-06-19 07:53:17', NULL, 1, 0),
(11, 1, 'Accounts Payable', '201', 8, NULL, NULL, 1, 0, 0, NULL, 11, '2020-06-19 07:53:56', '2020-06-19 07:53:56', NULL, 1, 0),
(12, 1, 'Wages Payable', '202', 8, NULL, NULL, 1, 0, 0, NULL, 12, '2020-06-19 07:54:26', '2020-06-19 07:54:26', NULL, 1, 0),
(13, 1, 'Taxes Payable', '203', 8, NULL, NULL, 1, 0, 0, NULL, 13, '2020-06-19 07:54:56', '2020-06-19 07:54:56', NULL, 1, 0),
(14, 1, 'Customer Deposits', '204', 8, NULL, NULL, 1, 0, 0, NULL, 14, '2020-06-19 07:55:27', '2020-06-19 07:55:27', NULL, 1, 0),
(15, 1, 'Sales Income', '301', 3, NULL, NULL, 1, 0, 0, NULL, 15, '2020-06-19 07:56:12', '2020-06-19 07:56:12', NULL, 1, 0),
(16, 1, 'Cost of Goods Sold', '401', 4, NULL, 8, 1, 0, 0, NULL, 16, '2020-06-19 07:56:51', '2020-09-18 06:24:55', NULL, 1, 0),
(17, 1, 'Bank Fees & Charges', '402', 4, NULL, NULL, 1, 0, 0, NULL, 17, '2020-06-19 09:16:58', '2020-06-19 09:16:58', NULL, 1, 0),
(18, 1, 'Rent Expense', '403', 4, NULL, NULL, 1, 0, 0, NULL, 18, '2020-06-19 09:17:25', '2020-06-19 09:17:25', NULL, 1, 0),
(19, 1, 'Salaries & Wages Expenses', '404', 4, NULL, NULL, 1, 0, 0, NULL, 19, '2020-06-19 09:18:01', '2020-06-19 09:18:01', NULL, 1, 0),
(20, 1, 'Water Expenses', '405', 4, NULL, NULL, 1, 0, 0, NULL, 20, '2020-06-19 09:18:52', '2020-06-19 09:18:52', NULL, 1, 0),
(21, 1, 'Electricity Expenses', '406', 4, NULL, NULL, 1, 0, 0, NULL, 21, '2020-06-19 09:19:17', '2020-06-19 09:19:17', NULL, 1, 0),
(22, 1, 'Owners Contribution', '600', 5, NULL, NULL, 1, 0, 0, NULL, 22, '2020-06-19 09:20:02', '2020-06-19 09:20:02', NULL, 1, 0),
(23, 1, 'Retained Earnings', '601', 5, NULL, NULL, 1, 0, 0, NULL, 23, '2020-06-19 09:20:30', '2020-06-19 09:20:30', NULL, 1, 0),
(73, 1, 'Sales Income - Gas', '301-1', 3, NULL, 17, 1, 0, 0, NULL, 24, '2020-07-01 05:38:34', '2020-07-01 05:52:56', NULL, 1, 0),
(76, 1, 'Sales Income - Kerosene Oil', '301-2', 3, NULL, 17, 1, 0, 0, NULL, 25, '2020-07-01 05:39:17', '2020-07-01 05:53:18', NULL, 1, 0),
(79, 1, 'Sales Income - Other Sales', '301-3', 3, NULL, 17, 1, 0, 0, NULL, 26, '2020-07-01 05:39:58', '2020-07-01 05:53:48', NULL, 1, 0),
(82, 1, 'Sales Income - Petrol 92', '301-4', 3, NULL, 17, 1, 0, 0, NULL, 27, '2020-07-01 05:41:29', '2020-07-01 05:54:30', NULL, 1, 0),
(85, 1, 'Sales Income - Petrol 95', '301-4', 3, NULL, 17, 1, 0, 0, NULL, 28, '2020-07-01 05:41:53', '2020-07-01 05:54:46', NULL, 1, 0),
(88, 1, 'Sales Income - Petrol LAD', '301-6', 3, NULL, 17, 1, 0, 0, NULL, 29, '2020-07-01 05:42:18', '2020-07-01 05:54:59', NULL, 1, 0),
(91, 1, 'Sales Income - Super Diesel', '301-7', 3, NULL, 17, 1, 0, 0, NULL, 30, '2020-07-01 05:42:56', '2020-07-01 05:55:11', NULL, 1, 0),
(94, 1, 'Sales Income - Lubricants', '301-8', 3, NULL, 17, 1, 0, 0, NULL, 31, '2020-07-01 05:43:56', '2020-07-01 05:54:18', NULL, 1, 0),
(97, 1, 'COGS - Gas', '401-1', 4, NULL, 8, 1, 0, 0, NULL, 32, '2020-07-01 05:56:07', '2020-09-18 06:24:45', NULL, 1, 0),
(100, 1, 'COGS  - Kerosene Oil', '401-2', 4, NULL, 8, 1, 0, 0, NULL, 33, '2020-07-01 05:56:31', '2020-09-18 06:23:21', NULL, 1, 0),
(103, 1, 'COGS  - Other Sales', '401-3', 4, NULL, 8, 1, 0, 0, NULL, 34, '2020-07-01 05:57:11', '2020-09-18 06:24:02', NULL, 1, 0),
(106, 1, 'COGS  - Petrol 92', '401-4', 4, NULL, 8, 1, 0, 0, NULL, 35, '2020-07-01 05:57:50', '2020-09-18 06:24:13', NULL, 1, 0),
(109, 1, 'COGS  - Petrol 95', '401-5', 4, NULL, 8, 1, 0, 0, NULL, 36, '2020-07-01 05:58:14', '2020-09-18 06:24:23', NULL, 1, 0),
(112, 1, 'COGS  - LAD', '401-6', 4, NULL, 8, 1, 0, 0, NULL, 37, '2020-07-01 05:58:40', '2020-09-18 06:23:31', NULL, 1, 0),
(115, 1, 'COGS  - Super Diesel', '401-7', 4, NULL, 8, 1, 0, 0, NULL, 38, '2020-07-01 05:59:14', '2020-09-18 06:24:34', NULL, 1, 0),
(118, 1, 'COGS  - Lubricants', '401-8', 4, NULL, 8, 1, 0, 0, NULL, 39, '2020-07-01 05:59:38', '2020-09-18 06:23:52', NULL, 1, 0),
(2992, 1, 'Opening Balance Equity Account', 'E1', 5, NULL, NULL, 1, 0, 0, NULL, 44, '2021-02-28 15:02:57', '2021-02-28 15:02:57', NULL, 1, 0),
(2993, 2, 'Cash', '101', 15, NULL, 13, 1, 0, 0, NULL, 1, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(2994, 2, 'Petty Cash', '102', 15, NULL, 13, 1, 0, 0, NULL, 2, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(2995, 2, 'Cheques in Hand', '103', 15, NULL, 14, 1, 0, 0, NULL, 3, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(2996, 2, 'Accounts Receivable', '104', 15, NULL, NULL, 1, 0, 0, NULL, 4, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(2997, 2, 'Company Deposits', '105', 15, NULL, NULL, 1, 0, 0, NULL, 5, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(2998, 2, 'Raw Material Account', '106', 15, NULL, 9, 1, 0, 0, NULL, 6, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(2999, 2, 'Finished Goods Account', '107', 15, NULL, 10, 1, 0, 0, NULL, 7, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3000, 2, 'Stock Account', '108', 15, NULL, 11, 1, 0, 0, NULL, 8, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3001, 2, 'Cards (Credit Debit)  Account', '120', 15, NULL, 15, 1, 0, 0, NULL, 9, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3002, 2, 'Fixed Assets', '150', 16, NULL, NULL, 1, 0, 0, NULL, 10, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3003, 2, 'Accounts Payable', '201', 17, NULL, NULL, 1, 0, 0, NULL, 11, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3004, 2, 'Wages Payable', '202', 17, NULL, NULL, 1, 0, 0, NULL, 12, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3005, 2, 'Taxes Payable', '203', 17, NULL, NULL, 1, 0, 0, NULL, 13, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3006, 2, 'Customer Deposits', '204', 17, NULL, NULL, 1, 0, 0, NULL, 14, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3007, 2, 'Sales Income', '301', 12, NULL, 17, 1, 0, 0, NULL, 15, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3008, 2, 'Cost of Goods Sold', '401', 13, NULL, 16, 1, 0, 0, NULL, 16, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3009, 2, 'Bank Fees & Charges', '402', 13, NULL, NULL, 1, 0, 0, NULL, 17, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3010, 2, 'Rent Expense', '403', 13, NULL, NULL, 1, 0, 0, NULL, 18, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3011, 2, 'Salaries & Wages Expenses', '404', 13, NULL, NULL, 1, 0, 0, NULL, 19, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3012, 2, 'Water Expenses', '405', 13, NULL, NULL, 1, 0, 0, NULL, 20, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3013, 2, 'Electricity Expenses', '406', 13, NULL, NULL, 1, 0, 0, NULL, 21, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3014, 2, 'Owners Contribution', '600', 14, NULL, NULL, 1, 0, 0, NULL, 22, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3015, 2, 'Retained Earnings', '601', 14, NULL, NULL, 1, 0, 0, NULL, 23, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3016, 2, 'Sales Income - Gas', '301-1', 12, NULL, 17, 1, 0, 0, NULL, 24, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3017, 2, 'Sales Income - Kerosene Oil', '301-2', 12, NULL, 17, 1, 0, 0, NULL, 25, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3018, 2, 'Sales Income - Other Sales', '301-3', 12, NULL, 17, 1, 0, 0, NULL, 26, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3019, 2, 'Sales Income - Petrol 92', '301-4', 12, NULL, 17, 1, 0, 0, NULL, 27, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3020, 2, 'Sales Income - Petrol 95', '301-4', 12, NULL, 17, 1, 0, 0, NULL, 28, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3021, 2, 'Sales Income - LAD', '301-6', 12, NULL, 17, 1, 0, 0, NULL, 29, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3022, 2, 'Sales Income - Super Diesel', '301-7', 12, NULL, 17, 1, 0, 0, NULL, 30, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3023, 2, 'Sales Income - Lubricants', '301-8', 12, NULL, 17, 1, 0, 0, NULL, 31, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3024, 2, 'COGS - Gas', '401-1', 13, NULL, 16, 1, 0, 0, NULL, 32, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3025, 2, 'COGS  - Kerosene Oil', '401-2', 13, NULL, 16, 1, 0, 0, NULL, 33, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3026, 2, 'COGS  - Other Sales', '401-3', 13, NULL, 16, 1, 0, 0, NULL, 34, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3027, 2, 'COGS  - Petrol 92', '401-4', 13, NULL, 16, 1, 0, 0, NULL, 35, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3028, 2, 'COGS  - Petrol 95', '401-5', 13, NULL, 16, 1, 0, 0, NULL, 36, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3029, 2, 'COGS  - LAD', '401-6', 13, NULL, 16, 1, 0, 0, NULL, 37, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3030, 2, 'COGS  - Super Diesel', '401-7', 13, NULL, 16, 1, 0, 0, NULL, 38, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3031, 2, 'COGS  - Lubricants', '401-8', 13, NULL, 16, 1, 0, 0, NULL, 39, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3032, 2, 'Sales income - Bowser', '301 - 8', 12, NULL, 17, 1, 0, 0, NULL, 40, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3033, 2, 'Expenses', '400', 13, NULL, NULL, 1, 0, 0, NULL, 42, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3034, 2, 'Cheque Return Income', '399', 12, NULL, NULL, 1, 0, 0, NULL, 43, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3035, 2, 'Opening Balance Equity Account', 'E1', 14, NULL, NULL, 1, 0, 0, NULL, 44, '2021-07-20 14:32:44', '2021-07-24 23:34:54', NULL, 1, 0),
(3036, 2, 'Bank 1', '1', 15, NULL, 12, 2, 0, 0, NULL, NULL, '2021-07-25 16:15:20', '2021-07-25 16:15:20', NULL, 1, 0),
(3037, 3, 'Cash', '101', 24, NULL, 23, 1, 0, 0, NULL, 1, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3038, 3, 'Petty Cash', '102', 24, NULL, 23, 1, 0, 0, NULL, 2, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3039, 3, 'Cheques in Hand', '103', 24, NULL, 24, 1, 0, 0, NULL, 3, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3040, 3, 'Accounts Receivable', '104', 24, NULL, NULL, 1, 0, 0, NULL, 4, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3041, 3, 'Company Deposits', '105', 24, NULL, NULL, 1, 0, 0, NULL, 5, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3042, 3, 'Raw Material Account', '106', 24, NULL, 19, 1, 0, 0, NULL, 6, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3043, 3, 'Finished Goods Account', '107', 24, NULL, 20, 1, 0, 0, NULL, 7, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3044, 3, 'Stock Account', '108', 24, NULL, 21, 1, 0, 0, NULL, 8, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3045, 3, 'Cards (Credit Debit)  Account', '120', 24, NULL, 25, 1, 1, 0, NULL, 9, '2022-02-03 06:03:22', '2022-02-03 07:55:29', NULL, 1, 0),
(3046, 3, 'Fixed Assets', '150', 25, NULL, NULL, 1, 0, 0, NULL, 10, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3047, 3, 'Accounts Payable', '201', 26, NULL, NULL, 1, 0, 0, NULL, 11, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3048, 3, 'Wages Payable', '202', 26, NULL, NULL, 1, 0, 0, NULL, 12, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3049, 3, 'Taxes Payable', '203', 26, NULL, NULL, 1, 0, 0, NULL, 13, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3050, 3, 'Customer Deposits', '204', 26, NULL, NULL, 1, 0, 0, NULL, 14, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3051, 3, 'Sales Income', '301', 21, NULL, 27, 1, 0, 0, NULL, 15, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3052, 3, 'Cost of Goods Sold', '401', 22, NULL, 26, 1, 0, 0, NULL, 16, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3053, 3, 'Bank Fees & Charges', '402', 22, NULL, NULL, 1, 0, 0, NULL, 17, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3054, 3, 'Rent Expense', '403', 22, NULL, NULL, 1, 0, 0, NULL, 18, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3055, 3, 'Salaries & Wages Expenses', '404', 22, NULL, NULL, 1, 0, 0, NULL, 19, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3056, 3, 'Water Expenses', '405', 22, NULL, NULL, 1, 0, 0, NULL, 20, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3057, 3, 'Electricity Expenses', '406', 22, NULL, NULL, 1, 0, 0, NULL, 21, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3058, 3, 'Owners Contribution', '600', 23, NULL, NULL, 1, 0, 0, NULL, 22, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3059, 3, 'Retained Earnings', '601', 23, NULL, NULL, 1, 0, 0, NULL, 23, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3060, 3, 'Sales Income - Gas', '301-1', 21, NULL, 27, 1, 0, 0, NULL, 24, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3061, 3, 'Sales Income - Kerosene Oil', '301-2', 21, NULL, 27, 1, 0, 0, NULL, 25, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3062, 3, 'Sales Income - Other Sales', '301-3', 21, NULL, 27, 1, 0, 0, NULL, 26, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3063, 3, 'Sales Income - Petrol 92', '301-4', 21, NULL, 27, 1, 0, 0, NULL, 27, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3064, 3, 'Sales Income - Petrol 95', '301-4', 21, NULL, 27, 1, 0, 0, NULL, 28, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3065, 3, 'Sales Income - LAD', '301-6', 21, NULL, 27, 1, 0, 0, NULL, 29, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3066, 3, 'Sales Income - Super Diesel', '301-7', 21, NULL, 27, 1, 0, 0, NULL, 30, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3067, 3, 'Sales Income - Lubricants', '301-8', 21, NULL, 27, 1, 0, 0, NULL, 31, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3068, 3, 'COGS - Gas', '401-1', 22, NULL, 26, 1, 0, 0, NULL, 32, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3069, 3, 'COGS  - Kerosene Oil', '401-2', 22, NULL, 26, 1, 0, 0, NULL, 33, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3070, 3, 'COGS  - Other Sales', '401-3', 22, NULL, 26, 1, 0, 0, NULL, 34, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3071, 3, 'COGS  - Petrol 92', '401-4', 22, NULL, 26, 1, 0, 0, NULL, 35, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3072, 3, 'COGS  - Petrol 95', '401-5', 22, NULL, 26, 1, 0, 0, NULL, 36, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3073, 3, 'COGS  - LAD', '401-6', 22, NULL, 26, 1, 0, 0, NULL, 37, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3074, 3, 'COGS  - Super Diesel', '401-7', 22, NULL, 26, 1, 0, 0, NULL, 38, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3075, 3, 'COGS  - Lubricants', '401-8', 22, NULL, 26, 1, 0, 0, NULL, 39, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3076, 3, 'Sales income - Bowser', '301 - 8', 21, NULL, 27, 1, 0, 0, NULL, 40, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3077, 3, 'Expenses', '400', 22, NULL, NULL, 1, 0, 0, NULL, 42, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3078, 3, 'Cheque Return Income', '399', 21, NULL, NULL, 1, 0, 0, NULL, 43, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3079, 3, 'Opening Balance Equity Account', 'E1', 23, NULL, NULL, 1, 0, 0, NULL, 44, '2022-02-03 06:03:22', '2022-02-03 06:04:29', NULL, 1, 0),
(3080, 3, 'Commercial Bank - 2670', '1430012670', 24, NULL, 22, 5, 0, 0, NULL, NULL, '2022-02-03 07:53:49', '2022-02-03 07:53:49', NULL, 1, 0),
(3081, 3, 'Commercial Bank - 3802', '1000393802', 24, NULL, 22, 5, 0, 0, NULL, NULL, '2022-02-03 07:54:14', '2022-02-03 07:54:14', NULL, 1, 0),
(3082, 3, 'Amex Card', '120-1', 24, NULL, 25, 5, 0, 0, NULL, NULL, '2022-02-03 07:55:54', '2022-02-03 07:55:54', 3045, 1, 0),
(3083, 3, 'Visa Master Card', '120-2', 24, NULL, 25, 5, 0, 0, NULL, NULL, '2022-02-03 07:56:21', '2022-02-03 07:56:21', 3045, 1, 0),
(3084, 3, 'CPC - 100692', 'CPC - 100692', 24, NULL, 22, 5, 0, 0, NULL, NULL, '2022-02-03 08:09:34', '2022-02-03 08:09:34', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `account_groups`
--

CREATE TABLE `account_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `account_type_id` int(10) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `default_account_group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_groups`
--

INSERT INTO `account_groups` (`id`, `business_id`, `name`, `account_type_id`, `note`, `default_account_group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Raw Material Account', 6, NULL, 1, '2020-06-19 07:27:31', '2020-06-19 07:27:31'),
(2, 1, 'Finished Goods Account', 6, NULL, 2, '2020-06-19 07:27:54', '2020-06-19 07:27:54'),
(3, 1, 'Other Stocks', 6, NULL, 3, '2020-06-19 07:28:09', '2020-06-19 07:28:09'),
(4, 1, 'Bank Account', 6, NULL, 4, '2020-06-19 07:28:27', '2020-06-19 07:28:27'),
(5, 1, 'Cash Account', 6, NULL, 5, '2020-06-19 07:28:44', '2020-06-19 07:28:44'),
(6, 1, 'Cheques in Hand (Customer\'s)', 6, NULL, 6, '2020-06-19 07:29:01', '2020-06-19 07:29:01'),
(7, 1, 'Card', 6, NULL, 7, '2020-06-19 07:31:50', '2020-06-19 07:31:50'),
(8, 1, 'COGS Account Group', 4, NULL, 8, '2020-06-19 07:32:06', '2020-06-26 11:34:20'),
(9, 2, 'Raw Material Account', 15, NULL, 1, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(10, 2, 'Finished Goods Account', 15, NULL, 2, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(11, 2, 'Other Stocks', 15, NULL, 3, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(12, 2, 'Bank Account', 15, NULL, 4, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(13, 2, 'Cash Account', 15, NULL, 5, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(14, 2, 'Cheques in Hand (Customer\'s)', 15, NULL, 6, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(15, 2, 'Card', 15, NULL, 7, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(16, 2, 'COGS Account Group', 13, NULL, 8, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(17, 2, 'Sales Income Group', 12, 'na', 9, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(18, 2, 'Direct Expense', 13, NULL, 10, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(19, 3, 'Raw Material Account', 24, NULL, 1, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(20, 3, 'Finished Goods Account', 24, NULL, 2, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(21, 3, 'Other Stocks', 24, NULL, 3, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(22, 3, 'Bank Account', 24, NULL, 4, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(23, 3, 'Cash Account', 24, NULL, 5, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(24, 3, 'Cheques in Hand (Customer\'s)', 24, NULL, 6, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(25, 3, 'Card', 24, NULL, 7, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(26, 3, 'COGS Account Group', 22, NULL, 8, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(27, 3, 'Sales Income Group', 21, 'na', 9, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(28, 3, 'Direct Expense', 22, NULL, 10, '2022-02-03 06:03:22', '2022-02-03 06:03:22');

-- --------------------------------------------------------

--
-- Table structure for table `account_settings`
--

CREATE TABLE `account_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `at_asset_id` int(10) NOT NULL COMMENT 'Account Transaction Id for asset account',
  `at_obe_id` int(10) NOT NULL COMMENT 'Account Transaction Id for Opening Balance Equity Account',
  `created_by` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_settings`
--

INSERT INTO `account_settings` (`id`, `business_id`, `date`, `account_id`, `group_id`, `amount`, `at_asset_id`, `at_obe_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 3, '2022-02-01', 3080, 22, '-667573.500000', 132, 133, 5, '2022-02-03 07:54:30', '2022-02-03 07:54:30'),
(2, 3, '2022-01-31', 3037, 23, '363240.000000', 134, 135, 5, '2022-02-03 07:55:02', '2022-02-03 07:55:02');

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `business_id` int(11) DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit','ledger_show','cheque_return_charges') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,6) NOT NULL,
  `reff_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `transaction_sell_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'used for property sell, to fetch block and property',
  `sell_line_id` int(10) DEFAULT NULL,
  `purchase_line_id` int(10) DEFAULT NULL,
  `income_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'only for transfer and deposit',
  `journal_entry` int(11) DEFAULT NULL,
  `journal_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `installment_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_type` enum('expense') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reconcile_status` tinyint(1) NOT NULL DEFAULT 0,
  `interest` decimal(10,0) DEFAULT NULL,
  `payment_option_id` int(10) UNSIGNED DEFAULT NULL,
  `bank_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_numbers` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_transactions`
--

INSERT INTO `account_transactions` (`id`, `account_id`, `business_id`, `type`, `sub_type`, `amount`, `reff_no`, `operation_date`, `created_by`, `transaction_id`, `transaction_payment_id`, `transfer_transaction_id`, `transaction_sell_line_id`, `sell_line_id`, `purchase_line_id`, `income_type`, `note`, `attachment`, `cheque_number`, `journal_entry`, `journal_deleted`, `installment_id`, `updated_type`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`, `reconcile_status`, `interest`, `payment_option_id`, `bank_name`, `cheque_numbers`, `cheque_date`, `payment_method`) VALUES
(1, 2996, 2, 'debit', 'ledger_show', '5000.000000', NULL, '2021-07-01 00:00:00', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-25 14:20:19', '2021-07-25 14:20:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 3035, 2, 'credit', NULL, '5000.000000', NULL, '2021-07-01 00:00:00', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-25 14:20:19', '2021-07-25 14:20:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2996, 2, 'credit', 'ledger_show', '2000.000000', NULL, '2021-07-01 00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-25 14:21:54', '2021-07-25 14:21:54', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 3035, 2, 'debit', NULL, '2000.000000', NULL, '2021-07-01 00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-25 14:21:54', '2021-07-25 14:21:54', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, NULL, 'credit', NULL, '2000.000000', NULL, '2021-07-01 00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-25 14:21:54', '2021-07-25 14:21:54', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 2996, 2, 'debit', 'ledger_show', '4000.000000', NULL, '2021-07-01 00:00:00', 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-25 14:22:54', '2021-07-25 14:22:54', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 3035, 2, 'credit', NULL, '4000.000000', NULL, '2021-07-01 00:00:00', 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-25 14:22:54', '2021-07-25 14:22:54', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 2999, 2, 'debit', NULL, '600000.000000', NULL, '2021-07-01 00:00:00', 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-25 15:16:53', '2021-07-25 15:16:53', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 3035, 2, 'credit', NULL, '600000.000000', NULL, '2021-07-01 00:00:00', 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-25 15:16:53', '2021-07-25 15:16:53', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 2999, 2, 'debit', NULL, '250000.000000', NULL, '2021-07-01 00:00:00', 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-25 15:17:20', '2021-07-25 15:17:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 3035, 2, 'credit', NULL, '250000.000000', NULL, '2021-07-01 00:00:00', 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-25 15:17:20', '2021-07-25 15:17:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 2999, 2, 'debit', NULL, '650000.000000', NULL, '2021-07-01 00:00:00', 2, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-25 15:18:03', '2021-07-25 15:18:03', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 3035, 2, 'credit', NULL, '650000.000000', NULL, '2021-07-01 00:00:00', 2, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-25 15:18:03', '2021-07-25 15:18:03', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 2999, 2, 'debit', NULL, '270000.000000', NULL, '2021-07-01 00:00:00', 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-25 15:18:33', '2021-07-25 15:18:33', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 3035, 2, 'credit', NULL, '270000.000000', NULL, '2021-07-01 00:00:00', 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-25 15:18:33', '2021-07-25 15:18:33', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 2999, 2, 'debit', NULL, '630000.000000', NULL, '2021-07-01 00:00:00', 2, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-25 15:19:01', '2021-07-25 15:19:01', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 3035, 2, 'credit', NULL, '630000.000000', NULL, '2021-07-01 00:00:00', 2, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-25 15:19:01', '2021-07-25 15:19:01', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 2999, 2, 'debit', NULL, '6150.000000', NULL, '2021-01-01 14:44:19', 2, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-28 18:44:19', '2021-07-28 18:44:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 3035, 2, 'credit', NULL, '6150.000000', NULL, '2021-01-01 14:44:19', 2, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-28 18:44:20', '2021-07-28 18:44:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 3040, 3, 'debit', 'ledger_show', '23700.000000', NULL, '2022-02-01 00:00:00', 5, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 3079, 3, 'credit', NULL, '23700.000000', NULL, '2022-02-01 00:00:00', 5, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 3040, 3, 'debit', 'ledger_show', '13400.000000', NULL, '2022-02-01 00:00:00', 5, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 3079, 3, 'credit', NULL, '13400.000000', NULL, '2022-02-01 00:00:00', 5, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 3040, 3, 'debit', 'ledger_show', '19100.000000', NULL, '2022-02-01 00:00:00', 5, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 3079, 3, 'credit', NULL, '19100.000000', NULL, '2022-02-01 00:00:00', 5, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 3040, 3, 'debit', 'ledger_show', '21350.000000', NULL, '2022-02-01 00:00:00', 5, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 3079, 3, 'credit', NULL, '21350.000000', NULL, '2022-02-01 00:00:00', 5, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 3040, 3, 'debit', 'ledger_show', '1000.000000', NULL, '2022-02-01 00:00:00', 5, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 3079, 3, 'credit', NULL, '1000.000000', NULL, '2022-02-01 00:00:00', 5, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 3040, 3, 'debit', 'ledger_show', '2095.000000', NULL, '2022-02-01 00:00:00', 5, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 3079, 3, 'credit', NULL, '2095.000000', NULL, '2022-02-01 00:00:00', 5, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 3040, 3, 'debit', 'ledger_show', '2000.000000', NULL, '2022-02-01 00:00:00', 5, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 3079, 3, 'credit', NULL, '2000.000000', NULL, '2022-02-01 00:00:00', 5, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 3040, 3, 'debit', 'ledger_show', '1870.000000', NULL, '2022-02-01 00:00:00', 5, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 3079, 3, 'credit', NULL, '1870.000000', NULL, '2022-02-01 00:00:00', 5, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 3040, 3, 'debit', 'ledger_show', '4990.000000', NULL, '2022-02-01 00:00:00', 5, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 3079, 3, 'credit', NULL, '4990.000000', NULL, '2022-02-01 00:00:00', 5, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 3040, 3, 'debit', 'ledger_show', '2220.000000', NULL, '2022-02-01 00:00:00', 5, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 3079, 3, 'credit', NULL, '2220.000000', NULL, '2022-02-01 00:00:00', 5, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 3040, 3, 'debit', 'ledger_show', '3825.000000', NULL, '2022-02-01 00:00:00', 5, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 3079, 3, 'credit', NULL, '3825.000000', NULL, '2022-02-01 00:00:00', 5, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 3040, 3, 'debit', 'ledger_show', '1460.000000', NULL, '2022-02-01 00:00:00', 5, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 3079, 3, 'credit', NULL, '1460.000000', NULL, '2022-02-01 00:00:00', 5, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 3040, 3, 'debit', 'ledger_show', '2500.000000', NULL, '2022-02-01 00:00:00', 5, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 3079, 3, 'credit', NULL, '2500.000000', NULL, '2022-02-01 00:00:00', 5, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 3040, 3, 'debit', 'ledger_show', '2660.000000', NULL, '2022-02-01 00:00:00', 5, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 3079, 3, 'credit', NULL, '2660.000000', NULL, '2022-02-01 00:00:00', 5, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 3040, 3, 'debit', 'ledger_show', '2930.000000', NULL, '2022-02-01 00:00:00', 5, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 3079, 3, 'credit', NULL, '2930.000000', NULL, '2022-02-01 00:00:00', 5, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 3040, 3, 'debit', 'ledger_show', '1125.000000', NULL, '2022-02-01 00:00:00', 5, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 3079, 3, 'credit', NULL, '1125.000000', NULL, '2022-02-01 00:00:00', 5, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 3040, 3, 'debit', 'ledger_show', '3200.000000', NULL, '2022-02-01 00:00:00', 5, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 3079, 3, 'credit', NULL, '3200.000000', NULL, '2022-02-01 00:00:00', 5, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 3040, 3, 'debit', 'ledger_show', '885.000000', NULL, '2022-02-01 00:00:00', 5, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 3079, 3, 'credit', NULL, '885.000000', NULL, '2022-02-01 00:00:00', 5, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 3040, 3, 'debit', 'ledger_show', '1055.000000', NULL, '2022-02-01 00:00:00', 5, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 3079, 3, 'credit', NULL, '1055.000000', NULL, '2022-02-01 00:00:00', 5, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 3040, 3, 'debit', 'ledger_show', '19955.000000', NULL, '2022-02-01 00:00:00', 5, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 3079, 3, 'credit', NULL, '19955.000000', NULL, '2022-02-01 00:00:00', 5, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 3040, 3, 'debit', 'ledger_show', '3485.000000', NULL, '2022-02-01 00:00:00', 5, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 3079, 3, 'credit', NULL, '3485.000000', NULL, '2022-02-01 00:00:00', 5, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 3040, 3, 'debit', 'ledger_show', '24000.000000', NULL, '2022-02-01 00:00:00', 5, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 3079, 3, 'credit', NULL, '24000.000000', NULL, '2022-02-01 00:00:00', 5, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 3040, 3, 'debit', 'ledger_show', '3805.000000', NULL, '2022-02-01 00:00:00', 5, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 3079, 3, 'credit', NULL, '3805.000000', NULL, '2022-02-01 00:00:00', 5, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 3040, 3, 'debit', 'ledger_show', '2000.000000', NULL, '2022-02-01 00:00:00', 5, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 3079, 3, 'credit', NULL, '2000.000000', NULL, '2022-02-01 00:00:00', 5, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 3040, 3, 'debit', 'ledger_show', '1700.000000', NULL, '2022-02-01 00:00:00', 5, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 3079, 3, 'credit', NULL, '1700.000000', NULL, '2022-02-01 00:00:00', 5, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 3040, 3, 'debit', 'ledger_show', '1500.000000', NULL, '2022-02-01 00:00:00', 5, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 3079, 3, 'credit', NULL, '1500.000000', NULL, '2022-02-01 00:00:00', 5, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 3040, 3, 'debit', 'ledger_show', '320.000000', NULL, '2022-02-01 00:00:00', 5, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 3079, 3, 'credit', NULL, '320.000000', NULL, '2022-02-01 00:00:00', 5, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 3040, 3, 'debit', 'ledger_show', '2100.000000', NULL, '2022-02-01 00:00:00', 5, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 3079, 3, 'credit', NULL, '2100.000000', NULL, '2022-02-01 00:00:00', 5, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 3040, 3, 'debit', 'ledger_show', '2900.000000', NULL, '2022-02-01 00:00:00', 5, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 3079, 3, 'credit', NULL, '2900.000000', NULL, '2022-02-01 00:00:00', 5, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 3040, 3, 'debit', 'ledger_show', '3025.000000', NULL, '2022-02-01 00:00:00', 5, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 3079, 3, 'credit', NULL, '3025.000000', NULL, '2022-02-01 00:00:00', 5, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 3040, 3, 'debit', 'ledger_show', '4950.000000', NULL, '2022-02-01 00:00:00', 5, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 3079, 3, 'credit', NULL, '4950.000000', NULL, '2022-02-01 00:00:00', 5, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 3040, 3, 'debit', 'ledger_show', '2540.000000', NULL, '2022-02-01 00:00:00', 5, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 3079, 3, 'credit', NULL, '2540.000000', NULL, '2022-02-01 00:00:00', 5, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 3040, 3, 'debit', 'ledger_show', '3750.000000', NULL, '2022-02-01 00:00:00', 5, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 3079, 3, 'credit', NULL, '3750.000000', NULL, '2022-02-01 00:00:00', 5, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 3040, 3, 'debit', 'ledger_show', '3185.000000', NULL, '2022-02-01 00:00:00', 5, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 3079, 3, 'credit', NULL, '3185.000000', NULL, '2022-02-01 00:00:00', 5, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 3040, 3, 'debit', 'ledger_show', '6530.000000', NULL, '2022-02-01 00:00:00', 5, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 3079, 3, 'credit', NULL, '6530.000000', NULL, '2022-02-01 00:00:00', 5, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 3040, 3, 'debit', 'ledger_show', '1575.000000', NULL, '2022-02-01 00:00:00', 5, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 3079, 3, 'credit', NULL, '1575.000000', NULL, '2022-02-01 00:00:00', 5, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 3040, 3, 'debit', 'ledger_show', '67700.000000', NULL, '2022-02-01 00:00:00', 5, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 3079, 3, 'credit', NULL, '67700.000000', NULL, '2022-02-01 00:00:00', 5, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 3040, 3, 'debit', 'ledger_show', '80185.000000', NULL, '2022-02-01 00:00:00', 5, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 3079, 3, 'credit', NULL, '80185.000000', NULL, '2022-02-01 00:00:00', 5, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 3047, 3, 'credit', 'ledger_show', '158800.000000', NULL, '2022-02-01 00:00:00', 5, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 3079, 3, 'debit', NULL, '158800.000000', NULL, '2022-02-01 00:00:00', 5, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 3043, 3, 'debit', NULL, '660765.000000', NULL, '2022-02-01 00:00:00', 5, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:29:01', '2022-02-03 07:29:01', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 3079, 3, 'credit', NULL, '660765.000000', NULL, '2022-02-01 00:00:00', 5, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:29:01', '2022-02-03 07:29:01', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 3043, 3, 'debit', NULL, '70400.000000', NULL, '2022-02-01 00:00:00', 5, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 3043, 3, 'debit', NULL, '22650.000000', NULL, '2022-02-01 00:00:00', 5, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 3043, 3, 'debit', NULL, '1925.000000', NULL, '2022-02-01 00:00:00', 5, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 3043, 3, 'debit', NULL, '25275.000000', NULL, '2022-02-01 00:00:00', 5, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 3043, 3, 'debit', NULL, '1265.000000', NULL, '2022-02-01 00:00:00', 5, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 3043, 3, 'debit', NULL, '4580.000000', NULL, '2022-02-01 00:00:00', 5, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 3043, 3, 'debit', NULL, '3540.000000', NULL, '2022-02-01 00:00:00', 5, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 3043, 3, 'debit', NULL, '2100.000000', NULL, '2022-02-01 00:00:00', 5, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 3043, 3, 'debit', NULL, '2275.000000', NULL, '2022-02-01 00:00:00', 5, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 3043, 3, 'debit', NULL, '14000.000000', NULL, '2022-02-01 00:00:00', 5, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(110, 3043, 3, 'debit', NULL, '16400.000000', NULL, '2022-02-01 00:00:00', 5, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 3043, 3, 'debit', NULL, '126000.000000', NULL, '2022-02-01 00:00:00', 5, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(112, 3043, 3, 'debit', NULL, '0.000000', NULL, '2022-02-01 00:00:00', 5, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 3043, 3, 'debit', NULL, '0.000000', NULL, '2022-02-01 00:00:00', 5, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 3043, 3, 'debit', NULL, '0.000000', NULL, '2022-02-01 00:00:00', 5, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 3043, 3, 'debit', NULL, '0.000000', NULL, '2022-02-01 00:00:00', 5, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(116, 3043, 3, 'debit', NULL, '0.000000', NULL, '2022-02-01 00:00:00', 5, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 3043, 3, 'debit', NULL, '12090.000000', NULL, '2022-02-01 00:00:00', 5, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 3043, 3, 'debit', NULL, '87.250000', NULL, '2022-02-01 00:00:00', 5, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(119, 3043, 3, 'debit', NULL, '2261.800000', NULL, '2022-02-01 00:00:00', 5, 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 3043, 3, 'debit', NULL, '1578.000000', NULL, '2022-02-01 00:00:00', 5, 70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 3043, 3, 'debit', NULL, '450.000000', NULL, '2022-02-01 00:00:00', 5, 71, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 3043, 3, 'debit', NULL, '836.000000', NULL, '2022-02-01 00:00:00', 5, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 3043, 3, 'debit', NULL, '19805.000000', NULL, '2022-02-01 00:00:00', 5, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(124, 3043, 3, 'debit', NULL, '2635.000000', NULL, '2022-02-01 00:00:00', 5, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(125, 3043, 3, 'debit', NULL, '1600.000000', NULL, '2022-02-01 00:00:00', 5, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(126, 3043, 3, 'debit', NULL, '125.000000', NULL, '2022-02-01 00:00:00', 5, 76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(127, 3043, 3, 'debit', NULL, '4950.000000', NULL, '2022-02-01 00:00:00', 5, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(128, 3043, 3, 'debit', NULL, '15000.000000', NULL, '2022-02-01 00:00:00', 5, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(129, 3043, 3, 'debit', NULL, '1050.000000', NULL, '2022-02-01 00:00:00', 5, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(130, 3043, 3, 'debit', NULL, '6480.000000', NULL, '2022-02-01 00:00:00', 5, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 3079, 3, 'credit', NULL, '359358.050000', NULL, '2022-02-01 00:00:00', 5, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(132, 3080, 3, 'credit', 'opening_balance', '667573.500000', NULL, '2022-02-01 00:00:00', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:54:30', '2022-02-03 07:54:30', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(133, 3079, 3, 'debit', 'opening_balance', '667573.500000', NULL, '2022-02-01 00:00:00', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:54:30', '2022-02-03 07:54:30', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(134, 3037, 3, 'debit', 'opening_balance', '363240.000000', NULL, '2022-01-31 00:00:00', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:55:02', '2022-02-03 07:55:02', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(135, 3079, 3, 'credit', 'opening_balance', '363240.000000', NULL, '2022-01-31 00:00:00', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:55:02', '2022-02-03 07:55:02', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(136, 3043, 3, 'credit', NULL, '286644.120000', NULL, '2022-02-01 00:00:00', 5, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(137, 3043, 3, 'credit', NULL, '35200.000000', NULL, '2022-02-01 00:00:00', 5, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 3069, 3, 'debit', 'ledger_show', '286644.120000', NULL, '2022-02-01 00:00:00', 5, 81, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(139, 3075, 3, 'debit', 'ledger_show', '35200.000000', NULL, '2022-02-01 00:00:00', 5, 81, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(140, 3061, 3, 'credit', 'ledger_show', '292494.000000', NULL, '2022-02-01 00:00:00', 5, 81, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(141, 3067, 3, 'credit', 'ledger_show', '42000.000000', NULL, '2022-02-01 00:00:00', 5, 81, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(142, 3040, 3, 'debit', 'ledger_show', '13050.000000', NULL, '2022-02-01 00:00:00', 5, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(143, 3040, 3, 'debit', 'ledger_show', '19000.001000', NULL, '2022-02-01 00:00:00', 5, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(144, 3037, 3, 'debit', NULL, '302444.000000', NULL, '2022-02-01 00:00:00', 5, 81, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(147, 3047, 3, 'credit', NULL, '440000.000000', NULL, '2022-02-01 14:55:00', 5, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:26:40', '2022-02-03 09:26:40', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(148, 3043, 3, 'debit', NULL, '440000.000000', NULL, '2022-02-01 14:55:00', 5, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:26:40', '2022-02-03 09:26:40', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(149, 3037, 3, 'credit', NULL, '180000.000000', NULL, '2022-02-01 14:57:00', 5, 86, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:27:45', '2022-02-03 09:27:45', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(150, 3047, 3, 'debit', NULL, '180000.000000', NULL, '2022-02-01 14:57:00', 5, 86, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:27:45', '2022-02-03 09:27:45', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(151, 3081, 3, 'credit', NULL, '260000.000000', NULL, '2022-02-01 14:58:00', 5, 86, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:29:11', '2022-02-03 09:29:11', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(152, 3047, 3, 'debit', NULL, '260000.000000', NULL, '2022-02-01 14:58:00', 5, 86, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:29:11', '2022-02-03 09:29:11', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(153, 3037, 3, 'credit', 'deposit', '350000.000000', NULL, '2022-02-02 15:09:00', 5, NULL, NULL, 154, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:39:22', '2022-02-03 09:39:22', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(154, 3080, 3, 'debit', 'deposit', '350000.000000', NULL, '2022-02-02 15:09:00', 5, NULL, NULL, 153, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:39:22', '2022-02-03 09:39:22', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(157, 3037, 3, 'credit', NULL, '23.000000', NULL, '2022-02-04 17:26:00', 5, 94, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-04 12:26:41', '2022-02-04 12:26:41', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(158, 3043, 3, 'debit', NULL, '23.000000', NULL, '2022-02-04 17:26:00', 5, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-04 12:26:41', '2022-02-04 12:26:41', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(159, 3037, 3, 'credit', NULL, '23.000000', NULL, '2022-02-04 17:26:00', 5, 95, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-04 12:27:48', '2022-02-04 12:27:48', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(160, 3043, 3, 'debit', NULL, '23.000000', NULL, '2022-02-04 17:26:00', 5, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-04 12:27:48', '2022-02-04 12:27:48', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(161, 2996, 2, 'debit', 'ledger_show', '20000.000000', NULL, '2022-02-14 00:00:00', 2, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-13 19:43:59', '2022-02-13 19:43:59', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(162, 3035, 2, 'credit', NULL, '20000.000000', NULL, '2022-02-14 00:00:00', 2, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-13 19:43:59', '2022-02-13 19:43:59', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(163, 2993, 2, 'debit', NULL, '10000.000000', NULL, '2022-02-14 00:00:00', 2, 97, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-13 19:46:06', '2022-02-13 19:46:06', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(164, 0, NULL, 'credit', NULL, '10000.000000', NULL, '2022-02-14 00:00:00', 2, 97, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-13 19:46:06', '2022-02-13 19:46:06', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(165, 2993, 2, 'debit', NULL, '1000.000000', NULL, '2022-02-14 01:47:00', 2, 1, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-13 20:17:54', '2022-02-13 20:17:54', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(166, 2996, 2, 'credit', 'ledger_show', '1000.000000', NULL, '2022-02-14 01:47:00', 2, 1, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-13 20:17:54', '2022-02-13 20:17:54', 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_account_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `default_account_type_id` bigint(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`id`, `name`, `parent_account_type_id`, `business_id`, `default_account_type_id`, `created_at`, `updated_at`) VALUES
(1, 'Assets', NULL, 1, 1, '2020-06-19 07:24:38', '2020-06-19 07:24:38'),
(2, 'Liabilities', NULL, 1, 2, '2020-06-19 07:24:53', '2020-06-19 07:24:53'),
(3, 'Income', NULL, 1, 3, '2020-06-19 07:25:06', '2020-06-19 07:25:06'),
(4, 'Expenses', NULL, 1, 4, '2020-06-19 07:25:17', '2020-06-19 07:25:17'),
(5, 'Equity', NULL, 1, 5, '2020-06-19 07:25:29', '2020-06-19 07:25:29'),
(6, 'Current Assets', 1, 1, 6, '2020-06-19 07:25:47', '2020-06-19 07:25:47'),
(7, 'Fixed Assets', 1, 1, 7, '2020-06-19 07:26:02', '2020-06-19 07:26:02'),
(8, 'Current Liabilities', 2, 1, 8, '2020-06-19 07:26:20', '2020-06-19 07:26:20'),
(9, 'Long Term Liabilities', 2, 1, 9, '2020-06-19 07:26:35', '2020-06-19 07:26:35'),
(10, 'Assets', NULL, 2, 1, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(11, 'Liabilities', NULL, 2, 2, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(12, 'Income', NULL, 2, 3, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(13, 'Expenses', NULL, 2, 4, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(14, 'Equity', NULL, 2, 5, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(15, 'Current Assets', 10, 2, 6, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(16, 'Fixed Assets', 10, 2, 7, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(17, 'Current Liabilities', 11, 2, 8, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(18, 'Long Term Liabilities', 11, 2, 9, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(19, 'Assets', NULL, 3, 1, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(20, 'Liabilities', NULL, 3, 2, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(21, 'Income', NULL, 3, 3, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(22, 'Expenses', NULL, 3, 4, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(23, 'Equity', NULL, 3, 5, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(24, 'Current Assets', 19, 3, 6, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(25, 'Fixed Assets', 19, 3, 7, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(26, 'Current Liabilities', 20, 3, 8, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(27, 'Long Term Liabilities', 20, 3, 9, '2022-02-03 06:03:22', '2022-02-03 06:03:22');

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'User', 'updated', 1, 'App\\User', 1, 'App\\User', '{\"attributes\":{\"id\":1,\"surname\":null,\"first_name\":\"syzygy\",\"last_name\":null,\"username\":\"syzygy\",\"email\":\"vikum12@gmail.com\",\"password\":\"$2y$10$q22YeidtD2xzY8KofJMvcOfXl7.cZ.P\\/vrsH1OlunHRzign\\/M5UO2\",\"language\":\"sin\",\"contact_no\":null,\"address\":null,\"remember_token\":\"d6G17cAxWTdp36S9ZHH3Aw1Wi1useNn9llwZ2bsq0rrxHfXID7KMFsoihWhX\",\"business_id\":1,\"status\":\"active\",\"is_cmmsn_agnt\":0,\"commission_type\":null,\"cmmsn_percent\":\"0.00\",\"cmmsn_application\":null,\"cmmsn_units\":null,\"selected_contacts\":0,\"dob\":null,\"marital_status\":null,\"blood_group\":null,\"contact_number\":null,\"fb_link\":null,\"twitter_link\":null,\"social_media_1\":null,\"social_media_2\":null,\"permanent_address\":null,\"current_address\":null,\"guardian_name\":null,\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"bank_details\":\"{\\\"account_holder_name\\\":null,\\\"account_number\\\":null,\\\"bank_name\\\":null,\\\"bank_code\\\":null,\\\"branch\\\":null,\\\"tax_payer_id\\\":null}\",\"id_proof_name\":null,\"id_proof_number\":null,\"toggle_popup\":0,\"user_store\":null,\"is_customer\":0,\"is_pump_operator\":0,\"pump_operator_id\":0,\"pump_operator_passcode\":null,\"is_property_user\":0,\"property_user_passcode\":null,\"is_superadmin_default\":0,\"give_away_gifts\":null,\"deleted_at\":null,\"created_at\":\"2019-12-30T11:22:03.000000Z\",\"updated_at\":\"2020-11-16T05:11:28.000000Z\",\"lock_screen\":0,\"max_sales_discount_percent\":null},\"old\":{\"id\":1,\"surname\":null,\"first_name\":\"syzygy\",\"last_name\":null,\"username\":\"syzygy\",\"email\":\"vikum12@gmail.com\",\"password\":\"$2y$10$q22YeidtD2xzY8KofJMvcOfXl7.cZ.P\\/vrsH1OlunHRzign\\/M5UO2\",\"language\":\"sin\",\"contact_no\":null,\"address\":null,\"remember_token\":\"p4kCwxk8OMEINtLrTnW0PeIav3K0VadrhCSF1Xi4NqGBg9k5zpKGXIa0EK3q\",\"business_id\":1,\"status\":\"active\",\"is_cmmsn_agnt\":0,\"commission_type\":null,\"cmmsn_percent\":\"0.00\",\"cmmsn_application\":null,\"cmmsn_units\":null,\"selected_contacts\":0,\"dob\":null,\"marital_status\":null,\"blood_group\":null,\"contact_number\":null,\"fb_link\":null,\"twitter_link\":null,\"social_media_1\":null,\"social_media_2\":null,\"permanent_address\":null,\"current_address\":null,\"guardian_name\":null,\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"bank_details\":\"{\\\"account_holder_name\\\":null,\\\"account_number\\\":null,\\\"bank_name\\\":null,\\\"bank_code\\\":null,\\\"branch\\\":null,\\\"tax_payer_id\\\":null}\",\"id_proof_name\":null,\"id_proof_number\":null,\"toggle_popup\":0,\"user_store\":null,\"is_customer\":0,\"is_pump_operator\":0,\"pump_operator_id\":0,\"pump_operator_passcode\":null,\"is_property_user\":0,\"property_user_passcode\":null,\"is_superadmin_default\":0,\"give_away_gifts\":null,\"deleted_at\":null,\"created_at\":\"2019-12-30T11:22:03.000000Z\",\"updated_at\":\"2020-11-16T05:11:28.000000Z\",\"lock_screen\":0,\"max_sales_discount_percent\":null}}', '2022-02-04 09:40:01', '2022-02-04 09:40:01'),
(2, 'User', 'updated', 5, 'App\\User', 5, 'App\\User', '{\"attributes\":{\"id\":5,\"surname\":\"Ms\",\"first_name\":\"LKD\",\"last_name\":\"1\",\"username\":\"LKD\",\"email\":\"LKD-B@1.COM\",\"password\":\"$2y$10$uzbISgHK5dx1agFtzQ7lEO9cP5Esc3D0zjEqS9AA6dm9QNZ2yUlxe\",\"language\":\"en\",\"contact_no\":null,\"address\":null,\"remember_token\":null,\"business_id\":3,\"status\":\"active\",\"is_cmmsn_agnt\":0,\"commission_type\":null,\"cmmsn_percent\":\"0.00\",\"cmmsn_application\":null,\"cmmsn_units\":null,\"selected_contacts\":0,\"dob\":null,\"marital_status\":null,\"blood_group\":null,\"contact_number\":null,\"fb_link\":null,\"twitter_link\":null,\"social_media_1\":null,\"social_media_2\":null,\"permanent_address\":null,\"current_address\":null,\"guardian_name\":null,\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"bank_details\":\"{\\\"account_holder_name\\\":null,\\\"account_number\\\":null,\\\"bank_name\\\":null,\\\"bank_code\\\":null,\\\"branch\\\":null,\\\"tax_payer_id\\\":null}\",\"id_proof_name\":null,\"id_proof_number\":null,\"toggle_popup\":0,\"user_store\":null,\"is_customer\":0,\"is_pump_operator\":0,\"pump_operator_id\":0,\"pump_operator_passcode\":null,\"is_property_user\":0,\"property_user_passcode\":null,\"is_superadmin_default\":0,\"give_away_gifts\":null,\"deleted_at\":null,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T09:42:47.000000Z\",\"lock_screen\":0,\"max_sales_discount_percent\":null},\"old\":{\"id\":5,\"surname\":\"Ms\",\"first_name\":\"Lanka Kerosene Depot\",\"last_name\":\"karukupone\",\"username\":\"LKD\",\"email\":\"LKD-B@1.COM\",\"password\":\"$2y$10$uzbISgHK5dx1agFtzQ7lEO9cP5Esc3D0zjEqS9AA6dm9QNZ2yUlxe\",\"language\":\"en\",\"contact_no\":null,\"address\":null,\"remember_token\":null,\"business_id\":3,\"status\":\"active\",\"is_cmmsn_agnt\":0,\"commission_type\":null,\"cmmsn_percent\":\"0.00\",\"cmmsn_application\":null,\"cmmsn_units\":null,\"selected_contacts\":0,\"dob\":null,\"marital_status\":null,\"blood_group\":null,\"contact_number\":null,\"fb_link\":null,\"twitter_link\":null,\"social_media_1\":null,\"social_media_2\":null,\"permanent_address\":null,\"current_address\":null,\"guardian_name\":null,\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"bank_details\":null,\"id_proof_name\":null,\"id_proof_number\":null,\"toggle_popup\":0,\"user_store\":null,\"is_customer\":0,\"is_pump_operator\":0,\"pump_operator_id\":0,\"pump_operator_passcode\":null,\"is_property_user\":0,\"property_user_passcode\":null,\"is_superadmin_default\":0,\"give_away_gifts\":null,\"deleted_at\":null,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T09:39:44.000000Z\",\"lock_screen\":0,\"max_sales_discount_percent\":null}}', '2022-02-04 09:42:47', '2022-02-04 09:42:47'),
(3, 'Reference Count', 'updated', 4, 'App\\ReferenceCount', 5, 'App\\User', '{\"attributes\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":71,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T09:43:02.000000Z\"},\"old\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":70,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T08:05:08.000000Z\"}}', '2022-02-04 09:43:02', '2022-02-04 09:43:02'),
(11, 'Reference Count', 'updated', 4, 'App\\ReferenceCount', 5, 'App\\User', '{\"attributes\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":72,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T11:06:18.000000Z\"},\"old\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":71,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T09:43:02.000000Z\"}}', '2022-02-04 11:06:18', '2022-02-04 11:06:18'),
(12, 'Product', 'created', 43, 'App\\Product', 5, 'App\\User', '{\"attributes\":{\"id\":43,\"name\":\"test\",\"business_id\":3,\"type\":\"single\",\"unit_id\":5,\"sub_unit_ids\":null,\"brand_id\":null,\"category_id\":null,\"sub_category_id\":null,\"tax\":null,\"tax_type\":\"exclusive\",\"enable_stock\":1,\"raw_material\":0,\"alert_quantity\":null,\"sku\":\" \",\"barcode_type\":\"C128\",\"expiry_period\":null,\"expiry_period_type\":null,\"enable_sr_no\":0,\"weight\":null,\"product_custom_field1\":null,\"product_custom_field2\":null,\"product_custom_field3\":null,\"product_custom_field4\":null,\"image\":null,\"product_description\":null,\"created_by\":5,\"warranty_id\":null,\"is_inactive\":0,\"not_for_selling\":0,\"show_avai_qty_in_qr_catalogue\":0,\"show_in_catalogue_page\":0,\"min_sell_price\":0,\"is_medicine\":0,\"country\":null,\"created_at\":\"2022-02-04T11:08:02.000000Z\",\"updated_at\":\"2022-02-04T11:08:02.000000Z\",\"multiple_units\":0,\"stock_type\":null,\"repair_model_id\":null,\"date\":null,\"is_service\":0}}', '2022-02-04 11:08:02', '2022-02-04 11:08:02'),
(13, 'Product', 'updated', 43, 'App\\Product', 5, 'App\\User', '{\"attributes\":{\"id\":43,\"name\":\"test\",\"business_id\":3,\"type\":\"single\",\"unit_id\":5,\"sub_unit_ids\":null,\"brand_id\":null,\"category_id\":null,\"sub_category_id\":null,\"tax\":null,\"tax_type\":\"exclusive\",\"enable_stock\":1,\"raw_material\":0,\"alert_quantity\":null,\"sku\":\"0043\",\"barcode_type\":\"C128\",\"expiry_period\":null,\"expiry_period_type\":null,\"enable_sr_no\":0,\"weight\":null,\"product_custom_field1\":null,\"product_custom_field2\":null,\"product_custom_field3\":null,\"product_custom_field4\":null,\"image\":null,\"product_description\":null,\"created_by\":5,\"warranty_id\":null,\"is_inactive\":0,\"not_for_selling\":0,\"show_avai_qty_in_qr_catalogue\":0,\"show_in_catalogue_page\":0,\"min_sell_price\":0,\"is_medicine\":0,\"country\":null,\"created_at\":\"2022-02-04T11:08:02.000000Z\",\"updated_at\":\"2022-02-04T11:08:02.000000Z\",\"multiple_units\":0,\"stock_type\":null,\"repair_model_id\":null,\"date\":null,\"is_service\":0},\"old\":{\"id\":43,\"name\":\"test\",\"business_id\":3,\"type\":\"single\",\"unit_id\":\"5\",\"sub_unit_ids\":null,\"brand_id\":null,\"category_id\":null,\"sub_category_id\":null,\"tax\":null,\"tax_type\":\"exclusive\",\"enable_stock\":1,\"raw_material\":null,\"alert_quantity\":null,\"sku\":\" \",\"barcode_type\":\"C128\",\"expiry_period\":null,\"expiry_period_type\":null,\"enable_sr_no\":null,\"weight\":null,\"product_custom_field1\":null,\"product_custom_field2\":null,\"product_custom_field3\":null,\"product_custom_field4\":null,\"image\":null,\"product_description\":null,\"created_by\":5,\"warranty_id\":null,\"is_inactive\":null,\"not_for_selling\":null,\"show_avai_qty_in_qr_catalogue\":null,\"show_in_catalogue_page\":null,\"min_sell_price\":null,\"is_medicine\":null,\"country\":null,\"created_at\":\"2022-02-04T11:08:02.000000Z\",\"updated_at\":\"2022-02-04T11:08:02.000000Z\",\"multiple_units\":null,\"stock_type\":null,\"repair_model_id\":null,\"date\":null,\"is_service\":null}}', '2022-02-04 11:08:02', '2022-02-04 11:08:02'),
(14, 'Product Variation', 'created', 43, 'App\\ProductVariation', 5, 'App\\User', '{\"attributes\":{\"id\":43,\"variation_template_id\":null,\"name\":\"DUMMY\",\"product_id\":43,\"is_dummy\":1,\"created_at\":\"2022-02-04T11:08:02.000000Z\",\"updated_at\":\"2022-02-04T11:08:02.000000Z\"}}', '2022-02-04 11:08:02', '2022-02-04 11:08:02'),
(15, 'Variation', 'created', 43, 'App\\Variation', 5, 'App\\User', '{\"attributes\":{\"id\":43,\"name\":\"DUMMY\",\"product_id\":43,\"sub_sku\":\"0043\",\"product_variation_id\":43,\"variation_value_id\":null,\"default_purchase_price\":\"6666.000000\",\"dpp_inc_tax\":\"6666.000000\",\"profit_percent\":\"25.0000\",\"default_sell_price\":\"8332.500000\",\"sell_price_inc_tax\":\"8332.500000\",\"created_at\":\"2022-02-04T11:08:02.000000Z\",\"updated_at\":\"2022-02-04T11:08:02.000000Z\",\"deleted_at\":null,\"combo_variations\":[],\"default_multiple_unit_price\":null}}', '2022-02-04 11:08:02', '2022-02-04 11:08:02'),
(16, 'Reference Count', 'updated', 4, 'App\\ReferenceCount', 5, 'App\\User', '{\"attributes\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":73,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T11:08:31.000000Z\"},\"old\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":72,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T11:06:18.000000Z\"}}', '2022-02-04 11:08:31', '2022-02-04 11:08:31'),
(17, 'Reference Count', 'updated', 4, 'App\\ReferenceCount', 5, 'App\\User', '{\"attributes\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":74,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T11:55:58.000000Z\"},\"old\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":73,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T11:08:31.000000Z\"}}', '2022-02-04 11:55:58', '2022-02-04 11:55:58'),
(18, 'Reference Count', 'updated', 4, 'App\\ReferenceCount', 5, 'App\\User', '{\"attributes\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":75,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T11:56:32.000000Z\"},\"old\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":74,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T11:55:58.000000Z\"}}', '2022-02-04 11:56:32', '2022-02-04 11:56:32'),
(19, 'Reference Count', 'updated', 4, 'App\\ReferenceCount', 5, 'App\\User', '{\"attributes\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":76,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T12:01:09.000000Z\"},\"old\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":75,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T11:56:32.000000Z\"}}', '2022-02-04 12:01:09', '2022-02-04 12:01:09'),
(20, 'User', 'updated', 5, 'App\\User', 5, 'App\\User', '{\"attributes\":{\"id\":5,\"surname\":\"Ms\",\"first_name\":\"LKD\",\"last_name\":\"1\",\"username\":\"LKD\",\"email\":\"LKD-B@1.COM\",\"password\":\"$2y$10$uzbISgHK5dx1agFtzQ7lEO9cP5Esc3D0zjEqS9AA6dm9QNZ2yUlxe\",\"language\":\"en\",\"contact_no\":null,\"address\":null,\"remember_token\":\"6Q5b4gHudoDPuu2aY8LuEHajIJkH5inootlkWrDpVJkDeVvVmq5C2RHKi4Oa\",\"business_id\":3,\"status\":\"active\",\"is_cmmsn_agnt\":0,\"commission_type\":null,\"cmmsn_percent\":\"0.00\",\"cmmsn_application\":null,\"cmmsn_units\":null,\"selected_contacts\":0,\"dob\":null,\"marital_status\":null,\"blood_group\":null,\"contact_number\":null,\"fb_link\":null,\"twitter_link\":null,\"social_media_1\":null,\"social_media_2\":null,\"permanent_address\":null,\"current_address\":null,\"guardian_name\":null,\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"bank_details\":\"{\\\"account_holder_name\\\":null,\\\"account_number\\\":null,\\\"bank_name\\\":null,\\\"bank_code\\\":null,\\\"branch\\\":null,\\\"tax_payer_id\\\":null}\",\"id_proof_name\":null,\"id_proof_number\":null,\"toggle_popup\":0,\"user_store\":null,\"is_customer\":0,\"is_pump_operator\":0,\"pump_operator_id\":0,\"pump_operator_passcode\":null,\"is_property_user\":0,\"property_user_passcode\":null,\"is_superadmin_default\":0,\"give_away_gifts\":null,\"deleted_at\":null,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T09:42:47.000000Z\",\"lock_screen\":0,\"max_sales_discount_percent\":null},\"old\":{\"id\":5,\"surname\":\"Ms\",\"first_name\":\"LKD\",\"last_name\":\"1\",\"username\":\"LKD\",\"email\":\"LKD-B@1.COM\",\"password\":\"$2y$10$uzbISgHK5dx1agFtzQ7lEO9cP5Esc3D0zjEqS9AA6dm9QNZ2yUlxe\",\"language\":\"en\",\"contact_no\":null,\"address\":null,\"remember_token\":null,\"business_id\":3,\"status\":\"active\",\"is_cmmsn_agnt\":0,\"commission_type\":null,\"cmmsn_percent\":\"0.00\",\"cmmsn_application\":null,\"cmmsn_units\":null,\"selected_contacts\":0,\"dob\":null,\"marital_status\":null,\"blood_group\":null,\"contact_number\":null,\"fb_link\":null,\"twitter_link\":null,\"social_media_1\":null,\"social_media_2\":null,\"permanent_address\":null,\"current_address\":null,\"guardian_name\":null,\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"bank_details\":\"{\\\"account_holder_name\\\":null,\\\"account_number\\\":null,\\\"bank_name\\\":null,\\\"bank_code\\\":null,\\\"branch\\\":null,\\\"tax_payer_id\\\":null}\",\"id_proof_name\":null,\"id_proof_number\":null,\"toggle_popup\":0,\"user_store\":null,\"is_customer\":0,\"is_pump_operator\":0,\"pump_operator_id\":0,\"pump_operator_passcode\":null,\"is_property_user\":0,\"property_user_passcode\":null,\"is_superadmin_default\":0,\"give_away_gifts\":null,\"deleted_at\":null,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T09:42:47.000000Z\",\"lock_screen\":0,\"max_sales_discount_percent\":null}}', '2022-02-04 12:02:52', '2022-02-04 12:02:52'),
(21, 'Reference Count', 'updated', 4, 'App\\ReferenceCount', 5, 'App\\User', '{\"attributes\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":77,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T12:03:40.000000Z\"},\"old\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":76,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T12:01:09.000000Z\"}}', '2022-02-04 12:03:40', '2022-02-04 12:03:40'),
(22, 'Reference Count', 'updated', 4, 'App\\ReferenceCount', 5, 'App\\User', '{\"attributes\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":78,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T12:04:44.000000Z\"},\"old\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":77,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T12:03:40.000000Z\"}}', '2022-02-04 12:04:44', '2022-02-04 12:04:44'),
(39, 'Reference Count', 'updated', 9, 'App\\ReferenceCount', 5, 'App\\User', '{\"attributes\":{\"id\":9,\"ref_type\":\"purchase\",\"ref_count\":2,\"business_id\":3,\"created_at\":\"2022-02-03T09:26:40.000000Z\",\"updated_at\":\"2022-02-04T12:26:41.000000Z\"},\"old\":{\"id\":9,\"ref_type\":\"purchase\",\"ref_count\":1,\"business_id\":3,\"created_at\":\"2022-02-03T09:26:40.000000Z\",\"updated_at\":\"2022-02-03T09:26:40.000000Z\"}}', '2022-02-04 12:26:41', '2022-02-04 12:26:41'),
(40, 'Transaction', 'created', 94, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"id\":94,\"business_id\":3,\"location_id\":3,\"res_table_id\":null,\"res_waiter_id\":null,\"res_order_status\":null,\"type\":\"purchase\",\"store_id\":6,\"sub_type\":null,\"status\":\"received\",\"cheque_return_charges\":\"0.000000\",\"need_to_reserve\":null,\"is_credit_sale\":0,\"credit_sale_id\":null,\"is_over_limit_credit_sale\":0,\"customer_limit\":\"0.000000\",\"over_limit_amount\":\"0.000000\",\"approved_user\":null,\"requested_by\":null,\"order_no\":null,\"order_date\":null,\"customer_ref\":null,\"is_quotation\":0,\"is_customer_order\":0,\"order_status\":null,\"payment_status\":\"due\",\"price_later\":0,\"adjustment_type\":null,\"contact_id\":50,\"pump_operator_id\":null,\"customer_group_id\":null,\"invoice_no\":\"PO2\",\"purchase_entry_no\":null,\"deed_no\":null,\"deed_date\":null,\"ref_no\":\"786\",\"subscription_no\":null,\"transaction_date\":\"2022-02-04T11:56:00.000000Z\",\"total_before_tax\":\"23.000000\",\"tax_id\":null,\"tax_amount\":\"0.000000\",\"discount_type\":null,\"discount_amount\":\"0.000000\",\"rp_redeemed\":0,\"rp_redeemed_amount\":\"0.000000\",\"shipping_details\":null,\"shipping_address\":null,\"shipping_status\":null,\"delivered_to\":null,\"shipping_charges\":\"0.000000\",\"additional_notes\":null,\"staff_note\":null,\"final_total\":\"23.000000\",\"amount_paid_from_advance\":\"0.000000\",\"expense_category_id\":null,\"expense_for\":null,\"fleet_id\":null,\"property_id\":null,\"expense_account\":null,\"controller_account\":null,\"commission_agent\":null,\"document\":null,\"is_direct_sale\":0,\"is_suspend\":0,\"exchange_rate\":\"1.000000\",\"total_amount_recovered\":null,\"transfer_parent_id\":null,\"return_parent_id\":null,\"is_pos_return\":0,\"pos_invoice_return\":null,\"opening_stock_product_id\":null,\"created_by\":5,\"import_batch\":null,\"import_time\":null,\"types_of_service_id\":null,\"packing_charge\":null,\"packing_charge_type\":null,\"service_custom_field_1\":null,\"service_custom_field_2\":null,\"service_custom_field_3\":null,\"service_custom_field_4\":null,\"mfg_parent_production_purchase_id\":null,\"mfg_wasted_units\":null,\"mfg_production_cost\":\"0.000000\",\"mfg_is_final\":0,\"is_created_from_api\":0,\"rp_earned\":0,\"from_store\":null,\"order_addresses\":null,\"is_recurring\":0,\"recur_interval\":null,\"recur_interval_type\":null,\"recur_repetitions\":null,\"recur_stopped_on\":null,\"recur_parent_id\":null,\"invoice_token\":null,\"pay_term_number\":null,\"pay_term_type\":\"days\",\"selling_price_group_id\":null,\"is_duplicate\":0,\"is_settlement\":0,\"deleted_by\":null,\"created_at\":\"2022-02-04T12:26:41.000000Z\",\"updated_at\":\"2022-02-04T12:26:41.000000Z\",\"imported\":0,\"advance_remaining\":\"0.000000\",\"deleted_at\":null,\"repair_brand_id\":null,\"repair_checklist\":null,\"repair_completed_on\":null,\"repair_defects\":null,\"repair_device_id\":null,\"repair_due_date\":null,\"repair_model_id\":null,\"repair_security_pattern\":null,\"repair_security_pwd\":null,\"repair_serial_no\":null,\"repair_status_id\":null,\"repair_updates_notif\":0,\"repair_warranty_id\":null,\"subscription_repeat_on\":null,\"repair_job_sheet_id\":null,\"finance_option_id\":null,\"balance_quantity\":\"0\",\"From_Account\":1,\"To_Account\":1}}', '2022-02-04 12:26:41', '2022-02-04 12:26:41'),
(41, 'Variation Location Details', 'updated', 18, 'App\\VariationLocationDetails', 5, 'App\\User', '{\"attributes\":{\"id\":18,\"product_id\":21,\"product_variation_id\":21,\"variation_id\":21,\"location_id\":3,\"qty_available\":\"70.0000\",\"created_at\":\"2022-02-03T07:49:47.000000Z\",\"updated_at\":\"2022-02-04T12:26:41.000000Z\"},\"old\":{\"id\":18,\"product_id\":21,\"product_variation_id\":21,\"variation_id\":21,\"location_id\":3,\"qty_available\":\"69.0000\",\"created_at\":\"2022-02-03T07:49:47.000000Z\",\"updated_at\":\"2022-02-03T07:49:47.000000Z\"}}', '2022-02-04 12:26:41', '2022-02-04 12:26:41'),
(42, 'Variation Store Details', 'updated', 17, 'App\\VariationStoreDetail', 5, 'App\\User', '{\"attributes\":{\"id\":17,\"product_id\":21,\"product_variation_id\":21,\"variation_id\":21,\"store_id\":6,\"qty_available\":\"70.0000\",\"created_at\":\"2022-02-03T07:49:47.000000Z\",\"updated_at\":\"2022-02-04T12:26:41.000000Z\"},\"old\":{\"id\":17,\"product_id\":21,\"product_variation_id\":21,\"variation_id\":21,\"store_id\":6,\"qty_available\":\"69.0000\",\"created_at\":\"2022-02-03T07:49:47.000000Z\",\"updated_at\":\"2022-02-03T07:49:47.000000Z\"}}', '2022-02-04 12:26:41', '2022-02-04 12:26:41'),
(43, 'Variation', 'updated', 21, 'App\\Variation', 5, 'App\\User', '{\"attributes\":{\"id\":21,\"name\":\"DUMMY\",\"product_id\":21,\"sub_sku\":\"C1\",\"product_variation_id\":21,\"variation_value_id\":null,\"default_purchase_price\":\"23.000000\",\"dpp_inc_tax\":\"23.000000\",\"profit_percent\":\"-100.0000\",\"default_sell_price\":\"0.000000\",\"sell_price_inc_tax\":\"0.000000\",\"created_at\":\"2022-02-03T07:49:47.000000Z\",\"updated_at\":\"2022-02-04T12:26:41.000000Z\",\"deleted_at\":null,\"combo_variations\":[],\"default_multiple_unit_price\":null},\"old\":{\"id\":21,\"name\":\"DUMMY\",\"product_id\":21,\"sub_sku\":\"C1\",\"product_variation_id\":21,\"variation_value_id\":null,\"default_purchase_price\":\"0.000000\",\"dpp_inc_tax\":\"0.000000\",\"profit_percent\":\"25.0000\",\"default_sell_price\":\"0.000000\",\"sell_price_inc_tax\":\"0.000000\",\"created_at\":\"2022-02-03T07:49:47.000000Z\",\"updated_at\":\"2022-02-03T07:49:47.000000Z\",\"deleted_at\":null,\"combo_variations\":[],\"default_multiple_unit_price\":null}}', '2022-02-04 12:26:41', '2022-02-04 12:26:41'),
(44, 'Purchase Line', 'created', 48, 'App\\PurchaseLine', 5, 'App\\User', '{\"attributes\":{\"id\":48,\"transaction_id\":94,\"product_id\":21,\"variation_id\":21,\"quantity\":1,\"bonus_qty\":\"0.000000\",\"pp_without_discount\":\"23.000000\",\"discount_percent\":\"0.000000\",\"purchase_price\":\"23.000000\",\"purchase_price_inc_tax\":\"23.000000\",\"item_tax\":\"0.000000\",\"tax_id\":null,\"quantity_sold\":\"0.000000\",\"quantity_adjusted\":\"0.000000\",\"quantity_returned\":\"0.000000\",\"mfg_quantity_used\":\"0.000000\",\"mfg_date\":null,\"exp_date\":null,\"lot_number\":null,\"sub_unit_id\":null,\"created_at\":\"2022-02-04T12:26:41.000000Z\",\"updated_at\":\"2022-02-04T12:26:41.000000Z\",\"deleted_at\":null}}', '2022-02-04 12:26:41', '2022-02-04 12:26:41'),
(45, 'Reference Count', 'updated', 10, 'App\\ReferenceCount', 5, 'App\\User', '{\"attributes\":{\"id\":10,\"ref_type\":\"purchase_payment\",\"ref_count\":3,\"business_id\":3,\"created_at\":\"2022-02-03T09:27:45.000000Z\",\"updated_at\":\"2022-02-04T12:26:41.000000Z\"},\"old\":{\"id\":10,\"ref_type\":\"purchase_payment\",\"ref_count\":2,\"business_id\":3,\"created_at\":\"2022-02-03T09:27:45.000000Z\",\"updated_at\":\"2022-02-03T09:29:11.000000Z\"}}', '2022-02-04 12:26:41', '2022-02-04 12:26:41'),
(46, 'Transaction Payment', 'created', 13, 'App\\TransactionPayment', 5, 'App\\User', '{\"attributes\":{\"id\":13,\"transaction_id\":94,\"business_id\":3,\"is_return\":0,\"amount\":\"23.000000\",\"method\":\"cash\",\"transaction_no\":null,\"card_transaction_number\":null,\"card_number\":null,\"card_type\":null,\"card_holder_name\":null,\"card_month\":null,\"card_year\":null,\"card_security\":null,\"cheque_number\":null,\"cheque_date\":\"2022-02-04\",\"bank_name\":null,\"bank_account_number\":null,\"transfer_date\":null,\"paid_on\":\"2022-02-04 17:26:00\",\"created_by\":5,\"payment_for\":50,\"parent_id\":null,\"note\":null,\"document\":null,\"payment_option_id\":null,\"is_deposited\":0,\"payment_ref_no\":\"PP2022\\/0003\",\"account_id\":3037,\"double_entry_account\":null,\"receivable_account\":null,\"paid_in_type\":null,\"deleted_at\":null,\"created_at\":\"2022-02-04T12:26:41.000000Z\",\"updated_at\":\"2022-02-04T12:26:41.000000Z\",\"reference_no\":null}}', '2022-02-04 12:26:41', '2022-02-04 12:26:41'),
(47, 'default', 'created', 157, 'App\\AccountTransaction', 5, 'App\\User', '{\"attributes\":{\"id\":157,\"account_id\":3037,\"business_id\":3,\"type\":\"credit\",\"sub_type\":null,\"amount\":\"23.000000\",\"reff_no\":null,\"operation_date\":\"2022-02-04T11:56:00.000000Z\",\"created_by\":5,\"transaction_id\":94,\"transaction_payment_id\":13,\"transfer_transaction_id\":null,\"transaction_sell_line_id\":null,\"sell_line_id\":null,\"purchase_line_id\":null,\"income_type\":null,\"note\":null,\"attachment\":null,\"cheque_number\":null,\"journal_entry\":null,\"journal_deleted\":0,\"installment_id\":null,\"updated_type\":null,\"updated_by\":null,\"deleted_by\":null,\"deleted_at\":null,\"created_at\":\"2022-02-04T12:26:41.000000Z\",\"updated_at\":\"2022-02-04T12:26:41.000000Z\",\"reconcile_status\":0,\"interest\":null,\"payment_option_id\":null,\"bank_name\":null,\"cheque_numbers\":null,\"cheque_date\":null,\"payment_method\":null}}', '2022-02-04 12:26:41', '2022-02-04 12:26:41'),
(48, 'Contact Ledger', 'created', 48, 'App\\ContactLedger', 5, 'App\\User', '{\"attributes\":{\"id\":48,\"contact_id\":50,\"type\":\"credit\",\"sub_type\":null,\"amount\":\"23.0000\",\"reff_no\":null,\"operation_date\":\"2022-02-04 17:26:00\",\"created_by\":5,\"transaction_id\":94,\"transaction_payment_id\":13,\"transaction_sell_line_id\":null,\"income_type\":null,\"installment_id\":null,\"note\":null,\"deleted_by\":null,\"deleted_at\":null,\"created_at\":\"2022-02-04T12:26:41.000000Z\",\"updated_at\":\"2022-02-04T12:26:41.000000Z\",\"payment_option_id\":null}}', '2022-02-04 12:26:41', '2022-02-04 12:26:41'),
(49, 'Contact Ledger', 'created', 49, 'App\\ContactLedger', 5, 'App\\User', '{\"attributes\":{\"id\":49,\"contact_id\":50,\"type\":\"debit\",\"sub_type\":null,\"amount\":\"23.0000\",\"reff_no\":null,\"operation_date\":\"2022-02-04 17:26:00\",\"created_by\":5,\"transaction_id\":94,\"transaction_payment_id\":13,\"transaction_sell_line_id\":null,\"income_type\":null,\"installment_id\":null,\"note\":null,\"deleted_by\":null,\"deleted_at\":null,\"created_at\":\"2022-02-04T12:26:41.000000Z\",\"updated_at\":\"2022-02-04T12:26:41.000000Z\",\"payment_option_id\":null}}', '2022-02-04 12:26:41', '2022-02-04 12:26:41'),
(50, 'default', 'created', 158, 'App\\AccountTransaction', 5, 'App\\User', '{\"attributes\":{\"id\":158,\"account_id\":3043,\"business_id\":3,\"type\":\"debit\",\"sub_type\":null,\"amount\":\"23.000000\",\"reff_no\":null,\"operation_date\":\"2022-02-04T11:56:00.000000Z\",\"created_by\":5,\"transaction_id\":94,\"transaction_payment_id\":null,\"transfer_transaction_id\":null,\"transaction_sell_line_id\":null,\"sell_line_id\":null,\"purchase_line_id\":null,\"income_type\":null,\"note\":null,\"attachment\":null,\"cheque_number\":null,\"journal_entry\":null,\"journal_deleted\":0,\"installment_id\":null,\"updated_type\":null,\"updated_by\":null,\"deleted_by\":null,\"deleted_at\":null,\"created_at\":\"2022-02-04T12:26:41.000000Z\",\"updated_at\":\"2022-02-04T12:26:41.000000Z\",\"reconcile_status\":0,\"interest\":null,\"payment_option_id\":null,\"bank_name\":null,\"cheque_numbers\":null,\"cheque_date\":null,\"payment_method\":null}}', '2022-02-04 12:26:41', '2022-02-04 12:26:41'),
(51, 'Reference Count', 'updated', 9, 'App\\ReferenceCount', 5, 'App\\User', '{\"attributes\":{\"id\":9,\"ref_type\":\"purchase\",\"ref_count\":3,\"business_id\":3,\"created_at\":\"2022-02-03T09:26:40.000000Z\",\"updated_at\":\"2022-02-04T12:27:47.000000Z\"},\"old\":{\"id\":9,\"ref_type\":\"purchase\",\"ref_count\":2,\"business_id\":3,\"created_at\":\"2022-02-03T09:26:40.000000Z\",\"updated_at\":\"2022-02-04T12:26:41.000000Z\"}}', '2022-02-04 12:27:47', '2022-02-04 12:27:47'),
(52, 'Transaction', 'created', 95, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"id\":95,\"business_id\":3,\"location_id\":3,\"res_table_id\":null,\"res_waiter_id\":null,\"res_order_status\":null,\"type\":\"purchase\",\"store_id\":6,\"sub_type\":null,\"status\":\"received\",\"cheque_return_charges\":\"0.000000\",\"need_to_reserve\":null,\"is_credit_sale\":0,\"credit_sale_id\":null,\"is_over_limit_credit_sale\":0,\"customer_limit\":\"0.000000\",\"over_limit_amount\":\"0.000000\",\"approved_user\":null,\"requested_by\":null,\"order_no\":null,\"order_date\":null,\"customer_ref\":null,\"is_quotation\":0,\"is_customer_order\":0,\"order_status\":null,\"payment_status\":\"due\",\"price_later\":0,\"adjustment_type\":null,\"contact_id\":50,\"pump_operator_id\":null,\"customer_group_id\":null,\"invoice_no\":\"PO2\",\"purchase_entry_no\":null,\"deed_no\":null,\"deed_date\":null,\"ref_no\":\"786\",\"subscription_no\":null,\"transaction_date\":\"2022-02-04T11:56:00.000000Z\",\"total_before_tax\":\"23.000000\",\"tax_id\":null,\"tax_amount\":\"0.000000\",\"discount_type\":null,\"discount_amount\":\"0.000000\",\"rp_redeemed\":0,\"rp_redeemed_amount\":\"0.000000\",\"shipping_details\":null,\"shipping_address\":null,\"shipping_status\":null,\"delivered_to\":null,\"shipping_charges\":\"0.000000\",\"additional_notes\":null,\"staff_note\":null,\"final_total\":\"23.000000\",\"amount_paid_from_advance\":\"0.000000\",\"expense_category_id\":null,\"expense_for\":null,\"fleet_id\":null,\"property_id\":null,\"expense_account\":null,\"controller_account\":null,\"commission_agent\":null,\"document\":null,\"is_direct_sale\":0,\"is_suspend\":0,\"exchange_rate\":\"1.000000\",\"total_amount_recovered\":null,\"transfer_parent_id\":null,\"return_parent_id\":null,\"is_pos_return\":0,\"pos_invoice_return\":null,\"opening_stock_product_id\":null,\"created_by\":5,\"import_batch\":null,\"import_time\":null,\"types_of_service_id\":null,\"packing_charge\":null,\"packing_charge_type\":null,\"service_custom_field_1\":null,\"service_custom_field_2\":null,\"service_custom_field_3\":null,\"service_custom_field_4\":null,\"mfg_parent_production_purchase_id\":null,\"mfg_wasted_units\":null,\"mfg_production_cost\":\"0.000000\",\"mfg_is_final\":0,\"is_created_from_api\":0,\"rp_earned\":0,\"from_store\":null,\"order_addresses\":null,\"is_recurring\":0,\"recur_interval\":null,\"recur_interval_type\":null,\"recur_repetitions\":null,\"recur_stopped_on\":null,\"recur_parent_id\":null,\"invoice_token\":null,\"pay_term_number\":null,\"pay_term_type\":\"days\",\"selling_price_group_id\":null,\"is_duplicate\":0,\"is_settlement\":0,\"deleted_by\":null,\"created_at\":\"2022-02-04T12:27:47.000000Z\",\"updated_at\":\"2022-02-04T12:27:47.000000Z\",\"imported\":0,\"advance_remaining\":\"0.000000\",\"deleted_at\":null,\"repair_brand_id\":null,\"repair_checklist\":null,\"repair_completed_on\":null,\"repair_defects\":null,\"repair_device_id\":null,\"repair_due_date\":null,\"repair_model_id\":null,\"repair_security_pattern\":null,\"repair_security_pwd\":null,\"repair_serial_no\":null,\"repair_status_id\":null,\"repair_updates_notif\":0,\"repair_warranty_id\":null,\"subscription_repeat_on\":null,\"repair_job_sheet_id\":null,\"finance_option_id\":null,\"balance_quantity\":\"0\",\"From_Account\":1,\"To_Account\":1}}', '2022-02-04 12:27:47', '2022-02-04 12:27:47'),
(53, 'Variation Location Details', 'updated', 18, 'App\\VariationLocationDetails', 5, 'App\\User', '{\"attributes\":{\"id\":18,\"product_id\":21,\"product_variation_id\":21,\"variation_id\":21,\"location_id\":3,\"qty_available\":\"71.0000\",\"created_at\":\"2022-02-03T07:49:47.000000Z\",\"updated_at\":\"2022-02-04T12:27:47.000000Z\"},\"old\":{\"id\":18,\"product_id\":21,\"product_variation_id\":21,\"variation_id\":21,\"location_id\":3,\"qty_available\":\"70.0000\",\"created_at\":\"2022-02-03T07:49:47.000000Z\",\"updated_at\":\"2022-02-04T12:26:41.000000Z\"}}', '2022-02-04 12:27:47', '2022-02-04 12:27:47'),
(54, 'Variation Store Details', 'updated', 17, 'App\\VariationStoreDetail', 5, 'App\\User', '{\"attributes\":{\"id\":17,\"product_id\":21,\"product_variation_id\":21,\"variation_id\":21,\"store_id\":6,\"qty_available\":\"71.0000\",\"created_at\":\"2022-02-03T07:49:47.000000Z\",\"updated_at\":\"2022-02-04T12:27:47.000000Z\"},\"old\":{\"id\":17,\"product_id\":21,\"product_variation_id\":21,\"variation_id\":21,\"store_id\":6,\"qty_available\":\"70.0000\",\"created_at\":\"2022-02-03T07:49:47.000000Z\",\"updated_at\":\"2022-02-04T12:26:41.000000Z\"}}', '2022-02-04 12:27:47', '2022-02-04 12:27:47'),
(55, 'Purchase Line', 'created', 49, 'App\\PurchaseLine', 5, 'App\\User', '{\"attributes\":{\"id\":49,\"transaction_id\":95,\"product_id\":21,\"variation_id\":21,\"quantity\":1,\"bonus_qty\":\"0.000000\",\"pp_without_discount\":\"23.000000\",\"discount_percent\":\"0.000000\",\"purchase_price\":\"23.000000\",\"purchase_price_inc_tax\":\"23.000000\",\"item_tax\":\"0.000000\",\"tax_id\":null,\"quantity_sold\":\"0.000000\",\"quantity_adjusted\":\"0.000000\",\"quantity_returned\":\"0.000000\",\"mfg_quantity_used\":\"0.000000\",\"mfg_date\":null,\"exp_date\":null,\"lot_number\":null,\"sub_unit_id\":null,\"created_at\":\"2022-02-04T12:27:47.000000Z\",\"updated_at\":\"2022-02-04T12:27:47.000000Z\",\"deleted_at\":null}}', '2022-02-04 12:27:47', '2022-02-04 12:27:47'),
(56, 'Reference Count', 'updated', 10, 'App\\ReferenceCount', 5, 'App\\User', '{\"attributes\":{\"id\":10,\"ref_type\":\"purchase_payment\",\"ref_count\":4,\"business_id\":3,\"created_at\":\"2022-02-03T09:27:45.000000Z\",\"updated_at\":\"2022-02-04T12:27:47.000000Z\"},\"old\":{\"id\":10,\"ref_type\":\"purchase_payment\",\"ref_count\":3,\"business_id\":3,\"created_at\":\"2022-02-03T09:27:45.000000Z\",\"updated_at\":\"2022-02-04T12:26:41.000000Z\"}}', '2022-02-04 12:27:47', '2022-02-04 12:27:47'),
(57, 'Transaction Payment', 'created', 14, 'App\\TransactionPayment', 5, 'App\\User', '{\"attributes\":{\"id\":14,\"transaction_id\":95,\"business_id\":3,\"is_return\":0,\"amount\":\"23.000000\",\"method\":\"cash\",\"transaction_no\":null,\"card_transaction_number\":null,\"card_number\":null,\"card_type\":null,\"card_holder_name\":null,\"card_month\":null,\"card_year\":null,\"card_security\":null,\"cheque_number\":null,\"cheque_date\":\"2022-02-04\",\"bank_name\":null,\"bank_account_number\":null,\"transfer_date\":null,\"paid_on\":\"2022-02-04 17:26:00\",\"created_by\":5,\"payment_for\":50,\"parent_id\":null,\"note\":null,\"document\":null,\"payment_option_id\":null,\"is_deposited\":0,\"payment_ref_no\":\"PP2022\\/0004\",\"account_id\":3037,\"double_entry_account\":null,\"receivable_account\":null,\"paid_in_type\":null,\"deleted_at\":null,\"created_at\":\"2022-02-04T12:27:47.000000Z\",\"updated_at\":\"2022-02-04T12:27:47.000000Z\",\"reference_no\":null}}', '2022-02-04 12:27:47', '2022-02-04 12:27:47'),
(58, 'default', 'created', 159, 'App\\AccountTransaction', 5, 'App\\User', '{\"attributes\":{\"id\":159,\"account_id\":3037,\"business_id\":3,\"type\":\"credit\",\"sub_type\":null,\"amount\":\"23.000000\",\"reff_no\":null,\"operation_date\":\"2022-02-04T11:56:00.000000Z\",\"created_by\":5,\"transaction_id\":95,\"transaction_payment_id\":14,\"transfer_transaction_id\":null,\"transaction_sell_line_id\":null,\"sell_line_id\":null,\"purchase_line_id\":null,\"income_type\":null,\"note\":null,\"attachment\":null,\"cheque_number\":null,\"journal_entry\":null,\"journal_deleted\":0,\"installment_id\":null,\"updated_type\":null,\"updated_by\":null,\"deleted_by\":null,\"deleted_at\":null,\"created_at\":\"2022-02-04T12:27:48.000000Z\",\"updated_at\":\"2022-02-04T12:27:48.000000Z\",\"reconcile_status\":0,\"interest\":null,\"payment_option_id\":null,\"bank_name\":null,\"cheque_numbers\":null,\"cheque_date\":null,\"payment_method\":null}}', '2022-02-04 12:27:48', '2022-02-04 12:27:48'),
(59, 'Contact Ledger', 'created', 50, 'App\\ContactLedger', 5, 'App\\User', '{\"attributes\":{\"id\":50,\"contact_id\":50,\"type\":\"credit\",\"sub_type\":null,\"amount\":\"23.0000\",\"reff_no\":null,\"operation_date\":\"2022-02-04 17:26:00\",\"created_by\":5,\"transaction_id\":95,\"transaction_payment_id\":14,\"transaction_sell_line_id\":null,\"income_type\":null,\"installment_id\":null,\"note\":null,\"deleted_by\":null,\"deleted_at\":null,\"created_at\":\"2022-02-04T12:27:48.000000Z\",\"updated_at\":\"2022-02-04T12:27:48.000000Z\",\"payment_option_id\":null}}', '2022-02-04 12:27:48', '2022-02-04 12:27:48'),
(60, 'Contact Ledger', 'created', 51, 'App\\ContactLedger', 5, 'App\\User', '{\"attributes\":{\"id\":51,\"contact_id\":50,\"type\":\"debit\",\"sub_type\":null,\"amount\":\"23.0000\",\"reff_no\":null,\"operation_date\":\"2022-02-04 17:26:00\",\"created_by\":5,\"transaction_id\":95,\"transaction_payment_id\":14,\"transaction_sell_line_id\":null,\"income_type\":null,\"installment_id\":null,\"note\":null,\"deleted_by\":null,\"deleted_at\":null,\"created_at\":\"2022-02-04T12:27:48.000000Z\",\"updated_at\":\"2022-02-04T12:27:48.000000Z\",\"payment_option_id\":null}}', '2022-02-04 12:27:48', '2022-02-04 12:27:48'),
(61, 'default', 'created', 160, 'App\\AccountTransaction', 5, 'App\\User', '{\"attributes\":{\"id\":160,\"account_id\":3043,\"business_id\":3,\"type\":\"debit\",\"sub_type\":null,\"amount\":\"23.000000\",\"reff_no\":null,\"operation_date\":\"2022-02-04T11:56:00.000000Z\",\"created_by\":5,\"transaction_id\":95,\"transaction_payment_id\":null,\"transfer_transaction_id\":null,\"transaction_sell_line_id\":null,\"sell_line_id\":null,\"purchase_line_id\":null,\"income_type\":null,\"note\":null,\"attachment\":null,\"cheque_number\":null,\"journal_entry\":null,\"journal_deleted\":0,\"installment_id\":null,\"updated_type\":null,\"updated_by\":null,\"deleted_by\":null,\"deleted_at\":null,\"created_at\":\"2022-02-04T12:27:48.000000Z\",\"updated_at\":\"2022-02-04T12:27:48.000000Z\",\"reconcile_status\":0,\"interest\":null,\"payment_option_id\":null,\"bank_name\":null,\"cheque_numbers\":null,\"cheque_date\":null,\"payment_method\":null}}', '2022-02-04 12:27:48', '2022-02-04 12:27:48'),
(62, 'Reference Count', 'updated', 4, 'App\\ReferenceCount', 5, 'App\\User', '{\"attributes\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":79,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T12:47:05.000000Z\"},\"old\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":78,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T12:04:44.000000Z\"}}', '2022-02-04 12:47:05', '2022-02-04 12:47:05'),
(63, 'Reference Count', 'updated', 4, 'App\\ReferenceCount', 5, 'App\\User', '{\"attributes\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":80,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T12:51:07.000000Z\"},\"old\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":79,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T12:47:05.000000Z\"}}', '2022-02-04 12:51:07', '2022-02-04 12:51:07'),
(64, 'Reference Count', 'updated', 4, 'App\\ReferenceCount', 5, 'App\\User', '{\"attributes\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":81,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T12:51:34.000000Z\"},\"old\":{\"id\":4,\"ref_type\":\"contacts\",\"ref_count\":80,\"business_id\":3,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T12:51:07.000000Z\"}}', '2022-02-04 12:51:34', '2022-02-04 12:51:34'),
(65, 'User', 'updated', 5, 'App\\User', 5, 'App\\User', '{\"attributes\":{\"id\":5,\"surname\":\"Ms\",\"first_name\":\"LKD\",\"last_name\":\"1\",\"username\":\"LKD\",\"email\":\"LKD-B@1.COM\",\"password\":\"$2y$10$uzbISgHK5dx1agFtzQ7lEO9cP5Esc3D0zjEqS9AA6dm9QNZ2yUlxe\",\"language\":\"en\",\"contact_no\":null,\"address\":null,\"remember_token\":\"lLQnKxLGqzorVDt9v5gjeeUM4xEqPdL4omZ65qw9xiGSoOIIjTOe70aaNWBV\",\"business_id\":3,\"status\":\"active\",\"is_cmmsn_agnt\":0,\"commission_type\":null,\"cmmsn_percent\":\"0.00\",\"cmmsn_application\":null,\"cmmsn_units\":null,\"selected_contacts\":0,\"dob\":null,\"marital_status\":null,\"blood_group\":null,\"contact_number\":null,\"fb_link\":null,\"twitter_link\":null,\"social_media_1\":null,\"social_media_2\":null,\"permanent_address\":null,\"current_address\":null,\"guardian_name\":null,\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"bank_details\":\"{\\\"account_holder_name\\\":null,\\\"account_number\\\":null,\\\"bank_name\\\":null,\\\"bank_code\\\":null,\\\"branch\\\":null,\\\"tax_payer_id\\\":null}\",\"id_proof_name\":null,\"id_proof_number\":null,\"toggle_popup\":0,\"user_store\":null,\"is_customer\":0,\"is_pump_operator\":0,\"pump_operator_id\":0,\"pump_operator_passcode\":null,\"is_property_user\":0,\"property_user_passcode\":null,\"is_superadmin_default\":0,\"give_away_gifts\":null,\"deleted_at\":null,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T09:42:47.000000Z\",\"lock_screen\":0,\"max_sales_discount_percent\":null},\"old\":{\"id\":5,\"surname\":\"Ms\",\"first_name\":\"LKD\",\"last_name\":\"1\",\"username\":\"LKD\",\"email\":\"LKD-B@1.COM\",\"password\":\"$2y$10$uzbISgHK5dx1agFtzQ7lEO9cP5Esc3D0zjEqS9AA6dm9QNZ2yUlxe\",\"language\":\"en\",\"contact_no\":null,\"address\":null,\"remember_token\":\"6Q5b4gHudoDPuu2aY8LuEHajIJkH5inootlkWrDpVJkDeVvVmq5C2RHKi4Oa\",\"business_id\":3,\"status\":\"active\",\"is_cmmsn_agnt\":0,\"commission_type\":null,\"cmmsn_percent\":\"0.00\",\"cmmsn_application\":null,\"cmmsn_units\":null,\"selected_contacts\":0,\"dob\":null,\"marital_status\":null,\"blood_group\":null,\"contact_number\":null,\"fb_link\":null,\"twitter_link\":null,\"social_media_1\":null,\"social_media_2\":null,\"permanent_address\":null,\"current_address\":null,\"guardian_name\":null,\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"bank_details\":\"{\\\"account_holder_name\\\":null,\\\"account_number\\\":null,\\\"bank_name\\\":null,\\\"bank_code\\\":null,\\\"branch\\\":null,\\\"tax_payer_id\\\":null}\",\"id_proof_name\":null,\"id_proof_number\":null,\"toggle_popup\":0,\"user_store\":null,\"is_customer\":0,\"is_pump_operator\":0,\"pump_operator_id\":0,\"pump_operator_passcode\":null,\"is_property_user\":0,\"property_user_passcode\":null,\"is_superadmin_default\":0,\"give_away_gifts\":null,\"deleted_at\":null,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-04T09:42:47.000000Z\",\"lock_screen\":0,\"max_sales_discount_percent\":null}}', '2022-02-04 12:55:41', '2022-02-04 12:55:41'),
(66, 'User', 'created', 7, 'App\\User', 5, 'App\\User', '{\"attributes\":{\"id\":7,\"surname\":\"\",\"first_name\":\"Shahrukh Khan\",\"last_name\":\"\",\"username\":\"CO-0001-3\",\"email\":\"abc@gmail.com\",\"password\":\"$2y$10$MRsRNMC.6BffgKwBsaftdO82KiBVlTeZKKzMljR5OLS\\/fZSsvH5yu\",\"language\":\"en\",\"contact_no\":null,\"address\":null,\"remember_token\":null,\"business_id\":null,\"status\":\"active\",\"is_cmmsn_agnt\":0,\"commission_type\":null,\"cmmsn_percent\":\"0.00\",\"cmmsn_application\":null,\"cmmsn_units\":null,\"selected_contacts\":0,\"dob\":null,\"marital_status\":null,\"blood_group\":null,\"contact_number\":null,\"fb_link\":null,\"twitter_link\":null,\"social_media_1\":null,\"social_media_2\":null,\"permanent_address\":null,\"current_address\":null,\"guardian_name\":null,\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"bank_details\":null,\"id_proof_name\":null,\"id_proof_number\":null,\"toggle_popup\":0,\"user_store\":null,\"is_customer\":0,\"is_pump_operator\":0,\"pump_operator_id\":0,\"pump_operator_passcode\":null,\"is_property_user\":0,\"property_user_passcode\":null,\"is_superadmin_default\":0,\"give_away_gifts\":null,\"deleted_at\":null,\"created_at\":\"2022-02-08T11:28:02.000000Z\",\"updated_at\":\"2022-02-08T11:28:02.000000Z\",\"lock_screen\":0,\"max_sales_discount_percent\":null}}', '2022-02-08 11:28:02', '2022-02-08 11:28:02'),
(67, 'User', 'updated', 7, 'App\\User', 5, 'App\\User', '{\"attributes\":{\"id\":7,\"surname\":\"\",\"first_name\":\"Shahrukh Khan\",\"last_name\":\"\",\"username\":\"CO-0001-3\",\"email\":\"abc@gmail.com\",\"password\":\"$2y$10$MRsRNMC.6BffgKwBsaftdO82KiBVlTeZKKzMljR5OLS\\/fZSsvH5yu\",\"language\":\"en\",\"contact_no\":null,\"address\":null,\"remember_token\":null,\"business_id\":3,\"status\":\"inactive\",\"is_cmmsn_agnt\":0,\"commission_type\":null,\"cmmsn_percent\":\"0.00\",\"cmmsn_application\":null,\"cmmsn_units\":null,\"selected_contacts\":0,\"dob\":null,\"marital_status\":null,\"blood_group\":null,\"contact_number\":null,\"fb_link\":null,\"twitter_link\":null,\"social_media_1\":null,\"social_media_2\":null,\"permanent_address\":null,\"current_address\":null,\"guardian_name\":null,\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"bank_details\":null,\"id_proof_name\":null,\"id_proof_number\":null,\"toggle_popup\":0,\"user_store\":null,\"is_customer\":1,\"is_pump_operator\":0,\"pump_operator_id\":0,\"pump_operator_passcode\":null,\"is_property_user\":0,\"property_user_passcode\":null,\"is_superadmin_default\":0,\"give_away_gifts\":null,\"deleted_at\":null,\"created_at\":\"2022-02-08T11:28:02.000000Z\",\"updated_at\":\"2022-02-08T11:28:02.000000Z\",\"lock_screen\":0,\"max_sales_discount_percent\":null},\"old\":{\"id\":7,\"surname\":\"\",\"first_name\":\"Shahrukh Khan\",\"last_name\":\"\",\"username\":\"CO-0001-3\",\"email\":\"abc@gmail.com\",\"password\":\"$2y$10$MRsRNMC.6BffgKwBsaftdO82KiBVlTeZKKzMljR5OLS\\/fZSsvH5yu\",\"language\":\"en\",\"contact_no\":null,\"address\":null,\"remember_token\":null,\"business_id\":null,\"status\":null,\"is_cmmsn_agnt\":null,\"commission_type\":null,\"cmmsn_percent\":null,\"cmmsn_application\":null,\"cmmsn_units\":null,\"selected_contacts\":null,\"dob\":null,\"marital_status\":null,\"blood_group\":null,\"contact_number\":null,\"fb_link\":null,\"twitter_link\":null,\"social_media_1\":null,\"social_media_2\":null,\"permanent_address\":null,\"current_address\":null,\"guardian_name\":null,\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"bank_details\":null,\"id_proof_name\":null,\"id_proof_number\":null,\"toggle_popup\":null,\"user_store\":null,\"is_customer\":null,\"is_pump_operator\":null,\"pump_operator_id\":null,\"pump_operator_passcode\":null,\"is_property_user\":null,\"property_user_passcode\":null,\"is_superadmin_default\":null,\"give_away_gifts\":null,\"deleted_at\":null,\"created_at\":\"2022-02-08T11:28:02.000000Z\",\"updated_at\":\"2022-02-08T11:28:02.000000Z\",\"lock_screen\":null,\"max_sales_discount_percent\":null}}', '2022-02-08 11:28:02', '2022-02-08 11:28:02');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(68, 'Contact', 'updated', 7, 'App\\Contact', 5, 'App\\User', '{\"attributes\":{\"id\":7,\"business_id\":3,\"type\":\"customer\",\"supplier_business_name\":null,\"name\":\"Shahrukh Khan\",\"email\":\"abc@gmail.com\",\"contact_id\":\"CO-0001-3\",\"tax_number\":null,\"city\":\"Karachi\",\"address\":null,\"geo_location\":null,\"state\":\"Karachi\",\"country\":\"Pakistan\",\"landmark\":\"abc\",\"mobile\":\"0315379475\",\"landline\":null,\"alternate_number\":\"03194373317\",\"pay_term_number\":null,\"pay_term_type\":null,\"credit_limit\":null,\"created_by\":5,\"total_rp\":0,\"total_rp_used\":0,\"total_rp_expired\":0,\"is_default\":1,\"customer_group_id\":null,\"supplier_group_id\":null,\"custom_field1\":null,\"custom_field2\":null,\"custom_field3\":null,\"custom_field4\":null,\"sell_over_limit\":0,\"sol_without_approval\":0,\"sol_with_approval\":0,\"over_limit_percentage\":\"0.00\",\"temp_approved_user\":null,\"temp_requested_by\":null,\"is_property\":0,\"active\":1,\"deleted_at\":null,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-08T11:28:02.000000Z\",\"nic_number\":\"\",\"image\":null,\"signature\":null,\"payment_account\":null,\"security_deposit_asset_account\":null,\"security_deposit_liability_account\":null},\"old\":{\"id\":7,\"business_id\":3,\"type\":\"customer\",\"supplier_business_name\":null,\"name\":\"Walk-In Customer\",\"email\":null,\"contact_id\":\"CO-0001-3\",\"tax_number\":null,\"city\":null,\"address\":null,\"geo_location\":null,\"state\":null,\"country\":null,\"landmark\":null,\"mobile\":null,\"landline\":null,\"alternate_number\":null,\"pay_term_number\":null,\"pay_term_type\":null,\"credit_limit\":null,\"created_by\":5,\"total_rp\":0,\"total_rp_used\":0,\"total_rp_expired\":0,\"is_default\":1,\"customer_group_id\":null,\"supplier_group_id\":null,\"custom_field1\":null,\"custom_field2\":null,\"custom_field3\":null,\"custom_field4\":null,\"sell_over_limit\":0,\"sol_without_approval\":0,\"sol_with_approval\":0,\"over_limit_percentage\":\"0.00\",\"temp_approved_user\":null,\"temp_requested_by\":null,\"is_property\":0,\"active\":1,\"deleted_at\":null,\"created_at\":\"2022-02-03T06:03:22.000000Z\",\"updated_at\":\"2022-02-03T06:03:22.000000Z\",\"nic_number\":\"\",\"image\":null,\"signature\":null,\"payment_account\":null,\"security_deposit_asset_account\":null,\"security_deposit_liability_account\":null}}', '2022-02-08 11:28:03', '2022-02-08 11:28:03'),
(69, 'Reference Count', 'updated', 1, 'App\\ReferenceCount', 2, 'App\\User', '{\"attributes\":{\"id\":1,\"ref_type\":\"contacts\",\"ref_count\":9,\"business_id\":2,\"created_at\":\"2021-07-20T14:32:44.000000Z\",\"updated_at\":\"2022-02-13T19:43:59.000000Z\"},\"old\":{\"id\":1,\"ref_type\":\"contacts\",\"ref_count\":8,\"business_id\":2,\"created_at\":\"2021-07-20T14:32:44.000000Z\",\"updated_at\":\"2021-07-31T12:34:58.000000Z\"}}', '2022-02-13 19:43:59', '2022-02-13 19:43:59'),
(70, 'Contact', 'created', 57, 'App\\Contact', 2, 'App\\User', '{\"attributes\":{\"id\":57,\"business_id\":2,\"type\":\"customer\",\"supplier_business_name\":null,\"name\":\"Sojib Hasan\",\"email\":\"sojibhasanme07@gmail.com\",\"contact_id\":\"CO-0009-2\",\"tax_number\":null,\"city\":\"dhaka\",\"address\":null,\"geo_location\":null,\"state\":\"Dhaka\",\"country\":null,\"landmark\":null,\"mobile\":\"+8801911265158\",\"landline\":\"1\",\"alternate_number\":\"1\",\"pay_term_number\":null,\"pay_term_type\":null,\"credit_limit\":null,\"created_by\":2,\"total_rp\":0,\"total_rp_used\":0,\"total_rp_expired\":0,\"is_default\":0,\"customer_group_id\":null,\"supplier_group_id\":null,\"custom_field1\":null,\"custom_field2\":null,\"custom_field3\":null,\"custom_field4\":null,\"sell_over_limit\":0,\"sol_without_approval\":0,\"sol_with_approval\":0,\"over_limit_percentage\":\"0.00\",\"temp_approved_user\":null,\"temp_requested_by\":null,\"is_property\":1,\"active\":1,\"deleted_at\":null,\"created_at\":\"2022-02-13T19:43:59.000000Z\",\"updated_at\":\"2022-02-13T19:43:59.000000Z\",\"nic_number\":\"\",\"image\":null,\"signature\":null,\"payment_account\":null,\"security_deposit_asset_account\":null,\"security_deposit_liability_account\":null}}', '2022-02-13 19:43:59', '2022-02-13 19:43:59'),
(71, 'Reference Count', 'updated', 3, 'App\\ReferenceCount', 2, 'App\\User', '{\"attributes\":{\"id\":3,\"ref_type\":\"opening_balance\",\"ref_count\":4,\"business_id\":2,\"created_at\":\"2021-07-25T14:20:19.000000Z\",\"updated_at\":\"2022-02-13T19:43:59.000000Z\"},\"old\":{\"id\":3,\"ref_type\":\"opening_balance\",\"ref_count\":3,\"business_id\":2,\"created_at\":\"2021-07-25T14:20:19.000000Z\",\"updated_at\":\"2021-07-25T14:22:54.000000Z\"}}', '2022-02-13 19:43:59', '2022-02-13 19:43:59'),
(72, 'Transaction', 'created', 96, 'App\\Transaction', 2, 'App\\User', '{\"attributes\":{\"id\":96,\"business_id\":2,\"location_id\":2,\"res_table_id\":null,\"res_waiter_id\":null,\"res_order_status\":null,\"type\":\"opening_balance\",\"store_id\":null,\"sub_type\":null,\"status\":\"final\",\"cheque_return_charges\":\"0.000000\",\"need_to_reserve\":null,\"is_credit_sale\":0,\"credit_sale_id\":null,\"is_over_limit_credit_sale\":0,\"customer_limit\":\"0.000000\",\"over_limit_amount\":\"0.000000\",\"approved_user\":null,\"requested_by\":null,\"order_no\":null,\"order_date\":null,\"customer_ref\":null,\"is_quotation\":0,\"is_customer_order\":0,\"order_status\":null,\"payment_status\":\"due\",\"price_later\":0,\"adjustment_type\":null,\"contact_id\":57,\"pump_operator_id\":null,\"customer_group_id\":null,\"invoice_no\":null,\"purchase_entry_no\":null,\"deed_no\":null,\"deed_date\":null,\"ref_no\":\"2022\\/0004\",\"subscription_no\":null,\"transaction_date\":\"2022-02-13T18:30:00.000000Z\",\"total_before_tax\":\"20000.000000\",\"tax_id\":null,\"tax_amount\":\"0.000000\",\"discount_type\":null,\"discount_amount\":\"0.000000\",\"rp_redeemed\":0,\"rp_redeemed_amount\":\"0.000000\",\"shipping_details\":null,\"shipping_address\":null,\"shipping_status\":null,\"delivered_to\":null,\"shipping_charges\":\"0.000000\",\"additional_notes\":null,\"staff_note\":null,\"final_total\":\"20000.000000\",\"amount_paid_from_advance\":\"0.000000\",\"expense_category_id\":null,\"expense_for\":null,\"fleet_id\":null,\"property_id\":null,\"expense_account\":null,\"controller_account\":null,\"commission_agent\":null,\"document\":null,\"is_direct_sale\":0,\"is_suspend\":0,\"exchange_rate\":\"1.000000\",\"total_amount_recovered\":null,\"transfer_parent_id\":null,\"return_parent_id\":null,\"is_pos_return\":0,\"pos_invoice_return\":null,\"opening_stock_product_id\":null,\"created_by\":2,\"import_batch\":null,\"import_time\":null,\"types_of_service_id\":null,\"packing_charge\":null,\"packing_charge_type\":null,\"service_custom_field_1\":null,\"service_custom_field_2\":null,\"service_custom_field_3\":null,\"service_custom_field_4\":null,\"mfg_parent_production_purchase_id\":null,\"mfg_wasted_units\":null,\"mfg_production_cost\":\"0.000000\",\"mfg_is_final\":0,\"is_created_from_api\":0,\"rp_earned\":0,\"from_store\":null,\"order_addresses\":null,\"is_recurring\":0,\"recur_interval\":null,\"recur_interval_type\":null,\"recur_repetitions\":null,\"recur_stopped_on\":null,\"recur_parent_id\":null,\"invoice_token\":null,\"pay_term_number\":null,\"pay_term_type\":null,\"selling_price_group_id\":null,\"is_duplicate\":0,\"is_settlement\":0,\"deleted_by\":null,\"created_at\":\"2022-02-13T19:43:59.000000Z\",\"updated_at\":\"2022-02-13T19:43:59.000000Z\",\"imported\":0,\"advance_remaining\":\"0.000000\",\"deleted_at\":null,\"repair_brand_id\":null,\"repair_checklist\":null,\"repair_completed_on\":null,\"repair_defects\":null,\"repair_device_id\":null,\"repair_due_date\":null,\"repair_model_id\":null,\"repair_security_pattern\":null,\"repair_security_pwd\":null,\"repair_serial_no\":null,\"repair_status_id\":null,\"repair_updates_notif\":0,\"repair_warranty_id\":null,\"subscription_repeat_on\":null,\"repair_job_sheet_id\":null,\"finance_option_id\":null,\"balance_quantity\":\"0\",\"From_Account\":1,\"To_Account\":1}}', '2022-02-13 19:43:59', '2022-02-13 19:43:59'),
(73, 'default', 'created', 161, 'App\\AccountTransaction', 2, 'App\\User', '{\"attributes\":{\"id\":161,\"account_id\":2996,\"business_id\":2,\"type\":\"debit\",\"sub_type\":\"ledger_show\",\"amount\":\"20000.000000\",\"reff_no\":null,\"operation_date\":\"2022-02-13T18:30:00.000000Z\",\"created_by\":2,\"transaction_id\":96,\"transaction_payment_id\":null,\"transfer_transaction_id\":null,\"transaction_sell_line_id\":null,\"sell_line_id\":null,\"purchase_line_id\":null,\"income_type\":null,\"note\":null,\"attachment\":null,\"cheque_number\":null,\"journal_entry\":null,\"journal_deleted\":0,\"installment_id\":null,\"updated_type\":null,\"updated_by\":null,\"deleted_by\":null,\"deleted_at\":null,\"created_at\":\"2022-02-13T19:43:59.000000Z\",\"updated_at\":\"2022-02-13T19:43:59.000000Z\",\"reconcile_status\":0,\"interest\":null,\"payment_option_id\":null,\"bank_name\":null,\"cheque_numbers\":null,\"cheque_date\":null,\"payment_method\":null}}', '2022-02-13 19:43:59', '2022-02-13 19:43:59'),
(74, 'Contact Ledger', 'created', 52, 'App\\ContactLedger', 2, 'App\\User', '{\"attributes\":{\"id\":52,\"contact_id\":57,\"type\":\"debit\",\"sub_type\":\"\",\"amount\":\"20000.0000\",\"reff_no\":null,\"operation_date\":\"2022-02-14 00:00:00\",\"created_by\":2,\"transaction_id\":96,\"transaction_payment_id\":null,\"transaction_sell_line_id\":null,\"income_type\":null,\"installment_id\":null,\"note\":null,\"deleted_by\":null,\"deleted_at\":null,\"created_at\":\"2022-02-13T19:43:59.000000Z\",\"updated_at\":\"2022-02-13T19:43:59.000000Z\",\"payment_option_id\":null}}', '2022-02-13 19:43:59', '2022-02-13 19:43:59'),
(75, 'default', 'created', 162, 'App\\AccountTransaction', 2, 'App\\User', '{\"attributes\":{\"id\":162,\"account_id\":3035,\"business_id\":2,\"type\":\"credit\",\"sub_type\":null,\"amount\":\"20000.000000\",\"reff_no\":null,\"operation_date\":\"2022-02-13T18:30:00.000000Z\",\"created_by\":2,\"transaction_id\":96,\"transaction_payment_id\":null,\"transfer_transaction_id\":null,\"transaction_sell_line_id\":null,\"sell_line_id\":null,\"purchase_line_id\":null,\"income_type\":null,\"note\":null,\"attachment\":null,\"cheque_number\":null,\"journal_entry\":null,\"journal_deleted\":0,\"installment_id\":null,\"updated_type\":null,\"updated_by\":null,\"deleted_by\":null,\"deleted_at\":null,\"created_at\":\"2022-02-13T19:43:59.000000Z\",\"updated_at\":\"2022-02-13T19:43:59.000000Z\",\"reconcile_status\":0,\"interest\":null,\"payment_option_id\":null,\"bank_name\":null,\"cheque_numbers\":null,\"cheque_date\":null,\"payment_method\":null}}', '2022-02-13 19:43:59', '2022-02-13 19:43:59'),
(76, 'Reference Count', 'created', 11, 'App\\ReferenceCount', 2, 'App\\User', '{\"attributes\":{\"id\":11,\"ref_type\":\"advance_payment\",\"ref_count\":1,\"business_id\":2,\"created_at\":\"2022-02-13T19:45:39.000000Z\",\"updated_at\":\"2022-02-13T19:45:39.000000Z\"}}', '2022-02-13 19:45:39', '2022-02-13 19:45:39'),
(77, 'Reference Count', 'updated', 11, 'App\\ReferenceCount', 2, 'App\\User', '{\"attributes\":{\"id\":11,\"ref_type\":\"advance_payment\",\"ref_count\":2,\"business_id\":2,\"created_at\":\"2022-02-13T19:45:39.000000Z\",\"updated_at\":\"2022-02-13T19:46:06.000000Z\"},\"old\":{\"id\":11,\"ref_type\":\"advance_payment\",\"ref_count\":1,\"business_id\":2,\"created_at\":\"2022-02-13T19:45:39.000000Z\",\"updated_at\":\"2022-02-13T19:45:39.000000Z\"}}', '2022-02-13 19:46:06', '2022-02-13 19:46:06'),
(78, 'Reference Count', 'updated', 11, 'App\\ReferenceCount', 2, 'App\\User', '{\"attributes\":{\"id\":11,\"ref_type\":\"advance_payment\",\"ref_count\":3,\"business_id\":2,\"created_at\":\"2022-02-13T19:45:39.000000Z\",\"updated_at\":\"2022-02-13T19:46:06.000000Z\"},\"old\":{\"id\":11,\"ref_type\":\"advance_payment\",\"ref_count\":2,\"business_id\":2,\"created_at\":\"2022-02-13T19:45:39.000000Z\",\"updated_at\":\"2022-02-13T19:46:06.000000Z\"}}', '2022-02-13 19:46:06', '2022-02-13 19:46:06'),
(79, 'Transaction', 'created', 97, 'App\\Transaction', 2, 'App\\User', '{\"attributes\":{\"id\":97,\"business_id\":2,\"location_id\":2,\"res_table_id\":null,\"res_waiter_id\":null,\"res_order_status\":null,\"type\":\"advance_payment\",\"store_id\":null,\"sub_type\":null,\"status\":\"final\",\"cheque_return_charges\":\"0.000000\",\"need_to_reserve\":null,\"is_credit_sale\":0,\"credit_sale_id\":null,\"is_over_limit_credit_sale\":0,\"customer_limit\":\"0.000000\",\"over_limit_amount\":\"0.000000\",\"approved_user\":null,\"requested_by\":null,\"order_no\":null,\"order_date\":null,\"customer_ref\":null,\"is_quotation\":0,\"is_customer_order\":0,\"order_status\":null,\"payment_status\":\"paid\",\"price_later\":0,\"adjustment_type\":null,\"contact_id\":57,\"pump_operator_id\":null,\"customer_group_id\":null,\"invoice_no\":null,\"purchase_entry_no\":null,\"deed_no\":null,\"deed_date\":null,\"ref_no\":\"2022\\/0003\",\"subscription_no\":null,\"transaction_date\":\"2022-02-13T18:30:00.000000Z\",\"total_before_tax\":\"10000.000000\",\"tax_id\":null,\"tax_amount\":\"0.000000\",\"discount_type\":null,\"discount_amount\":\"0.000000\",\"rp_redeemed\":0,\"rp_redeemed_amount\":\"0.000000\",\"shipping_details\":null,\"shipping_address\":null,\"shipping_status\":null,\"delivered_to\":null,\"shipping_charges\":\"0.000000\",\"additional_notes\":null,\"staff_note\":null,\"final_total\":\"10000.000000\",\"amount_paid_from_advance\":\"0.000000\",\"expense_category_id\":null,\"expense_for\":null,\"fleet_id\":null,\"property_id\":null,\"expense_account\":null,\"controller_account\":null,\"commission_agent\":null,\"document\":null,\"is_direct_sale\":0,\"is_suspend\":0,\"exchange_rate\":\"1.000000\",\"total_amount_recovered\":null,\"transfer_parent_id\":null,\"return_parent_id\":null,\"is_pos_return\":0,\"pos_invoice_return\":null,\"opening_stock_product_id\":null,\"created_by\":2,\"import_batch\":null,\"import_time\":null,\"types_of_service_id\":null,\"packing_charge\":null,\"packing_charge_type\":null,\"service_custom_field_1\":null,\"service_custom_field_2\":null,\"service_custom_field_3\":null,\"service_custom_field_4\":null,\"mfg_parent_production_purchase_id\":null,\"mfg_wasted_units\":null,\"mfg_production_cost\":\"0.000000\",\"mfg_is_final\":0,\"is_created_from_api\":0,\"rp_earned\":0,\"from_store\":null,\"order_addresses\":null,\"is_recurring\":0,\"recur_interval\":null,\"recur_interval_type\":null,\"recur_repetitions\":null,\"recur_stopped_on\":null,\"recur_parent_id\":null,\"invoice_token\":null,\"pay_term_number\":null,\"pay_term_type\":null,\"selling_price_group_id\":null,\"is_duplicate\":0,\"is_settlement\":0,\"deleted_by\":null,\"created_at\":\"2022-02-13T19:46:06.000000Z\",\"updated_at\":\"2022-02-13T19:46:06.000000Z\",\"imported\":0,\"advance_remaining\":\"10000.000000\",\"deleted_at\":null,\"repair_brand_id\":null,\"repair_checklist\":null,\"repair_completed_on\":null,\"repair_defects\":null,\"repair_device_id\":null,\"repair_due_date\":null,\"repair_model_id\":null,\"repair_security_pattern\":null,\"repair_security_pwd\":null,\"repair_serial_no\":null,\"repair_status_id\":null,\"repair_updates_notif\":0,\"repair_warranty_id\":null,\"subscription_repeat_on\":null,\"repair_job_sheet_id\":null,\"finance_option_id\":null,\"balance_quantity\":\"0\",\"From_Account\":1,\"To_Account\":1}}', '2022-02-13 19:46:06', '2022-02-13 19:46:06'),
(80, 'default', 'created', 163, 'App\\AccountTransaction', 2, 'App\\User', '{\"attributes\":{\"id\":163,\"account_id\":2993,\"business_id\":2,\"type\":\"debit\",\"sub_type\":null,\"amount\":\"10000.000000\",\"reff_no\":null,\"operation_date\":\"2022-02-13T18:30:00.000000Z\",\"created_by\":2,\"transaction_id\":97,\"transaction_payment_id\":null,\"transfer_transaction_id\":null,\"transaction_sell_line_id\":null,\"sell_line_id\":null,\"purchase_line_id\":null,\"income_type\":null,\"note\":null,\"attachment\":null,\"cheque_number\":null,\"journal_entry\":null,\"journal_deleted\":0,\"installment_id\":null,\"updated_type\":null,\"updated_by\":null,\"deleted_by\":null,\"deleted_at\":null,\"created_at\":\"2022-02-13T19:46:06.000000Z\",\"updated_at\":\"2022-02-13T19:46:06.000000Z\",\"reconcile_status\":0,\"interest\":null,\"payment_option_id\":null,\"bank_name\":null,\"cheque_numbers\":null,\"cheque_date\":null,\"payment_method\":null}}', '2022-02-13 19:46:06', '2022-02-13 19:46:06'),
(81, 'Contact Ledger', 'created', 53, 'App\\ContactLedger', 2, 'App\\User', '{\"attributes\":{\"id\":53,\"contact_id\":57,\"type\":\"credit\",\"sub_type\":null,\"amount\":\"10000.0000\",\"reff_no\":null,\"operation_date\":\"2022-02-14 00:00:00\",\"created_by\":2,\"transaction_id\":97,\"transaction_payment_id\":null,\"transaction_sell_line_id\":null,\"income_type\":null,\"installment_id\":null,\"note\":null,\"deleted_by\":null,\"deleted_at\":null,\"created_at\":\"2022-02-13T19:46:06.000000Z\",\"updated_at\":\"2022-02-13T19:46:06.000000Z\",\"payment_option_id\":null}}', '2022-02-13 19:46:06', '2022-02-13 19:46:06'),
(82, 'default', 'created', 164, 'App\\AccountTransaction', 2, 'App\\User', '{\"attributes\":{\"id\":164,\"account_id\":0,\"business_id\":null,\"type\":\"credit\",\"sub_type\":null,\"amount\":\"10000.000000\",\"reff_no\":null,\"operation_date\":\"2022-02-13T18:30:00.000000Z\",\"created_by\":2,\"transaction_id\":97,\"transaction_payment_id\":null,\"transfer_transaction_id\":null,\"transaction_sell_line_id\":null,\"sell_line_id\":null,\"purchase_line_id\":null,\"income_type\":null,\"note\":null,\"attachment\":null,\"cheque_number\":null,\"journal_entry\":null,\"journal_deleted\":0,\"installment_id\":null,\"updated_type\":null,\"updated_by\":null,\"deleted_by\":null,\"deleted_at\":null,\"created_at\":\"2022-02-13T19:46:06.000000Z\",\"updated_at\":\"2022-02-13T19:46:06.000000Z\",\"reconcile_status\":0,\"interest\":null,\"payment_option_id\":null,\"bank_name\":null,\"cheque_numbers\":null,\"cheque_date\":null,\"payment_method\":null}}', '2022-02-13 19:46:06', '2022-02-13 19:46:06'),
(83, 'Transaction Payment', 'created', 15, 'App\\TransactionPayment', 2, 'App\\User', '{\"attributes\":{\"id\":15,\"transaction_id\":97,\"business_id\":2,\"is_return\":0,\"amount\":\"10000.000000\",\"method\":\"cash\",\"transaction_no\":null,\"card_transaction_number\":null,\"card_number\":null,\"card_type\":\"credit\",\"card_holder_name\":null,\"card_month\":null,\"card_year\":null,\"card_security\":null,\"cheque_number\":null,\"cheque_date\":null,\"bank_name\":null,\"bank_account_number\":null,\"transfer_date\":null,\"paid_on\":\"2022-02-14 00:00:00\",\"created_by\":2,\"payment_for\":57,\"parent_id\":null,\"note\":null,\"document\":null,\"payment_option_id\":null,\"is_deposited\":0,\"payment_ref_no\":\"2022\\/0002\",\"account_id\":2993,\"double_entry_account\":null,\"receivable_account\":null,\"paid_in_type\":null,\"deleted_at\":null,\"created_at\":\"2022-02-13T19:46:06.000000Z\",\"updated_at\":\"2022-02-13T19:46:06.000000Z\",\"reference_no\":null}}', '2022-02-13 19:46:06', '2022-02-13 19:46:06'),
(84, 'Reference Count', 'created', 12, 'App\\ReferenceCount', 2, 'App\\User', '{\"attributes\":{\"id\":12,\"ref_type\":\"sell_payment\",\"ref_count\":1,\"business_id\":2,\"created_at\":\"2022-02-13T20:17:08.000000Z\",\"updated_at\":\"2022-02-13T20:17:08.000000Z\"}}', '2022-02-13 20:17:08', '2022-02-13 20:17:08'),
(85, 'Reference Count', 'updated', 12, 'App\\ReferenceCount', 2, 'App\\User', '{\"attributes\":{\"id\":12,\"ref_type\":\"sell_payment\",\"ref_count\":2,\"business_id\":2,\"created_at\":\"2022-02-13T20:17:08.000000Z\",\"updated_at\":\"2022-02-13T20:17:54.000000Z\"},\"old\":{\"id\":12,\"ref_type\":\"sell_payment\",\"ref_count\":1,\"business_id\":2,\"created_at\":\"2022-02-13T20:17:08.000000Z\",\"updated_at\":\"2022-02-13T20:17:08.000000Z\"}}', '2022-02-13 20:17:54', '2022-02-13 20:17:54'),
(86, 'Transaction Payment', 'created', 16, 'App\\TransactionPayment', 2, 'App\\User', '{\"attributes\":{\"id\":16,\"transaction_id\":null,\"business_id\":2,\"is_return\":0,\"amount\":\"1000.000000\",\"method\":\"cash\",\"transaction_no\":null,\"card_transaction_number\":null,\"card_number\":null,\"card_type\":\"credit\",\"card_holder_name\":null,\"card_month\":\"1\",\"card_year\":\"22\",\"card_security\":null,\"cheque_number\":null,\"cheque_date\":\"2022-02-14\",\"bank_name\":null,\"bank_account_number\":null,\"transfer_date\":null,\"paid_on\":\"2022-02-14 01:47:00\",\"created_by\":2,\"payment_for\":3,\"parent_id\":null,\"note\":null,\"document\":null,\"payment_option_id\":null,\"is_deposited\":0,\"payment_ref_no\":\"SP2022\\/0002\",\"account_id\":2993,\"double_entry_account\":null,\"receivable_account\":null,\"paid_in_type\":\"customer_page\",\"deleted_at\":null,\"created_at\":\"2022-02-13T20:17:54.000000Z\",\"updated_at\":\"2022-02-13T20:17:54.000000Z\",\"reference_no\":null}}', '2022-02-13 20:17:54', '2022-02-13 20:17:54'),
(87, 'default', 'created', 165, 'App\\AccountTransaction', 2, 'App\\User', '{\"attributes\":{\"id\":165,\"account_id\":2993,\"business_id\":2,\"type\":\"debit\",\"sub_type\":null,\"amount\":\"1000.000000\",\"reff_no\":null,\"operation_date\":\"2022-02-13T20:17:00.000000Z\",\"created_by\":2,\"transaction_id\":1,\"transaction_payment_id\":16,\"transfer_transaction_id\":null,\"transaction_sell_line_id\":null,\"sell_line_id\":null,\"purchase_line_id\":null,\"income_type\":null,\"note\":null,\"attachment\":null,\"cheque_number\":null,\"journal_entry\":null,\"journal_deleted\":0,\"installment_id\":null,\"updated_type\":null,\"updated_by\":null,\"deleted_by\":null,\"deleted_at\":null,\"created_at\":\"2022-02-13T20:17:54.000000Z\",\"updated_at\":\"2022-02-13T20:17:54.000000Z\",\"reconcile_status\":0,\"interest\":null,\"payment_option_id\":null,\"bank_name\":null,\"cheque_numbers\":null,\"cheque_date\":null,\"payment_method\":null}}', '2022-02-13 20:17:54', '2022-02-13 20:17:54'),
(88, 'default', 'created', 166, 'App\\AccountTransaction', 2, 'App\\User', '{\"attributes\":{\"id\":166,\"account_id\":2996,\"business_id\":2,\"type\":\"credit\",\"sub_type\":\"ledger_show\",\"amount\":\"1000.000000\",\"reff_no\":null,\"operation_date\":\"2022-02-13T20:17:00.000000Z\",\"created_by\":2,\"transaction_id\":1,\"transaction_payment_id\":16,\"transfer_transaction_id\":null,\"transaction_sell_line_id\":null,\"sell_line_id\":null,\"purchase_line_id\":null,\"income_type\":null,\"note\":null,\"attachment\":null,\"cheque_number\":null,\"journal_entry\":null,\"journal_deleted\":0,\"installment_id\":null,\"updated_type\":null,\"updated_by\":null,\"deleted_by\":null,\"deleted_at\":null,\"created_at\":\"2022-02-13T20:17:54.000000Z\",\"updated_at\":\"2022-02-13T20:17:54.000000Z\",\"reconcile_status\":0,\"interest\":null,\"payment_option_id\":null,\"bank_name\":null,\"cheque_numbers\":null,\"cheque_date\":null,\"payment_method\":null}}', '2022-02-13 20:17:54', '2022-02-13 20:17:54'),
(89, 'Contact Ledger', 'created', 54, 'App\\ContactLedger', 2, 'App\\User', '{\"attributes\":{\"id\":54,\"contact_id\":3,\"type\":\"credit\",\"sub_type\":\"\",\"amount\":\"1000.0000\",\"reff_no\":null,\"operation_date\":\"2022-02-14 01:47:00\",\"created_by\":2,\"transaction_id\":1,\"transaction_payment_id\":16,\"transaction_sell_line_id\":null,\"income_type\":null,\"installment_id\":null,\"note\":null,\"deleted_by\":null,\"deleted_at\":null,\"created_at\":\"2022-02-13T20:17:54.000000Z\",\"updated_at\":\"2022-02-13T20:17:54.000000Z\",\"payment_option_id\":null}}', '2022-02-13 20:17:54', '2022-02-13 20:17:54'),
(90, 'Reference Count', 'created', 13, 'App\\ReferenceCount', 2, 'App\\User', '{\"attributes\":{\"id\":13,\"ref_type\":\"purchase_payment\",\"ref_count\":1,\"business_id\":2,\"created_at\":\"2022-02-13T20:17:54.000000Z\",\"updated_at\":\"2022-02-13T20:17:54.000000Z\"}}', '2022-02-13 20:17:54', '2022-02-13 20:17:54'),
(91, 'Transaction', 'updated', 1, 'App\\Transaction', 2, 'App\\User', '{\"attributes\":{\"id\":1,\"business_id\":2,\"location_id\":2,\"res_table_id\":null,\"res_waiter_id\":null,\"res_order_status\":null,\"type\":\"opening_balance\",\"store_id\":null,\"sub_type\":null,\"status\":\"final\",\"cheque_return_charges\":\"0.000000\",\"need_to_reserve\":null,\"is_credit_sale\":0,\"credit_sale_id\":null,\"is_over_limit_credit_sale\":0,\"customer_limit\":\"0.000000\",\"over_limit_amount\":\"0.000000\",\"approved_user\":null,\"requested_by\":null,\"order_no\":null,\"order_date\":null,\"customer_ref\":null,\"is_quotation\":0,\"is_customer_order\":0,\"order_status\":null,\"payment_status\":\"partial\",\"price_later\":0,\"adjustment_type\":null,\"contact_id\":3,\"pump_operator_id\":null,\"customer_group_id\":null,\"invoice_no\":null,\"purchase_entry_no\":null,\"deed_no\":null,\"deed_date\":null,\"ref_no\":\"2021\\/0001\",\"subscription_no\":null,\"transaction_date\":\"2021-06-30T18:30:00.000000Z\",\"total_before_tax\":\"5000.000000\",\"tax_id\":null,\"tax_amount\":\"0.000000\",\"discount_type\":null,\"discount_amount\":\"0.000000\",\"rp_redeemed\":0,\"rp_redeemed_amount\":\"0.000000\",\"shipping_details\":null,\"shipping_address\":null,\"shipping_status\":null,\"delivered_to\":null,\"shipping_charges\":\"0.000000\",\"additional_notes\":null,\"staff_note\":null,\"final_total\":\"5000.000000\",\"amount_paid_from_advance\":\"0.000000\",\"expense_category_id\":null,\"expense_for\":null,\"fleet_id\":null,\"property_id\":null,\"expense_account\":null,\"controller_account\":null,\"commission_agent\":null,\"document\":null,\"is_direct_sale\":0,\"is_suspend\":0,\"exchange_rate\":\"1.000000\",\"total_amount_recovered\":null,\"transfer_parent_id\":null,\"return_parent_id\":null,\"is_pos_return\":0,\"pos_invoice_return\":null,\"opening_stock_product_id\":null,\"created_by\":2,\"import_batch\":null,\"import_time\":null,\"types_of_service_id\":null,\"packing_charge\":null,\"packing_charge_type\":null,\"service_custom_field_1\":null,\"service_custom_field_2\":null,\"service_custom_field_3\":null,\"service_custom_field_4\":null,\"mfg_parent_production_purchase_id\":null,\"mfg_wasted_units\":null,\"mfg_production_cost\":\"0.000000\",\"mfg_is_final\":0,\"is_created_from_api\":0,\"rp_earned\":0,\"from_store\":null,\"order_addresses\":null,\"is_recurring\":0,\"recur_interval\":null,\"recur_interval_type\":null,\"recur_repetitions\":null,\"recur_stopped_on\":null,\"recur_parent_id\":null,\"invoice_token\":null,\"pay_term_number\":null,\"pay_term_type\":null,\"selling_price_group_id\":null,\"is_duplicate\":0,\"is_settlement\":0,\"deleted_by\":null,\"created_at\":\"2021-07-25T14:20:19.000000Z\",\"updated_at\":\"2022-02-13T20:17:54.000000Z\",\"imported\":0,\"advance_remaining\":\"0.000000\",\"deleted_at\":null,\"repair_brand_id\":null,\"repair_checklist\":null,\"repair_completed_on\":null,\"repair_defects\":null,\"repair_device_id\":null,\"repair_due_date\":null,\"repair_model_id\":null,\"repair_security_pattern\":null,\"repair_security_pwd\":null,\"repair_serial_no\":null,\"repair_status_id\":null,\"repair_updates_notif\":0,\"repair_warranty_id\":null,\"subscription_repeat_on\":null,\"repair_job_sheet_id\":null,\"finance_option_id\":null,\"balance_quantity\":\"0\",\"From_Account\":1,\"To_Account\":1},\"old\":{\"id\":1,\"business_id\":2,\"location_id\":2,\"res_table_id\":null,\"res_waiter_id\":null,\"res_order_status\":null,\"type\":\"opening_balance\",\"store_id\":null,\"sub_type\":null,\"status\":\"final\",\"cheque_return_charges\":\"0.000000\",\"need_to_reserve\":null,\"is_credit_sale\":0,\"credit_sale_id\":null,\"is_over_limit_credit_sale\":0,\"customer_limit\":\"0.000000\",\"over_limit_amount\":\"0.000000\",\"approved_user\":null,\"requested_by\":null,\"order_no\":null,\"order_date\":null,\"customer_ref\":null,\"is_quotation\":0,\"is_customer_order\":0,\"order_status\":null,\"payment_status\":\"due\",\"price_later\":0,\"adjustment_type\":null,\"contact_id\":3,\"pump_operator_id\":null,\"customer_group_id\":null,\"invoice_no\":null,\"purchase_entry_no\":null,\"deed_no\":null,\"deed_date\":null,\"ref_no\":\"2021\\/0001\",\"subscription_no\":null,\"transaction_date\":\"2021-06-30T18:30:00.000000Z\",\"total_before_tax\":\"5000.000000\",\"tax_id\":null,\"tax_amount\":\"0.000000\",\"discount_type\":null,\"discount_amount\":\"0.000000\",\"rp_redeemed\":0,\"rp_redeemed_amount\":\"0.000000\",\"shipping_details\":null,\"shipping_address\":null,\"shipping_status\":null,\"delivered_to\":null,\"shipping_charges\":\"0.000000\",\"additional_notes\":null,\"staff_note\":null,\"final_total\":\"5000.000000\",\"amount_paid_from_advance\":\"0.000000\",\"expense_category_id\":null,\"expense_for\":null,\"fleet_id\":null,\"property_id\":null,\"expense_account\":null,\"controller_account\":null,\"commission_agent\":null,\"document\":null,\"is_direct_sale\":0,\"is_suspend\":0,\"exchange_rate\":\"1.000000\",\"total_amount_recovered\":null,\"transfer_parent_id\":null,\"return_parent_id\":null,\"is_pos_return\":0,\"pos_invoice_return\":null,\"opening_stock_product_id\":null,\"created_by\":2,\"import_batch\":null,\"import_time\":null,\"types_of_service_id\":null,\"packing_charge\":null,\"packing_charge_type\":null,\"service_custom_field_1\":null,\"service_custom_field_2\":null,\"service_custom_field_3\":null,\"service_custom_field_4\":null,\"mfg_parent_production_purchase_id\":null,\"mfg_wasted_units\":null,\"mfg_production_cost\":\"0.000000\",\"mfg_is_final\":0,\"is_created_from_api\":0,\"rp_earned\":0,\"from_store\":null,\"order_addresses\":null,\"is_recurring\":0,\"recur_interval\":null,\"recur_interval_type\":null,\"recur_repetitions\":null,\"recur_stopped_on\":null,\"recur_parent_id\":null,\"invoice_token\":null,\"pay_term_number\":null,\"pay_term_type\":null,\"selling_price_group_id\":null,\"is_duplicate\":0,\"is_settlement\":0,\"deleted_by\":null,\"created_at\":\"2021-07-25T14:20:19.000000Z\",\"updated_at\":\"2021-07-25T14:20:19.000000Z\",\"imported\":0,\"advance_remaining\":\"0.000000\",\"deleted_at\":null,\"repair_brand_id\":null,\"repair_checklist\":null,\"repair_completed_on\":null,\"repair_defects\":null,\"repair_device_id\":null,\"repair_due_date\":null,\"repair_model_id\":null,\"repair_security_pattern\":null,\"repair_security_pwd\":null,\"repair_serial_no\":null,\"repair_status_id\":null,\"repair_updates_notif\":0,\"repair_warranty_id\":null,\"subscription_repeat_on\":null,\"repair_job_sheet_id\":null,\"finance_option_id\":null,\"balance_quantity\":\"0\",\"From_Account\":1,\"To_Account\":1}}', '2022-02-13 20:17:54', '2022-02-13 20:17:54'),
(92, 'Cash Register', 'created', 1, 'App\\CashRegister', 2, 'App\\User', '{\"attributes\":{\"id\":1,\"business_id\":2,\"location_id\":2,\"user_id\":2,\"status\":\"open\",\"closed_at\":null,\"closing_amount\":\"0.0000\",\"total_card_slips\":0,\"total_cheques\":0,\"total_credit_sale\":\"0.0000\",\"closing_note\":null,\"created_at\":\"2022-02-13T20:34:17.000000Z\",\"updated_at\":\"2022-02-13T20:34:17.000000Z\"}}', '2022-02-13 20:34:17', '2022-02-13 20:34:17'),
(93, 'Cash Register Transaction', 'created', 1, 'App\\CashRegisterTransaction', 2, 'App\\User', '{\"attributes\":{\"id\":1,\"cash_register_id\":1,\"amount\":\"1000.0000\",\"pay_method\":\"cash\",\"type\":\"credit\",\"transaction_type\":\"initial\",\"transaction_id\":null,\"created_at\":\"2022-02-13T20:34:17.000000Z\",\"updated_at\":\"2022-02-13T20:34:17.000000Z\"}}', '2022-02-13 20:34:17', '2022-02-13 20:34:17'),
(94, 'Reference Count', 'updated', 1, 'App\\ReferenceCount', 2, 'App\\User', '{\"attributes\":{\"id\":1,\"ref_type\":\"contacts\",\"ref_count\":10,\"business_id\":2,\"created_at\":\"2021-07-20T14:32:44.000000Z\",\"updated_at\":\"2022-02-13T20:34:18.000000Z\"},\"old\":{\"id\":1,\"ref_type\":\"contacts\",\"ref_count\":9,\"business_id\":2,\"created_at\":\"2021-07-20T14:32:44.000000Z\",\"updated_at\":\"2022-02-13T19:43:59.000000Z\"}}', '2022-02-13 20:34:18', '2022-02-13 20:34:18'),
(95, 'Reference Count', 'updated', 1, 'App\\ReferenceCount', 2, 'App\\User', '{\"attributes\":{\"id\":1,\"ref_type\":\"contacts\",\"ref_count\":11,\"business_id\":2,\"created_at\":\"2021-07-20T14:32:44.000000Z\",\"updated_at\":\"2022-02-13T20:58:23.000000Z\"},\"old\":{\"id\":1,\"ref_type\":\"contacts\",\"ref_count\":10,\"business_id\":2,\"created_at\":\"2021-07-20T14:32:44.000000Z\",\"updated_at\":\"2022-02-13T20:34:18.000000Z\"}}', '2022-02-13 20:58:23', '2022-02-13 20:58:23'),
(96, 'Customer Group', 'created', 5, 'App\\ContactGroup', 2, 'App\\User', '{\"attributes\":{\"id\":5,\"business_id\":2,\"type\":\"customer\",\"name\":\"Own Company\",\"amount\":0,\"created_by\":0,\"created_at\":\"2022-02-13T21:15:47.000000Z\",\"updated_at\":\"2022-02-13T21:15:47.000000Z\",\"account_type_id\":null,\"interest_account_id\":null}}', '2022-02-13 21:15:47', '2022-02-13 21:15:47'),
(97, 'Customer Group', 'created', 6, 'App\\ContactGroup', 2, 'App\\User', '{\"attributes\":{\"id\":6,\"business_id\":2,\"type\":\"supplier\",\"name\":\"Own Company\",\"amount\":0,\"created_by\":0,\"created_at\":\"2022-02-13T21:15:47.000000Z\",\"updated_at\":\"2022-02-13T21:15:47.000000Z\",\"account_type_id\":null,\"interest_account_id\":null}}', '2022-02-13 21:15:47', '2022-02-13 21:15:47'),
(98, 'MPCS from settings', 'created', 7, 'Modules\\MPCS\\Entities\\MpcsFormSetting', 2, 'App\\User', '{\"attributes\":{\"id\":7,\"business_id\":2,\"F9C_sn\":1,\"F9C_tdate\":null,\"F159ABC_form_sn\":1,\"F159ABC_form_tdate\":null,\"F159ABC_first_day_after_stock_taking\":0,\"F159ABC_first_day_of_next_month\":0,\"F159ABC_first_day_of_next_month_selected\":null,\"F16A_form_sn\":1,\"F16A_form_tdate\":null,\"F21C_form_sn\":1,\"F21C_form_tdate\":null,\"F14_form_sn\":1,\"F14_form_tdate\":null,\"F17_form_sn\":1,\"F17_form_tdate\":null,\"F20_form_sn\":1,\"F20_form_tdate\":null,\"F21_form_sn\":1,\"F21_form_tdate\":null,\"F22_form_sn\":1,\"F22_form_tdate\":null,\"F22_no_of_product_per_page\":null,\"current_stock_aa_onstocktaking\":0,\"f16a_first_day_after_stock_taking\":0,\"f16a_first_day_of_next_month\":0,\"f16a_first_day_of_next_month_selected\":null,\"created_at\":\"2022-02-13T21:15:47.000000Z\",\"updated_at\":\"2022-02-13T21:15:47.000000Z\",\"F16A_total_pp\":\"0.00\",\"F16A_total_sp\":\"0.00\",\"F21C_first_day_after_stock_taking\":0,\"F21C_first_day_of_next_month_selected\":null,\"F21C_first_day_of_next_month\":0,\"F9C_first_day_after_stock_taking\":0,\"F9C_first_day_of_next_month_selected\":null,\"F9C_first_day_of_next_month\":0}}', '2022-02-13 21:15:47', '2022-02-13 21:15:47'),
(99, 'User', 'updated', 2, 'App\\User', 2, 'App\\User', '{\"attributes\":{\"id\":2,\"surname\":null,\"first_name\":\"Hi\",\"last_name\":\"Cool\",\"username\":\"cool\",\"email\":\"cool@1.com\",\"password\":\"$2y$10$JTkbQNH93ONriGZlq9PlI.TlMfMA7hGITZGZ.ehmI4GArQXBjQuAq\",\"language\":\"en\",\"contact_no\":null,\"address\":null,\"remember_token\":\"VxOEPgspIkh8mkskfQXDZ4Ayr0vDxI347GB3fQnxUUeDO9jis8VcWnJRMJhn\",\"business_id\":2,\"status\":\"active\",\"is_cmmsn_agnt\":0,\"commission_type\":null,\"cmmsn_percent\":\"0.00\",\"cmmsn_application\":null,\"cmmsn_units\":null,\"selected_contacts\":0,\"dob\":null,\"marital_status\":null,\"blood_group\":null,\"contact_number\":null,\"fb_link\":null,\"twitter_link\":null,\"social_media_1\":null,\"social_media_2\":null,\"permanent_address\":null,\"current_address\":null,\"guardian_name\":null,\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"bank_details\":null,\"id_proof_name\":null,\"id_proof_number\":null,\"toggle_popup\":0,\"user_store\":null,\"is_customer\":0,\"is_pump_operator\":0,\"pump_operator_id\":0,\"pump_operator_passcode\":null,\"is_property_user\":0,\"property_user_passcode\":null,\"is_superadmin_default\":0,\"give_away_gifts\":null,\"deleted_at\":null,\"created_at\":\"2021-07-20T14:32:44.000000Z\",\"updated_at\":\"2022-02-13T21:20:55.000000Z\",\"lock_screen\":0,\"max_sales_discount_percent\":null},\"old\":{\"id\":2,\"surname\":null,\"first_name\":\"Hi\",\"last_name\":\"Cool\",\"username\":\"cool\",\"email\":\"cool@1.com\",\"password\":\"$2y$10$JTkbQNH93ONriGZlq9PlI.TlMfMA7hGITZGZ.ehmI4GArQXBjQuAq\",\"language\":\"en\",\"contact_no\":null,\"address\":null,\"remember_token\":\"qOn3ZZ1gTH3IwrEUu20nyAqXkrr6jzcgLdM0Pu8umCOnjLxXuMwvJeP2o9bE\",\"business_id\":2,\"status\":\"active\",\"is_cmmsn_agnt\":0,\"commission_type\":null,\"cmmsn_percent\":\"0.00\",\"cmmsn_application\":null,\"cmmsn_units\":null,\"selected_contacts\":0,\"dob\":null,\"marital_status\":null,\"blood_group\":null,\"contact_number\":null,\"fb_link\":null,\"twitter_link\":null,\"social_media_1\":null,\"social_media_2\":null,\"permanent_address\":null,\"current_address\":null,\"guardian_name\":null,\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"bank_details\":null,\"id_proof_name\":null,\"id_proof_number\":null,\"toggle_popup\":0,\"user_store\":null,\"is_customer\":0,\"is_pump_operator\":0,\"pump_operator_id\":0,\"pump_operator_passcode\":null,\"is_property_user\":0,\"property_user_passcode\":null,\"is_superadmin_default\":0,\"give_away_gifts\":null,\"deleted_at\":null,\"created_at\":\"2021-07-20T14:32:44.000000Z\",\"updated_at\":\"2022-02-13T21:20:55.000000Z\",\"lock_screen\":0,\"max_sales_discount_percent\":null}}', '2022-02-14 09:55:21', '2022-02-14 09:55:21'),
(100, 'Reference Count', 'created', 14, 'App\\ReferenceCount', 2, 'App\\User', '{\"attributes\":{\"id\":14,\"ref_type\":\"expense\",\"ref_count\":1,\"business_id\":2,\"created_at\":\"2022-02-14T10:15:47.000000Z\",\"updated_at\":\"2022-02-14T10:15:47.000000Z\"}}', '2022-02-14 10:15:47', '2022-02-14 10:15:47'),
(101, 'Reference Count', 'updated', 1, 'App\\ReferenceCount', 2, 'App\\User', '{\"attributes\":{\"id\":1,\"ref_type\":\"contacts\",\"ref_count\":12,\"business_id\":2,\"created_at\":\"2021-07-20T14:32:44.000000Z\",\"updated_at\":\"2022-02-14T10:21:42.000000Z\"},\"old\":{\"id\":1,\"ref_type\":\"contacts\",\"ref_count\":11,\"business_id\":2,\"created_at\":\"2021-07-20T14:32:44.000000Z\",\"updated_at\":\"2022-02-13T20:58:23.000000Z\"}}', '2022-02-14 10:21:42', '2022-02-14 10:21:42'),
(102, 'Reference Count', 'updated', 1, 'App\\ReferenceCount', 2, 'App\\User', '{\"attributes\":{\"id\":1,\"ref_type\":\"contacts\",\"ref_count\":13,\"business_id\":2,\"created_at\":\"2021-07-20T14:32:44.000000Z\",\"updated_at\":\"2022-02-14T10:21:45.000000Z\"},\"old\":{\"id\":1,\"ref_type\":\"contacts\",\"ref_count\":12,\"business_id\":2,\"created_at\":\"2021-07-20T14:32:44.000000Z\",\"updated_at\":\"2022-02-14T10:21:42.000000Z\"}}', '2022-02-14 10:21:45', '2022-02-14 10:21:45'),
(103, 'User', 'updated', 2, 'App\\User', 2, 'App\\User', '{\"attributes\":{\"id\":2,\"surname\":null,\"first_name\":\"Hi\",\"last_name\":\"Cool\",\"username\":\"cool\",\"email\":\"cool@1.com\",\"password\":\"$2y$10$JTkbQNH93ONriGZlq9PlI.TlMfMA7hGITZGZ.ehmI4GArQXBjQuAq\",\"language\":\"en\",\"contact_no\":null,\"address\":null,\"remember_token\":\"BNs05LNEWoDAYqZtcWIkwFdDSDxtXJRFVsUeO8looSuvsw4XRBfFHfPr2q2h\",\"business_id\":2,\"status\":\"active\",\"is_cmmsn_agnt\":0,\"commission_type\":null,\"cmmsn_percent\":\"0.00\",\"cmmsn_application\":null,\"cmmsn_units\":null,\"selected_contacts\":0,\"dob\":null,\"marital_status\":null,\"blood_group\":null,\"contact_number\":null,\"fb_link\":null,\"twitter_link\":null,\"social_media_1\":null,\"social_media_2\":null,\"permanent_address\":null,\"current_address\":null,\"guardian_name\":null,\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"bank_details\":null,\"id_proof_name\":null,\"id_proof_number\":null,\"toggle_popup\":0,\"user_store\":null,\"is_customer\":0,\"is_pump_operator\":0,\"pump_operator_id\":0,\"pump_operator_passcode\":null,\"is_property_user\":0,\"property_user_passcode\":null,\"is_superadmin_default\":0,\"give_away_gifts\":null,\"deleted_at\":null,\"created_at\":\"2021-07-20T14:32:44.000000Z\",\"updated_at\":\"2022-02-13T21:20:55.000000Z\",\"lock_screen\":0,\"max_sales_discount_percent\":null},\"old\":{\"id\":2,\"surname\":null,\"first_name\":\"Hi\",\"last_name\":\"Cool\",\"username\":\"cool\",\"email\":\"cool@1.com\",\"password\":\"$2y$10$JTkbQNH93ONriGZlq9PlI.TlMfMA7hGITZGZ.ehmI4GArQXBjQuAq\",\"language\":\"en\",\"contact_no\":null,\"address\":null,\"remember_token\":\"VxOEPgspIkh8mkskfQXDZ4Ayr0vDxI347GB3fQnxUUeDO9jis8VcWnJRMJhn\",\"business_id\":2,\"status\":\"active\",\"is_cmmsn_agnt\":0,\"commission_type\":null,\"cmmsn_percent\":\"0.00\",\"cmmsn_application\":null,\"cmmsn_units\":null,\"selected_contacts\":0,\"dob\":null,\"marital_status\":null,\"blood_group\":null,\"contact_number\":null,\"fb_link\":null,\"twitter_link\":null,\"social_media_1\":null,\"social_media_2\":null,\"permanent_address\":null,\"current_address\":null,\"guardian_name\":null,\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"bank_details\":null,\"id_proof_name\":null,\"id_proof_number\":null,\"toggle_popup\":0,\"user_store\":null,\"is_customer\":0,\"is_pump_operator\":0,\"pump_operator_id\":0,\"pump_operator_passcode\":null,\"is_property_user\":0,\"property_user_passcode\":null,\"is_superadmin_default\":0,\"give_away_gifts\":null,\"deleted_at\":null,\"created_at\":\"2021-07-20T14:32:44.000000Z\",\"updated_at\":\"2022-02-13T21:20:55.000000Z\",\"lock_screen\":0,\"max_sales_discount_percent\":null}}', '2022-02-14 12:08:09', '2022-02-14 12:08:09'),
(104, 'User', 'updated', 1, 'App\\User', 1, 'App\\User', '{\"attributes\":{\"id\":1,\"surname\":null,\"first_name\":\"syzygy\",\"last_name\":null,\"username\":\"syzygy\",\"email\":\"vikum12@gmail.com\",\"password\":\"$2y$10$DM\\/I12r2UboQ51yZia1IVOfj7AZp2ClaeTUZMGPuL.pPx9mNc3NUu\",\"language\":\"sin\",\"contact_no\":null,\"address\":null,\"remember_token\":\"KhceKyw4N9rGrit0hWbqz75djEFUj4URJzFuiFdI5rVSl5D6aWdooJd41ZFX\",\"business_id\":1,\"status\":\"active\",\"is_cmmsn_agnt\":0,\"commission_type\":null,\"cmmsn_percent\":\"0.00\",\"cmmsn_application\":null,\"cmmsn_units\":null,\"selected_contacts\":0,\"dob\":null,\"marital_status\":null,\"blood_group\":null,\"contact_number\":null,\"fb_link\":null,\"twitter_link\":null,\"social_media_1\":null,\"social_media_2\":null,\"permanent_address\":null,\"current_address\":null,\"guardian_name\":null,\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"bank_details\":\"{\\\"account_holder_name\\\":null,\\\"account_number\\\":null,\\\"bank_name\\\":null,\\\"bank_code\\\":null,\\\"branch\\\":null,\\\"tax_payer_id\\\":null}\",\"id_proof_name\":null,\"id_proof_number\":null,\"toggle_popup\":0,\"user_store\":null,\"is_customer\":0,\"is_pump_operator\":0,\"pump_operator_id\":0,\"pump_operator_passcode\":null,\"is_property_user\":0,\"property_user_passcode\":null,\"is_superadmin_default\":0,\"give_away_gifts\":null,\"deleted_at\":null,\"created_at\":\"2019-12-30T11:22:03.000000Z\",\"updated_at\":\"2020-11-16T05:11:28.000000Z\",\"lock_screen\":0,\"max_sales_discount_percent\":null},\"old\":{\"id\":1,\"surname\":null,\"first_name\":\"syzygy\",\"last_name\":null,\"username\":\"syzygy\",\"email\":\"vikum12@gmail.com\",\"password\":\"$2y$10$DM\\/I12r2UboQ51yZia1IVOfj7AZp2ClaeTUZMGPuL.pPx9mNc3NUu\",\"language\":\"sin\",\"contact_no\":null,\"address\":null,\"remember_token\":\"d6G17cAxWTdp36S9ZHH3Aw1Wi1useNn9llwZ2bsq0rrxHfXID7KMFsoihWhX\",\"business_id\":1,\"status\":\"active\",\"is_cmmsn_agnt\":0,\"commission_type\":null,\"cmmsn_percent\":\"0.00\",\"cmmsn_application\":null,\"cmmsn_units\":null,\"selected_contacts\":0,\"dob\":null,\"marital_status\":null,\"blood_group\":null,\"contact_number\":null,\"fb_link\":null,\"twitter_link\":null,\"social_media_1\":null,\"social_media_2\":null,\"permanent_address\":null,\"current_address\":null,\"guardian_name\":null,\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"bank_details\":\"{\\\"account_holder_name\\\":null,\\\"account_number\\\":null,\\\"bank_name\\\":null,\\\"bank_code\\\":null,\\\"branch\\\":null,\\\"tax_payer_id\\\":null}\",\"id_proof_name\":null,\"id_proof_number\":null,\"toggle_popup\":0,\"user_store\":null,\"is_customer\":0,\"is_pump_operator\":0,\"pump_operator_id\":0,\"pump_operator_passcode\":null,\"is_property_user\":0,\"property_user_passcode\":null,\"is_superadmin_default\":0,\"give_away_gifts\":null,\"deleted_at\":null,\"created_at\":\"2019-12-30T11:22:03.000000Z\",\"updated_at\":\"2020-11-16T05:11:28.000000Z\",\"lock_screen\":0,\"max_sales_discount_percent\":null}}', '2022-02-14 12:09:06', '2022-02-14 12:09:06');

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `name` varchar(191) NOT NULL,
  `address` text NOT NULL,
  `mobile_number` varchar(191) NOT NULL,
  `land_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `nic_number` varchar(191) NOT NULL,
  `nic_copy` varchar(191) DEFAULT NULL,
  `agent_photo` varchar(191) DEFAULT NULL,
  `referral_code` varchar(191) NOT NULL,
  `bank_name` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `branch` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `leave_category_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `attendance_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'status 1=present 0=absen and 3= onleave',
  `in_time` time NOT NULL,
  `out_time` time NOT NULL,
  `over_time` tinyint(1) NOT NULL DEFAULT 0,
  `ot_hours` int(10) NOT NULL DEFAULT 0,
  `ot_minutes` int(10) NOT NULL DEFAULT 0,
  `approved_ot_hours` int(10) NOT NULL DEFAULT 0,
  `approved_ot_minutes` int(10) NOT NULL DEFAULT 0,
  `late_time` tinyint(1) NOT NULL DEFAULT 0,
  `lt_hours` int(10) NOT NULL DEFAULT 0,
  `lt_minutes` int(10) NOT NULL DEFAULT 0,
  `approved_lt_hours` int(10) NOT NULL DEFAULT 0,
  `approved_lt_minutes` int(10) NOT NULL DEFAULT 0,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `balamandalayas`
--

CREATE TABLE `balamandalayas` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `gramaseva_vasama_id` int(10) NOT NULL,
  `balamandalaya` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_continuous` tinyint(1) NOT NULL DEFAULT 0,
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `label_font_size` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `basic_salaries`
--

CREATE TABLE `basic_salaries` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `salary_date` date NOT NULL,
  `department_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `salary_amount` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `block_close_reasons`
--

CREATE TABLE `block_close_reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reason` text NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `boat_trips`
--

CREATE TABLE `boat_trips` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `trip_name` varchar(191) NOT NULL,
  `starting_location` varchar(191) NOT NULL,
  `final_location` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` enum('booked','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `is_manged_stock_enable` int(11) NOT NULL DEFAULT 0 COMMENT '0 = disable, 1 = enable manage stock in product page',
  `business_categories` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_for_customers` tinyint(1) NOT NULL DEFAULT 0,
  `day_end` int(11) NOT NULL DEFAULT 0,
  `day_end_enable` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT 0.00,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT 1,
  `accounting_method` enum('fifo','lifo','avco') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `expiry_type` enum('add_expiry','add_manufacturing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `sale_import_date` date DEFAULT NULL,
  `purchase_import_date` date DEFAULT NULL,
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT 1,
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `keyboard_shortcuts` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturing_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_brand` tinyint(1) NOT NULL DEFAULT 1,
  `enable_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT 1,
  `enable_purchase_status` tinyint(1) DEFAULT 1,
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT 0,
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT 0,
  `enable_racks` tinyint(1) NOT NULL DEFAULT 0,
  `enable_row` tinyint(1) NOT NULL DEFAULT 0,
  `enable_position` tinyint(1) NOT NULL DEFAULT 0,
  `show_avai_qty_in_qr_catalogue` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_catalogue_page` tinyint(1) NOT NULL DEFAULT 0,
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT 1,
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT 1,
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT 1,
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `ref_no_prefixes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_color` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `enable_free_qty` tinyint(1) NOT NULL DEFAULT 0,
  `popup_load_save_data` tinyint(1) NOT NULL DEFAULT 0,
  `rp_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_labels` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `common_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_line_discount` tinyint(1) NOT NULL DEFAULT 0,
  `currency_precision` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '2',
  `reg_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity_precision` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '2',
  `search_product_settings` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_store` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_patient` tinyint(1) NOT NULL DEFAULT 0,
  `is_hospital` tinyint(1) DEFAULT 0,
  `is_pharmacy` tinyint(1) NOT NULL DEFAULT 0,
  `is_laboratory` tinyint(1) NOT NULL DEFAULT 0,
  `patient_details_id` int(11) DEFAULT NULL,
  `background_showing_type` enum('only_background_image','background_image_and_logo') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ref_no_starting_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repair_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitor_qr_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_used` tinyint(1) NOT NULL DEFAULT 0,
  `customer_interest_deduct_option` tinyint(4) NOT NULL DEFAULT 0,
  `customer_interest_deduct` int(11) NOT NULL DEFAULT 0,
  `service_addition_method` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `company_number`, `currency_id`, `is_manged_stock_enable`, `business_categories`, `show_for_customers`, `day_end`, `day_end_enable`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `sale_import_date`, `purchase_import_date`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `manufacturing_settings`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `show_avai_qty_in_qr_catalogue`, `show_in_catalogue_page`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `ref_no_prefixes`, `theme_color`, `created_by`, `enable_rp`, `enable_free_qty`, `popup_load_save_data`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `enable_line_discount`, `currency_precision`, `reg_no`, `quantity_precision`, `search_product_settings`, `default_store`, `is_active`, `is_patient`, `is_hospital`, `is_pharmacy`, `is_laboratory`, `patient_details_id`, `background_showing_type`, `background_image`, `created_at`, `updated_at`, `ref_no_starting_number`, `repair_settings`, `visitor_qr_data`, `contact_fields`, `trial_used`, `customer_interest_deduct_option`, `customer_interest_deduct`, `service_addition_method`) VALUES
(1, 'SYZYGY', NULL, 111, 1, 'null', 1, 0, 0, '2019-12-01', NULL, NULL, NULL, NULL, NULL, 25.00, 1, 'Asia/Colombo', 1, 'fifo', '0.00', 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, NULL, NULL, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"tc_sale_and_pos_text\":\"&lt;br&gt;\",\"show_credit_sale_button\":\"1\",\"duplicate_invoice_prefix\":0,\"disable_duplicate_invoice\":0,\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', NULL, 1, 1, 1, 1, 1, 0, NULL, 0, 1, 0, 0, 0, 0, 1, 'cmsn_agnt', 1, 0, 'before', '[\"purchase\",\"add_sale\",\"pos_sale\",\"stock_transfer\",\"stock_adjustment\",\"expenses\",\"account\",\"banking_module\",\"tables\",\"modifiers\",\"booking\",\"kitchen\",\"subscription\",\"type_of_service\",\"tables\",\"modifiers\",\"service_staff\",\"kitchen\",\"booking\"]', 'd-m-Y', '24', '{\"purchase\":\"PO\",\"purchase_return\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"customer\":null,\"supplier\":null,\"settlement\":null,\"excess_commission\":null,\"shortage_recover\":null,\"security_deposit\":null,\"refund_security_deposit\":null,\"employee_no\":null}', NULL, NULL, 0, 0, 0, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":\"7777\",\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null},\"custom_field\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null}}', '{\"enable_product_warranty\":\"1\",\"default_datatable_page_entries\":\"25\"}', 0, '3', NULL, '3', '{\"enable_code\":\"1\",\"enable_rack_number\":\"1\",\"enable_qty\":\"1\",\"enable_product_cost\":\"1\",\"enable_product_supplier\":\"1\"}', NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, '2019-12-30 11:22:03', '2022-02-14 10:19:30', '{\"purchase\":null,\"purchase_return\":null,\"stock_transfer\":null,\"stock_adjustment\":null,\"sell_return\":null,\"expense\":null,\"contacts\":null,\"purchase_payment\":null,\"sell_payment\":null,\"expense_payment\":null,\"business_location\":null,\"username\":null,\"subscription\":null,\"customer\":null,\"supplier\":null,\"settlement\":null,\"excess_commission\":null,\"shortage_recover\":null,\"security_deposit\":null,\"refund_security_deposit\":null,\"employee_no\":null}', NULL, NULL, NULL, 0, 0, 0, 0),
(2, 'Cool', 'RA-8', 111, 1, '[]', 0, 0, 0, '2021-07-01', NULL, NULL, NULL, NULL, NULL, 25.00, 2, 'Asia/Colombo', 1, 'fifo', NULL, 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, '2021-07-25', '2021-07-25', 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"recent_product_quantity\":\"f2\",\"add_new_product\":\"f4\"}}', NULL, NULL, 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchase\",\"add_sale\",\"pos_sale\",\"stock_transfer\",\"stock_adjustment\",\"expenses\",\"account\",\"banking_module\",\"modifiers\",\"subscription\",\"type_of_service\",\"service_staff\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"business_location\":\"BL\",\"customer\":\"CU\",\"supplier\":\"SU\",\"settlement\":\"ST\"}', NULL, NULL, 0, 0, 0, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', NULL, NULL, NULL, NULL, 0, '2', NULL, '2', NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, '2021-07-20 14:32:44', '2022-02-14 11:53:16', '{\"purchase\":\"1\",\"stock_transfer\":\"1\",\"stock_adjustment\":\"1\",\"sell_return\":\"1\",\"expense\":\"1\",\"contacts\":\"1\",\"purchase_payment\":\"1\",\"sell_payment\":\"1\",\"business_location\":\"1\",\"customer\":\"1\",\"supplier\":\"1\",\"settlement\":\"1\"}', NULL, NULL, NULL, 0, 0, 0, 0),
(3, 'LKD', 'RA-9', 111, 1, '[]', 0, 0, 0, '2022-02-03', NULL, NULL, NULL, NULL, NULL, 25.00, 5, 'Asia/Colombo', 1, 'fifo', NULL, 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, '2022-02-03', '2022-02-03', 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"recent_product_quantity\":\"f2\",\"add_new_product\":\"f4\"}}', NULL, NULL, 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchase\",\"add_sale\",\"pos_sale\",\"stock_transfer\",\"stock_adjustment\",\"expenses\",\"account\",\"banking_module\",\"modifiers\",\"subscription\",\"type_of_service\",\"service_staff\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"business_location\":\"BL\",\"customer\":\"CU\",\"supplier\":\"SU\",\"settlement\":\"ST\"}', NULL, NULL, 0, 0, 0, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', NULL, NULL, NULL, NULL, 0, '2', NULL, '2', NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, '2022-02-03 06:03:22', '2022-02-14 10:19:30', '{\"purchase\":\"1\",\"stock_transfer\":\"1\",\"stock_adjustment\":\"1\",\"sell_return\":\"1\",\"expense\":\"1\",\"contacts\":\"1\",\"purchase_payment\":\"1\",\"sell_payment\":\"1\",\"business_location\":\"1\",\"customer\":\"1\",\"supplier\":\"1\",\"settlement\":\"1\"}', NULL, NULL, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT 1,
  `receipt_printer_type` enum('browser','printer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_payment_accounts` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `default_payment_accounts`, `is_active`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'SYZYGY', '1', 'Sri Lanka', 'Western', 'Malabe', '10115', 1, 1, NULL, 1, 'browser', NULL, 'Mobile', 'Alternate', NULL, NULL, '{\"cash\":{\"is_enabled\":\"1\",\"account\":1},\"card\":{\"is_enabled\":\"1\",\"account\":9},\"cheque\":{\"is_enabled\":\"1\",\"account\":3},\"direct_bank_deposit\":{\"is_enabled\":\"1\",\"account\":2},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":2},\"other\":{\"is_enabled\":0,\"account\":2},\"custom_pay_1\":{\"is_enabled\":0,\"account\":2},\"custom_pay_2\":{\"is_enabled\":0,\"account\":2}}', 1, NULL, NULL, NULL, NULL, NULL, '2019-12-30 11:22:03', '2021-07-25 14:31:58'),
(2, 2, 'BL0001', 'Cool', '1', 'Sri Lanka', 'Western', 'Malabe', '10115', 2, 2, NULL, 1, 'browser', NULL, '1', '1', '', '1', '{\"cash\":{\"is_enabled\":\"1\",\"account\":\"2993\"},\"card\":{\"is_enabled\":\"1\",\"account\":\"3001\"},\"cheque\":{\"is_enabled\":\"1\",\"account\":\"2995\"},\"direct_bank_deposit\":{\"is_enabled\":\"1\",\"account\":\"2994\"},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":\"2994\"},\"other\":{\"account\":\"2994\"},\"custom_pay_1\":{\"account\":\"2994\"},\"custom_pay_2\":{\"account\":\"2994\"}}', 1, NULL, NULL, NULL, NULL, NULL, '2021-07-20 14:32:44', '2022-02-14 11:53:16'),
(3, 3, 'BL0001', 'LKD', '11', 'SL', '0', 'Bangadeniya', '0', 3, 3, NULL, 1, 'browser', NULL, '032 22 59 498', '032 22 59 498', NULL, 'https://ezypetro.com/95-lankakerosenedepot-karukupone', '{\"cash\":{\"is_enabled\":\"1\",\"account\":\"3037\"},\"card\":{\"is_enabled\":\"1\",\"account\":\"3045\"},\"cheque\":{\"is_enabled\":\"1\",\"account\":\"3039\"},\"direct_bank_deposit\":{\"is_enabled\":\"1\",\"account\":\"3038\"},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":\"3038\"},\"other\":{\"account\":\"3037\"},\"custom_pay_1\":{\"account\":\"3037\"},\"custom_pay_2\":{\"account\":\"3037\"}}', 1, NULL, NULL, NULL, NULL, NULL, '2022-02-03 06:03:22', '2022-02-04 08:14:55');

-- --------------------------------------------------------

--
-- Table structure for table `bussines_categories`
--

CREATE TABLE `bussines_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_card_slips` int(11) NOT NULL DEFAULT 0,
  `total_cheques` int(11) NOT NULL DEFAULT 0,
  `total_credit_sale` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `closing_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `total_credit_sale`, `closing_note`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 2, 'open', NULL, '0.0000', 0, 0, '0.0000', NULL, '2022-02-13 20:34:17', '2022-02-13 20:34:17');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_register_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pay_method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` enum('initial','sell','transfer','refund') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 1, '1000.0000', 'cash', 'credit', 'initial', NULL, '2022-02-13 20:34:17', '2022-02-13 20:34:17');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `add_related_account` enum('category_level','sub_category_level') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cogs_account_id` int(10) DEFAULT NULL,
  `sales_income_account_id` int(10) DEFAULT NULL,
  `weight_excess_loss_applicable` tinyint(1) NOT NULL DEFAULT 0,
  `weight_loss_expense_account_id` int(10) UNSIGNED DEFAULT NULL,
  `weight_excess_income_account_id` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `add_related_account`, `cogs_account_id`, `sales_income_account_id`, `weight_excess_loss_applicable`, `weight_loss_expense_account_id`, `weight_excess_income_account_id`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Fuel', 2, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 2, NULL, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(2, 'Others', 2, 'CAT1', 0, 'sub_category_level', NULL, NULL, 0, NULL, NULL, 2, NULL, '2021-07-25 14:48:48', '2021-07-25 14:48:48'),
(3, 'Gas', 2, 'SCAT1', 2, 'category_level', 3024, 3016, 0, NULL, NULL, 2, NULL, '2021-07-25 14:51:37', '2021-07-25 14:51:37'),
(4, 'Lubricants', 2, 'SCAT2', 2, 'category_level', 3031, 3023, 0, NULL, NULL, 2, NULL, '2021-07-25 14:53:21', '2021-07-25 14:53:21'),
(5, 'Petrol 92', 2, 'SCAT 3', 1, 'category_level', 3027, 3019, 0, NULL, NULL, 2, NULL, '2021-07-25 15:04:31', '2021-07-25 15:04:31'),
(6, 'Petrol 95', 2, 'SCAT 4', 1, 'category_level', 3028, 3020, 0, NULL, NULL, 2, NULL, '2021-07-25 15:05:03', '2021-07-25 15:05:03'),
(7, 'Auto Diesel', 2, 'SCAT 5', 1, 'category_level', 3029, 3021, 0, NULL, NULL, 2, NULL, '2021-07-25 15:05:53', '2021-07-25 15:05:53'),
(8, 'Fuel', 3, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(9, 'Lubricants', 3, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, '2022-02-03 06:15:54', '2022-02-03 06:15:54'),
(10, 'Gas', 3, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, '2022-02-03 06:16:10', '2022-02-03 06:16:10'),
(11, 'Other Items', 3, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, '2022-02-03 06:16:39', '2022-02-03 06:16:39'),
(12, 'Gas', 3, 'SC-Gas', 10, 'category_level', 3068, 3060, 0, NULL, NULL, 5, NULL, '2022-02-03 06:17:18', '2022-02-03 06:17:18'),
(13, 'Cylinders', 3, 'SC-Cylinders', 10, 'category_level', 3068, 3060, 0, NULL, NULL, 5, NULL, '2022-02-03 06:17:45', '2022-02-03 06:17:45'),
(14, 'Lubricants', 3, 'SC-Lubricants', 9, 'category_level', 3070, 3062, 0, NULL, NULL, 5, '2022-02-03 06:20:15', '2022-02-03 06:18:21', '2022-02-03 06:20:15'),
(15, 'LK', 3, 'SC-LK', 8, 'category_level', 3069, 3061, 0, NULL, NULL, 5, NULL, '2022-02-03 06:18:51', '2022-02-03 06:18:51'),
(16, 'Caltex', 3, 'SC-Caltex', 9, 'category_level', 3075, 3067, 0, NULL, NULL, 5, NULL, '2022-02-03 06:19:46', '2022-02-03 06:21:40'),
(17, 'Laugfs', 3, 'SC-Laugfs', 9, 'category_level', 3075, 3067, 0, NULL, NULL, 5, NULL, '2022-02-03 06:20:59', '2022-02-03 06:20:59'),
(18, 'Litro Gas', 3, 'SC-Litro Gas', 11, 'category_level', 3070, 3062, 0, NULL, NULL, 5, '2022-02-03 06:30:06', '2022-02-03 06:22:52', '2022-02-03 06:30:06'),
(19, 'Panasonic', 3, 'SC-Panasonic', 11, 'category_level', 3070, 3062, 0, NULL, NULL, 5, NULL, '2022-02-03 06:23:50', '2022-02-03 06:23:50'),
(20, 'Orange', 3, 'SC-Orange', 11, 'category_level', 3070, 3062, 0, NULL, NULL, 5, NULL, '2022-02-03 06:23:50', '2022-02-03 06:23:50'),
(21, 'Fresh Lanka', 3, 'SC-Fresh Lanka', 11, 'category_level', 3070, 3062, 0, NULL, NULL, 5, NULL, '2022-02-03 06:24:34', '2022-02-03 06:24:34'),
(22, 'Yamaha', 3, 'SC-Yamaha', 11, 'category_level', 3070, 3062, 0, NULL, NULL, 5, NULL, '2022-02-03 06:24:56', '2022-02-03 06:24:56'),
(23, 'Others', 3, 'SC-Others', 10, 'category_level', 3068, 3060, 0, NULL, NULL, 5, NULL, '2022-02-03 06:27:03', '2022-02-03 06:27:03'),
(24, 'Litro Gas', 3, NULL, 10, NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(25, 'Litro Cylinders', 3, NULL, 10, NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47');

-- --------------------------------------------------------

--
-- Table structure for table `chequer_bank_accounts`
--

CREATE TABLE `chequer_bank_accounts` (
  `id` int(11) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `account_number` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `branch` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `current_balance` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `is_visible` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0:Inactive, 1:Active, 2:Delete',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `transaction_date` timestamp NULL DEFAULT NULL,
  `cheque_templete_id` int(11) NOT NULL,
  `account_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:Bank, 0:Loan',
  `cashier_account` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1:Cashier Account',
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chequer_currencies`
--

CREATE TABLE `chequer_currencies` (
  `iso` char(3) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chequer_default_settings`
--

CREATE TABLE `chequer_default_settings` (
  `id` int(11) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `def_tempid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `def_curnctname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `def_stampid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `def_entrydt` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `def_status` int(11) NOT NULL DEFAULT 1,
  `def_currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `def_stamp` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `def_cheque_templete` int(11) NOT NULL,
  `def_bank_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `def_font` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `def_font_size` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chequer_purchase_orders`
--

CREATE TABLE `chequer_purchase_orders` (
  `id` int(11) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `po_number` varchar(499) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_bill_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `total_items` int(11) NOT NULL,
  `discount_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount_percentage` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `subTotal` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `grandTotal` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(499) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_email` varchar(499) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `supplier_tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_fax` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `outlet_id` int(11) NOT NULL,
  `outlet_name` varchar(499) COLLATE utf8_unicode_ci NOT NULL,
  `outlet_address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `outlet_contact` varchar(499) COLLATE utf8_unicode_ci NOT NULL,
  `warehouse_id` int(100) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `payment_method_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cheque_number` varchar(499) COLLATE utf8_unicode_ci NOT NULL,
  `gift_card` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `card_number` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `paid_amt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `return_change` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `po_date` date NOT NULL,
  `attachment_file` varchar(499) COLLATE utf8_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_user_id` int(11) NOT NULL,
  `created_datetime` datetime NOT NULL,
  `updated_user_id` int(11) NOT NULL,
  `updated_datetime` datetime NOT NULL,
  `received_user_id` int(11) NOT NULL,
  `received_datetime` datetime NOT NULL,
  `transation_date` date NOT NULL,
  `status` int(11) NOT NULL,
  `vt_status` int(1) NOT NULL COMMENT '0: Debit Payment, 1: Completed ',
  `refund_status` int(1) NOT NULL COMMENT '1: Full Refund, 2: Partial Refund ',
  `pid` int(11) NOT NULL,
  `fuel_tank_id` text COLLATE utf8_unicode_ci NOT NULL,
  `supplier_order_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chequer_stamps`
--

CREATE TABLE `chequer_stamps` (
  `id` int(11) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `stamp_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `stamp_image` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `stamp_entrydt` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `stamp_status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chequer_suppliers`
--

CREATE TABLE `chequer_suppliers` (
  `id` int(11) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(4999) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_user_id` int(11) NOT NULL DEFAULT 0,
  `created_datetime` datetime NOT NULL,
  `updated_user_id` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `balance` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `isPayee` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cheque_numbers`
--

CREATE TABLE `cheque_numbers` (
  `id` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `account_no` varchar(100) DEFAULT NULL,
  `first_cheque_no` varchar(100) DEFAULT NULL,
  `last_cheque_no` varchar(100) DEFAULT NULL,
  `no_of_cheque_leaves` varchar(50) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cheque_number_maintains`
--

CREATE TABLE `cheque_number_maintains` (
  `id` int(11) NOT NULL,
  `account_no` int(11) NOT NULL DEFAULT 0,
  `cheque_no` int(11) NOT NULL DEFAULT 0,
  `status` varchar(2) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cheque_templates`
--

CREATE TABLE `cheque_templates` (
  `id` int(10) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `image_url` varchar(50) NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `template_size` varchar(20) NOT NULL,
  `pay_name` varchar(20) NOT NULL,
  `date_pos` varchar(255) NOT NULL,
  `date_format` varchar(255) DEFAULT NULL,
  `amount` varchar(20) NOT NULL,
  `amount_in_w1` varchar(20) NOT NULL,
  `amount_in_w2` varchar(20) NOT NULL,
  `amount_in_w3` varchar(20) NOT NULL,
  `template_cross` varchar(20) NOT NULL,
  `pay_only` varchar(20) NOT NULL,
  `not_negotiable` varchar(20) NOT NULL,
  `signature_stamp` varchar(20) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `seprator` varchar(225) DEFAULT NULL,
  `words2` varchar(225) DEFAULT NULL,
  `words3` varchar(225) DEFAULT NULL,
  `is_dublecross` varchar(225) DEFAULT NULL,
  `dublecross` varchar(225) DEFAULT NULL,
  `is_stamp` varchar(225) DEFAULT NULL,
  `is_strikeBearer` varchar(255) DEFAULT NULL,
  `strikeBearer` varchar(255) DEFAULT NULL,
  `d1` varchar(225) DEFAULT NULL,
  `d2` varchar(255) DEFAULT NULL,
  `m1` varchar(255) DEFAULT NULL,
  `m2` varchar(255) DEFAULT NULL,
  `y1` varchar(255) DEFAULT NULL,
  `y2` varchar(255) DEFAULT NULL,
  `y3` varchar(255) DEFAULT NULL,
  `y4` varchar(255) DEFAULT NULL,
  `ds1` varchar(225) DEFAULT NULL,
  `ds2` varchar(255) DEFAULT NULL,
  `signature_stamp_area` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `close_current_sales`
--

CREATE TABLE `close_current_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `property_finalize_id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `block_id` int(10) UNSIGNED NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `closed_by` int(10) UNSIGNED NOT NULL,
  `reason_id` varchar(191) NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `all_payments_completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `company_package_variables`
--

CREATE TABLE `company_package_variables` (
  `id` int(10) UNSIGNED NOT NULL,
  `variable_options` int(11) NOT NULL,
  `variable_code` varchar(191) NOT NULL,
  `option_value` int(11) NOT NULL,
  `increase_decrease` enum('0','1') NOT NULL,
  `variable_type` enum('0','1') NOT NULL,
  `price_value` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `components`
--

CREATE TABLE `components` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('supplier','customer','both') COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `total_rp` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `customer_group_id` int(11) DEFAULT NULL,
  `supplier_group_id` int(10) UNSIGNED DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sell_over_limit` tinyint(1) NOT NULL DEFAULT 0,
  `sol_without_approval` tinyint(1) NOT NULL DEFAULT 0,
  `sol_with_approval` tinyint(1) NOT NULL DEFAULT 0,
  `over_limit_percentage` decimal(10,2) NOT NULL DEFAULT 0.00,
  `temp_approved_user` int(10) DEFAULT NULL,
  `temp_requested_by` int(10) UNSIGNED DEFAULT NULL,
  `is_property` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nic_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_account` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `security_deposit_asset_account` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `security_deposit_liability_account` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_payee` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `supplier_business_name`, `name`, `email`, `contact_id`, `tax_number`, `city`, `address`, `geo_location`, `state`, `country`, `landmark`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `customer_group_id`, `supplier_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `sell_over_limit`, `sol_without_approval`, `sol_with_approval`, `over_limit_percentage`, `temp_approved_user`, `temp_requested_by`, `is_property`, `active`, `deleted_at`, `created_at`, `updated_at`, `nic_number`, `image`, `signature`, `payment_account`, `security_deposit_asset_account`, `security_deposit_liability_account`, `is_payee`) VALUES
(1, 1, 'customer', NULL, 'Walk-In Customer', NULL, 'CO0001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0),
(2, 2, 'customer', NULL, 'Walk-In Customer', NULL, 'CO-0001-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2021-07-20 14:32:44', '2021-07-20 14:32:44', '', NULL, NULL, NULL, NULL, NULL, 0),
(3, 2, 'customer', NULL, 'Customer 1', 'c1@1.com', 'CO-0002-2', NULL, '1', NULL, NULL, '1', '1', '1', '1', '1', '1', NULL, NULL, NULL, 2, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2021-07-25 14:20:19', '2021-07-25 14:20:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(4, 2, 'customer', NULL, 'Customer 2', 'c2@1.com', 'CO-0003-2', NULL, '1', NULL, NULL, '1', '1', '1', '1', '1', '1', NULL, NULL, NULL, 2, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2021-07-25 14:21:53', '2021-07-25 14:21:53', '', NULL, NULL, NULL, NULL, NULL, 0),
(5, 2, 'customer', NULL, 'Customer 3', 'c3@1.com', 'CO-0004-2', NULL, '1', NULL, NULL, '1', '1', '1', '1', '1', '1', NULL, NULL, NULL, 2, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2021-07-25 14:22:54', '2021-07-25 14:22:54', '', NULL, NULL, NULL, NULL, NULL, 0),
(6, 2, 'supplier', NULL, 'CPC', NULL, 'CO-0008-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, 'days', NULL, 2, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2021-07-31 04:00:00', '2021-07-31 12:34:58', '', NULL, NULL, NULL, NULL, NULL, 0),
(7, 3, 'customer', NULL, 'Shahrukh Khan', 'abc@gmail.com', 'CO-0001-3', NULL, 'Karachi', NULL, NULL, 'Karachi', 'Pakistan', 'abc', '0315379475', NULL, '03194373317', NULL, NULL, NULL, 5, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 06:03:22', '2022-02-08 11:28:02', '', NULL, NULL, NULL, NULL, NULL, 0),
(8, 3, 'customer', NULL, 'Joya', NULL, '100-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(9, 3, 'customer', NULL, 'Edin', NULL, '101-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(10, 3, 'customer', NULL, 'Ranjan', NULL, '102-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(11, 3, 'customer', NULL, 'Lal', NULL, '103-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(12, 3, 'customer', NULL, 'Nishshanka - S', NULL, '300-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(13, 3, 'customer', NULL, 'Sasila - S', NULL, '301-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(14, 3, 'customer', NULL, 'Ovintan - S', NULL, '302-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(15, 3, 'customer', NULL, 'Shirantha - S', NULL, '303-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(16, 3, 'customer', NULL, 'A.Dinesh - S', NULL, '304-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(17, 3, 'customer', NULL, 'Rasal - S', NULL, '305-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(18, 3, 'customer', NULL, 'Ranushka - S', NULL, '306-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(19, 3, 'customer', NULL, 'Loranz - S', NULL, '307-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(20, 3, 'customer', NULL, 'Roshan - Damesh - S ', NULL, '308-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(21, 3, 'customer', NULL, 'Davini - S', NULL, '309-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(22, 3, 'customer', NULL, 'C Jude - 1 - S', NULL, '310-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(23, 3, 'customer', NULL, 'Dilshan - S', NULL, '311-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(24, 3, 'customer', NULL, 'V Jude - S', NULL, '312-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(25, 3, 'customer', NULL, 'Suren - S', NULL, '313-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(26, 3, 'customer', NULL, 'A Tyron - S', NULL, '314-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(27, 3, 'customer', NULL, 'Cool Thambi - S', NULL, '315-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(28, 3, 'customer', NULL, 'Lakshman - S', NULL, '316-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(29, 3, 'customer', NULL, 'Suji - S', NULL, '317-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', '', NULL, NULL, NULL, NULL, NULL, 0),
(30, 3, 'customer', NULL, 'Manoj - S', NULL, '318-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(31, 3, 'customer', NULL, 'Udesh - P', NULL, '600-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(32, 3, 'customer', NULL, 'D W Nishantha - P', NULL, '601-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(33, 3, 'customer', NULL, 'Radan - P', NULL, '602-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(34, 3, 'customer', NULL, 'Rasamani - P', NULL, '603-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(35, 3, 'customer', NULL, 'Nishanthan - P', NULL, '604-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(36, 3, 'customer', NULL, 'Playji - P', NULL, '605-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(37, 3, 'customer', NULL, 'Sudu Rohan - P', NULL, '606-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(38, 3, 'customer', NULL, 'Prasad - P', NULL, '607-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(39, 3, 'customer', NULL, 'Shenal - P', NULL, '608-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(40, 3, 'customer', NULL, 'Telastan - P', NULL, '609-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(41, 3, 'customer', NULL, 'Loku Madun - P', NULL, '610-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(42, 3, 'customer', NULL, 'Sujan - P', NULL, '611-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(43, 3, 'customer', NULL, 'Nishanthan - P', NULL, '612-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(44, 3, 'customer', NULL, 'Dilu - P', NULL, '613-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(45, 3, 'customer', NULL, 'General - S', NULL, '3000-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(46, 3, 'customer', NULL, 'General - P', NULL, '6000-3', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(47, 3, 'supplier', NULL, 'CPC', NULL, '400-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(48, 3, 'supplier', NULL, 'CPC Lubricant', NULL, '401-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(49, 3, 'supplier', NULL, 'Caltex', NULL, '402-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(50, 3, 'supplier', NULL, 'Laugfs', NULL, '403-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(51, 3, 'supplier', NULL, 'Castrol', NULL, '404-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(52, 3, 'supplier', NULL, 'Orange', NULL, '405-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(53, 3, 'supplier', NULL, 'Panasonic', NULL, '406-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(54, 3, 'supplier', NULL, 'Fresh Lanka Imports & Exports', NULL, '407-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(55, 3, 'supplier', NULL, 'DPG Gas Distributors (Pvt) Ltd', NULL, '408-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(56, 3, 'supplier', NULL, 'New Chilaw Yamaha Centre ', NULL, '409-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 0, 1, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', '', NULL, NULL, NULL, NULL, NULL, 0),
(57, 2, 'customer', NULL, 'Sojib Hasan', 'sojibhasanme07@gmail.com', 'CO-0009-2', NULL, 'dhaka', NULL, NULL, 'Dhaka', NULL, NULL, '+8801911265158', '1', '1', NULL, NULL, NULL, 2, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '0.00', NULL, NULL, 1, 1, NULL, '2022-02-13 19:43:59', '2022-02-13 19:43:59', '', NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contact_groups`
--

CREATE TABLE `contact_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('customer','supplier') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `interest_account_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_groups`
--

INSERT INTO `contact_groups` (`id`, `business_id`, `type`, `name`, `amount`, `created_by`, `created_at`, `updated_at`, `account_type_id`, `interest_account_id`) VALUES
(1, 2, 'customer', 'Wholesaler', 15.00, 2, '2021-07-25 14:56:16', '2021-07-25 14:56:16', NULL, NULL),
(2, 2, 'customer', 'Retailer', 10.00, 2, '2021-07-25 14:56:37', '2021-07-25 14:56:37', NULL, NULL),
(3, 3, 'customer', 'Own Company', 0.00, 0, '2022-02-03 07:01:47', '2022-02-03 07:01:47', NULL, NULL),
(4, 3, 'supplier', 'Own Company', 0.00, 0, '2022-02-03 07:01:47', '2022-02-03 07:01:47', NULL, NULL),
(5, 2, 'customer', 'Own Company', 0.00, 0, '2022-02-13 21:15:47', '2022-02-13 21:15:47', NULL, NULL),
(6, 2, 'supplier', 'Own Company', 0.00, 0, '2022-02-13 21:15:47', '2022-02-13 21:15:47', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_ledgers`
--

CREATE TABLE `contact_ledgers` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('debit','credit') NOT NULL,
  `sub_type` enum('cheque_return_charges',' payment') DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_payment_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_sell_line_id` int(10) DEFAULT NULL COMMENT 'used for property sell, to fetch block and property',
  `income_type` int(191) DEFAULT NULL,
  `installment_id` int(10) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `payment_option_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_ledgers`
--

INSERT INTO `contact_ledgers` (`id`, `contact_id`, `type`, `sub_type`, `amount`, `reff_no`, `operation_date`, `created_by`, `transaction_id`, `transaction_payment_id`, `transaction_sell_line_id`, `income_type`, `installment_id`, `note`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`, `payment_option_id`) VALUES
(1, 3, 'debit', '', '5000.0000', NULL, '2021-07-01 00:00:00', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-25 14:20:19', '2021-07-25 14:20:19', NULL),
(2, 4, 'credit', '', '2000.0000', NULL, '2021-07-01 00:00:00', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-25 14:21:54', '2021-07-25 14:21:54', NULL),
(3, 5, 'debit', '', '4000.0000', NULL, '2021-07-01 00:00:00', 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-25 14:22:54', '2021-07-25 14:22:54', NULL),
(4, 8, 'debit', '', '23700.0000', NULL, '2022-02-01 00:00:00', 5, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(5, 9, 'debit', '', '13400.0000', NULL, '2022-02-01 00:00:00', 5, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(6, 10, 'debit', '', '19100.0000', NULL, '2022-02-01 00:00:00', 5, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(7, 11, 'debit', '', '21350.0000', NULL, '2022-02-01 00:00:00', 5, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(8, 12, 'debit', '', '1000.0000', NULL, '2022-02-01 00:00:00', 5, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(9, 13, 'debit', '', '2095.0000', NULL, '2022-02-01 00:00:00', 5, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(10, 14, 'debit', '', '2000.0000', NULL, '2022-02-01 00:00:00', 5, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(11, 15, 'debit', '', '1870.0000', NULL, '2022-02-01 00:00:00', 5, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(12, 16, 'debit', '', '4990.0000', NULL, '2022-02-01 00:00:00', 5, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(13, 17, 'debit', '', '2220.0000', NULL, '2022-02-01 00:00:00', 5, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(14, 18, 'debit', '', '3825.0000', NULL, '2022-02-01 00:00:00', 5, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(15, 19, 'debit', '', '1460.0000', NULL, '2022-02-01 00:00:00', 5, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(16, 20, 'debit', '', '2500.0000', NULL, '2022-02-01 00:00:00', 5, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(17, 21, 'debit', '', '2660.0000', NULL, '2022-02-01 00:00:00', 5, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(18, 22, 'debit', '', '2930.0000', NULL, '2022-02-01 00:00:00', 5, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(19, 23, 'debit', '', '1125.0000', NULL, '2022-02-01 00:00:00', 5, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(20, 24, 'debit', '', '3200.0000', NULL, '2022-02-01 00:00:00', 5, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(21, 25, 'debit', '', '885.0000', NULL, '2022-02-01 00:00:00', 5, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(22, 26, 'debit', '', '1055.0000', NULL, '2022-02-01 00:00:00', 5, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(23, 27, 'debit', '', '19955.0000', NULL, '2022-02-01 00:00:00', 5, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(24, 28, 'debit', '', '3485.0000', NULL, '2022-02-01 00:00:00', 5, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(25, 29, 'debit', '', '24000.0000', NULL, '2022-02-01 00:00:00', 5, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', NULL),
(26, 30, 'debit', '', '3805.0000', NULL, '2022-02-01 00:00:00', 5, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', NULL),
(27, 31, 'debit', '', '2000.0000', NULL, '2022-02-01 00:00:00', 5, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', NULL),
(28, 33, 'debit', '', '1700.0000', NULL, '2022-02-01 00:00:00', 5, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', NULL),
(29, 34, 'debit', '', '1500.0000', NULL, '2022-02-01 00:00:00', 5, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', NULL),
(30, 35, 'debit', '', '320.0000', NULL, '2022-02-01 00:00:00', 5, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', NULL),
(31, 36, 'debit', '', '2100.0000', NULL, '2022-02-01 00:00:00', 5, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', NULL),
(32, 37, 'debit', '', '2900.0000', NULL, '2022-02-01 00:00:00', 5, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', NULL),
(33, 38, 'debit', '', '3025.0000', NULL, '2022-02-01 00:00:00', 5, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', NULL),
(34, 39, 'debit', '', '4950.0000', NULL, '2022-02-01 00:00:00', 5, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', NULL),
(35, 40, 'debit', '', '2540.0000', NULL, '2022-02-01 00:00:00', 5, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', NULL),
(36, 41, 'debit', '', '3750.0000', NULL, '2022-02-01 00:00:00', 5, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', NULL),
(37, 42, 'debit', '', '3185.0000', NULL, '2022-02-01 00:00:00', 5, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', NULL),
(38, 43, 'debit', '', '6530.0000', NULL, '2022-02-01 00:00:00', 5, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', NULL),
(39, 44, 'debit', '', '1575.0000', NULL, '2022-02-01 00:00:00', 5, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', NULL),
(40, 45, 'debit', '', '67700.0000', NULL, '2022-02-01 00:00:00', 5, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', NULL),
(41, 46, 'debit', '', '80185.0000', NULL, '2022-02-01 00:00:00', 5, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', NULL),
(42, 50, 'credit', '', '158800.0000', NULL, '2022-02-01 00:00:00', 5, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', NULL),
(43, 8, 'debit', '', '13050.0000', NULL, '2022-02-01 00:00:00', 5, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', NULL),
(44, 8, 'debit', '', '19000.0010', NULL, '2022-02-01 00:00:00', 5, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', NULL),
(45, 49, 'credit', NULL, '440000.0000', NULL, '2022-02-01 14:55:00', 5, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:26:40', '2022-02-03 09:26:40', NULL),
(46, 49, 'debit', '', '180000.0000', NULL, '2022-02-01 14:57:00', 5, 86, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:27:45', '2022-02-03 09:27:45', NULL),
(47, 49, 'debit', '', '260000.0000', NULL, '2022-02-01 14:58:00', 5, 86, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-03 09:29:11', '2022-02-03 09:29:11', NULL),
(48, 50, 'credit', NULL, '23.0000', NULL, '2022-02-04 17:26:00', 5, 94, 13, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-04 12:26:41', '2022-02-04 12:26:41', NULL),
(49, 50, 'debit', NULL, '23.0000', NULL, '2022-02-04 17:26:00', 5, 94, 13, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-04 12:26:41', '2022-02-04 12:26:41', NULL),
(50, 50, 'credit', NULL, '23.0000', NULL, '2022-02-04 17:26:00', 5, 95, 14, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-04 12:27:48', '2022-02-04 12:27:48', NULL),
(51, 50, 'debit', NULL, '23.0000', NULL, '2022-02-04 17:26:00', 5, 95, 14, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-04 12:27:48', '2022-02-04 12:27:48', NULL),
(52, 57, 'debit', '', '20000.0000', NULL, '2022-02-14 00:00:00', 2, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-13 19:43:59', '2022-02-13 19:43:59', NULL),
(53, 57, 'credit', NULL, '10000.0000', NULL, '2022-02-14 00:00:00', 2, 97, 15, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-13 19:46:06', '2022-02-13 19:46:06', NULL),
(54, 3, 'credit', '', '1000.0000', NULL, '2022-02-14 01:47:00', 2, 1, 16, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-13 20:17:54', '2022-02-13 20:17:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(5) NOT NULL,
  `country_code` char(2) NOT NULL DEFAULT '',
  `country` varchar(45) NOT NULL DEFAULT '',
  `currency_code` char(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country`, `currency_code`) VALUES
(1, 'AD', 'Andorra', 'EUR'),
(2, 'AE', 'United Arab Emirates', 'AED'),
(3, 'AF', 'Afghanistan', 'AFN'),
(4, 'AG', 'Antigua and Barbuda', 'XCD'),
(5, 'AI', 'Anguilla', 'XCD'),
(6, 'AL', 'Albania', 'ALL'),
(7, 'AM', 'Armenia', 'AMD'),
(8, 'AO', 'Angola', 'AOA'),
(9, 'AQ', 'Antarctica', ''),
(10, 'AR', 'Argentina', 'ARS'),
(11, 'AS', 'American Samoa', 'USD'),
(12, 'AT', 'Austria', 'EUR'),
(13, 'AU', 'Australia', 'AUD'),
(14, 'AW', 'Aruba', 'AWG'),
(15, 'AX', 'Ãƒâ€¦land', 'EUR'),
(16, 'AZ', 'Azerbaijan', 'AZN'),
(17, 'BA', 'Bosnia and Herzegovina', 'BAM'),
(18, 'BB', 'Barbados', 'BBD'),
(19, 'BD', 'Bangladesh', 'BDT'),
(20, 'BE', 'Belgium', 'EUR'),
(21, 'BF', 'Burkina Faso', 'XOF'),
(22, 'BG', 'Bulgaria', 'BGN'),
(23, 'BH', 'Bahrain', 'BHD'),
(24, 'BI', 'Burundi', 'BIF'),
(25, 'BJ', 'Benin', 'XOF'),
(26, 'BL', 'Saint BarthÃƒÂ©lemy', 'EUR'),
(27, 'BM', 'Bermuda', 'BMD'),
(28, 'BN', 'Brunei', 'BND'),
(29, 'BO', 'Bolivia', 'BOB'),
(30, 'BQ', 'Bonaire', 'USD'),
(31, 'BR', 'Brazil', 'BRL'),
(32, 'BS', 'Bahamas', 'BSD'),
(33, 'BT', 'Bhutan', 'BTN'),
(34, 'BV', 'Bouvet Island', 'NOK'),
(35, 'BW', 'Botswana', 'BWP'),
(36, 'BY', 'Belarus', 'BYR'),
(37, 'BZ', 'Belize', 'BZD'),
(38, 'CA', 'Canada', 'CAD'),
(39, 'CC', 'Cocos [Keeling] Islands', 'AUD'),
(40, 'CD', 'Democratic Republic of the Congo', 'CDF'),
(41, 'CF', 'Central African Republic', 'XAF'),
(42, 'CG', 'Republic of the Congo', 'XAF'),
(43, 'CH', 'Switzerland', 'CHF'),
(44, 'CI', 'Ivory Coast', 'XOF'),
(45, 'CK', 'Cook Islands', 'NZD'),
(46, 'CL', 'Chile', 'CLP'),
(47, 'CM', 'Cameroon', 'XAF'),
(48, 'CN', 'China', 'CNY'),
(49, 'CO', 'Colombia', 'COP'),
(50, 'CR', 'Costa Rica', 'CRC'),
(51, 'CU', 'Cuba', 'CUP'),
(52, 'CV', 'Cape Verde', 'CVE'),
(53, 'CW', 'Curacao', 'ANG'),
(54, 'CX', 'Christmas Island', 'AUD'),
(55, 'CY', 'Cyprus', 'EUR'),
(56, 'CZ', 'Czech Republic', 'CZK'),
(57, 'DE', 'Germany', 'EUR'),
(58, 'DJ', 'Djibouti', 'DJF'),
(59, 'DK', 'Denmark', 'DKK'),
(60, 'DM', 'Dominica', 'XCD'),
(61, 'DO', 'Dominican Republic', 'DOP'),
(62, 'DZ', 'Algeria', 'DZD'),
(63, 'EC', 'Ecuador', 'USD'),
(64, 'EE', 'Estonia', 'EUR'),
(65, 'EG', 'Egypt', 'EGP'),
(66, 'EH', 'Western Sahara', 'MAD'),
(67, 'ER', 'Eritrea', 'ERN'),
(68, 'ES', 'Spain', 'EUR'),
(69, 'ET', 'Ethiopia', 'ETB'),
(70, 'FI', 'Finland', 'EUR'),
(71, 'FJ', 'Fiji', 'FJD'),
(72, 'FK', 'Falkland Islands', 'FKP'),
(73, 'FM', 'Micronesia', 'USD'),
(74, 'FO', 'Faroe Islands', 'DKK'),
(75, 'FR', 'France', 'EUR'),
(76, 'GA', 'Gabon', 'XAF'),
(77, 'GB', 'United Kingdom', 'GBP'),
(78, 'GD', 'Grenada', 'XCD'),
(79, 'GE', 'Georgia', 'GEL'),
(80, 'GF', 'French Guiana', 'EUR'),
(81, 'GG', 'Guernsey', 'GBP'),
(82, 'GH', 'Ghana', 'GHS'),
(83, 'GI', 'Gibraltar', 'GIP'),
(84, 'GL', 'Greenland', 'DKK'),
(85, 'GM', 'Gambia', 'GMD'),
(86, 'GN', 'Guinea', 'GNF'),
(87, 'GP', 'Guadeloupe', 'EUR'),
(88, 'GQ', 'Equatorial Guinea', 'XAF'),
(89, 'GR', 'Greece', 'EUR'),
(90, 'GS', 'South Georgia and the South Sandwich Islands', 'GBP'),
(91, 'GT', 'Guatemala', 'GTQ'),
(92, 'GU', 'Guam', 'USD'),
(93, 'GW', 'Guinea-Bissau', 'XOF'),
(94, 'GY', 'Guyana', 'GYD'),
(95, 'HK', 'Hong Kong', 'HKD'),
(96, 'HM', 'Heard Island and McDonald Islands', 'AUD'),
(97, 'HN', 'Honduras', 'HNL'),
(98, 'HR', 'Croatia', 'HRK'),
(99, 'HT', 'Haiti', 'HTG'),
(100, 'HU', 'Hungary', 'HUF'),
(101, 'ID', 'Indonesia', 'IDR'),
(102, 'IE', 'Ireland', 'EUR'),
(103, 'IL', 'Israel', 'ILS'),
(104, 'IM', 'Isle of Man', 'GBP'),
(105, 'IN', 'India', 'INR'),
(106, 'IO', 'British Indian Ocean Territory', 'USD'),
(107, 'IQ', 'Iraq', 'IQD'),
(108, 'IR', 'Iran', 'IRR'),
(109, 'IS', 'Iceland', 'ISK'),
(110, 'IT', 'Italy', 'EUR'),
(111, 'JE', 'Jersey', 'GBP'),
(112, 'JM', 'Jamaica', 'JMD'),
(113, 'JO', 'Jordan', 'JOD'),
(114, 'JP', 'Japan', 'JPY'),
(115, 'KE', 'Kenya', 'KES'),
(116, 'KG', 'Kyrgyzstan', 'KGS'),
(117, 'KH', 'Cambodia', 'KHR'),
(118, 'KI', 'Kiribati', 'AUD'),
(119, 'KM', 'Comoros', 'KMF'),
(120, 'KN', 'Saint Kitts and Nevis', 'XCD'),
(121, 'KP', 'North Korea', 'KPW'),
(122, 'KR', 'South Korea', 'KRW'),
(123, 'KW', 'Kuwait', 'KWD'),
(124, 'KY', 'Cayman Islands', 'KYD'),
(125, 'KZ', 'Kazakhstan', 'KZT'),
(126, 'LA', 'Laos', 'LAK'),
(127, 'LB', 'Lebanon', 'LBP'),
(128, 'LC', 'Saint Lucia', 'XCD'),
(129, 'LI', 'Liechtenstein', 'CHF'),
(130, 'LK', 'Sri Lanka', 'LKR'),
(131, 'LR', 'Liberia', 'LRD'),
(132, 'LS', 'Lesotho', 'LSL'),
(133, 'LT', 'Lithuania', 'EUR'),
(134, 'LU', 'Luxembourg', 'EUR'),
(135, 'LV', 'Latvia', 'EUR'),
(136, 'LY', 'Libya', 'LYD'),
(137, 'MA', 'Morocco', 'MAD'),
(138, 'MC', 'Monaco', 'EUR'),
(139, 'MD', 'Moldova', 'MDL'),
(140, 'ME', 'Montenegro', 'EUR'),
(141, 'MF', 'Saint Martin', 'EUR'),
(142, 'MG', 'Madagascar', 'MGA'),
(143, 'MH', 'Marshall Islands', 'USD'),
(144, 'MK', 'Macedonia', 'MKD'),
(145, 'ML', 'Mali', 'XOF'),
(146, 'MM', 'Myanmar [Burma]', 'MMK'),
(147, 'MN', 'Mongolia', 'MNT'),
(148, 'MO', 'Macao', 'MOP'),
(149, 'MP', 'Northern Mariana Islands', 'USD'),
(150, 'MQ', 'Martinique', 'EUR'),
(151, 'MR', 'Mauritania', 'MRO'),
(152, 'MS', 'Montserrat', 'XCD'),
(153, 'MT', 'Malta', 'EUR'),
(154, 'MU', 'Mauritius', 'MUR'),
(155, 'MV', 'Maldives', 'MVR'),
(156, 'MW', 'Malawi', 'MWK'),
(157, 'MX', 'Mexico', 'MXN'),
(158, 'MY', 'Malaysia', 'MYR'),
(159, 'MZ', 'Mozambique', 'MZN'),
(160, 'NA', 'Namibia', 'NAD'),
(161, 'NC', 'New Caledonia', 'XPF'),
(162, 'NE', 'Niger', 'XOF'),
(163, 'NF', 'Norfolk Island', 'AUD'),
(164, 'NG', 'Nigeria', 'NGN'),
(165, 'NI', 'Nicaragua', 'NIO'),
(166, 'NL', 'Netherlands', 'EUR'),
(167, 'NO', 'Norway', 'NOK'),
(168, 'NP', 'Nepal', 'NPR'),
(169, 'NR', 'Nauru', 'AUD'),
(170, 'NU', 'Niue', 'NZD'),
(171, 'NZ', 'New Zealand', 'NZD'),
(172, 'OM', 'Oman', 'OMR'),
(173, 'PA', 'Panama', 'PAB'),
(174, 'PE', 'Peru', 'PEN'),
(175, 'PF', 'French Polynesia', 'XPF'),
(176, 'PG', 'Papua New Guinea', 'PGK'),
(177, 'PH', 'Philippines', 'PHP'),
(178, 'PK', 'Pakistan', 'PKR'),
(179, 'PL', 'Poland', 'PLN'),
(180, 'PM', 'Saint Pierre and Miquelon', 'EUR'),
(181, 'PN', 'Pitcairn Islands', 'NZD'),
(182, 'PR', 'Puerto Rico', 'USD'),
(183, 'PS', 'Palestine', 'ILS'),
(184, 'PT', 'Portugal', 'EUR'),
(185, 'PW', 'Palau', 'USD'),
(186, 'PY', 'Paraguay', 'PYG'),
(187, 'QA', 'Qatar', 'QAR'),
(188, 'RE', 'RÃƒÂ©union', 'EUR'),
(189, 'RO', 'Romania', 'RON'),
(190, 'RS', 'Serbia', 'RSD'),
(191, 'RU', 'Russia', 'RUB'),
(192, 'RW', 'Rwanda', 'RWF'),
(193, 'SA', 'Saudi Arabia', 'SAR'),
(194, 'SB', 'Solomon Islands', 'SBD'),
(195, 'SC', 'Seychelles', 'SCR'),
(196, 'SD', 'Sudan', 'SDG'),
(197, 'SE', 'Sweden', 'SEK'),
(198, 'SG', 'Singapore', 'SGD'),
(199, 'SH', 'Saint Helena', 'SHP'),
(200, 'SI', 'Slovenia', 'EUR'),
(201, 'SJ', 'Svalbard and Jan Mayen', 'NOK'),
(202, 'SK', 'Slovakia', 'EUR'),
(203, 'SL', 'Sierra Leone', 'SLL'),
(204, 'SM', 'San Marino', 'EUR'),
(205, 'SN', 'Senegal', 'XOF'),
(206, 'SO', 'Somalia', 'SOS'),
(207, 'SR', 'Suriname', 'SRD'),
(208, 'SS', 'South Sudan', 'SSP'),
(209, 'ST', 'SÃƒÂ£o TomÃƒÂ© and PrÃƒÂ­ncipe', 'STD'),
(210, 'SV', 'El Salvador', 'USD'),
(211, 'SX', 'Sint Maarten', 'ANG'),
(212, 'SY', 'Syria', 'SYP'),
(213, 'SZ', 'Swaziland', 'SZL'),
(214, 'TC', 'Turks and Caicos Islands', 'USD'),
(215, 'TD', 'Chad', 'XAF'),
(216, 'TF', 'French Southern Territories', 'EUR'),
(217, 'TG', 'Togo', 'XOF'),
(218, 'TH', 'Thailand', 'THB'),
(219, 'TJ', 'Tajikistan', 'TJS'),
(220, 'TK', 'Tokelau', 'NZD'),
(221, 'TL', 'East Timor', 'USD'),
(222, 'TM', 'Turkmenistan', 'TMT'),
(223, 'TN', 'Tunisia', 'TND'),
(224, 'TO', 'Tonga', 'TOP'),
(225, 'TR', 'Turkey', 'TRY'),
(226, 'TT', 'Trinidad and Tobago', 'TTD'),
(227, 'TV', 'Tuvalu', 'AUD'),
(228, 'TW', 'Taiwan', 'TWD'),
(229, 'TZ', 'Tanzania', 'TZS'),
(230, 'UA', 'Ukraine', 'UAH'),
(231, 'UG', 'Uganda', 'UGX'),
(232, 'UM', 'U.S. Minor Outlying Islands', 'USD'),
(233, 'US', 'United States', 'USD'),
(234, 'UY', 'Uruguay', 'UYU'),
(235, 'UZ', 'Uzbekistan', 'UZS'),
(236, 'VA', 'Vatican City', 'EUR'),
(237, 'VC', 'Saint Vincent and the Grenadines', 'XCD'),
(238, 'VE', 'Venezuela', 'VEF'),
(239, 'VG', 'British Virgin Islands', 'USD'),
(240, 'VI', 'U.S. Virgin Islands', 'USD'),
(241, 'VN', 'Vietnam', 'VND'),
(242, 'VU', 'Vanuatu', 'VUV'),
(243, 'WF', 'Wallis and Futuna', 'XPF'),
(244, 'WS', 'Samoa', 'WST'),
(245, 'XK', 'Kosovo', 'EUR'),
(246, 'YE', 'Yemen', 'YER'),
(247, 'YT', 'Mayotte', 'EUR'),
(248, 'ZA', 'South Africa', 'ZAR'),
(249, 'ZM', 'Zambia', 'ZMW'),
(250, 'ZW', 'Zimbabwe', 'ZWL');

-- --------------------------------------------------------

--
-- Table structure for table `crews`
--

CREATE TABLE `crews` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `employee_no` varchar(191) NOT NULL,
  `crew_name` varchar(191) NOT NULL,
  `nic_number` varchar(191) NOT NULL,
  `license_number` varchar(191) DEFAULT NULL,
  `joined_date` date NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `crms`
--

CREATE TABLE `crms` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `business_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `total_rp` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `crm_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_activities`
--

CREATE TABLE `crm_activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `mobile` varchar(191) NOT NULL,
  `alternate_number` varchar(191) NOT NULL,
  `landline` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `district` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `contact_id` int(10) UNSIGNED DEFAULT NULL,
  `time_connected` time NOT NULL,
  `add_in_customer_page` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => no, 1=>yes',
  `discontinue_follow_up` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => no, 1 => yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `crm_activity_details`
--

CREATE TABLE `crm_activity_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `crm_activity_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `next_follow_up_date` datetime NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `crm_comments`
--

CREATE TABLE `crm_comments` (
  `id` int(11) NOT NULL,
  `crm_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_date` date NOT NULL,
  `comments` varchar(191) NOT NULL,
  `next_follow_up` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `crm_groups`
--

CREATE TABLE `crm_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHC', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NG', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `current_meters`
--

CREATE TABLE `current_meters` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date_and_time` datetime NOT NULL,
  `pump_operator_id` int(10) UNSIGNED NOT NULL,
  `pump_id` int(10) UNSIGNED NOT NULL,
  `pump_no` varchar(191) NOT NULL,
  `starting_meter` decimal(15,4) NOT NULL,
  `last_time_meter` decimal(15,4) NOT NULL,
  `current_meter` decimal(15,4) NOT NULL,
  `sale_price` decimal(15,4) NOT NULL,
  `sold_ltr` decimal(15,4) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `contact_number` varchar(191) DEFAULT NULL,
  `landline` varchar(191) DEFAULT NULL,
  `geo_location` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `town` varchar(191) DEFAULT NULL,
  `district` varchar(191) DEFAULT NULL,
  `give_away_gifts` varchar(191) DEFAULT NULL,
  `is_company_customer` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nic_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `business_id`, `first_name`, `last_name`, `email`, `username`, `password`, `remember_token`, `mobile`, `contact_number`, `landline`, `geo_location`, `address`, `town`, `district`, `give_away_gifts`, `is_company_customer`, `created_at`, `updated_at`, `nic_number`) VALUES
(1, 2, 'Customer 1', '', 'c1@1.com', 'CO-0002-2', '$2y$10$voRBqICYCZCC4TrhfrboGehUTkfw8oool/pOnH1PyG8R7dAiyHzI.', NULL, '1', '1', '1', '', '1', '1', '1', NULL, 1, '2021-07-25 14:20:19', '2021-07-25 14:20:19', ''),
(2, 2, 'Customer 2', '', 'c2@1.com', 'CO-0003-2', '$2y$10$s.SwaD/8iXD75UktlKIBe.jcSmTrxmrYOlepCkWwnL9w2RFnzPdd2', NULL, '1', '1', '1', '', '1', '1', '1', NULL, 1, '2021-07-25 14:21:53', '2021-07-25 14:21:53', ''),
(3, 2, 'Customer 3', '', 'c3@1.com', 'CO-0004-2', '$2y$10$710YOrH/ff21YU5BEucBpOQZkg0OnX1JPd3O1XJGwQvuj5FYCsVrK', NULL, '1', '1', '1', '', '1', '1', '1', NULL, 1, '2021-07-25 14:22:54', '2021-07-25 14:22:54', ''),
(4, 2, 'Sojib Hasan', '', 'sojibhasanme07@gmail.com', 'CO-0009-2', '$2y$10$4shZM30AEL5S7dCR7/ZHB.uPwMaHPTilX7yxu0Nl3xXvIt9oih.jK', NULL, '+8801911265158', '1', '1', '', 'dhaka', 'Dhaka', ' ', NULL, 1, '2022-02-13 19:43:59', '2022-02-13 19:43:59', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_payments`
--

CREATE TABLE `customer_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `settlement_no` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(191) NOT NULL,
  `cheque_date` date DEFAULT NULL,
  `cheque_number` varchar(191) DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `amount` decimal(15,5) NOT NULL,
  `sub_total` decimal(15,5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_references`
--

CREATE TABLE `customer_references` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `reference` varchar(191) NOT NULL,
  `date` date NOT NULL,
  `barcode_src` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_statements`
--

CREATE TABLE `customer_statements` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `statement_no` int(10) NOT NULL,
  `print_date` date NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `added_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_statement_details`
--

CREATE TABLE `customer_statement_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `statement_id` int(10) UNSIGNED NOT NULL COMMENT 'id form customer statement table',
  `date` date NOT NULL,
  `location` varchar(191) NOT NULL,
  `invoice_no` varchar(191) DEFAULT NULL,
  `customer_reference` varchar(191) DEFAULT NULL,
  `order_no` varchar(191) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `product` varchar(191) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `qty` decimal(15,2) NOT NULL,
  `invoice_amount` decimal(15,2) NOT NULL,
  `due_amount` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_statement_settings`
--

CREATE TABLE `customer_statement_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `enable_separate_customer_statement_no` tinyint(1) NOT NULL DEFAULT 0,
  `starting_no` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `daily_collections`
--

CREATE TABLE `daily_collections` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `collection_form_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pump_operator_id` int(10) UNSIGNED NOT NULL,
  `settlement_id` int(10) UNSIGNED DEFAULT NULL,
  `settlement_date` datetime DEFAULT NULL,
  `balance_collection` decimal(15,2) NOT NULL DEFAULT 0.00,
  `current_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `location_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bring_forward` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `daily_vouchers`
--

CREATE TABLE `daily_vouchers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `daily_vouchers_no` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `transaction_date` date NOT NULL,
  `operator_id` int(10) UNSIGNED NOT NULL,
  `pump_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `current_outstanding` int(10) DEFAULT NULL,
  `outstanding_pending` int(10) DEFAULT NULL,
  `voucher_order_number` varchar(191) NOT NULL,
  `voucher_order_date` date NOT NULL,
  `vehicle_no` int(10) UNSIGNED NOT NULL COMMENT 'this is customer_references',
  `total_amount` decimal(15,2) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `settlement_no` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `is_issue_customer_bill` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `daily_voucher_items`
--

CREATE TABLE `daily_voucher_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `daily_voucher_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `qty` float NOT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `default_accounts`
--

CREATE TABLE `default_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_type` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `default_accounts`
--

INSERT INTO `default_accounts` (`id`, `business_id`, `name`, `account_number`, `account_type_id`, `note`, `asset_type`, `created_by`, `is_closed`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Cash', '101', 6, NULL, 5, 1, 0, NULL, '2020-06-19 07:34:50', '2020-06-19 07:34:50'),
(2, 1, 'Petty Cash', '102', 6, NULL, 5, 1, 0, NULL, '2020-06-19 07:36:39', '2020-06-19 07:36:39'),
(3, 1, 'Cheques in Hand', '103', 6, NULL, 6, 1, 0, NULL, '2020-06-19 07:37:44', '2020-06-19 07:37:44'),
(4, 1, 'Accounts Receivable', '104', 6, NULL, NULL, 1, 0, NULL, '2020-06-19 07:46:08', '2020-06-19 07:46:08'),
(5, 1, 'Company Deposits', '105', 6, NULL, NULL, 1, 0, NULL, '2020-06-19 07:46:42', '2020-06-19 07:46:42'),
(6, 1, 'Raw Material Account', '106', 6, NULL, 1, 1, 0, NULL, '2020-06-19 07:47:24', '2020-06-19 07:47:24'),
(7, 1, 'Finished Goods Account', '107', 6, NULL, 2, 1, 0, NULL, '2020-06-19 07:48:09', '2020-09-18 06:25:20'),
(8, 1, 'Stock Account', '108', 6, NULL, 3, 1, 0, NULL, '2020-06-19 07:48:39', '2020-06-19 07:48:39'),
(9, 1, 'Cards (Credit Debit)  Account', '120', 6, NULL, 7, 1, 0, NULL, '2020-06-19 07:50:46', '2020-06-19 07:50:46'),
(10, 1, 'Fixed Assets', '150', 7, NULL, NULL, 1, 0, NULL, '2020-06-19 07:53:17', '2020-06-19 07:53:17'),
(11, 1, 'Accounts Payable', '201', 8, NULL, NULL, 1, 0, NULL, '2020-06-19 07:53:56', '2020-06-19 07:53:56'),
(12, 1, 'Wages Payable', '202', 8, NULL, NULL, 1, 0, NULL, '2020-06-19 07:54:26', '2020-06-19 07:54:26'),
(13, 1, 'Taxes Payable', '203', 8, NULL, NULL, 1, 0, NULL, '2020-06-19 07:54:56', '2020-06-19 07:54:56'),
(14, 1, 'Customer Deposits', '204', 8, NULL, NULL, 1, 0, NULL, '2020-06-19 07:55:27', '2020-06-19 07:55:27'),
(15, 1, 'Sales Income', '301', 3, NULL, 9, 1, 0, NULL, '2020-06-19 07:56:12', '2020-09-18 06:25:46'),
(16, 1, 'Cost of Goods Sold', '401', 4, NULL, 8, 1, 0, NULL, '2020-06-19 07:56:51', '2020-09-18 06:24:55'),
(17, 1, 'Bank Fees & Charges', '402', 4, NULL, NULL, 1, 0, NULL, '2020-06-19 09:16:58', '2020-06-19 09:16:58'),
(18, 1, 'Rent Expense', '403', 4, NULL, NULL, 1, 0, NULL, '2020-06-19 09:17:25', '2020-06-19 09:17:25'),
(19, 1, 'Salaries & Wages Expenses', '404', 4, NULL, NULL, 1, 0, NULL, '2020-06-19 09:18:01', '2020-06-19 09:18:01'),
(20, 1, 'Water Expenses', '405', 4, NULL, NULL, 1, 0, NULL, '2020-06-19 09:18:52', '2020-06-19 09:18:52'),
(21, 1, 'Electricity Expenses', '406', 4, NULL, NULL, 1, 0, NULL, '2020-06-19 09:19:17', '2020-06-19 09:19:17'),
(22, 1, 'Owners Contribution', '600', 5, NULL, NULL, 1, 0, NULL, '2020-06-19 09:20:01', '2020-06-19 09:20:01'),
(23, 1, 'Retained Earnings', '601', 5, NULL, NULL, 1, 0, NULL, '2020-06-19 09:20:30', '2020-06-19 09:20:30'),
(24, 1, 'Sales Income - Gas', '301-1', 3, NULL, 9, 1, 0, NULL, '2020-07-01 05:38:34', '2020-07-01 05:52:56'),
(25, 1, 'Sales Income - Kerosene Oil', '301-2', 3, NULL, 9, 1, 0, NULL, '2020-07-01 05:39:17', '2020-07-01 05:53:18'),
(26, 1, 'Sales Income - Other Sales', '301-3', 3, NULL, 9, 1, 0, NULL, '2020-07-01 05:39:58', '2020-07-01 05:53:48'),
(27, 1, 'Sales Income - Petrol 92', '301-4', 3, NULL, 9, 1, 0, NULL, '2020-07-01 05:41:29', '2020-07-01 05:54:30'),
(28, 1, 'Sales Income - Petrol 95', '301-4', 3, NULL, 9, 1, 0, NULL, '2020-07-01 05:41:53', '2020-07-01 05:54:46'),
(29, 1, 'Sales Income - LAD', '301-6', 3, NULL, 9, 1, 0, NULL, '2020-07-01 05:42:18', '2020-07-01 05:54:59'),
(30, 1, 'Sales Income - Super Diesel', '301-7', 3, NULL, 9, 1, 0, NULL, '2020-07-01 05:42:56', '2020-07-01 05:55:11'),
(31, 1, 'Sales Income - Lubricants', '301-8', 3, NULL, 9, 1, 0, NULL, '2020-07-01 05:43:56', '2020-07-01 05:54:18'),
(32, 1, 'COGS - Gas', '401-1', 4, NULL, 8, 1, 0, NULL, '2020-07-01 05:56:07', '2020-09-18 06:24:45'),
(33, 1, 'COGS  - Kerosene Oil', '401-2', 4, NULL, 8, 1, 0, NULL, '2020-07-01 05:56:31', '2020-09-18 06:23:21'),
(34, 1, 'COGS  - Other Sales', '401-3', 4, NULL, 8, 1, 0, NULL, '2020-07-01 05:57:11', '2020-09-18 06:24:02'),
(35, 1, 'COGS  - Petrol 92', '401-4', 4, NULL, 8, 1, 0, NULL, '2020-07-01 05:57:50', '2020-09-18 06:24:13'),
(36, 1, 'COGS  - Petrol 95', '401-5', 4, NULL, 8, 1, 0, NULL, '2020-07-01 05:58:14', '2020-09-18 06:24:23'),
(37, 1, 'COGS  - LAD', '401-6', 4, NULL, 8, 1, 0, NULL, '2020-07-01 05:58:40', '2020-09-18 06:23:31'),
(38, 1, 'COGS  - Super Diesel', '401-7', 4, NULL, 8, 1, 0, NULL, '2020-07-01 05:59:14', '2020-09-18 06:24:34'),
(39, 1, 'COGS  - Lubricants', '401-8', 4, NULL, 8, 1, 0, NULL, '2020-07-01 05:59:38', '2020-09-18 06:23:52'),
(40, 1, 'Sales income - Bowser', '301 - 8', 3, NULL, 9, 1, 0, NULL, '2020-09-18 06:37:57', '2020-09-18 06:40:23'),
(42, 1, 'Expenses', '400', 4, NULL, NULL, 1, 0, NULL, '2020-10-06 02:12:39', '2020-10-06 02:12:39'),
(43, 1, 'Cheque Return Income', '399', 3, NULL, NULL, 1, 0, NULL, '2020-10-18 11:56:12', '2020-10-18 11:56:12'),
(44, 1, 'Opening Balance Equity Account', 'E1', 5, NULL, NULL, 1, 0, NULL, '2021-02-28 15:02:57', '2021-02-28 15:02:57');

-- --------------------------------------------------------

--
-- Table structure for table `default_account_groups`
--

CREATE TABLE `default_account_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `account_type_id` int(10) UNSIGNED NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `default_account_groups`
--

INSERT INTO `default_account_groups` (`id`, `business_id`, `name`, `account_type_id`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 'Raw Material Account', 6, NULL, '2020-06-19 07:27:31', '2020-06-19 07:27:31'),
(2, 1, 'Finished Goods Account', 6, NULL, '2020-06-19 07:27:54', '2020-06-19 07:27:54'),
(3, 1, 'Other Stocks', 6, NULL, '2020-06-19 07:28:09', '2020-06-19 07:28:09'),
(4, 1, 'Bank Account', 6, NULL, '2020-06-19 07:28:27', '2020-06-19 07:28:27'),
(5, 1, 'Cash Account', 6, NULL, '2020-06-19 07:28:44', '2020-06-19 07:28:44'),
(6, 1, 'Cheques in Hand (Customer\'s)', 6, NULL, '2020-06-19 07:29:01', '2020-06-19 07:29:01'),
(7, 1, 'Card', 6, NULL, '2020-06-19 07:31:50', '2020-06-19 07:31:50'),
(8, 1, 'COGS Account Group', 4, NULL, '2020-06-19 07:32:06', '2020-06-26 11:34:20'),
(9, 1, 'Sales Income Group', 3, 'na', '2020-06-26 11:22:14', '2020-06-26 11:22:14'),
(10, 1, 'Direct Expense', 4, NULL, '2020-07-10 00:53:35', '2020-07-10 00:53:35');

-- --------------------------------------------------------

--
-- Table structure for table `default_account_types`
--

CREATE TABLE `default_account_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_account_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `default_account_types`
--

INSERT INTO `default_account_types` (`id`, `name`, `parent_account_type_id`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'Assets', NULL, 1, '2020-06-19 07:24:38', '2020-06-19 07:24:38'),
(2, 'Liabilities', NULL, 1, '2020-06-19 07:24:53', '2020-06-19 07:24:53'),
(3, 'Income', NULL, 1, '2020-06-19 07:25:06', '2020-06-19 07:25:06'),
(4, 'Expenses', NULL, 1, '2020-06-19 07:25:17', '2020-06-19 07:25:17'),
(5, 'Equity', NULL, 1, '2020-06-19 07:25:29', '2020-06-19 07:25:29'),
(6, 'Current Assets', 1, 1, '2020-06-19 07:25:47', '2020-06-19 07:25:47'),
(7, 'Fixed Assets', 1, 1, '2020-06-19 07:26:02', '2020-06-19 07:26:02'),
(8, 'Current Liabilities', 2, 1, '2020-06-19 07:26:20', '2020-06-19 07:26:20'),
(9, 'Long Term Liabilities', 2, 1, '2020-06-19 07:26:35', '2020-06-19 07:26:35');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `department` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_superadmin_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_default` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'key to superadmin default entery id'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dip_readings`
--

CREATE TABLE `dip_readings` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `ref_number` varchar(191) DEFAULT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `tank_id` int(10) UNSIGNED NOT NULL,
  `date_and_time` varchar(191) NOT NULL,
  `dip_reading` decimal(15,5) NOT NULL,
  `transaction_date` date NOT NULL,
  `fuel_balance_dip_reading` decimal(15,5) NOT NULL,
  `current_qty` decimal(15,5) NOT NULL,
  `tank_manufacturer` varchar(191) DEFAULT NULL,
  `tank_capacity` decimal(15,3) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reset_new_dip` varchar(222) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dip_readings`
--

INSERT INTO `dip_readings` (`id`, `business_id`, `ref_number`, `location_id`, `tank_id`, `date_and_time`, `dip_reading`, `transaction_date`, `fuel_balance_dip_reading`, `current_qty`, `tank_manufacturer`, `tank_capacity`, `note`, `created_at`, `updated_at`, `reset_new_dip`) VALUES
(1, 3, '1', 3, 6, '02/02/2022', '0.00000', '0000-00-00', '4388.00000', '4388.00000', NULL, NULL, NULL, '2022-02-03 09:31:41', '2022-02-03 09:31:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dip_resettings`
--

CREATE TABLE `dip_resettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `tank_id` int(10) UNSIGNED NOT NULL,
  `meter_reset_form_no` varchar(191) NOT NULL,
  `date_and_time` varchar(191) NOT NULL,
  `transaction_date` date NOT NULL,
  `system_dip_balance` decimal(15,2) NOT NULL,
  `current_dip_difference` decimal(15,2) NOT NULL,
  `reset_new_dip` decimal(15,2) NOT NULL,
  `reason` text DEFAULT NULL,
  `adjustment_transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `current_qty` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `applicable_in_spg` tinyint(1) DEFAULT 0,
  `applicable_in_cg` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(10) UNSIGNED DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `document_and_notes`
--

CREATE TABLE `document_and_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `notable_id` int(11) NOT NULL,
  `notable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE `domains` (
  `id` int(10) UNSIGNED NOT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `employee_no` varchar(191) NOT NULL,
  `driver_name` varchar(191) NOT NULL,
  `nic_number` varchar(191) NOT NULL,
  `dl_number` varchar(191) NOT NULL,
  `joined_date` date NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `edit_account_entries`
--

CREATE TABLE `edit_account_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `account_transaction_id` int(10) UNSIGNED NOT NULL,
  `date_and_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `orignal_amount` decimal(15,6) NOT NULL,
  `edited_amount` decimal(15,6) NOT NULL,
  `action_type` enum('edited','deleted') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `edit_contact_entries`
--

CREATE TABLE `edit_contact_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED DEFAULT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `contact_ledger_id` int(10) UNSIGNED NOT NULL,
  `date_and_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `orignal_amount` decimal(15,6) NOT NULL,
  `edited_amount` decimal(15,6) NOT NULL,
  `action_type` enum('edited','deleted') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `business_id` int(10) NOT NULL,
  `location_id` int(10) NOT NULL,
  `employee_number` varchar(50) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `marital_status` enum('Singel','Married') NOT NULL,
  `date_of_birth` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `blood_group` enum('A','B','AB','O','Do Not Know') NOT NULL,
  `id_number` varchar(100) NOT NULL,
  `religious` int(10) UNSIGNED DEFAULT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `photo` varchar(100) NOT NULL,
  `joined_date` date NOT NULL,
  `probation_end_date` date DEFAULT NULL,
  `date_of_permanency` date DEFAULT NULL,
  `personal_attachment` longtext NOT NULL,
  `contact_details` longtext NOT NULL,
  `emergency_contact` longtext NOT NULL,
  `dependents` longtext NOT NULL,
  `department_id` int(10) DEFAULT NULL,
  `job_title` int(10) DEFAULT NULL,
  `category` int(10) DEFAULT NULL,
  `employment_status` int(10) DEFAULT NULL,
  `work_shift` int(10) DEFAULT NULL,
  `deposit` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `termination` tinyint(2) NOT NULL DEFAULT 1,
  `termination_note` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `soft_delete` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_awards`
--

CREATE TABLE `employee_awards` (
  `id` int(11) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `award_name` varchar(200) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `gift_item` varchar(100) NOT NULL,
  `award_amount` decimal(13,2) NOT NULL,
  `award_month` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employment_statuses`
--

CREATE TABLE `employment_statuses` (
  `id` int(10) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `status_name` varchar(128) CHARACTER SET latin1 NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_superadmin_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_account` int(10) UNSIGNED NOT NULL,
  `is_sub_category` tinyint(1) NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_subscriptions`
--

CREATE TABLE `family_subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `order_id` varchar(191) DEFAULT NULL,
  `no_of_family_members` int(10) UNSIGNED NOT NULL,
  `option_variable_id` int(10) NOT NULL,
  `amount_to_pay` decimal(15,4) NOT NULL,
  `paid_via` varchar(191) DEFAULT NULL,
  `payment_transaction_id` varchar(191) DEFAULT NULL,
  `status` enum('approved','waiting','declined') NOT NULL DEFAULT 'waiting',
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fazol`
--

CREATE TABLE `fazol` (
  `id` int(11) NOT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `finance_options`
--

CREATE TABLE `finance_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `finance_option` varchar(191) NOT NULL,
  `custom_payments` enum('no','yes') NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fleets`
--

CREATE TABLE `fleets` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `code_for_vehicle` varchar(191) NOT NULL,
  `location_id` varchar(191) NOT NULL,
  `vehicle_number` varchar(191) NOT NULL,
  `vehicle_type` varchar(191) NOT NULL,
  `vehicle_brand` varchar(191) NOT NULL,
  `vehicle_model` varchar(191) NOT NULL,
  `chassis_number` varchar(191) NOT NULL,
  `engine_number` varchar(191) NOT NULL,
  `battery_detail` varchar(191) NOT NULL,
  `tyre_detail` varchar(191) NOT NULL,
  `notes` text DEFAULT NULL,
  `income_account_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_account_id` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `form9c_sub_categories`
--

CREATE TABLE `form9c_sub_categories` (
  `id` int(10) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `sub_category_id` int(10) UNSIGNED NOT NULL,
  `qty` decimal(15,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `form_f17_details`
--

CREATE TABLE `form_f17_details` (
  `id` int(10) NOT NULL,
  `header_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `product` varchar(191) DEFAULT NULL,
  `current_stock` decimal(15,5) NOT NULL DEFAULT 0.00000,
  `unit_price` decimal(15,2) DEFAULT NULL,
  `select_mode` enum('increase','decrease') DEFAULT NULL,
  `new_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `unit_price_difference` decimal(15,2) NOT NULL DEFAULT 0.00,
  `price_changed_loss` decimal(15,2) NOT NULL DEFAULT 0.00,
  `price_changed_gain` decimal(15,2) NOT NULL DEFAULT 0.00,
  `page_no` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `form_f17_headers`
--

CREATE TABLE `form_f17_headers` (
  `id` int(10) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` varchar(191) DEFAULT NULL,
  `form_no` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `store_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `unit_id` int(10) UNSIGNED DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `total_price_change_loss` decimal(15,2) DEFAULT 0.00,
  `total_price_change_gain` decimal(15,2) DEFAULT 0.00,
  `page_no` varchar(191) DEFAULT NULL,
  `user` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `form_f22_details`
--

CREATE TABLE `form_f22_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `header_id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `form_no` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_code` varchar(499) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `product` text DEFAULT NULL,
  `book_no` varchar(191) DEFAULT NULL,
  `current_stock` decimal(15,2) DEFAULT NULL,
  `stock_count` decimal(15,2) DEFAULT NULL,
  `unit_purchase_price` decimal(15,2) DEFAULT NULL,
  `unit_sale_price` decimal(15,2) DEFAULT NULL,
  `purchase_price_total` decimal(15,2) DEFAULT NULL,
  `sales_price_total` decimal(15,2) DEFAULT NULL,
  `difference_qty` decimal(15,2) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `form_f22_headers`
--

CREATE TABLE `form_f22_headers` (
  `id` int(10) UNSIGNED NOT NULL,
  `form_no` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `manager_name` varchar(250) DEFAULT NULL,
  `pre_field` varchar(250) DEFAULT NULL,
  `last_bill` varchar(100) DEFAULT NULL,
  `form_date` date DEFAULT NULL,
  `start_time` varchar(200) DEFAULT NULL,
  `last_time` varchar(200) DEFAULT NULL,
  `purchase_price1` decimal(15,2) DEFAULT NULL,
  `purchase_price2` decimal(15,2) DEFAULT NULL,
  `purchase_price3` decimal(15,2) DEFAULT NULL,
  `sales_price1` decimal(15,2) DEFAULT NULL,
  `sales_price2` decimal(15,2) DEFAULT NULL,
  `sales_price3` decimal(15,2) DEFAULT NULL,
  `created_by` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `form_opening_values`
--

CREATE TABLE `form_opening_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `form_name` varchar(191) NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL,
  `data` text NOT NULL DEFAULT '[]',
  `edited_by` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fuel_tanks`
--

CREATE TABLE `fuel_tanks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `fuel_tank_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fuel_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `location_id` int(10) UNSIGNED NOT NULL,
  `storage_volume` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `current_balance` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bulk_tank` tinyint(1) NOT NULL DEFAULT 0,
  `tank_dip_chart_id` int(10) UNSIGNED DEFAULT NULL,
  `tank_manufacturer` varchar(191) DEFAULT NULL,
  `tank_capacity` decimal(15,3) DEFAULT NULL,
  `unit_name` varchar(191) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `transaction_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fuel_tanks`
--

INSERT INTO `fuel_tanks` (`id`, `business_id`, `product_id`, `fuel_tank_number`, `fuel_type`, `location_id`, `storage_volume`, `current_balance`, `bulk_tank`, `tank_dip_chart_id`, `tank_manufacturer`, `tank_capacity`, `unit_name`, `user_id`, `transaction_date`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'P92-1', '', 2, '13000', '6000', 0, NULL, NULL, NULL, NULL, 2, '2021-07-01', '2021-07-25 15:16:53', '2021-07-25 15:16:53'),
(2, 2, 1, 'P92-2', '', 2, '13000', '2500', 0, NULL, NULL, NULL, NULL, 2, '2021-07-01', '2021-07-25 15:17:20', '2021-07-25 15:17:20'),
(3, 2, 2, 'P95', '', 2, '13000', '5000', 0, NULL, NULL, NULL, NULL, 2, '2021-07-01', '2021-07-25 15:18:03', '2021-07-25 15:18:03'),
(4, 2, 3, 'LAD-1', '', 2, '13000', '3000', 1, NULL, NULL, NULL, NULL, 2, '2021-07-01', '2021-07-25 15:18:33', '2021-07-25 15:18:33'),
(5, 2, 3, 'LAD-2', '', 2, '13000', '7000', 0, NULL, NULL, NULL, NULL, 2, '2021-07-01', '2021-07-25 15:19:01', '2021-07-25 15:19:01'),
(6, 3, 5, 'Tank - LK', '', 3, '14700', '4388', 0, NULL, NULL, NULL, NULL, 5, '2022-02-01', '2022-02-03 07:29:01', '2022-02-03 09:12:25');

-- --------------------------------------------------------

--
-- Table structure for table `give_away_gifts`
--

CREATE TABLE `give_away_gifts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gold_grades`
--

CREATE TABLE `gold_grades` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date_and_time` datetime NOT NULL,
  `grade_name` varchar(100) NOT NULL,
  `last_gold_purity` decimal(15,2) NOT NULL DEFAULT 0.00,
  `grade_price` float NOT NULL,
  `gold_purity` float NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `trash` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gold_prices`
--

CREATE TABLE `gold_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date_and_time` datetime NOT NULL,
  `grade_id` int(11) NOT NULL,
  `grade_name` int(11) NOT NULL,
  `purity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gold_productions`
--

CREATE TABLE `gold_productions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `location_id` int(10) NOT NULL,
  `gold_smith_id` int(10) NOT NULL,
  `category_type` enum('service','non_inventory') DEFAULT NULL,
  `product_qty` decimal(10,2) NOT NULL,
  `receiving_store` varchar(191) NOT NULL,
  `gold_grade_id` int(10) NOT NULL,
  `wastage_per_8_g` decimal(15,4) NOT NULL,
  `total_product_gold_weight` decimal(15,4) NOT NULL,
  `total_stone_other_weight` decimal(15,4) NOT NULL,
  `wastage_calculation` decimal(15,4) NOT NULL,
  `total_gold_wastage` decimal(15,4) NOT NULL,
  `total_goldsmith_in_g` decimal(15,4) NOT NULL,
  `labour_cost` decimal(15,4) NOT NULL,
  `labour_cost_total` decimal(15,4) NOT NULL,
  `design_cost` decimal(15,4) NOT NULL,
  `stone_cost` decimal(15,4) NOT NULL,
  `other_cost` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gold_smiths`
--

CREATE TABLE `gold_smiths` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `mobile` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `landline` varchar(191) NOT NULL,
  `dob` date NOT NULL,
  `employee_number` varchar(50) NOT NULL,
  `opening_gold_qty` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gramaseva_vasamas`
--

CREATE TABLE `gramaseva_vasamas` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `gramaseva_vasama` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `helpers`
--

CREATE TABLE `helpers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `employee_no` varchar(191) NOT NULL,
  `helper_name` varchar(191) NOT NULL,
  `nic_number` varchar(191) NOT NULL,
  `joined_date` date NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `help_explanations`
--

CREATE TABLE `help_explanations` (
  `id` int(10) UNSIGNED NOT NULL,
  `help_key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `event_name` varchar(128) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `id` int(10) UNSIGNED NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_superadmin_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hr_prefixes`
--

CREATE TABLE `hr_prefixes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `employee_prefix` varchar(191) DEFAULT NULL,
  `employee_starting_number` int(10) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_superadmin_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hr_settings`
--

CREATE TABLE `hr_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `overtime_rate` decimal(15,2) NOT NULL DEFAULT 0.00,
  `late_time_rate` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `income_methods`
--

CREATE TABLE `income_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `referral_group_id` int(10) UNSIGNED NOT NULL,
  `income_method` varchar(191) NOT NULL,
  `status` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `income_type` enum('fixed','percentage') DEFAULT NULL,
  `value` decimal(15,6) NOT NULL,
  `minimum_new_signups` int(10) NOT NULL,
  `minimum_active_subscriptions` int(10) NOT NULL,
  `comission_eligible_conditions` enum('minimum_signups_only','minimum_subscription_only','both') DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `income_settings`
--

CREATE TABLE `income_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `income_name` varchar(191) NOT NULL,
  `owner_income` decimal(15,6) NOT NULL,
  `crew_income` decimal(15,6) NOT NULL,
  `deduct_expense_for_income` enum('yes','no') DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=disabled, 1=enabled',
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `installments`
--

CREATE TABLE `installments` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `transaction_sell_line_id` int(10) UNSIGNED NOT NULL,
  `installment_no` varchar(191) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `date` date NOT NULL,
  `payment_status` enum('due','partial','paid') NOT NULL DEFAULT 'due',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `installment_cycles`
--

CREATE TABLE `installment_cycles` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `cycle_date` date DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `interest_settings`
--

CREATE TABLE `interest_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `contact_group_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `font_size` int(11) DEFAULT NULL,
  `business_name_font_size` int(11) DEFAULT NULL,
  `invoice_heading_font_size` int(11) DEFAULT NULL,
  `header_font_size` int(11) DEFAULT NULL,
  `footer_font_size` int(11) DEFAULT NULL,
  `invoice_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT 0,
  `client_id_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT 1,
  `show_brand` tinyint(1) NOT NULL DEFAULT 0,
  `show_sku` tinyint(1) NOT NULL DEFAULT 1,
  `show_cat_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `show_lot` tinyint(1) NOT NULL DEFAULT 0,
  `show_image` tinyint(1) NOT NULL DEFAULT 0,
  `show_sale_description` tinyint(1) NOT NULL DEFAULT 0,
  `sales_person_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT 0,
  `table_product_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT 0,
  `show_business_name` tinyint(1) NOT NULL DEFAULT 0,
  `show_location_name` tinyint(1) NOT NULL DEFAULT 1,
  `show_landmark` tinyint(1) NOT NULL DEFAULT 1,
  `show_city` tinyint(1) NOT NULL DEFAULT 1,
  `show_state` tinyint(1) NOT NULL DEFAULT 1,
  `show_zip_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_country` tinyint(1) NOT NULL DEFAULT 1,
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT 1,
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT 0,
  `show_email` tinyint(1) NOT NULL DEFAULT 0,
  `show_tax_1` tinyint(1) NOT NULL DEFAULT 1,
  `show_tax_2` tinyint(1) NOT NULL DEFAULT 0,
  `show_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `show_payments` tinyint(1) NOT NULL DEFAULT 0,
  `show_customer` tinyint(1) NOT NULL DEFAULT 0,
  `customer_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT 0,
  `highlight_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `common_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` int(10) UNSIGNED NOT NULL,
  `design` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT 'classic',
  `cn_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_tax_headings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT 0,
  `prev_bal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_custom_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_custom_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `header_align` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_height` int(11) DEFAULT NULL,
  `logo_margin_bottom` int(11) DEFAULT NULL,
  `logo_margin_top` int(11) DEFAULT NULL,
  `logo_width` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `font_size`, `business_name_font_size`, `invoice_heading_font_size`, `header_font_size`, `footer_font_size`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`, `header_align`, `logo_height`, `logo_margin_bottom`, `logo_margin_top`, `logo_width`) VALUES
(1, 'Default', NULL, 20, 40, 40, 30, 20, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Subtotal', 'Discount', 'Tax', 'Total', 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', 0, '#000000', NULL, NULL, '{\"due_date_label\":null}', 1, 1, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2019-12-30 11:22:03', '2020-02-26 06:33:00', NULL, NULL, NULL, NULL, NULL),
(2, 'Default', NULL, NULL, NULL, NULL, NULL, NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', 0, '#000000', '', NULL, NULL, 1, 2, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-07-20 14:32:44', '2021-07-20 14:32:44', NULL, NULL, NULL, NULL, NULL),
(3, 'Default', NULL, NULL, NULL, NULL, NULL, NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', 0, '#000000', '', NULL, NULL, 1, 3, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-02-03 06:03:22', '2022-02-03 06:03:22', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT 0,
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'blank', '', 1, 0, 4, 1, '2019-12-30 11:22:03', '2020-05-30 12:08:04'),
(2, 2, 'Default', 'blank', '', 1, 0, 4, 1, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(3, 3, 'Default', 'blank', '', 1, 0, 4, 1, '2022-02-03 06:03:22', '2022-02-03 06:03:22');

-- --------------------------------------------------------

--
-- Table structure for table `issue_customer_bills`
--

CREATE TABLE `issue_customer_bills` (
  `id` int(10) NOT NULL,
  `business_id` int(10) NOT NULL,
  `date` date NOT NULL,
  `customer_bill_no` varchar(50) NOT NULL,
  `location_id` int(10) NOT NULL,
  `pump_id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `reference_id` int(11) NOT NULL,
  `order_bill_no` varchar(50) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `show_in_daily_voucher` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 for yes, 0 for no',
  `created_by` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issue_customer_bill_details`
--

CREATE TABLE `issue_customer_bill_details` (
  `id` int(10) NOT NULL,
  `business_id` int(10) NOT NULL,
  `issue_bill_id` bigint(20) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `qty` int(10) NOT NULL,
  `discount` int(10) NOT NULL,
  `tax` int(10) DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_categories`
--

CREATE TABLE `job_categories` (
  `id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `category_name` varchar(128) CHARACTER SET latin1 NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_default` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_superadmin_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_titles`
--

CREATE TABLE `job_titles` (
  `id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `job_title` varchar(100) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_superadmin_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_default` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'key to superadmin default entery id '
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` int(10) UNSIGNED NOT NULL,
  `journal_id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `account_type_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `debit_amount` decimal(15,2) DEFAULT NULL,
  `credit_amount` decimal(15,2) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_opening_balance` enum('yes','no') DEFAULT NULL,
  `added_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `sector` enum('private','government') NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `main_organization` varchar(191) DEFAULT NULL,
  `business` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `town` varchar(191) NOT NULL,
  `district` varchar(191) NOT NULL,
  `mobile_no_1` varchar(15) NOT NULL,
  `mobile_no_2` varchar(15) DEFAULT NULL,
  `mobile_no_3` varchar(15) DEFAULT NULL,
  `land_number` varchar(15) DEFAULT NULL,
  `status` enum('valid','invalid') NOT NULL DEFAULT 'valid',
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `leads_categories`
--

CREATE TABLE `leads_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE `leave_applications` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `leave_ctegory_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` varchar(250) NOT NULL,
  `status` enum('Pending','Accepted','Rejected','') NOT NULL DEFAULT 'Pending',
  `application_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leave_application_types`
--

CREATE TABLE `leave_application_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `leave_type` varchar(191) NOT NULL,
  `allowed_days` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_superadmin_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leave_application_types`
--

INSERT INTO `leave_application_types` (`id`, `business_id`, `leave_type`, `allowed_days`, `created_at`, `updated_at`, `is_default`, `is_superadmin_default`) VALUES
(1, 2, 'Half Day', NULL, '2021-07-20 14:32:44', '2021-07-20 14:32:44', 0, 0),
(2, 2, 'Short Leave', NULL, '2021-07-20 14:32:44', '2021-07-20 14:32:44', 0, 0),
(3, 3, 'Half Day', NULL, '2022-02-03 06:03:22', '2022-02-03 06:03:22', 0, 0),
(4, 3, 'Short Leave', NULL, '2022-02-03 06:03:22', '2022-02-03 06:03:22', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `employee_id` int(10) NOT NULL,
  `leave_type_id` int(10) NOT NULL,
  `leave_date_from` date NOT NULL,
  `leave_date_to` date NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `attended_by` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `district` varchar(191) NOT NULL,
  `town` varchar(191) NOT NULL,
  `mobile_number_1` varchar(15) NOT NULL,
  `mobile_number_2` varchar(15) DEFAULT NULL,
  `mobile_number_3` varchar(15) DEFAULT NULL,
  `land_number` varchar(15) DEFAULT NULL,
  `gender` enum('male','female') NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gramasevaka_area` int(10) DEFAULT NULL,
  `bala_mandalaya_area` int(10) DEFAULT NULL,
  `member_group` int(10) NOT NULL,
  `give_away_gifts` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `member_groups`
--

CREATE TABLE `member_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `member_group` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `merged_sub_categories`
--

CREATE TABLE `merged_sub_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date_and_time` varchar(191) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `merged_sub_category_name` varchar(191) NOT NULL,
  `sub_categories` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `meter_resettings`
--

CREATE TABLE `meter_resettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `meter_reset_ref_no` int(10) NOT NULL,
  `date_and_time` varchar(191) NOT NULL,
  `pump_id` int(10) NOT NULL,
  `last_meter` decimal(15,5) NOT NULL,
  `new_reset_meter` decimal(15,5) NOT NULL,
  `created_by` int(10) NOT NULL,
  `reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `meter_sales`
--

CREATE TABLE `meter_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `settlement_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `pump_id` int(10) UNSIGNED NOT NULL,
  `starting_meter` decimal(15,5) NOT NULL,
  `closing_meter` decimal(15,5) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `qty` decimal(15,2) NOT NULL,
  `discount` varchar(191) DEFAULT NULL,
  `discount_type` enum('fixed','percentage') DEFAULT NULL,
  `discount_amount` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `testing_qty` decimal(15,2) DEFAULT NULL,
  `sub_total` decimal(15,5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `transaction_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meter_sales`
--

INSERT INTO `meter_sales` (`id`, `settlement_no`, `business_id`, `product_id`, `pump_id`, `starting_meter`, `closing_meter`, `price`, `qty`, `discount`, `discount_type`, `discount_amount`, `testing_qty`, `sub_total`, `created_at`, `updated_at`, `transaction_id`) VALUES
(1, '1', 3, 5, 7, '6679672.00000', '6683034.00000', '87.00', '3362.00', '0', NULL, '0.0000', '0.00', '292494.00000', '2022-02-03 08:50:34', '2022-02-03 09:12:25', 81);

-- --------------------------------------------------------

--
-- Table structure for table `mfg_by_products`
--

CREATE TABLE `mfg_by_products` (
  `id` int(11) NOT NULL,
  `mfg_recipe_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `production_cost` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mfg_ingredient_groups`
--

CREATE TABLE `mfg_ingredient_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mfg_recipes`
--

CREATE TABLE `mfg_recipes` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waste_percent` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ingredients_cost` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `extra_cost` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `final_price` decimal(22,4) NOT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `production_cost_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'percentage'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mfg_recipe_ingredients`
--

CREATE TABLE `mfg_recipe_ingredients` (
  `id` int(10) UNSIGNED NOT NULL,
  `mfg_recipe_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(11) NOT NULL,
  `mfg_ingredient_group_id` int(11) DEFAULT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `waste_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(3, '2017_07_05_071953_create_currencies_table', 1),
(4, '2017_07_05_073658_create_business_table', 1),
(5, '2017_07_22_075923_add_business_id_users_table', 1),
(6, '2017_07_23_113209_create_brands_table', 1),
(7, '2017_07_26_083429_create_permission_tables', 1),
(8, '2017_07_26_110000_create_tax_rates_table', 1),
(9, '2017_07_26_122313_create_units_table', 1),
(10, '2017_07_27_075706_create_contacts_table', 1),
(11, '2017_08_04_071038_create_categories_table', 1),
(12, '2017_08_08_115903_create_products_table', 1),
(13, '2017_08_09_061616_create_variation_templates_table', 1),
(14, '2017_08_09_061638_create_variation_value_templates_table', 1),
(15, '2017_08_10_061146_create_product_variations_table', 1),
(16, '2017_08_10_061216_create_variations_table', 1),
(17, '2017_08_19_054827_create_transactions_table', 1),
(18, '2017_08_31_073533_create_purchase_lines_table', 1),
(19, '2017_10_15_064638_create_transaction_payments_table', 1),
(20, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(21, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(22, '2017_11_20_063603_create_transaction_sell_lines', 1),
(23, '2017_11_21_064540_create_barcodes_table', 1),
(24, '2017_11_23_181237_create_invoice_schemes_table', 1),
(25, '2017_12_25_122822_create_business_locations_table', 1),
(26, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(27, '2017_12_25_163227_create_variation_location_details_table', 1),
(28, '2018_01_04_115627_create_sessions_table', 1),
(29, '2018_01_05_112817_create_invoice_layouts_table', 1),
(30, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(31, '2018_01_08_104124_create_expense_categories_table', 1),
(32, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(33, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(34, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(35, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(36, '2018_01_27_184322_create_printers_table', 1),
(37, '2018_01_30_181442_create_cash_registers_table', 1),
(38, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(39, '2018_02_07_173326_modify_business_table', 1),
(40, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(41, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(42, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(43, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(44, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(45, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(46, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(47, '2018_02_13_183323_alter_decimal_fields_size', 1),
(48, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(49, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(50, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(51, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(52, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(53, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(54, '2018_02_21_105329_create_system_table', 1),
(55, '2018_02_23_100549_version_1_2', 1),
(56, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(57, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(58, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(59, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(60, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(61, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(62, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(63, '2018_03_06_210206_modify_product_barcode_types', 1),
(64, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(65, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(66, '2018_03_19_113601_add_business_settings_options', 1),
(67, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(68, '2018_03_26_165350_create_customer_groups_table', 1),
(69, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(70, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(71, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(72, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(73, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(74, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(75, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(76, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(77, '2018_04_17_123122_add_lot_number_to_business', 1),
(78, '2018_04_17_160845_add_product_racks_table', 1),
(79, '2018_04_20_182015_create_res_tables_table', 1),
(80, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(81, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(82, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(83, '2018_04_27_132653_quotation_related_change', 1),
(84, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(85, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(86, '2018_05_14_114027_add_rows_positions_for_products', 1),
(87, '2018_05_14_125223_add_weight_to_products_table', 1),
(88, '2018_05_14_164754_add_opening_stock_permission', 1),
(89, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(90, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(91, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(92, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(93, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(94, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(95, '2018_05_22_123527_create_reference_counts_table', 1),
(96, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(97, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(98, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(99, '2018_05_25_180603_create_modifiers_related_table', 1),
(100, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(101, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(102, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(103, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(104, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(105, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(106, '2018_06_07_182258_add_image_field_to_products_table', 1),
(107, '2018_06_13_133705_create_bookings_table', 1),
(108, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(109, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(110, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(111, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(112, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(113, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(114, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(115, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(116, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(117, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(118, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(119, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(120, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(121, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(122, '2018_09_04_155900_create_accounts_table', 1),
(123, '2018_09_06_114438_create_selling_price_groups_table', 1),
(124, '2018_09_06_154057_create_variation_group_prices_table', 1),
(125, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(126, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(127, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(128, '2018_09_10_152703_create_account_transactions_table', 1),
(129, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(130, '2018_09_19_123914_create_notification_templates_table', 1),
(131, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(132, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(133, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1),
(134, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(135, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(136, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(137, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(138, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(139, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(140, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(141, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(142, '2018_10_22_134428_modify_variable_product_data', 1),
(143, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(144, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(145, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(146, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(147, '2018_10_31_175627_add_user_contact_access', 1),
(148, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(149, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(150, '2018_11_08_105621_add_role_permissions', 1),
(151, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1),
(152, '2018_11_28_104410_modify_units_table_for_multi_unit', 1),
(153, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1),
(154, '2018_11_29_115918_add_primary_key_in_system_table', 1),
(155, '2018_12_03_185546_add_product_description_column_to_products_table', 1),
(156, '2018_12_06_114937_modify_system_table_and_users_table', 1),
(157, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1),
(158, '2018_12_14_103307_modify_system_table', 1),
(159, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1),
(160, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1),
(161, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1),
(162, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1),
(163, '2018_12_24_154933_create_notifications_table', 1),
(164, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1),
(165, '2019_01_10_124645_add_account_permission', 1),
(166, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1),
(167, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1),
(168, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1),
(169, '2019_02_19_103118_create_discounts_table', 1),
(170, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1),
(171, '2019_02_21_134324_add_permission_for_discount', 1),
(172, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1),
(173, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1),
(174, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1),
(175, '2019_03_12_120336_create_activity_log_table', 1),
(176, '2019_03_15_132925_create_media_table', 1),
(177, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1),
(178, '2019_05_10_132311_add_missing_column_indexing', 1),
(179, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1),
(180, '2019_05_25_104922_add_view_purchase_price_permission', 1),
(181, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1),
(182, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1),
(183, '2019_06_19_112058_add_database_changes_for_reward_points', 1),
(184, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1),
(185, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1),
(186, '2019_07_15_165136_add_fields_for_combo_product', 1),
(187, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1),
(188, '2019_07_22_152649_add_not_for_selling_in_product_table', 1),
(189, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1),
(190, '2019_08_08_162302_add_sub_units_related_fields', 1),
(191, '2019_08_26_133419_update_price_fields_decimal_point', 1),
(192, '2019_09_02_160054_remove_location_permissions_from_roles', 1),
(193, '2019_09_03_185259_add_permission_for_pos_screen', 1),
(194, '2019_09_17_122522_add_custom_labels_column_to_business_table', 1),
(195, '2019_09_18_164319_add_shipping_fields_to_transactions_table', 1),
(196, '2019_09_23_161906_add_media_description_cloumn_to_media_table', 1),
(197, '2019_10_18_155633_create_account_types_table', 1),
(198, '2019_10_22_163335_add_common_settings_column_to_business_table', 1),
(199, '2019_11_09_110522_add_indexing_to_lot_number', 1),
(200, '2019_11_19_170824_add_is_active_column_to_business_locations_table', 1),
(201, '2019_11_21_162913_change_quantity_field_types_to_decimal', 1),
(202, '2018_06_27_185405_create_packages_table', 2),
(203, '2018_06_28_182803_create_subscriptions_table', 2),
(204, '2018_07_17_182021_add_rows_to_system_table', 2),
(205, '2018_07_19_131721_add_options_to_packages_table', 2),
(206, '2018_08_17_155534_add_min_termination_alert_days', 2),
(207, '2018_08_28_105945_add_business_based_username_settings_to_system_table', 2),
(208, '2018_08_30_105906_add_superadmin_communicator_logs_table', 2),
(209, '2018_11_02_130636_add_custom_permissions_to_packages_table', 2),
(210, '2018_11_05_161848_add_more_fields_to_packages_table', 2),
(211, '2018_12_10_124621_modify_system_table_values_null_default', 2),
(212, '2019_05_10_135434_add_missing_database_column_indexes', 2),
(213, '2019_08_16_115300_create_superadmin_frontend_pages_table', 2),
(214, '2019_07_15_114211_add_manufacturing_module_version_to_system_table', 3),
(215, '2019_07_15_114403_create_mfg_recipes_table', 3),
(216, '2019_07_18_180217_add_production_columns_to_transactions_table', 3),
(217, '2019_07_26_110753_add_manufacturing_settings_column_to_business_table', 3),
(218, '2019_07_26_170450_add_manufacturing_permissions', 3),
(219, '2019_08_08_110035_create_mfg_recipe_ingredients_table', 3),
(220, '2019_08_08_172837_add_recipe_add_edit_permissions', 3),
(221, '2019_08_12_114610_add_ingredient_waste_percent_columns', 3),
(222, '2019_09_04_163141_add_location_id_to_cash_registers_table', 4),
(223, '2019_09_04_184008_create_types_of_services_table', 4),
(224, '2019_09_06_131445_add_types_of_service_fields_to_transactions_table', 4),
(225, '2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table', 4),
(226, '2019_09_12_105616_create_product_locations_table', 4),
(227, '2019_09_19_170927_close_all_active_registers', 4),
(228, '2019_10_29_132521_add_update_purchase_status_permission', 4),
(229, '2019_12_02_105025_create_warranties_table', 4),
(230, '2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table', 4),
(231, '2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table', 4),
(232, '2019_12_11_121307_add_draft_and_quotation_list_permissions', 4),
(233, '2019_12_12_180126_copy_expense_total_to_total_before_tax', 4),
(234, '2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table', 4),
(235, '2019_11_05_115136_create_ingredient_groups_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(3, 'App\\User', 2),
(5, 'App\\User', 3),
(5, 'App\\User', 4),
(6, 'App\\User', 5),
(8, 'App\\User', 6);

-- --------------------------------------------------------

--
-- Table structure for table `module_permission_locations`
--

CREATE TABLE `module_permission_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `module_name` enum('mf_module','hr_module','accounting_module','restaurant_module','number_of_pumps') NOT NULL,
  `locations` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `module_permission_locations`
--

INSERT INTO `module_permission_locations` (`id`, `business_id`, `module_name`, `locations`, `created_at`, `updated_at`) VALUES
(1, 2, 'number_of_pumps', '{\"2\":\"12\"}', '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(2, 3, 'number_of_pumps', '{\"3\":\"2\"}', '2022-02-03 06:03:22', '2022-02-03 06:06:55'),
(3, 3, 'accounting_module', '{\"3\":\"1\"}', '2022-02-03 06:06:55', '2022-02-03 06:06:55'),
(4, 3, 'hr_module', '{\"3\":\"1\"}', '2022-02-03 06:06:55', '2022-02-03 06:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `mpcs_form_settings`
--

CREATE TABLE `mpcs_form_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `F9C_sn` int(10) DEFAULT NULL,
  `F9C_tdate` date DEFAULT NULL,
  `F159ABC_form_sn` int(10) DEFAULT NULL,
  `F159ABC_form_tdate` date DEFAULT NULL,
  `F159ABC_first_day_after_stock_taking` tinyint(1) NOT NULL DEFAULT 0,
  `F159ABC_first_day_of_next_month` tinyint(1) NOT NULL DEFAULT 0,
  `F159ABC_first_day_of_next_month_selected` int(10) DEFAULT NULL,
  `F16A_form_sn` int(100) DEFAULT NULL,
  `F16A_form_tdate` date DEFAULT NULL,
  `F21C_form_sn` int(10) DEFAULT NULL,
  `F21C_form_tdate` date DEFAULT NULL,
  `F14_form_sn` int(10) DEFAULT NULL,
  `F14_form_tdate` date DEFAULT NULL,
  `F17_form_sn` int(10) DEFAULT NULL,
  `F17_form_tdate` date DEFAULT NULL,
  `F20_form_sn` int(10) DEFAULT NULL,
  `F20_form_tdate` date DEFAULT NULL,
  `F21_form_sn` int(10) DEFAULT NULL,
  `F21_form_tdate` date DEFAULT NULL,
  `F22_form_sn` int(10) DEFAULT NULL,
  `F22_form_tdate` date DEFAULT NULL,
  `F22_no_of_product_per_page` int(10) DEFAULT NULL,
  `current_stock_aa_onstocktaking` tinyint(1) DEFAULT 0,
  `f16a_first_day_after_stock_taking` tinyint(1) NOT NULL DEFAULT 0,
  `f16a_first_day_of_next_month` tinyint(1) NOT NULL DEFAULT 0,
  `f16a_first_day_of_next_month_selected` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `F16A_total_pp` decimal(15,2) NOT NULL DEFAULT 0.00,
  `F16A_total_sp` decimal(15,2) NOT NULL DEFAULT 0.00,
  `F21C_first_day_after_stock_taking` tinyint(1) NOT NULL DEFAULT 0,
  `F21C_first_day_of_next_month_selected` int(10) DEFAULT NULL,
  `F21C_first_day_of_next_month` tinyint(1) NOT NULL DEFAULT 0,
  `F9C_first_day_after_stock_taking` tinyint(1) NOT NULL DEFAULT 0,
  `F9C_first_day_of_next_month_selected` int(10) DEFAULT NULL,
  `F9C_first_day_of_next_month` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mpcs_form_settings`
--

INSERT INTO `mpcs_form_settings` (`id`, `business_id`, `F9C_sn`, `F9C_tdate`, `F159ABC_form_sn`, `F159ABC_form_tdate`, `F159ABC_first_day_after_stock_taking`, `F159ABC_first_day_of_next_month`, `F159ABC_first_day_of_next_month_selected`, `F16A_form_sn`, `F16A_form_tdate`, `F21C_form_sn`, `F21C_form_tdate`, `F14_form_sn`, `F14_form_tdate`, `F17_form_sn`, `F17_form_tdate`, `F20_form_sn`, `F20_form_tdate`, `F21_form_sn`, `F21_form_tdate`, `F22_form_sn`, `F22_form_tdate`, `F22_no_of_product_per_page`, `current_stock_aa_onstocktaking`, `f16a_first_day_after_stock_taking`, `f16a_first_day_of_next_month`, `f16a_first_day_of_next_month_selected`, `created_at`, `updated_at`, `F16A_total_pp`, `F16A_total_sp`, `F21C_first_day_after_stock_taking`, `F21C_first_day_of_next_month_selected`, `F21C_first_day_of_next_month`, `F9C_first_day_after_stock_taking`, `F9C_first_day_of_next_month_selected`, `F9C_first_day_of_next_month`) VALUES
(5, 1, 1, NULL, 1, NULL, 0, 0, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, NULL, 0, 0, 0, NULL, '2020-05-27 08:31:51', '2020-05-27 08:31:51', '0.00', '0.00', 0, NULL, 0, 0, NULL, 0),
(6, 3, 1, NULL, 1, NULL, 0, 0, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, NULL, 0, 0, 0, NULL, '2022-02-03 07:01:47', '2022-02-03 07:01:47', '0.00', '0.00', 0, NULL, 0, 0, NULL, 0),
(7, 2, 1, NULL, 1, NULL, 0, 0, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, NULL, 0, 0, 0, NULL, '2022-02-13 21:15:47', '2022-02-13 21:15:47', '0.00', '0.00', 0, NULL, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `note_id` varchar(191) NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `date_and_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note_heading` varchar(191) DEFAULT NULL,
  `note_details` text DEFAULT NULL,
  `note_footer` text DEFAULT NULL,
  `show_on_top_section` enum('no','yes') NOT NULL DEFAULT 'no',
  `shared_with_users` text DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `note_groups`
--

CREATE TABLE `note_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `prefix` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notice_boards`
--

CREATE TABLE `notice_boards` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `short_description` varchar(300) NOT NULL,
  `notice_details` text NOT NULL,
  `status` enum('published','unpublished') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'unpublished',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `subject`, `auto_send`, `auto_send_sms`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {paid_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', 0, 0, '2019-12-30 11:22:03', '2019-12-30 11:22:03'),
(2, 1, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {paid_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {paid_amount}. {business_name}', 'Payment Received, from {business_name}', 0, 0, '2019-12-30 11:22:03', '2019-12-30 11:22:03'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', 0, 0, '2019-12-30 11:22:03', '2019-12-30 11:22:03'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', 0, 0, '2019-12-30 11:22:03', '2019-12-30 11:22:03'),
(5, 1, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {invoice_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {invoice_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', 0, 0, '2019-12-30 11:22:03', '2019-12-30 11:22:03'),
(6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {invoice_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {invoice_number}.\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', 0, 0, '2019-12-30 11:22:03', '2019-12-30 11:22:03'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {invoice_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {invoice_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', 0, 0, '2019-12-30 11:22:03', '2019-12-30 11:22:03'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {invoice_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {invoice_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', 0, 0, '2019-12-30 11:22:03', '2019-12-30 11:22:03'),
(9, 2, 'new_sale', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>Your invoice number is {invoice_number}<br />\r\n                    Total amount: {total_amount}<br />\r\n                    Paid amount: {paid_amount}</p>\r\n\r\n                    <p>Thank you for shopping with us.</p>\r\n\r\n                    <p>{business_logo}</p>\r\n\r\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', 0, 0, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(10, 2, 'payment_received', '<p>Dear {contact_name},</p>\r\n\r\n                <p>We have received a payment of {paid_amount}</p>\r\n\r\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {paid_amount}. {business_name}', 'Payment Received, from {business_name}', 0, 0, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(11, 2, 'payment_reminder', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\r\n\r\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', 0, 0, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(12, 2, 'new_booking', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>Your booking is confirmed</p>\r\n\r\n                    <p>Date: {start_time} to {end_time}</p>\r\n\r\n                    <p>Table: {table}</p>\r\n\r\n                    <p>Location: {location}</p>\r\n\r\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', 0, 0, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(13, 2, 'new_order', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>We have a new order with reference number {invoice_number}. Kindly process the products as soon as possible.</p>\r\n\r\n                    <p>{business_name}<br />\r\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {invoice_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', 0, 0, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(14, 2, 'payment_paid', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>We have paid amount {paid_amount} again invoice number {invoice_number}.<br />\r\n                    Kindly note it down.</p>\r\n\r\n                    <p>{business_name}<br />\r\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {invoice_number}.\r\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', 0, 0, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(15, 2, 'items_received', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>We have received all items from invoice reference number {invoice_number}. Thank you for processing it.</p>\r\n\r\n                    <p>{business_name}<br />\r\n                    {business_logo}</p>', 'We have received all items from invoice reference number {invoice_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', 0, 0, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(16, 2, 'items_pending', '<p>Dear {contact_name},<br />\r\n                    This is to remind you that we have not yet received some items from invoice reference number {invoice_number}. Please process it as soon as possible.</p>\r\n\r\n                    <p>{business_name}<br />\r\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {invoice_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', 0, 0, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(17, 3, 'new_sale', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>Your invoice number is {invoice_number}<br />\r\n                    Total amount: {total_amount}<br />\r\n                    Paid amount: {paid_amount}</p>\r\n\r\n                    <p>Thank you for shopping with us.</p>\r\n\r\n                    <p>{business_logo}</p>\r\n\r\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', 0, 0, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(18, 3, 'payment_received', '<p>Dear {contact_name},</p>\r\n\r\n                <p>We have received a payment of {paid_amount}</p>\r\n\r\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {paid_amount}. {business_name}', 'Payment Received, from {business_name}', 0, 0, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(19, 3, 'payment_reminder', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\r\n\r\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', 0, 0, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(20, 3, 'new_booking', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>Your booking is confirmed</p>\r\n\r\n                    <p>Date: {start_time} to {end_time}</p>\r\n\r\n                    <p>Table: {table}</p>\r\n\r\n                    <p>Location: {location}</p>\r\n\r\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', 0, 0, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(21, 3, 'new_order', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>We have a new order with reference number {invoice_number}. Kindly process the products as soon as possible.</p>\r\n\r\n                    <p>{business_name}<br />\r\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {invoice_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', 0, 0, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(22, 3, 'payment_paid', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>We have paid amount {paid_amount} again invoice number {invoice_number}.<br />\r\n                    Kindly note it down.</p>\r\n\r\n                    <p>{business_name}<br />\r\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {invoice_number}.\r\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', 0, 0, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(23, 3, 'items_received', '<p>Dear {contact_name},</p>\r\n\r\n                    <p>We have received all items from invoice reference number {invoice_number}. Thank you for processing it.</p>\r\n\r\n                    <p>{business_name}<br />\r\n                    {business_logo}</p>', 'We have received all items from invoice reference number {invoice_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', 0, 0, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(24, 3, 'items_pending', '<p>Dear {contact_name},<br />\r\n                    This is to remind you that we have not yet received some items from invoice reference number {invoice_number}. Please process it as soon as possible.</p>\r\n\r\n                    <p>{business_name}<br />\r\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {invoice_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', 0, 0, '2022-02-03 06:03:22', '2022-02-03 06:03:22');

-- --------------------------------------------------------

--
-- Table structure for table `opening_meters`
--

CREATE TABLE `opening_meters` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date_and_time` datetime NOT NULL,
  `pump_id` int(10) UNSIGNED NOT NULL,
  `current_meter` decimal(15,6) NOT NULL,
  `reset_meter` decimal(15,6) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `other_incomes`
--

CREATE TABLE `other_incomes` (
  `id` int(10) UNSIGNED NOT NULL,
  `settlement_no` varchar(255) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `reason` text DEFAULT NULL,
  `sub_total` decimal(15,5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `price` decimal(15,0) NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `qty` decimal(15,2) NOT NULL DEFAULT 0.00,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `other_sales`
--

CREATE TABLE `other_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `settlement_no` varchar(255) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(15,5) NOT NULL,
  `qty` decimal(15,5) NOT NULL,
  `balance_stock` decimal(15,5) NOT NULL,
  `discount` decimal(15,2) DEFAULT NULL,
  `discount_type` enum('fixed','percentage') DEFAULT NULL,
  `discount_amount` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `sub_total` decimal(15,5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `transaction_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `other_sales`
--

INSERT INTO `other_sales` (`id`, `settlement_no`, `business_id`, `store_id`, `product_id`, `price`, `qty`, `balance_stock`, `discount`, `discount_type`, `discount_amount`, `sub_total`, `created_at`, `updated_at`, `transaction_id`) VALUES
(2, '1', 3, 6, 6, '23000.00000', '2.00000', '4.00000', '4000.00', 'fixed', '4000.0000', '42000.00000', '2022-02-03 09:03:29', '2022-02-03 09:12:25', 81);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_count` int(11) NOT NULL COMMENT 'No. of Business Locations, 0 = infinite option.',
  `user_count` int(11) NOT NULL,
  `customer_count` int(11) NOT NULL,
  `product_count` int(11) NOT NULL,
  `visit_count` int(11) DEFAULT NULL,
  `bookings` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable bookings',
  `orders` tinyint(1) NOT NULL DEFAULT 0,
  `kitchen` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable kitchen',
  `order_screen` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable order_screen',
  `tables` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable tables',
  `invoice_count` int(11) NOT NULL,
  `vehicle_count` int(10) NOT NULL,
  `store_count` int(11) NOT NULL,
  `interval` enum('days','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval_count` int(11) NOT NULL,
  `trial_days` int(11) NOT NULL,
  `price` decimal(20,4) NOT NULL,
  `custom_permissions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `visible` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_one_time` tinyint(1) NOT NULL DEFAULT 0,
  `enable_custom_link` tinyint(1) NOT NULL DEFAULT 0,
  `custom_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_link_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_commission_agent` tinyint(1) NOT NULL DEFAULT 0,
  `restaurant` tinyint(1) NOT NULL DEFAULT 0,
  `booking` tinyint(1) DEFAULT 0,
  `crm_enable` tinyint(1) NOT NULL DEFAULT 0,
  `manufacturer` tinyint(1) NOT NULL DEFAULT 0,
  `sms_enable` tinyint(1) NOT NULL DEFAULT 0,
  `hr_module` tinyint(1) NOT NULL DEFAULT 0,
  `employee` tinyint(1) NOT NULL DEFAULT 0,
  `teminated` tinyint(1) NOT NULL DEFAULT 0,
  `award` tinyint(1) NOT NULL DEFAULT 0,
  `leave_request` tinyint(1) NOT NULL DEFAULT 0,
  `import_attendance` tinyint(1) NOT NULL DEFAULT 0,
  `attendance` tinyint(1) NOT NULL DEFAULT 0,
  `late_and_over_time` tinyint(1) NOT NULL DEFAULT 0,
  `payroll` tinyint(1) NOT NULL DEFAULT 0,
  `hr_reports` tinyint(1) NOT NULL DEFAULT 0,
  `notice_board` tinyint(1) NOT NULL DEFAULT 0,
  `hr_settings` tinyint(1) NOT NULL DEFAULT 0,
  `salary_details` tinyint(1) NOT NULL DEFAULT 0,
  `basic_salary` tinyint(1) NOT NULL DEFAULT 0,
  `payroll_payments` tinyint(1) NOT NULL DEFAULT 0,
  `attendance_report` tinyint(1) NOT NULL DEFAULT 0,
  `employee_report` tinyint(1) NOT NULL DEFAULT 0,
  `payroll_report` tinyint(1) NOT NULL DEFAULT 0,
  `department` tinyint(1) NOT NULL DEFAULT 0,
  `jobtitle` tinyint(1) NOT NULL DEFAULT 0,
  `jobcategory` tinyint(1) NOT NULL DEFAULT 0,
  `workingdays` tinyint(1) NOT NULL DEFAULT 0,
  `workshift` tinyint(1) NOT NULL DEFAULT 0,
  `holidays` tinyint(1) NOT NULL DEFAULT 0,
  `leave_type` tinyint(1) NOT NULL DEFAULT 0,
  `salary_grade` tinyint(1) NOT NULL DEFAULT 0,
  `employment_status` tinyint(1) NOT NULL DEFAULT 0,
  `salary_component` tinyint(1) NOT NULL DEFAULT 0,
  `hr_prefix` tinyint(1) NOT NULL DEFAULT 0,
  `hr_tax` tinyint(1) NOT NULL DEFAULT 0,
  `religion` tinyint(1) NOT NULL DEFAULT 0,
  `hr_setting_page` tinyint(1) NOT NULL DEFAULT 0,
  `visitors_registration_module` tinyint(1) NOT NULL DEFAULT 0,
  `visitors` tinyint(1) NOT NULL DEFAULT 0,
  `visitors_registration` tinyint(1) NOT NULL DEFAULT 0,
  `visitors_registration_setting` tinyint(1) NOT NULL DEFAULT 0,
  `visitors_district` tinyint(1) NOT NULL DEFAULT 0,
  `visitors_town` tinyint(1) NOT NULL DEFAULT 0,
  `disable_all_other_module_vr` tinyint(1) NOT NULL DEFAULT 0,
  `enable_duplicate_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `petro_module` tinyint(1) NOT NULL DEFAULT 0,
  `meter_resetting` tinyint(1) NOT NULL DEFAULT 0,
  `pay_excess_commission` tinyint(1) NOT NULL DEFAULT 0,
  `recover_shortage` tinyint(1) NOT NULL DEFAULT 0,
  `pump_operator_ledger` tinyint(1) NOT NULL DEFAULT 0,
  `tasks_management` tinyint(1) NOT NULL DEFAULT 0,
  `notes_page` tinyint(1) NOT NULL DEFAULT 0,
  `tasks_page` tinyint(1) NOT NULL DEFAULT 0,
  `reminder_page` tinyint(1) NOT NULL DEFAULT 0,
  `member_registration` tinyint(1) NOT NULL DEFAULT 0,
  `commission_type` tinyint(1) NOT NULL DEFAULT 0,
  `backup_module` tinyint(1) NOT NULL DEFAULT 0,
  `enable_separate_customer_statement_no` tinyint(1) NOT NULL DEFAULT 0,
  `edit_customer_statement` tinyint(1) NOT NULL DEFAULT 0,
  `enable_cheque_writing` tinyint(1) NOT NULL DEFAULT 0,
  `issue_customer_bill` tinyint(1) NOT NULL DEFAULT 0,
  `home_dashboard` tinyint(1) NOT NULL DEFAULT 0,
  `contact_module` tinyint(1) NOT NULL DEFAULT 0,
  `contact_supplier` tinyint(1) NOT NULL DEFAULT 0,
  `contact_customer` tinyint(1) NOT NULL DEFAULT 0,
  `ran_module` tinyint(1) NOT NULL DEFAULT 0,
  `report_module` tinyint(1) NOT NULL DEFAULT 0,
  `verification_report` tinyint(1) NOT NULL DEFAULT 0,
  `notification_template_module` tinyint(1) NOT NULL DEFAULT 0,
  `settings_module` tinyint(1) NOT NULL DEFAULT 0,
  `business_settings` tinyint(1) NOT NULL DEFAULT 0,
  `business_location` tinyint(1) NOT NULL DEFAULT 0,
  `invoice_settings` tinyint(1) NOT NULL DEFAULT 0,
  `tax_rates` tinyint(1) NOT NULL DEFAULT 0,
  `list_easy_payment` tinyint(1) NOT NULL DEFAULT 0,
  `user_management_module` tinyint(1) NOT NULL DEFAULT 0,
  `banking_module` tinyint(1) NOT NULL DEFAULT 0,
  `products` tinyint(1) NOT NULL DEFAULT 0,
  `purchase` tinyint(1) NOT NULL DEFAULT 0,
  `stock_transfer` tinyint(1) NOT NULL DEFAULT 0,
  `service_staff` tinyint(1) NOT NULL DEFAULT 0,
  `enable_subscription` tinyint(1) NOT NULL DEFAULT 0,
  `add_sale` tinyint(1) NOT NULL DEFAULT 0,
  `sale_module` tinyint(1) NOT NULL DEFAULT 0,
  `all_sales` tinyint(1) NOT NULL DEFAULT 0,
  `list_pos` tinyint(1) NOT NULL DEFAULT 0,
  `list_draft` tinyint(1) NOT NULL DEFAULT 0,
  `list_quotation` tinyint(1) NOT NULL DEFAULT 0,
  `list_sell_return` tinyint(1) NOT NULL DEFAULT 0,
  `shipment` tinyint(1) NOT NULL DEFAULT 0,
  `discount` tinyint(1) NOT NULL DEFAULT 0,
  `import_sale` tinyint(1) NOT NULL DEFAULT 0,
  `reserved_stock` tinyint(1) NOT NULL DEFAULT 0,
  `status_order` tinyint(1) NOT NULL DEFAULT 0,
  `list_orders` tinyint(1) NOT NULL DEFAULT 0,
  `upload_orders` tinyint(1) NOT NULL DEFAULT 0,
  `subcriptions` tinyint(1) NOT NULL DEFAULT 0,
  `over_limit_sales` tinyint(1) NOT NULL DEFAULT 0,
  `stock_adjustment` tinyint(1) NOT NULL DEFAULT 0,
  `type_of_service` tinyint(1) NOT NULL DEFAULT 0,
  `pos_sale` tinyint(1) NOT NULL DEFAULT 0,
  `expenses` tinyint(1) NOT NULL DEFAULT 0,
  `modifiers` tinyint(1) NOT NULL DEFAULT 0,
  `upload_images` tinyint(1) NOT NULL DEFAULT 0,
  `leads_module` tinyint(1) NOT NULL DEFAULT 0,
  `leads` tinyint(1) NOT NULL DEFAULT 0,
  `day_count` tinyint(1) NOT NULL DEFAULT 0,
  `leads_import` tinyint(1) NOT NULL DEFAULT 0,
  `leads_settings` tinyint(1) NOT NULL DEFAULT 0,
  `sms_module` tinyint(1) NOT NULL DEFAULT 0,
  `cache_clear` tinyint(1) NOT NULL DEFAULT 0,
  `pump_operator_dashboard` tinyint(1) NOT NULL DEFAULT 0,
  `select_pump_operator_in_settlement` tinyint(1) NOT NULL DEFAULT 1,
  `list_sms` tinyint(1) NOT NULL DEFAULT 0,
  `customer_settings` tinyint(1) NOT NULL DEFAULT 0,
  `mpcs_module` tinyint(1) NOT NULL DEFAULT 0,
  `fleet_module` tinyint(1) NOT NULL DEFAULT 0,
  `ezyboat_module` tinyint(1) NOT NULL DEFAULT 0,
  `merge_sub_category` tinyint(1) NOT NULL DEFAULT 0,
  `customer_order_own_customer` tinyint(1) NOT NULL DEFAULT 0,
  `customer_order_general_customer` tinyint(1) NOT NULL DEFAULT 0,
  `customer_to_directly_in_panel` tinyint(1) NOT NULL DEFAULT 0,
  `hospital_system` tinyint(1) NOT NULL DEFAULT 0,
  `hospital_business_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_branches` tinyint(1) NOT NULL DEFAULT 0,
  `number_of_users` tinyint(1) NOT NULL DEFAULT 0,
  `number_of_products` tinyint(1) NOT NULL DEFAULT 0,
  `number_of_periods` tinyint(1) NOT NULL DEFAULT 0,
  `number_of_customers` tinyint(1) NOT NULL DEFAULT 0,
  `monthly_total_sales` tinyint(1) NOT NULL DEFAULT 0,
  `no_of_family_members` tinyint(1) NOT NULL DEFAULT 0,
  `no_of_vehicles` tinyint(1) NOT NULL DEFAULT 0,
  `option_variables` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `only_for_business` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `currency_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `module_enable_price` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manage_module_enable` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monthly_total_sale_value` tinyint(1) NOT NULL DEFAULT 0,
  `number_of_stores` tinyint(1) NOT NULL DEFAULT 0,
  `current_values` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_count` int(11) NOT NULL DEFAULT 1,
  `list_opening_values` tinyint(1) NOT NULL DEFAULT 0,
  `mpcs_form_settings` tinyint(1) NOT NULL DEFAULT 0,
  `add_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `add_job_sheet` tinyint(1) NOT NULL DEFAULT 0,
  `brands` tinyint(1) NOT NULL DEFAULT 0,
  `job_sheets` tinyint(1) NOT NULL DEFAULT 0,
  `list_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `repair_module` tinyint(1) NOT NULL DEFAULT 0,
  `repair_settings` tinyint(1) NOT NULL DEFAULT 0,
  `catalogue_qr` tinyint(1) NOT NULL DEFAULT 0,
  `enable_crm` tinyint(1) NOT NULL DEFAULT 0,
  `tank_dip_chart` tinyint(1) NOT NULL DEFAULT 0,
  `monthly_report` tinyint(1) NOT NULL DEFAULT 0,
  `comparison_report` tinyint(1) NOT NULL DEFAULT 0,
  `property_module` tinyint(1) NOT NULL DEFAULT 0,
  `customer_interest_deduct` int(11) NOT NULL DEFAULT 0,
  `customer_interest_deduct_option` tinyint(4) NOT NULL DEFAULT 0,
  `day_end_enable` tinyint(4) NOT NULL DEFAULT 0,
  `activity_report` tinyint(1) NOT NULL DEFAULT 0,
  `contact_group_customer` tinyint(1) NOT NULL DEFAULT 0,
  `contact_group_supplier` tinyint(1) NOT NULL DEFAULT 0,
  `contact_report` tinyint(1) NOT NULL DEFAULT 0,
  `customer_payment` tinyint(1) NOT NULL DEFAULT 0,
  `customer_reference` tinyint(1) NOT NULL DEFAULT 0,
  `customer_statement` tinyint(1) NOT NULL DEFAULT 0,
  `daily_collection` tinyint(1) NOT NULL DEFAULT 0,
  `dip_management` tinyint(1) NOT NULL DEFAULT 0,
  `import_contact` tinyint(1) NOT NULL DEFAULT 0,
  `issue_payment_detail` tinyint(1) NOT NULL DEFAULT 0,
  `list_settlement` tinyint(1) NOT NULL DEFAULT 0,
  `meter_reading` tinyint(1) NOT NULL DEFAULT 0,
  `outstanding_received` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status_report` tinyint(1) NOT NULL DEFAULT 0,
  `petro_dashboard` tinyint(1) NOT NULL DEFAULT 0,
  `petro_task_management` tinyint(1) NOT NULL DEFAULT 0,
  `pos_button_on_top_belt` tinyint(1) NOT NULL DEFAULT 0,
  `product_report` tinyint(1) NOT NULL DEFAULT 0,
  `pump_dashboard_opening` tinyint(1) NOT NULL DEFAULT 0,
  `pump_management_testing` tinyint(1) NOT NULL DEFAULT 0,
  `pump_management` tinyint(1) NOT NULL DEFAULT 0,
  `pumper_management` tinyint(1) NOT NULL DEFAULT 0,
  `report_credit_status` tinyint(1) NOT NULL DEFAULT 0,
  `report_daily_summary` tinyint(1) NOT NULL DEFAULT 0,
  `report_daily` tinyint(1) NOT NULL DEFAULT 0,
  `report_profit_loss` tinyint(1) NOT NULL DEFAULT 0,
  `report_register` tinyint(1) NOT NULL DEFAULT 0,
  `settlement` tinyint(1) NOT NULL DEFAULT 0,
  `trending_product` tinyint(1) NOT NULL DEFAULT 0,
  `user_activity` tinyint(1) NOT NULL DEFAULT 0,
  `payday` tinyint(1) DEFAULT 0,
  `monthly_max_sale_limit` decimal(20,4) DEFAULT NULL,
  `purchase_module` tinyint(1) DEFAULT 0,
  `all_purchase` tinyint(1) DEFAULT 0,
  `add_purchase` tinyint(1) DEFAULT 0,
  `add_bulk_purchase` tinyint(1) DEFAULT 0,
  `import_purchase` tinyint(1) DEFAULT 0,
  `pop_button_on_top_belt` tinyint(1) DEFAULT 0,
  `purchase_return` tinyint(1) DEFAULT 0,
  `no_of_backup` int(10) DEFAULT NULL,
  `no_of_day` int(10) DEFAULT NULL,
  `cheque_write_module` int(1) NOT NULL DEFAULT 0,
  `all_cheque_write_module` int(1) NOT NULL DEFAULT 0,
  `cheque_templates` int(1) NOT NULL DEFAULT 0,
  `write_cheque` int(1) NOT NULL DEFAULT 0,
  `manage_stamps` int(1) NOT NULL DEFAULT 0,
  `manage_payee` int(1) NOT NULL DEFAULT 0,
  `cheque_number_list` int(1) NOT NULL DEFAULT 0,
  `deleted_cheque_details` int(1) NOT NULL DEFAULT 0,
  `printed_cheque_details` int(1) NOT NULL DEFAULT 0,
  `default_setting` int(1) NOT NULL DEFAULT 0,
  `report_verification` tinyint(1) NOT NULL DEFAULT 0,
  `report_table` tinyint(1) NOT NULL DEFAULT 0,
  `report_staff_service` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `description`, `package_permissions`, `location_count`, `user_count`, `customer_count`, `product_count`, `visit_count`, `bookings`, `orders`, `kitchen`, `order_screen`, `tables`, `invoice_count`, `vehicle_count`, `store_count`, `interval`, `interval_count`, `trial_days`, `price`, `custom_permissions`, `created_by`, `sort_order`, `visible`, `is_active`, `is_private`, `is_one_time`, `enable_custom_link`, `custom_link`, `custom_link_text`, `sales_commission_agent`, `restaurant`, `booking`, `crm_enable`, `manufacturer`, `sms_enable`, `hr_module`, `employee`, `teminated`, `award`, `leave_request`, `import_attendance`, `attendance`, `late_and_over_time`, `payroll`, `hr_reports`, `notice_board`, `hr_settings`, `salary_details`, `basic_salary`, `payroll_payments`, `attendance_report`, `employee_report`, `payroll_report`, `department`, `jobtitle`, `jobcategory`, `workingdays`, `workshift`, `holidays`, `leave_type`, `salary_grade`, `employment_status`, `salary_component`, `hr_prefix`, `hr_tax`, `religion`, `hr_setting_page`, `visitors_registration_module`, `visitors`, `visitors_registration`, `visitors_registration_setting`, `visitors_district`, `visitors_town`, `disable_all_other_module_vr`, `enable_duplicate_invoice`, `petro_module`, `meter_resetting`, `pay_excess_commission`, `recover_shortage`, `pump_operator_ledger`, `tasks_management`, `notes_page`, `tasks_page`, `reminder_page`, `member_registration`, `commission_type`, `backup_module`, `enable_separate_customer_statement_no`, `edit_customer_statement`, `enable_cheque_writing`, `issue_customer_bill`, `home_dashboard`, `contact_module`, `contact_supplier`, `contact_customer`, `ran_module`, `report_module`, `verification_report`, `notification_template_module`, `settings_module`, `business_settings`, `business_location`, `invoice_settings`, `tax_rates`, `list_easy_payment`, `user_management_module`, `banking_module`, `products`, `purchase`, `stock_transfer`, `service_staff`, `enable_subscription`, `add_sale`, `sale_module`, `all_sales`, `list_pos`, `list_draft`, `list_quotation`, `list_sell_return`, `shipment`, `discount`, `import_sale`, `reserved_stock`, `status_order`, `list_orders`, `upload_orders`, `subcriptions`, `over_limit_sales`, `stock_adjustment`, `type_of_service`, `pos_sale`, `expenses`, `modifiers`, `upload_images`, `leads_module`, `leads`, `day_count`, `leads_import`, `leads_settings`, `sms_module`, `cache_clear`, `pump_operator_dashboard`, `select_pump_operator_in_settlement`, `list_sms`, `customer_settings`, `mpcs_module`, `fleet_module`, `ezyboat_module`, `merge_sub_category`, `customer_order_own_customer`, `customer_order_general_customer`, `customer_to_directly_in_panel`, `hospital_system`, `hospital_business_type`, `number_of_branches`, `number_of_users`, `number_of_products`, `number_of_periods`, `number_of_customers`, `monthly_total_sales`, `no_of_family_members`, `no_of_vehicles`, `option_variables`, `only_for_business`, `deleted_at`, `currency_id`, `created_at`, `updated_at`, `module_enable_price`, `manage_module_enable`, `other_permissions`, `monthly_total_sale_value`, `number_of_stores`, `current_values`, `employee_count`, `list_opening_values`, `mpcs_form_settings`, `add_invoice`, `add_job_sheet`, `brands`, `job_sheets`, `list_invoice`, `repair_module`, `repair_settings`, `catalogue_qr`, `enable_crm`, `tank_dip_chart`, `monthly_report`, `comparison_report`, `property_module`, `customer_interest_deduct`, `customer_interest_deduct_option`, `day_end_enable`, `activity_report`, `contact_group_customer`, `contact_group_supplier`, `contact_report`, `customer_payment`, `customer_reference`, `customer_statement`, `daily_collection`, `dip_management`, `import_contact`, `issue_payment_detail`, `list_settlement`, `meter_reading`, `outstanding_received`, `payment_status_report`, `petro_dashboard`, `petro_task_management`, `pos_button_on_top_belt`, `product_report`, `pump_dashboard_opening`, `pump_management_testing`, `pump_management`, `pumper_management`, `report_credit_status`, `report_daily_summary`, `report_daily`, `report_profit_loss`, `report_register`, `settlement`, `trending_product`, `user_activity`, `payday`, `monthly_max_sale_limit`, `purchase_module`, `all_purchase`, `add_purchase`, `add_bulk_purchase`, `import_purchase`, `pop_button_on_top_belt`, `purchase_return`, `no_of_backup`, `no_of_day`, `cheque_write_module`, `all_cheque_write_module`, `cheque_templates`, `write_cheque`, `manage_stamps`, `manage_payee`, `cheque_number_list`, `deleted_cheque_details`, `printed_cheque_details`, `default_setting`, `report_verification`, `report_table`, `report_staff_service`) VALUES
(2, 'Premium', 'Premium', '{\"account_access\":1,\"sms_settings_access\":0,\"module_access\":1}', 1, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 'years', 1, 0, '285000.0000', '[]', 1, 1, 1, 1, 0, 1, 0, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '[\"hosp_and_dis\",\"pharmacies\",\"laboratories\"]', 0, 0, 0, 0, 0, 0, 0, 0, '[]', NULL, NULL, '111', '2020-01-16 04:38:23', '2022-02-04 08:08:45', NULL, NULL, NULL, 0, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '100000000000000.0000', 1, 1, 1, 1, 1, 1, 1, 100000000, 100000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1),
(33, 'EzyPetro with Accounting & Pumper Dashboard', '12', '{\"account_access\":1,\"sms_settings_access\":0,\"module_access\":1}', 1, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 3, 'years', 1, 0, '5.0000', '[]', 1, 1, 1, 1, 0, 0, 0, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '[]', 0, 0, 0, 0, 0, 0, 0, 0, '[]', NULL, NULL, '111', '2021-03-21 17:53:16', '2022-02-14 10:19:30', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '100000000.0000', 1, 1, 1, 1, 1, 1, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1),
(57, 'Lanka Kerosene Depot', 'Custom Package', '{\"sms_settings_access\":0,\"account_access\":\"1\",\"module_access\":\"1\"}', 1, 1, 1, 1000, 12, 0, 0, 0, 0, 0, 1, 1, 1, 'years', 1, 0, '15000.0000', '{\"manufacturing_module\":\"0\"}', 1, 1, 0, 1, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '[]', 0, 0, 0, 0, 0, 0, 0, 0, NULL, 3, NULL, '111', '2022-02-03 06:06:55', '2022-02-04 08:14:56', '{\"access_account\":0,\"access_module\":0,\"enable_sale_cmsn_agent\":0,\"customer_order_own_customer\":0,\"meter_resetting\":0,\"pay_excess_commission\":0,\"recover_shortage\":0,\"pump_operator_ledger\":0,\"commission_type\":0,\"enable_petro_module\":0,\"backup_module\":0,\"issue_customer_bill\":0,\"home_dashboard\":0,\"contact_module\":0,\"contact_supplier\":0,\"contact_customer\":0,\"report_module\":0,\"settings_module\":0,\"business_settings\":0,\"business_location\":0,\"tax_rates\":0,\"user_management_module\":0,\"products\":0,\"purchase\":0,\"stock_transfer\":0,\"stock_adjustment\":0,\"expenses\":0,\"select_pump_operator_in_settlement\":0}', '{\"access_account\":\"1\",\"access_module\":\"1\",\"enable_sale_cmsn_agent\":\"1\",\"customer_order_own_customer\":\"1\",\"meter_resetting\":\"1\",\"pay_excess_commission\":\"1\",\"recover_shortage\":\"1\",\"pump_operator_ledger\":\"1\",\"commission_type\":\"1\",\"enable_petro_module\":\"1\",\"backup_module\":\"1\",\"issue_customer_bill\":\"1\",\"home_dashboard\":\"1\",\"contact_module\":\"1\",\"contact_supplier\":\"1\",\"contact_customer\":\"1\",\"report_module\":\"1\",\"settings_module\":\"1\",\"business_settings\":\"1\",\"business_location\":\"1\",\"tax_rates\":\"1\",\"user_management_module\":\"1\",\"products\":\"1\",\"purchase\":\"1\",\"stock_transfer\":\"1\",\"stock_adjustment\":\"1\",\"expenses\":\"1\",\"select_pump_operator_in_settlement\":\"1\"}', '{\"purchase\":1,\"stock_transfer\":1,\"service_staff\":0,\"enable_subscription\":0,\"add_sale\":0,\"stock_adjustment\":1,\"tables\":0,\"type_of_service\":0,\"pos_sale\":0,\"expenses\":1,\"modifiers\":0,\"kitchen\":0,\"customer_interest_deduct_option\":0}', 0, 0, '{\"number_of_branches\":null,\"number_of_users\":null,\"number_of_customers\":null,\"number_of_products\":null,\"number_of_periods\":null,\"number_of_stores\":null}', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(58, 'Cool', 'Custom Package', '{\"sms_settings_access\":0,\"account_access\":\"1\",\"module_access\":\"1\"}', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 3, 'years', 1, 0, '1.0000', '{\"manufacturing_module\":\"0\"}', 1, 1, 0, 1, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '[]', 0, 0, 0, 0, 0, 0, 0, 0, NULL, 2, NULL, '111', '2022-02-14 11:53:16', '2022-02-14 11:53:16', '{\"access_account\":0,\"access_module\":0,\"enable_sale_cmsn_agent\":0,\"customer_order_own_customer\":0,\"meter_resetting\":0,\"enable_petro_module\":0,\"issue_customer_bill\":0,\"home_dashboard\":0,\"contact_module\":0,\"contact_supplier\":0,\"contact_customer\":0,\"report_module\":0,\"settings_module\":0,\"business_settings\":0,\"business_location\":0,\"invoice_settings\":0,\"user_management_module\":0,\"products\":0,\"purchase\":0,\"stock_transfer\":0,\"pos_sale\":0,\"sale_module\":0,\"all_sales\":0,\"add_sale\":0,\"list_pos\":0,\"list_sell_return\":0,\"shipment\":0,\"discount\":0,\"expenses\":0,\"pump_operator_dashboard\":0,\"select_pump_operator_in_settlement\":0}', '{\"access_account\":\"1\",\"access_module\":\"1\",\"enable_sale_cmsn_agent\":\"1\",\"customer_order_own_customer\":\"1\",\"meter_resetting\":\"1\",\"enable_petro_module\":\"1\",\"issue_customer_bill\":\"1\",\"home_dashboard\":\"1\",\"contact_module\":\"1\",\"contact_supplier\":\"1\",\"contact_customer\":\"1\",\"report_module\":\"1\",\"settings_module\":\"1\",\"business_settings\":\"1\",\"business_location\":\"1\",\"invoice_settings\":\"1\",\"user_management_module\":\"1\",\"products\":\"1\",\"purchase\":\"1\",\"stock_transfer\":\"1\",\"pos_sale\":\"1\",\"sale_module\":\"1\",\"all_sales\":\"1\",\"add_sale\":\"1\",\"list_pos\":\"1\",\"list_sell_return\":\"1\",\"shipment\":\"1\",\"discount\":\"1\",\"expenses\":\"1\",\"pump_operator_dashboard\":\"1\",\"select_pump_operator_in_settlement\":\"1\"}', '{\"purchase\":1,\"stock_transfer\":1,\"service_staff\":0,\"enable_subscription\":0,\"add_sale\":1,\"stock_adjustment\":0,\"tables\":0,\"type_of_service\":0,\"pos_sale\":1,\"expenses\":1,\"modifiers\":0,\"kitchen\":0,\"customer_interest_deduct_option\":0}', 0, 0, '{\"number_of_branches\":null,\"number_of_users\":null,\"number_of_customers\":null,\"number_of_products\":null,\"number_of_periods\":null,\"number_of_stores\":null}', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_variables`
--

CREATE TABLE `package_variables` (
  `id` int(10) UNSIGNED NOT NULL,
  `variable_options` int(11) NOT NULL,
  `variable_code` varchar(191) NOT NULL,
  `option_value` decimal(15,0) NOT NULL,
  `increase_decrease` enum('0','1') NOT NULL,
  `variable_type` enum('0','1') NOT NULL,
  `price_value` double NOT NULL,
  `is_company_variable` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Table structure for table `patient_allergies`
--

CREATE TABLE `patient_allergies` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `allergy_name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient_details`
--

CREATE TABLE `patient_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `date_of_birth` varchar(20) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `marital_status` int(10) DEFAULT NULL,
  `blood_group` int(10) DEFAULT NULL,
  `height` varchar(10) DEFAULT NULL,
  `weight` varchar(10) DEFAULT NULL,
  `guardian_name` varchar(191) DEFAULT NULL,
  `time_zone` varchar(191) DEFAULT NULL,
  `profile_image` varchar(191) DEFAULT NULL,
  `known_allergies` varchar(191) DEFAULT NULL,
  `notes` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient_doctors`
--

CREATE TABLE `patient_doctors` (
  `id` int(11) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `doctor_name` varchar(191) NOT NULL,
  `qualification` varchar(191) DEFAULT NULL,
  `signatures` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient_medicines`
--

CREATE TABLE `patient_medicines` (
  `id` int(11) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `pharmacy_name` varchar(191) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `amount` float DEFAULT 0,
  `date` date DEFAULT NULL,
  `medicine_name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `pharmacy_file` text DEFAULT NULL,
  `is_upload` tinyint(1) DEFAULT 0,
  `notes` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient_payments`
--

CREATE TABLE `patient_payments` (
  `id` int(11) NOT NULL,
  `institution_id` int(10) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient_prescriptions`
--

CREATE TABLE `patient_prescriptions` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `hospital_name` varchar(191) DEFAULT NULL,
  `doctor_id` int(11) NOT NULL,
  `amount` float DEFAULT NULL,
  `symptoms` varchar(191) NOT NULL,
  `diagnosis` varchar(191) NOT NULL,
  `allergies_id` int(11) NOT NULL,
  `prescription_date` datetime NOT NULL,
  `prescription_file` text DEFAULT NULL,
  `bill_file_dummy` varchar(191) DEFAULT NULL,
  `is_upload` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient_tests`
--

CREATE TABLE `patient_tests` (
  `id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `laboratory_name` varchar(191) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `test_file` text DEFAULT NULL,
  `bill_file` text DEFAULT NULL,
  `amount` float DEFAULT 0,
  `is_upload` tinyint(1) NOT NULL DEFAULT 0,
  `test_name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payhere`
--

CREATE TABLE `payhere` (
  `id` int(11) NOT NULL,
  `order_id` varchar(10) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `price` float NOT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `status_code` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment_options`
--

CREATE TABLE `payment_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `payment_option` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `credit_account_type` int(11) NOT NULL,
  `credit_account` int(11) NOT NULL,
  `credit_sub_account_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `month` varchar(50) NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `gross_salary` decimal(13,2) NOT NULL DEFAULT 0.00,
  `deduction` decimal(13,2) NOT NULL DEFAULT 0.00,
  `total_hour` int(5) DEFAULT NULL,
  `net_salary` decimal(13,2) NOT NULL DEFAULT 0.00,
  `award` longtext NOT NULL,
  `fine_deduction` decimal(13,2) NOT NULL DEFAULT 0.00,
  `bonus` decimal(13,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(100) NOT NULL,
  `note` text DEFAULT NULL,
  `net_payment` decimal(13,2) NOT NULL DEFAULT 0.00,
  `type` enum('Monthly','Hourly') NOT NULL,
  `date_range` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pay_onlines`
--

CREATE TABLE `pay_onlines` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `order_id` varchar(191) NOT NULL,
  `date` date NOT NULL,
  `pay_online_no` varchar(191) NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `note` varchar(191) DEFAULT NULL,
  `type` enum('security_deposit') NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `reference_no` varchar(191) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `paid_via` enum('payhere','offline') NOT NULL,
  `payment_transaction_id` int(11) DEFAULT NULL,
  `status` enum('approved','declined','pending') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `penalties`
--

CREATE TABLE `penalties` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `sell_line_id` int(10) UNSIGNED NOT NULL,
  `block_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `note` text NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2019-12-30 11:19:41', NULL),
(2, 'direct_sell.access', 'web', '2019-12-30 11:19:41', NULL),
(3, 'product.opening_stock', 'web', '2019-12-30 11:19:42', '2019-12-30 11:19:42'),
(4, 'crud_all_bookings', 'web', '2019-12-30 11:19:42', '2019-12-30 11:19:42'),
(5, 'crud_own_bookings', 'web', '2019-12-30 11:19:42', '2019-12-30 11:19:42'),
(6, 'access_default_selling_price', 'web', '2019-12-30 11:19:42', '2019-12-30 11:19:42'),
(7, 'purchase.payments', 'web', '2019-12-30 11:19:42', '2019-12-30 11:19:42'),
(8, 'sell.payments', 'web', '2019-12-30 11:19:42', '2019-12-30 11:19:42'),
(9, 'edit_product_price_from_sale_screen', 'web', '2019-12-30 11:19:42', '2019-12-30 11:19:42'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2019-12-30 11:19:42', '2019-12-30 11:19:42'),
(11, 'roles.view', 'web', '2019-12-30 11:19:42', '2019-12-30 11:19:42'),
(12, 'roles.create', 'web', '2019-12-30 11:19:42', '2019-12-30 11:19:42'),
(13, 'roles.update', 'web', '2019-12-30 11:19:42', '2019-12-30 11:19:42'),
(14, 'roles.delete', 'web', '2019-12-30 11:19:42', '2019-12-30 11:19:42'),
(15, 'account.access', 'web', '2019-12-30 11:19:42', '2019-12-30 11:19:42'),
(16, 'discount.access', 'web', '2019-12-30 11:19:43', '2019-12-30 11:19:43'),
(17, 'view_purchase_price', 'web', '2019-12-30 11:19:43', '2019-12-30 11:19:43'),
(18, 'view_own_sell_only', 'web', '2019-12-30 11:19:43', '2019-12-30 11:19:43'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2019-12-30 11:19:43', '2019-12-30 11:19:43'),
(20, 'edit_product_price_from_pos_screen', 'web', '2019-12-30 11:19:43', '2019-12-30 11:19:43'),
(21, 'access_shipping', 'web', '2019-12-30 11:19:43', '2019-12-30 11:19:43'),
(22, 'user.view', 'web', '2019-12-30 11:19:43', NULL),
(23, 'user.create', 'web', '2019-12-30 11:19:43', NULL),
(24, 'user.update', 'web', '2019-12-30 11:19:43', NULL),
(25, 'user.delete', 'web', '2019-12-30 11:19:43', NULL),
(26, 'supplier.view', 'web', '2019-12-30 11:19:43', NULL),
(27, 'supplier.create', 'web', '2019-12-30 11:19:43', NULL),
(28, 'supplier.update', 'web', '2019-12-30 11:19:43', NULL),
(29, 'supplier.delete', 'web', '2019-12-30 11:19:43', NULL),
(30, 'customer.view', 'web', '2019-12-30 11:19:43', NULL),
(31, 'customer.create', 'web', '2019-12-30 11:19:43', NULL),
(32, 'customer.update', 'web', '2019-12-30 11:19:43', NULL),
(33, 'customer.delete', 'web', '2019-12-30 11:19:43', NULL),
(34, 'product.view', 'web', '2019-12-30 11:19:43', NULL),
(35, 'product.create', 'web', '2019-12-30 11:19:43', NULL),
(36, 'product.update', 'web', '2019-12-30 11:19:43', NULL),
(37, 'product.delete', 'web', '2019-12-30 11:19:43', NULL),
(38, 'purchase.view', 'web', '2019-12-30 11:19:43', NULL),
(39, 'purchase.create', 'web', '2019-12-30 11:19:43', NULL),
(40, 'purchase.update', 'web', '2019-12-30 11:19:43', NULL),
(41, 'purchase.delete', 'web', '2019-12-30 11:19:43', NULL),
(42, 'sell.view', 'web', '2019-12-30 11:19:43', NULL),
(43, 'sell.create', 'web', '2019-12-30 11:19:43', NULL),
(44, 'sell.update', 'web', '2019-12-30 11:19:43', NULL),
(45, 'sell.delete', 'web', '2019-12-30 11:19:43', NULL),
(46, 'purchase_n_sell_report.view', 'web', '2019-12-30 11:19:43', NULL),
(47, 'contacts_report.view', 'web', '2019-12-30 11:19:43', NULL),
(48, 'stock_report.view', 'web', '2019-12-30 11:19:43', NULL),
(49, 'tax_report.view', 'web', '2019-12-30 11:19:43', NULL),
(50, 'trending_product_report.view', 'web', '2019-12-30 11:19:43', NULL),
(51, 'register_report.view', 'web', '2019-12-30 11:19:43', NULL),
(52, 'sales_representative.view', 'web', '2019-12-30 11:19:43', NULL),
(53, 'expense_report.view', 'web', '2019-12-30 11:19:43', NULL),
(54, 'business_settings.access', 'web', '2019-12-30 11:19:43', NULL),
(55, 'barcode_settings.access', 'web', '2019-12-30 11:19:43', NULL),
(56, 'invoice_settings.access', 'web', '2019-12-30 11:19:43', NULL),
(57, 'brand.view', 'web', '2019-12-30 11:19:43', NULL),
(58, 'brand.create', 'web', '2019-12-30 11:19:43', NULL),
(59, 'brand.update', 'web', '2019-12-30 11:19:43', NULL),
(60, 'brand.delete', 'web', '2019-12-30 11:19:43', NULL),
(61, 'tax_rate.view', 'web', '2019-12-30 11:19:43', NULL),
(62, 'tax_rate.create', 'web', '2019-12-30 11:19:43', NULL),
(63, 'tax_rate.update', 'web', '2019-12-30 11:19:43', NULL),
(64, 'tax_rate.delete', 'web', '2019-12-30 11:19:43', NULL),
(65, 'unit.view', 'web', '2019-12-30 11:19:43', NULL),
(66, 'unit.create', 'web', '2019-12-30 11:19:43', NULL),
(67, 'unit.update', 'web', '2019-12-30 11:19:43', NULL),
(68, 'unit.delete', 'web', '2019-12-30 11:19:43', NULL),
(69, 'category.view', 'web', '2019-12-30 11:19:43', NULL),
(70, 'category.create', 'web', '2019-12-30 11:19:43', NULL),
(71, 'category.update', 'web', '2019-12-30 11:19:43', NULL),
(72, 'category.delete', 'web', '2019-12-30 11:19:43', NULL),
(73, 'expense.access', 'web', '2019-12-30 11:19:43', NULL),
(74, 'access_all_locations', 'web', '2019-12-30 11:19:43', NULL),
(75, 'dashboard.data', 'web', '2019-12-30 11:19:43', NULL),
(76, 'location.1', 'web', '2019-12-30 11:22:03', '2019-12-30 11:22:03'),
(77, 'manufacturing.access_recipe', 'web', '2019-12-31 05:09:04', '2019-12-31 05:09:04'),
(78, 'manufacturing.access_production', 'web', '2019-12-31 05:09:04', '2019-12-31 05:09:04'),
(79, 'manufacturing.add_recipe', 'web', '2019-12-31 05:09:04', '2019-12-31 05:09:04'),
(80, 'manufacturing.edit_recipe', 'web', '2019-12-31 05:09:04', '2019-12-31 05:09:04'),
(81, 'purchase.update_status', 'web', '2020-01-09 08:23:54', '2020-01-09 08:23:54'),
(82, 'list_drafts', 'web', '2020-01-09 08:23:54', '2020-01-09 08:23:54'),
(83, 'list_quotations', 'web', '2020-01-09 08:23:54', '2020-01-09 08:23:54'),
(84, 'product.set_min_sell_price', 'web', NULL, NULL),
(85, 'sales-commission-agents.create', 'web', NULL, NULL),
(86, 'day_end.view', 'web', NULL, NULL),
(87, 'day_end.bypass', 'web', NULL, NULL),
(88, 'crm.view', 'web', NULL, NULL),
(89, 'crm.create', 'web', NULL, NULL),
(90, 'crm.update', 'web', NULL, NULL),
(91, 'crm.delete', 'web', NULL, NULL),
(92, 'restaurant.access', 'web', '2019-12-24 18:30:00', '2019-12-24 18:30:00'),
(95, 'edit_product_price_below_purchase_price', 'web', NULL, NULL),
(120, 'selling_price_group.1', 'web', '2020-03-02 12:52:39', '2020-03-02 12:52:39'),
(125, 'account.link_account', 'web', NULL, NULL),
(126, 'sms.view', 'web', NULL, NULL),
(129, 'settlement.edit', 'web', NULL, NULL),
(130, 'reset_dip', 'web', '2020-04-16 09:01:00', '2020-04-16 04:52:27'),
(137, 'account.edit', 'web', NULL, NULL),
(140, 'edit_customer_statement', 'web', '2020-05-06 19:00:00', '2020-05-06 19:00:00'),
(141, 'enable_separate_customer_statement_no', 'web', '2020-05-06 19:00:00', '2020-05-06 19:00:00'),
(142, 'backup', 'web', '2020-05-06 19:00:00', '2020-05-06 19:00:00'),
(143, 'edit_f22_stock_Taking_form', 'web', '2020-05-07 19:00:00', '2020-05-07 19:00:00'),
(145, 'edit_f17_form', 'web', NULL, NULL),
(147, 'enable_cheque_writing', 'web', '2020-05-14 19:00:00', '2020-05-14 19:00:00'),
(148, 'f9c_form', 'web', NULL, NULL),
(149, 'f15a9abc_form', 'web', NULL, NULL),
(150, 'f16a_form', 'web', NULL, NULL),
(151, 'f21c_form', 'web', NULL, NULL),
(152, 'f17_form', 'web', NULL, NULL),
(153, 'f14b_form', 'web', NULL, NULL),
(154, 'f20_form', 'web', NULL, NULL),
(155, 'f21_form', 'web', NULL, NULL),
(156, 'f22_stock_taking_form', 'web', NULL, NULL),
(157, 'unfinished_form.purchase', 'web', NULL, NULL),
(158, 'unfinished_form.sale', 'web', NULL, NULL),
(159, 'unfinished_form.pos', 'web', NULL, NULL),
(160, 'unfinished_form.stock_adjustment', 'web', NULL, NULL),
(161, 'unfinished_form.stock_transfer', 'web', NULL, NULL),
(162, 'unfinished_form.expense', 'web', NULL, NULL),
(163, 'hr.access', 'web', '2020-05-26 19:00:00', '2020-05-26 19:00:00'),
(165, 'pos_page_return', 'web', '2020-05-26 19:00:00', '2020-05-26 19:00:00'),
(166, 'expense.create', 'web', NULL, NULL),
(167, 'expense.update', 'web', NULL, NULL),
(168, 'expense.delete', 'web', NULL, NULL),
(169, 'expense.add_payment', 'web', NULL, NULL),
(172, 'product.price_section', 'web', '2020-05-31 19:00:00', '2020-05-31 19:00:00'),
(173, 'fuel_tank.edit', 'web', '2020-05-31 19:00:00', '2020-05-31 19:00:00'),
(174, 'meter_resetting_tab', 'web', '2020-05-31 19:00:00', '2020-05-31 19:00:00'),
(175, 'add_dip_resetting', 'web', '2020-05-31 19:00:00', '2020-05-31 19:00:00'),
(177, 'issue_customer_bill.access', 'web', NULL, NULL),
(178, 'issue_customer_bill.add', 'web', NULL, NULL),
(179, 'issue_customer_bill.view', 'web', NULL, NULL),
(180, 'edit_other_income_prices', 'web', '2020-07-12 18:30:00', '2020-07-12 18:30:00'),
(181, 'mpcs_form_settings', 'web', '2020-07-12 18:30:00', '2020-07-12 18:30:00'),
(182, 'list_opening_values', 'web', '2020-07-12 18:30:00', '2020-07-12 18:30:00'),
(183, 'tasks_management.access', 'web', '2020-07-14 18:30:00', '2020-07-14 18:30:00'),
(184, 'tasks_management.tasks', 'web', '2020-07-14 18:30:00', '2020-07-14 18:30:00'),
(186, 'add_remarks', 'web', '2020-07-17 18:30:00', '2020-07-17 18:30:00'),
(187, 'update_status_of_issue', 'web', '2020-07-17 18:30:00', '2020-07-17 18:30:00'),
(188, 'upload_images', 'web', '2020-07-18 18:30:00', '2020-07-18 18:30:00'),
(189, 'leads.view', 'web', NULL, NULL),
(190, 'leads.create', 'web', NULL, NULL),
(191, 'leads.edit', 'web', NULL, NULL),
(192, 'leads.delete', 'web', NULL, NULL),
(193, 'leads.import', 'web', NULL, NULL),
(194, 'day_count', 'web', NULL, NULL),
(195, 'leads.settings', 'web', NULL, NULL),
(196, 'sms.access', 'web', NULL, NULL),
(197, 'sms.list', 'web', NULL, NULL),
(198, 'member_registration.access', 'web', NULL, NULL),
(199, 'status_order', 'web', NULL, NULL),
(200, 'customer_settings.access', 'web', '2020-07-30 18:30:00', '2020-07-30 18:30:00'),
(201, 'approve_sell_over_limit', 'web', '2020-07-30 18:30:00', '2020-07-30 18:30:00'),
(202, 'stock_adjustment_report.view', 'web', NULL, NULL),
(203, 'item_report.view', 'web', NULL, NULL),
(204, 'product_purchase_report.view', 'web', NULL, NULL),
(205, 'product_sell_report.view', 'web', NULL, NULL),
(206, 'product_transaction_report.view', 'web', NULL, NULL),
(207, 'purchase_payment_report.view', 'web', NULL, NULL),
(208, 'sell_payment_report.view', 'web', NULL, NULL),
(209, 'outstanding_received_report.view', 'web', NULL, NULL),
(210, 'aging_report.view', 'web', NULL, NULL),
(211, 'daily_report.view', 'web', NULL, NULL),
(212, 'daily_summary_report.view', 'web', NULL, NULL),
(213, 'activity_report.view', 'web', NULL, NULL),
(214, 'contact_report.view', 'web', NULL, NULL),
(215, 'trending_products.view', 'web', NULL, NULL),
(216, 'user_activity.view', 'web', NULL, NULL),
(217, 'sales_report.view', 'web', NULL, NULL),
(218, 'purchase_and_slae_report.view', 'web', NULL, NULL),
(219, 'credit_status.view', 'web', NULL, NULL),
(220, 'tasks_management.reminder', 'web', NULL, NULL),
(221, 'employee.edit', 'web', NULL, NULL),
(222, 'attendance.approve_reject_lo', 'web', NULL, NULL),
(223, 'leave_request.approve_reject', 'web', NULL, NULL),
(224, 'leave_request.delete', 'web', NULL, NULL),
(225, 'leave_request.edit', 'web', NULL, NULL),
(228, 'web', 'daily_collection.delete', '2020-09-29 18:50:00', '2020-09-30 00:51:00'),
(230, 'account.reconcile', 'web', '2020-10-04 18:30:00', '2020-10-04 18:30:00'),
(231, 'daily_collection.delete', 'web', '2020-09-29 18:50:00', '2020-09-30 00:51:00'),
(236, 'customer_reference.edit', 'web', '2020-10-14 18:30:00', '2020-10-14 18:30:00'),
(238, 'cache_clear', 'web', '2020-10-16 18:30:00', '2020-10-16 18:30:00'),
(240, 'pum_operator.active_inactive', 'web', '2020-10-21 18:30:00', '2020-10-21 18:30:00'),
(241, 'pump_operator.dashboard', 'web', '2020-10-21 18:30:00', '2020-10-21 18:30:00'),
(242, 'petro.access', 'web', '2020-10-22 18:30:00', '2020-10-22 18:30:00'),
(243, 'mpcs.access', 'web', '2020-10-22 18:30:00', '2020-10-22 18:30:00'),
(244, 'ran.access', 'web', '2020-10-22 18:30:00', '2020-10-22 18:30:00'),
(245, 'report.access', 'web', '2020-10-22 18:30:00', '2020-10-22 18:30:00'),
(246, 'catalogue.access', 'web', '2020-10-22 18:30:00', '2020-10-22 18:30:00'),
(247, 'repair.access', 'web', '2020-10-22 18:30:00', '2020-10-22 18:30:00'),
(249, 'visitor.registration.create', 'web', NULL, NULL),
(250, 'visitor.registration.view', 'web', NULL, NULL),
(251, 'visitor.registration.edit', 'web', NULL, NULL),
(252, 'visitor.registration.delete', 'web', NULL, NULL),
(253, 'visitor.business.name.required', 'web', NULL, NULL),
(254, 'visitor.business.name.enable', 'web', NULL, NULL),
(255, 'visitor.date.time.required', 'web', NULL, NULL),
(256, 'visitor.date.time.enable', 'web', NULL, NULL),
(257, 'visitor.visited.date.required', 'web', NULL, NULL),
(258, 'visitor.visited.date.enable', 'web', NULL, NULL),
(259, 'visitor.mobile.number.required', 'web', NULL, NULL),
(260, 'visitor.mobile.number.enable', 'web', NULL, NULL),
(261, 'visitor.land.number.required', 'web', NULL, NULL),
(262, 'visitor.land.number.enable', 'web', NULL, NULL),
(263, 'visitor.name.required', 'web', NULL, NULL),
(264, 'visitor.name.enable', 'web', NULL, NULL),
(265, 'visitor.address.enable', 'web', NULL, NULL),
(266, 'visitor.district.required', 'web', NULL, NULL),
(267, 'visitor.district.enable', 'web', NULL, NULL),
(268, 'visitor.district.add', 'web', NULL, NULL),
(269, 'visitor.town.required', 'web', NULL, NULL),
(270, 'visitor.town.enable', 'web', NULL, NULL),
(271, 'visitor.town.add', 'web', NULL, NULL),
(272, 'visitor.details.required', 'web', NULL, NULL),
(273, 'visitor.details.enable', 'web', NULL, NULL),
(274, 'visitor.settings.view', 'web', NULL, NULL),
(275, 'visitor.settings.edit', 'web', NULL, NULL),
(276, 'monthly_report.view', 'web', NULL, NULL),
(277, 'comparison_report.view', 'web', NULL, NULL),
(281, 'pump_operator.access_code', 'web', NULL, NULL),
(282, 'daily_pump_status.edit', 'web', NULL, NULL),
(283, 'daily_pump_status.delete', 'web', NULL, NULL),
(288, 'property.purchase.view', 'web', NULL, NULL),
(289, 'property.purchase.create', 'web', NULL, NULL),
(290, 'property.list.view', 'web', NULL, NULL),
(291, 'property.purchase.edit', 'web', NULL, NULL),
(292, 'property.purchase.delete', 'web', NULL, NULL),
(293, 'property.list.create', 'web', NULL, NULL),
(294, 'property.list.edit', 'web', NULL, NULL),
(295, 'property.list.delete', 'web', NULL, NULL),
(296, 'property.settings.access', 'web', NULL, NULL),
(297, 'property.settings.unit', 'web', NULL, NULL),
(298, 'property.settings.tax', 'web', NULL, NULL),
(299, 'property.customer.view', 'web', NULL, NULL),
(300, 'property.customer.create', 'web', NULL, NULL),
(301, 'property.customer.edit', 'web', NULL, NULL),
(302, 'property.customer.delete', 'web', NULL, NULL),
(307, 'fleet.access', 'web', NULL, NULL),
(308, 'pump_operator.main_system', 'web', NULL, NULL),
(311, 'property_finalize.edit', 'web', NULL, NULL),
(312, 'property_account_settings.edit', 'web', NULL, NULL),
(313, 'property_penalty.delete', 'web', NULL, NULL),
(314, 'list_easy_payments.access', 'web', NULL, NULL),
(316, 'account.settings', 'web', NULL, NULL),
(319, 'property.current_sale.edit', 'web', NULL, NULL),
(320, 'property.current_sale.view', 'web', NULL, NULL),
(321, 'property.current_sale.close.create', 'web', NULL, NULL),
(322, 'property.add_new_sale', 'web', NULL, NULL),
(323, 'property.current_sale.close.edit', 'web', NULL, NULL),
(324, 'fleet.routes.edit', 'web', NULL, NULL),
(325, 'fleet.routes.delete', 'web', NULL, NULL),
(326, 'fleet.drivers.edit', 'web', NULL, NULL),
(327, 'fleet.drivers.delete', 'web', NULL, NULL),
(328, 'fleet.helpers.edit', 'web', NULL, NULL),
(329, 'fleet.helpers.delete', 'web', NULL, NULL),
(331, 'account.settings.edit', 'web', NULL, NULL),
(339, 'account.deposit_transfer.edit', 'web', NULL, NULL),
(340, 'location.2', 'web', '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(341, 'location.3', 'web', '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(342, 'add.payments', 'web', '2022-02-08 10:26:49', '2022-02-08 10:26:49');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy_products`
--

CREATE TABLE `pharmacy_products` (
  `id` int(11) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prescription_medicines`
--

CREATE TABLE `prescription_medicines` (
  `id` int(11) NOT NULL,
  `prescription_id` int(10) UNSIGNED NOT NULL,
  `medicine_id` int(10) UNSIGNED NOT NULL,
  `notes` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prescription_tests`
--

CREATE TABLE `prescription_tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `prescription_id` int(10) UNSIGNED NOT NULL,
  `test_id` int(10) UNSIGNED NOT NULL,
  `notes` varchar(191) DEFAULT NULL,
  `test_date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `printed_cheque_details`
--

CREATE TABLE `printed_cheque_details` (
  `id` int(11) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `template_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `payee` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_account_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cheque_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cheque_amount` float(15,2) NOT NULL,
  `cheque_date` varchar(225) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `voucher_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `payee_tempname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `stampvalu` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `amount_word` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `refrence` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_order_id` int(11) DEFAULT NULL,
  `supplier_paid_amount` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE `priorities` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `date` date NOT NULL,
  `added_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`id`, `business_id`, `name`, `date`, `added_by`, `created_at`, `updated_at`) VALUES
(1, 2, 'Low', '2021-07-20', 1, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(2, 2, 'Medium', '2021-07-20', 1, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(3, 2, 'High', '2021-07-20', 1, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(4, 2, 'Urgent', '2021-07-20', 1, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(5, 2, 'Critical', '2021-07-20', 1, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(6, 3, 'Low', '2022-02-03', 1, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(7, 3, 'Medium', '2022-02-03', 1, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(8, 3, 'High', '2022-02-03', 1, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(9, 3, 'Urgent', '2022-02-03', 1, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(10, 3, 'Critical', '2022-02-03', 1, '2022-02-03 06:03:22', '2022-02-03 06:03:22');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo','variable_only_in_sale') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(11) UNSIGNED DEFAULT NULL,
  `sub_unit_ids` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT 0,
  `raw_material` tinyint(1) NOT NULL DEFAULT 0,
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT 0,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT 0,
  `not_for_selling` tinyint(1) NOT NULL DEFAULT 0,
  `show_avai_qty_in_qr_catalogue` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_catalogue_page` tinyint(1) NOT NULL DEFAULT 0,
  `min_sell_price` int(11) NOT NULL DEFAULT 0,
  `is_medicine` tinyint(1) NOT NULL DEFAULT 0,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `multiple_units` tinyint(1) NOT NULL DEFAULT 0,
  `stock_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repair_model_id` int(10) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL,
  `is_service` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `raw_material`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `product_description`, `created_by`, `warranty_id`, `is_inactive`, `not_for_selling`, `show_avai_qty_in_qr_catalogue`, `show_in_catalogue_page`, `min_sell_price`, `is_medicine`, `country`, `created_at`, `updated_at`, `multiple_units`, `stock_type`, `repair_model_id`, `date`, `is_service`) VALUES
(1, 'Petrol 92', 2, 'single', 2, NULL, NULL, 1, 5, NULL, 'exclusive', 1, 0, '3000.0000', '001', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, 0, 0, 0, 0, 0, NULL, '2021-07-25 15:08:32', '2021-07-25 15:08:32', 0, '2999', NULL, NULL, 0),
(2, 'Petrol 95', 2, 'single', 2, NULL, NULL, 1, 6, NULL, 'exclusive', 1, 0, '2000.0000', '0002', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, 0, 0, 0, 0, 0, NULL, '2021-07-25 15:09:12', '2021-07-25 15:09:12', 0, '2999', NULL, NULL, 0),
(3, 'Auto Diesel', 2, 'single', 2, NULL, NULL, 1, 7, NULL, 'exclusive', 1, 0, '4000.0000', '0003', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, 0, 0, 0, 0, 0, NULL, '2021-07-25 15:10:20', '2021-07-25 15:10:20', 0, '2999', NULL, NULL, 0),
(4, 'Product-1', 2, 'single', 2, NULL, NULL, 2, 4, NULL, 'exclusive', 1, 0, '1.0000', '0004', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, 0, 0, 0, 0, 0, NULL, '2021-07-28 18:44:03', '2021-07-28 18:44:03', 0, '2999', NULL, NULL, 0),
(5, 'Lanka Kerosene Oil', 3, 'single', 6, NULL, NULL, 8, 15, NULL, 'inclusive', 1, 0, '6600.0000', 'A0017L99', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:27:48', '2022-02-03 07:27:48', 0, '3043', NULL, NULL, 0),
(6, 'O/B - 20L', 3, 'single', 7, NULL, NULL, 9, 16, NULL, 'inclusive', 1, 0, '0.0000', '1', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(7, 'Delo - 5L', 3, 'single', 7, NULL, NULL, 9, 16, NULL, 'inclusive', 1, 0, '0.0000', '2', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(8, 'Delo - 1L', 3, 'single', 7, NULL, NULL, 9, 16, NULL, 'inclusive', 1, 0, '0.0000', '3', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(9, 'D/S 40 - 5L', 3, 'single', 7, NULL, NULL, 9, 16, NULL, 'inclusive', 1, 0, '0.0000', '4', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(10, 'D/S 40 - 1L', 3, 'single', 7, NULL, NULL, 9, 16, NULL, 'inclusive', 1, 0, '0.0000', '5', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(11, 'Scooty - 1L', 3, 'single', 7, NULL, NULL, 9, 16, NULL, 'inclusive', 1, 0, '0.0000', '6', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(12, '4T - 1L', 3, 'single', 7, NULL, NULL, 9, 16, NULL, 'inclusive', 1, 0, '0.0000', '7', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(13, 'Greese - 100g', 3, 'single', 7, NULL, NULL, 9, 16, NULL, 'inclusive', 1, 0, '0.0000', '8', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(14, 'Greese - 250g', 3, 'single', 7, NULL, NULL, 9, 16, NULL, 'inclusive', 1, 0, '0.0000', '9', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(15, 'TCW-3 - 20L', 3, 'single', 7, NULL, NULL, 9, 17, NULL, 'inclusive', 1, 0, '0.0000', '10', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(16, 'GO-140 - 20L', 3, 'single', 7, NULL, NULL, 9, 17, NULL, 'inclusive', 1, 0, '0.0000', '11', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(17, 'Q-T - 20L', 3, 'single', 7, NULL, NULL, 9, 17, NULL, 'inclusive', 1, 0, '0.0000', '12', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(18, '12.5 Kg - Gas', 3, 'single', 7, NULL, NULL, 10, 24, NULL, 'inclusive', 1, 0, '0.0000', 'G1', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(19, '5 Kg - Gas', 3, 'single', 7, NULL, NULL, 10, 24, NULL, 'inclusive', 1, 0, '0.0000', 'G2', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(20, '2.5 Kg - Gas', 3, 'single', 7, NULL, NULL, 10, 24, NULL, 'inclusive', 1, 0, '0.0000', 'G3', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(21, '12.5 Kg - Cylinders', 3, 'single', 7, NULL, NULL, 10, 25, NULL, 'inclusive', 1, 0, '0.0000', 'C1', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(22, '5 Kg - Cylinders', 3, 'single', 7, NULL, NULL, 10, 25, NULL, 'inclusive', 1, 0, '0.0000', 'C2', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(23, '2.5 Kg - Cylinders', 3, 'single', 7, NULL, NULL, 10, 25, NULL, 'inclusive', 1, 0, '0.0000', 'C3', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(24, 'Regulators', 3, 'single', 7, NULL, NULL, 10, 23, NULL, 'inclusive', 1, 0, '0.0000', '13', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(25, 'Hose', 3, 'single', 7, NULL, NULL, 10, 23, NULL, 'inclusive', 1, 0, '0.0000', '14', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(26, 'Pack', 3, 'single', 7, NULL, NULL, 10, 23, NULL, 'inclusive', 1, 0, '0.0000', '15', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(27, 'Panasonic Evolta', 3, 'single', 7, NULL, NULL, 11, 19, NULL, 'inclusive', 1, 0, '0.0000', '16', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(28, 'Panasonic Alkaline 9V BAT', 3, 'single', 7, NULL, NULL, 11, 19, NULL, 'inclusive', 1, 0, '0.0000', '17', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(29, 'Panasonic AA', 3, 'single', 7, NULL, NULL, 11, 19, NULL, 'inclusive', 1, 0, '0.0000', '18', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(30, 'Panasonic AAA', 3, 'single', 7, NULL, NULL, 11, 19, NULL, 'inclusive', 1, 0, '0.0000', '19', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(31, 'S Glue', 3, 'single', 7, NULL, NULL, 11, 19, NULL, 'inclusive', 1, 0, '0.0000', '20', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(32, 'H Torch', 3, 'single', 7, NULL, NULL, 11, 19, NULL, 'inclusive', 1, 0, '0.0000', '21', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(33, 'Orange AA', 3, 'single', 7, NULL, NULL, 11, 20, NULL, 'inclusive', 1, 0, '0.0000', '22', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(34, 'Orange AAA', 3, 'single', 7, NULL, NULL, 11, 20, NULL, 'inclusive', 1, 0, '0.0000', '23', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(35, '4-BAT', 3, 'single', 7, NULL, NULL, 11, 21, NULL, 'inclusive', 1, 0, '0.0000', '24', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(36, '2-BAT', 3, 'single', 7, NULL, NULL, 11, 21, NULL, 'inclusive', 1, 0, '0.0000', '25', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(37, 'Big BAT', 3, 'single', 7, NULL, NULL, 11, 21, NULL, 'inclusive', 1, 0, '0.0000', '26', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(38, 'H Torch - S', 3, 'single', 7, NULL, NULL, 11, 21, NULL, 'inclusive', 1, 0, '0.0000', '27', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(39, 'H Torch - L', 3, 'single', 7, NULL, NULL, 11, 21, NULL, 'inclusive', 1, 0, '0.0000', '28', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(40, 'H Torch - Big', 3, 'single', 7, NULL, NULL, 11, 21, NULL, 'inclusive', 1, 0, '0.0000', '29', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(41, 'Charger', 3, 'single', 7, NULL, NULL, 11, 21, NULL, 'inclusive', 1, 0, '0.0000', '30', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(42, 'Yamaha', 3, 'single', 7, NULL, NULL, 11, 22, NULL, 'inclusive', 1, 0, '0.0000', '31', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 0, '3043', NULL, NULL, 0),
(43, 'test', 3, 'single', 5, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, 0, NULL, '0043', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 0, 0, 0, 0, 0, 0, NULL, '2022-02-04 11:08:02', '2022-02-04 11:08:02', 0, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

CREATE TABLE `product_locations` (
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(42, 3),
(43, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(1, NULL, 'DUMMY', 1, 1, '2021-07-25 15:08:32', '2021-07-25 15:08:32'),
(2, NULL, 'DUMMY', 2, 1, '2021-07-25 15:09:12', '2021-07-25 15:09:12'),
(3, NULL, 'DUMMY', 3, 1, '2021-07-25 15:10:20', '2021-07-25 15:10:20'),
(4, NULL, 'DUMMY', 4, 1, '2021-07-28 18:44:03', '2021-07-28 18:44:03'),
(5, NULL, 'DUMMY', 5, 1, '2022-02-03 07:27:48', '2022-02-03 07:27:48'),
(6, NULL, 'DUMMY', 6, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(7, NULL, 'DUMMY', 7, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(8, NULL, 'DUMMY', 8, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(9, NULL, 'DUMMY', 9, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(10, NULL, 'DUMMY', 10, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(11, NULL, 'DUMMY', 11, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(12, NULL, 'DUMMY', 12, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(13, NULL, 'DUMMY', 13, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(14, NULL, 'DUMMY', 14, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(15, NULL, 'DUMMY', 15, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(16, NULL, 'DUMMY', 16, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(17, NULL, 'DUMMY', 17, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(18, NULL, 'DUMMY', 18, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(19, NULL, 'DUMMY', 19, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(20, NULL, 'DUMMY', 20, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(21, NULL, 'DUMMY', 21, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(22, NULL, 'DUMMY', 22, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(23, NULL, 'DUMMY', 23, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(24, NULL, 'DUMMY', 24, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(25, NULL, 'DUMMY', 25, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(26, NULL, 'DUMMY', 26, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(27, NULL, 'DUMMY', 27, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(28, NULL, 'DUMMY', 28, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(29, NULL, 'DUMMY', 29, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(30, NULL, 'DUMMY', 30, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(31, NULL, 'DUMMY', 31, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(32, NULL, 'DUMMY', 32, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(33, NULL, 'DUMMY', 33, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(34, NULL, 'DUMMY', 34, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(35, NULL, 'DUMMY', 35, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(36, NULL, 'DUMMY', 36, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(37, NULL, 'DUMMY', 37, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(38, NULL, 'DUMMY', 38, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(39, NULL, 'DUMMY', 39, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(40, NULL, 'DUMMY', 40, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(41, NULL, 'DUMMY', 41, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(42, NULL, 'DUMMY', 42, 1, '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(43, NULL, 'DUMMY', 43, 1, '2022-02-04 11:08:02', '2022-02-04 11:08:02');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `unit_id` int(10) UNSIGNED NOT NULL,
  `extent` decimal(15,4) NOT NULL COMMENT 'size',
  `status` enum('open','close') NOT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `added_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `property_account_settings`
--

CREATE TABLE `property_account_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `income_account_id` int(10) NOT NULL,
  `expense_account_id` int(10) NOT NULL,
  `interest_income_account_id` int(10) NOT NULL,
  `penalty_income_account_id` int(10) NOT NULL,
  `account_receivable_account_id` int(10) NOT NULL,
  `capital_income_account_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `property_blocks`
--

CREATE TABLE `property_blocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `transaction_date` date NOT NULL,
  `block_number` varchar(191) NOT NULL,
  `block_sale_price` decimal(15,6) NOT NULL,
  `block_sold_price` decimal(15,6) NOT NULL DEFAULT 0.000000,
  `block_extent` decimal(15,4) NOT NULL,
  `unit_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) DEFAULT NULL COMMENT 'customer who bought block',
  `is_sold` tinyint(1) NOT NULL DEFAULT 0,
  `sold_by` int(10) DEFAULT NULL,
  `is_finalized` tinyint(1) NOT NULL DEFAULT 0,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `added_by` int(10) UNSIGNED NOT NULL,
  `all_payments_completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `commission_approval` enum('pending','approved') DEFAULT 'pending',
  `commission_approved_by` int(11) DEFAULT NULL,
  `commission_entered_by` int(11) DEFAULT NULL,
  `commission_status_updated_by` int(11) DEFAULT NULL,
  `commission_status` enum('pending','paid') DEFAULT 'pending',
  `sale_commission` decimal(15,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `property_finalizes`
--

CREATE TABLE `property_finalizes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `property_sell_line_id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `block_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `balance_amount` decimal(15,6) NOT NULL,
  `finance_option_id` int(10) UNSIGNED NOT NULL,
  `other_payment` decimal(15,6) NOT NULL,
  `down_payment` decimal(15,6) NOT NULL,
  `easy_payment` enum('yes','no') NOT NULL DEFAULT 'no',
  `no_of_installment` int(10) UNSIGNED NOT NULL,
  `installment_amount` decimal(15,6) NOT NULL,
  `first_installment_date` date NOT NULL,
  `installment_cycle_id` int(10) UNSIGNED NOT NULL,
  `loan_capital` decimal(15,6) NOT NULL,
  `total_interest` decimal(15,6) NOT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `closed_by` int(10) UNSIGNED DEFAULT NULL,
  `reason_id` varchar(191) DEFAULT NULL,
  `all_payments_completed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `property_sell_lines`
--

CREATE TABLE `property_sell_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `block_id` int(10) UNSIGNED NOT NULL,
  `block_number` varchar(191) NOT NULL,
  `unit` varchar(191) NOT NULL,
  `size` decimal(15,4) NOT NULL,
  `block_value` decimal(15,6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `property_taxes`
--

CREATE TABLE `property_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `tax_name` varchar(191) NOT NULL,
  `tax_type` enum('fixed','percentage') DEFAULT NULL,
  `value` decimal(15,4) DEFAULT 0.0000,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pumper_day_entries`
--

CREATE TABLE `pumper_day_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `pump_operator_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL DEFAULT current_timestamp(),
  `pump_id` int(10) UNSIGNED NOT NULL,
  `pump_no` varchar(191) NOT NULL,
  `starting_meter` decimal(15,6) NOT NULL,
  `closing_meter` decimal(15,6) NOT NULL,
  `testing_ltr` decimal(15,6) NOT NULL DEFAULT 0.000000,
  `sold_ltr` decimal(15,6) NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `settlement_datetime` timestamp NULL DEFAULT current_timestamp(),
  `settlement_no` varchar(191) DEFAULT NULL,
  `settlement_added_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pumps`
--

CREATE TABLE `pumps` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `pump_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `location_id` int(10) UNSIGNED NOT NULL,
  `fuel_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `installation_date` date NOT NULL,
  `pump_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image_link` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `storage_tank` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `starting_meter` decimal(13,4) NOT NULL DEFAULT 0.0000,
  `last_meter_reading` decimal(13,4) NOT NULL DEFAULT 0.0000,
  `temp_meter_reading` decimal(13,4) NOT NULL DEFAULT 0.0000,
  `pod_starting_meter` decimal(15,6) DEFAULT NULL COMMENT 'pump operator dashboard field only',
  `pod_last_meter` decimal(15,6) DEFAULT NULL COMMENT 'pump operator dashboard field only',
  `product_id` int(10) UNSIGNED NOT NULL,
  `fuel_tank_id` int(10) UNSIGNED NOT NULL,
  `qty` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `checkk` int(1) NOT NULL DEFAULT 1,
  `testing` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `transaction_date` date NOT NULL,
  `bulk_sale_meter` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pumps`
--

INSERT INTO `pumps` (`id`, `business_id`, `pump_name`, `location_id`, `fuel_type`, `installation_date`, `pump_no`, `image_link`, `storage_tank`, `starting_meter`, `last_meter_reading`, `temp_meter_reading`, `pod_starting_meter`, `pod_last_meter`, `product_id`, `fuel_tank_id`, `qty`, `checkk`, `testing`, `transaction_date`, `bulk_sale_meter`, `created_at`, `updated_at`) VALUES
(1, 2, 'P95-1', 2, '', '2021-07-31', 'P95-1', '', NULL, '1000.0000', '1000.0000', '1000.0000', NULL, NULL, 2, 3, '', 1, '1', '2021-07-31', 0, '2021-07-31 12:28:46', '2021-07-31 12:28:46'),
(2, 2, 'P-1', 2, '', '2021-07-31', 'P-1', '', NULL, '2300.0000', '2300.0000', '2300.0000', NULL, NULL, 1, 1, '', 1, '1', '2021-07-31', 0, '2021-07-31 12:29:10', '2021-07-31 12:29:10'),
(3, 2, 'P-2', 2, '', '2021-07-31', 'P-2', '', NULL, '3000.0000', '3000.0000', '3000.0000', NULL, NULL, 1, 1, '', 1, '1', '2021-07-31', 0, '2021-07-31 12:29:34', '2021-07-31 12:29:34'),
(4, 2, 'P-3', 2, '', '2021-07-31', 'P-3', '', NULL, '4200.0000', '4200.0000', '4200.0000', NULL, NULL, 1, 2, '', 1, '1', '2021-07-31', 0, '2021-07-31 12:30:21', '2021-07-31 12:30:21'),
(5, 2, 'D-1', 2, '', '2021-07-31', 'D-1', '', NULL, '800.0000', '800.0000', '800.0000', NULL, NULL, 3, 4, '', 1, '1', '2021-07-31', 0, '2021-07-31 12:30:45', '2021-07-31 12:30:45'),
(6, 2, 'D-2', 2, '', '2021-07-31', 'D-2', '', NULL, '700.0000', '700.0000', '700.0000', NULL, NULL, 3, 5, '', 1, '1', '2021-07-31', 0, '2021-07-31 12:31:10', '2021-07-31 12:31:10'),
(7, 3, 'K1', 3, '', '2022-02-01', 'K1', '', NULL, '6679672.0000', '6683034.0000', '6679672.0000', NULL, NULL, 5, 6, '', 1, '1', '2022-02-01', 0, '2022-02-03 07:29:28', '2022-02-03 08:50:34'),
(8, 3, 'K2', 3, '', '2022-02-01', 'K2', '', NULL, '8909709.0000', '8909709.0000', '8909709.0000', NULL, NULL, 5, 6, '', 1, '1', '2022-02-01', 0, '2022-02-03 07:29:47', '2022-02-03 07:29:47');

-- --------------------------------------------------------

--
-- Table structure for table `pump_operators`
--

CREATE TABLE `pump_operators` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `pump_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cnic` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `landline` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `assigned_pump_id` int(10) UNSIGNED NOT NULL,
  `status` int(1) DEFAULT NULL,
  `commission_type` enum('fixed','percentage','none') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `commission_ap` decimal(15,2) NOT NULL DEFAULT 0.00,
  `short_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `excess_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `settlement_no` varchar(191) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pump_operators`
--

INSERT INTO `pump_operators` (`id`, `business_id`, `location_id`, `pump_id`, `name`, `cnic`, `address`, `dob`, `landline`, `mobile`, `assigned_pump_id`, `status`, `commission_type`, `commission_ap`, `short_amount`, `excess_amount`, `settlement_no`, `active`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 0, 'Test-1', '1', '1', '2021-07-31', '1', '1', 0, 1, 'none', '0.00', '0.00', '0.00', NULL, 1, '2021-07-31 12:31:58', '2021-07-31 12:31:58'),
(2, 2, 2, 0, 'Test-2', '1', '1', '2021-07-31', '1', '1', 0, 1, 'none', '0.00', '0.00', '0.00', NULL, 1, '2021-07-31 12:32:58', '2021-07-31 12:32:58'),
(3, 3, 3, 0, 'Office Sale', '1', '1', '2022-02-01', '1', '1', 0, 1, 'none', '0.00', '0.00', '0.00', 'ST1', 1, '2022-02-03 07:35:26', '2022-02-03 09:12:25');

-- --------------------------------------------------------

--
-- Table structure for table `pump_operator_assignments`
--

CREATE TABLE `pump_operator_assignments` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `pump_id` int(10) UNSIGNED NOT NULL,
  `pump_operator_id` int(10) UNSIGNED NOT NULL,
  `starting_meter` decimal(15,6) NOT NULL DEFAULT 0.000000,
  `closing_meter` decimal(15,6) DEFAULT 0.000000,
  `date_and_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `close_date_and_time` timestamp NULL DEFAULT NULL,
  `status` enum('open','close') NOT NULL DEFAULT 'open',
  `settlement_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pump_operator_payments`
--

CREATE TABLE `pump_operator_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `date_and_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `pump_operator_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,6) NOT NULL DEFAULT 0.000000,
  `bonus_qty` decimal(15,6) DEFAULT 0.000000,
  `pp_without_discount` decimal(31,6) NOT NULL DEFAULT 0.000000 COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(15,6) NOT NULL DEFAULT 0.000000 COMMENT 'Inline discount percentage',
  `purchase_price` decimal(31,6) NOT NULL,
  `purchase_price_inc_tax` decimal(31,6) NOT NULL DEFAULT 0.000000,
  `item_tax` decimal(31,6) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity_sold` decimal(22,6) NOT NULL DEFAULT 0.000000 COMMENT 'Quanity sold from \r\n\r\nthis purchase line',
  `quantity_adjusted` decimal(22,6) NOT NULL DEFAULT 0.000000 COMMENT 'Quanity adjusted in stock \r\n\r\nadjustment from this purchase line',
  `quantity_returned` decimal(22,6) NOT NULL DEFAULT 0.000000,
  `mfg_quantity_used` decimal(22,6) NOT NULL DEFAULT 0.000000,
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `bonus_qty`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 1, 1, '6000.000000', '0.000000', '100.000000', '0.000000', '100.000000', '100.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2021-07-25 15:16:53', '2021-07-25 15:16:53', NULL),
(2, 5, 1, 1, '2500.000000', '0.000000', '100.000000', '0.000000', '100.000000', '100.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2021-07-25 15:17:20', '2021-07-25 15:17:20', NULL),
(3, 6, 2, 2, '5000.000000', '0.000000', '130.000000', '0.000000', '130.000000', '130.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2021-07-25 15:18:03', '2021-07-25 15:18:03', NULL),
(4, 7, 3, 3, '3000.000000', '0.000000', '90.000000', '0.000000', '90.000000', '90.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2021-07-25 15:18:33', '2021-07-25 15:18:33', NULL),
(5, 8, 3, 3, '7000.000000', '0.000000', '90.000000', '0.000000', '90.000000', '90.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2021-07-25 15:19:01', '2021-07-25 15:19:01', NULL),
(6, 9, 4, 4, '50.000000', '0.000000', '123.000000', '0.000000', '123.000000', '123.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2021-07-28 18:44:19', '2021-07-28 18:44:19', NULL),
(7, 49, 5, 5, '7750.000000', '0.000000', '85.260000', '0.000000', '85.260000', '85.260000', '0.000000', NULL, '3362.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:29:01', '2022-02-03 09:12:25', NULL),
(8, 50, 6, 6, '4.000000', '0.000000', '17600.000000', '0.000000', '17600.000000', '17600.000000', '0.000000', NULL, '2.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 09:12:25', NULL),
(9, 51, 7, 7, '3.000000', '0.000000', '7550.000000', '0.000000', '7550.000000', '7550.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(10, 52, 8, 8, '1.000000', '0.000000', '1925.000000', '0.000000', '1925.000000', '1925.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(11, 53, 9, 9, '5.000000', '0.000000', '5055.000000', '0.000000', '5055.000000', '5055.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(12, 54, 10, 10, '1.000000', '0.000000', '1265.000000', '0.000000', '1265.000000', '1265.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(13, 55, 11, 11, '4.000000', '0.000000', '1145.000000', '0.000000', '1145.000000', '1145.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(14, 56, 12, 12, '3.000000', '0.000000', '1180.000000', '0.000000', '1180.000000', '1180.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(15, 57, 13, 13, '10.000000', '0.000000', '210.000000', '0.000000', '210.000000', '210.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(16, 58, 14, 14, '5.000000', '0.000000', '455.000000', '0.000000', '455.000000', '455.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(17, 59, 15, 15, '1.000000', '0.000000', '14000.000000', '0.000000', '14000.000000', '14000.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(18, 60, 16, 16, '1.000000', '0.000000', '16400.000000', '0.000000', '16400.000000', '16400.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(19, 61, 17, 17, '10.000000', '0.000000', '12600.000000', '0.000000', '12600.000000', '12600.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(20, 62, 21, 21, '69.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(21, 63, 22, 22, '18.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(22, 64, 23, 23, '35.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(23, 65, 24, 24, '2.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(24, 66, 25, 25, '3.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(25, 67, 27, 27, '39.000000', '0.000000', '310.000000', '0.000000', '310.000000', '310.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(26, 68, 28, 28, '1.000000', '0.000000', '87.250000', '0.000000', '87.250000', '87.250000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(27, 69, 29, 29, '43.000000', '0.000000', '52.600000', '0.000000', '52.600000', '52.600000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(28, 70, 30, 30, '15.000000', '0.000000', '105.200000', '0.000000', '105.200000', '105.200000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(29, 71, 31, 31, '10.000000', '0.000000', '45.000000', '0.000000', '45.000000', '45.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(30, 72, 32, 32, '1.000000', '0.000000', '836.000000', '0.000000', '836.000000', '836.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(31, 73, 33, 33, '233.000000', '0.000000', '85.000000', '0.000000', '85.000000', '85.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(32, 74, 34, 34, '31.000000', '0.000000', '85.000000', '0.000000', '85.000000', '85.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(33, 75, 35, 35, '8.000000', '0.000000', '200.000000', '0.000000', '200.000000', '200.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(34, 76, 36, 36, '1.000000', '0.000000', '125.000000', '0.000000', '125.000000', '125.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(35, 77, 38, 38, '9.000000', '0.000000', '550.000000', '0.000000', '550.000000', '550.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(36, 78, 40, 40, '5.000000', '0.000000', '3000.000000', '0.000000', '3000.000000', '3000.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(37, 79, 41, 41, '3.000000', '0.000000', '350.000000', '0.000000', '350.000000', '350.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(38, 80, 42, 42, '16.000000', '0.000000', '405.000000', '0.000000', '405.000000', '405.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL),
(40, 86, 6, 6, '25.000000', '0.000000', '17600.000000', '0.000000', '17600.000000', '17600.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-03 09:26:40', '2022-02-03 09:26:40', NULL),
(48, 94, 21, 21, '1.000000', '0.000000', '23.000000', '0.000000', '23.000000', '23.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-04 12:26:41', '2022-02-04 12:26:41', NULL),
(49, 95, 21, 21, '1.000000', '0.000000', '23.000000', '0.000000', '23.000000', '23.000000', '0.000000', NULL, '0.000000', '0.000000', '0.000000', '0.000000', NULL, NULL, NULL, NULL, '2022-02-04 12:27:47', '2022-02-04 12:27:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `receive_work_orders`
--

CREATE TABLE `receive_work_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `goldsmith_id` int(10) UNSIGNED NOT NULL,
  `date_and_time` datetime NOT NULL,
  `receive_work_order_no` int(10) NOT NULL,
  `receiving_store_id` int(10) UNSIGNED NOT NULL,
  `work_order_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `gold_grade` int(10) DEFAULT NULL,
  `item_weight` decimal(15,2) DEFAULT NULL,
  `required_item_weight` decimal(15,2) NOT NULL,
  `required_qty` int(10) NOT NULL,
  `received_qty` int(10) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `received_weight_for_all_items` decimal(15,2) NOT NULL,
  `wastage_per_8g` decimal(15,4) NOT NULL,
  `total_wastage` decimal(15,4) NOT NULL,
  `total_stone_weight` decimal(15,4) NOT NULL,
  `labour_cost` decimal(15,4) NOT NULL,
  `item_details` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 13, 2, '2021-07-20 14:32:44', '2022-02-14 10:21:45'),
(2, 'business_location', 1, 2, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(3, 'opening_balance', 4, 2, '2021-07-25 14:20:19', '2022-02-13 19:43:59'),
(4, 'contacts', 81, 3, '2022-02-03 06:03:22', '2022-02-04 12:51:34'),
(5, 'business_location', 1, 3, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(6, 'opening_balance', 39, 3, '2022-02-03 07:08:19', '2022-02-03 07:08:20'),
(9, 'purchase', 3, 3, '2022-02-03 09:26:40', '2022-02-04 12:27:47'),
(10, 'purchase_payment', 4, 3, '2022-02-03 09:27:45', '2022-02-04 12:27:47'),
(11, 'advance_payment', 3, 2, '2022-02-13 19:45:39', '2022-02-13 19:46:06'),
(12, 'sell_payment', 2, 2, '2022-02-13 20:17:08', '2022-02-13 20:17:54'),
(13, 'purchase_payment', 1, 2, '2022-02-13 20:17:54', '2022-02-13 20:17:54'),
(14, 'expense', 1, 2, '2022-02-14 10:15:47', '2022-02-14 10:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` int(10) UNSIGNED NOT NULL,
  `referral_code` varchar(191) NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `resource_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `referral_groups`
--

CREATE TABLE `referral_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `group_name` varchar(191) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `referral_starting_codes`
--

CREATE TABLE `referral_starting_codes` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `referral_group` int(10) NOT NULL,
  `prefix` varchar(191) NOT NULL,
  `starting_code` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reimbursements`
--

CREATE TABLE `reimbursements` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `department_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `manager_name` varchar(100) NOT NULL,
  `memo` text NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `approved_manager` enum('Pending','Approved','Reject','') NOT NULL DEFAULT 'Pending',
  `manager_comment` text NOT NULL,
  `approved_admin` enum('Pending','Reject','Approved','') NOT NULL DEFAULT 'Pending',
  `admin_comment` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `religions`
--

CREATE TABLE `religions` (
  `id` int(10) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `religion_name` varchar(255) NOT NULL,
  `religion_status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_superadmin_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `options` enum('when_login','in_dashboard','in_other_page') NOT NULL DEFAULT 'when_login',
  `other_pages` text DEFAULT NULL,
  `snooze` tinyint(1) NOT NULL DEFAULT 0,
  `time` int(10) UNSIGNED NOT NULL,
  `time_type` enum('minutes','hours','days','weeks','months') DEFAULT NULL,
  `cancel` tinyint(1) NOT NULL DEFAULT 0,
  `snoozed_at` datetime DEFAULT NULL,
  `crm_reminder_id` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `crm_reminder` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `repair_device_models`
--

CREATE TABLE `repair_device_models` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `repair_checklist` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `device_id` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `repair_job_sheets`
--

CREATE TABLE `repair_job_sheets` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `job_sheet_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_type` enum('carry_in','pick_up','on_site') COLLATE utf8mb4_unicode_ci NOT NULL,
  `pick_up_on_site_addr` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `device_id` int(10) UNSIGNED DEFAULT NULL,
  `device_model_id` int(10) UNSIGNED DEFAULT NULL,
  `checklist` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `security_pwd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `security_pattern` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `product_configuration` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `defects` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_condition` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_staff` int(10) UNSIGNED DEFAULT NULL,
  `comment_by_ss` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'comment made by technician',
  `estimated_cost` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parts` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `repair_statuses`
--

CREATE TABLE `repair_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_subject` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_completed_status` tinyint(1) NOT NULL DEFAULT 0,
  `sms_template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_service_staff` tinyint(1) NOT NULL DEFAULT 0,
  `is_superadmin_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `is_superadmin_default`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, 0, '2019-12-30 11:22:03', '2019-12-30 11:22:03'),
(2, 'Cashier#1', 'web', 1, 0, 0, 0, '2019-12-30 11:22:03', '2019-12-30 11:22:03'),
(3, 'Admin#2', 'web', 2, 1, 0, 0, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(4, 'Cashier#2', 'web', 2, 0, 0, 0, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(5, 'Pump Operator#2', 'web', 2, 0, 0, 0, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(6, 'Admin#3', 'web', 3, 1, 0, 0, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(7, 'Cashier#3', 'web', 3, 0, 0, 0, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(8, 'Pump Operator#3', 'web', 3, 0, 0, 0, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(9, 'test#3', 'web', 3, 0, 0, 0, '2022-02-08 10:21:46', '2022-02-08 10:21:46');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(42, 2),
(42, 4),
(42, 7),
(43, 2),
(43, 4),
(43, 7),
(44, 2),
(44, 4),
(44, 7),
(45, 2),
(45, 4),
(45, 7),
(74, 4),
(74, 5),
(74, 7),
(74, 8),
(95, 2),
(241, 5),
(241, 8),
(342, 9);

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `route_name` varchar(191) NOT NULL,
  `orignal_location` varchar(191) DEFAULT NULL,
  `destination` varchar(191) DEFAULT NULL,
  `distance` decimal(15,6) DEFAULT NULL,
  `rate` decimal(15,6) DEFAULT NULL,
  `route_amount` decimal(15,6) DEFAULT NULL,
  `driver_incentive` decimal(15,6) DEFAULT NULL,
  `helper_incentive` decimal(15,6) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `route_invoice_numbers`
--

CREATE TABLE `route_invoice_numbers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `prefix` varchar(191) DEFAULT NULL,
  `starting_number` int(10) NOT NULL DEFAULT 1,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `route_operations`
--

CREATE TABLE `route_operations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date_of_operation` date NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `route_id` int(10) UNSIGNED NOT NULL,
  `fleet_id` int(10) UNSIGNED NOT NULL,
  `invoice_no` varchar(191) NOT NULL,
  `product_id` int(10) DEFAULT NULL,
  `order_number` varchar(191) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `qty` decimal(15,6) DEFAULT NULL,
  `driver_id` int(10) UNSIGNED NOT NULL,
  `helper_id` int(10) UNSIGNED NOT NULL,
  `distance` decimal(15,6) NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `driver_incentive` decimal(15,6) NOT NULL,
  `helper_incentive` decimal(15,6) NOT NULL,
  `transaction_id` int(10) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `route_products`
--

CREATE TABLE `route_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `id` int(11) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `grade_id` int(11) DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `total_payable` double DEFAULT NULL,
  `total_cost_company` double DEFAULT NULL,
  `total_deduction` double DEFAULT NULL,
  `total_statutory` double NOT NULL,
  `component` longtext DEFAULT NULL,
  `type` enum('Monthly','Hourly') NOT NULL,
  `hourly_salary` decimal(13,2) DEFAULT NULL,
  `salary_year` year(4) NOT NULL,
  `salary_month` varchar(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salary_components`
--

CREATE TABLE `salary_components` (
  `id` int(10) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `component_name` varchar(128) CHARACTER SET latin1 NOT NULL,
  `component_amount` decimal(15,2) NOT NULL,
  `override` tinyint(1) NOT NULL,
  `statutory_fund` tinyint(1) NOT NULL,
  `type` int(2) NOT NULL COMMENT '1= Earning; 2= Deduction ',
  `total_payable` int(1) NOT NULL DEFAULT 0,
  `cost_company` int(1) NOT NULL DEFAULT 0,
  `value_type` int(2) NOT NULL COMMENT '1= Amount ; 2= Percentage ',
  `flag` tinyint(2) NOT NULL DEFAULT 0,
  `statutory_payment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_superadmin_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salary_grades`
--

CREATE TABLE `salary_grades` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `grade_name` varchar(100) NOT NULL,
  `min_salary` float NOT NULL,
  `max_salary` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_superadmin_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales_officers`
--

CREATE TABLE `sales_officers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `officer_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_line_warranties`
--

CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int(11) NOT NULL,
  `warranty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_areas`
--

CREATE TABLE `service_areas` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `service_area` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settlements`
--

CREATE TABLE `settlements` (
  `id` int(11) NOT NULL,
  `settlement_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `business_id` int(10) UNSIGNED NOT NULL,
  `transaction_date` date NOT NULL,
  `finish_date` date DEFAULT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `pump_operator_id` int(10) UNSIGNED NOT NULL,
  `bulk_store_product` tinyint(1) NOT NULL,
  `work_shift` varchar(191) NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1: Active , 0: Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settlements`
--

INSERT INTO `settlements` (`id`, `settlement_no`, `business_id`, `transaction_date`, `finish_date`, `location_id`, `pump_operator_id`, `bulk_store_product`, `work_shift`, `note`, `total_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ST1', 3, '2022-02-01', '2022-02-03', 3, 3, 0, '[]', NULL, '334494', 1, '2022-02-03 08:50:34', '2022-02-16 09:35:44');

-- --------------------------------------------------------

--
-- Table structure for table `settlement_card_payments`
--

CREATE TABLE `settlement_card_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `settlement_no` varchar(255) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `card_type` int(10) UNSIGNED DEFAULT NULL,
  `card_number` varchar(100) DEFAULT NULL,
  `amount` decimal(15,6) NOT NULL,
  `customer_payment_id` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `settlement_cash_payments`
--

CREATE TABLE `settlement_cash_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `settlement_no` varchar(255) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `customer_payment_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settlement_cash_payments`
--

INSERT INTO `settlement_cash_payments` (`id`, `settlement_no`, `business_id`, `customer_id`, `amount`, `customer_payment_id`, `created_at`, `updated_at`) VALUES
(3, '1', 3, 7, '302444.000000', NULL, '2022-02-03 09:09:54', '2022-02-03 09:09:54');

-- --------------------------------------------------------

--
-- Table structure for table `settlement_cheque_payments`
--

CREATE TABLE `settlement_cheque_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `settlement_no` varchar(255) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `cheque_number` varchar(255) NOT NULL,
  `cheque_date` date NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `customer_payment_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `settlement_credit_sale_payments`
--

CREATE TABLE `settlement_credit_sale_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `settlement_no` varchar(255) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `order_date` date NOT NULL,
  `customer_reference` varchar(191) DEFAULT NULL,
  `price` decimal(15,6) NOT NULL,
  `qty` decimal(15,6) NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `outstanding` decimal(15,6) DEFAULT NULL,
  `credit_limit` decimal(15,6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `transaction_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settlement_credit_sale_payments`
--

INSERT INTO `settlement_credit_sale_payments` (`id`, `settlement_no`, `business_id`, `customer_id`, `product_id`, `order_number`, `order_date`, `customer_reference`, `price`, `qty`, `amount`, `outstanding`, `credit_limit`, `created_at`, `updated_at`, `transaction_id`) VALUES
(1, '1', 3, 8, 5, '0', '2022-02-01', NULL, '87.000000', '150.000000', '13050.000000', '23700.000000', '0.000000', '2022-02-03 09:07:05', '2022-02-03 09:12:25', 83),
(2, '1', 3, 8, 6, '0', '2022-02-01', NULL, '23000.000000', '0.826087', '19000.000000', '23700.000000', '0.000000', '2022-02-03 09:09:36', '2022-02-03 09:12:25', 84);

-- --------------------------------------------------------

--
-- Table structure for table `settlement_excess_payments`
--

CREATE TABLE `settlement_excess_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `settlement_no` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `current_excess` decimal(15,6) NOT NULL DEFAULT 0.000000,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `settlement_expense_payments`
--

CREATE TABLE `settlement_expense_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `settlement_no` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `expense_number` varchar(191) NOT NULL,
  `category_id` int(10) NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `reason` text DEFAULT NULL,
  `amount` decimal(15,6) NOT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'reference transaction id',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `settlement_shortage_payments`
--

CREATE TABLE `settlement_shortage_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` text NOT NULL,
  `settlement_no` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(15,6) NOT NULL,
  `current_shortage` decimal(15,6) NOT NULL DEFAULT 0.000000,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `logingLogo_width` int(11) NOT NULL,
  `logingLogo_height` int(11) NOT NULL,
  `uploadFileFicon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploadFileLBackground` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploadFileLLogo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_background_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_box_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topBelt_background_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `background_showing_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tc_sale_and_pos` tinyint(1) NOT NULL DEFAULT 0,
  `sales_agents_registration` tinyint(1) NOT NULL DEFAULT 0,
  `main_module_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_module_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_module_bg_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ls_side_menu_bg_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ls_side_menu_font_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `register_now_btn_bg` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_register_btn_bg` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_register_btn_bg` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pricing_btn_bg` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_register_bg` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `self_register_bg` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_login_bg` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_login_bg` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_login_bg` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_login_bg` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitor_login_bg` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_messages` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_page_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_page_footer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_page_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_page_general_message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_expired_message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_footer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tour_toggle` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `captch_site_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `logingLogo_width`, `logingLogo_height`, `uploadFileFicon`, `uploadFileLBackground`, `uploadFileLLogo`, `login_background_color`, `login_box_color`, `topBelt_background_color`, `background_showing_type`, `tc_sale_and_pos`, `sales_agents_registration`, `main_module_color`, `sub_module_color`, `sub_module_bg_color`, `ls_side_menu_bg_color`, `ls_side_menu_font_color`, `register_now_btn_bg`, `customer_register_btn_bg`, `member_register_btn_bg`, `pricing_btn_bg`, `member_register_bg`, `self_register_bg`, `admin_login_bg`, `customer_login_bg`, `member_login_bg`, `employee_login_bg`, `visitor_login_bg`, `show_messages`, `login_page_title`, `login_page_footer`, `login_page_description`, `login_page_general_message`, `system_expired_message`, `invoice_footer`, `tour_toggle`, `created_at`, `updated_at`, `captch_site_key`) VALUES
(1, 400, 200, 'public/img/setting/1643874089.png', 'public/img/setting/1643874103.png', 'public/img/setting/1643874089.png', '#7E75B4', '#34523', '#9900cc', '1', 1, 0, '', '#00ff00', '#444444', '#FFFFFF', '#00004d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"lp_title\":\"1\"}', 'Login Page Title', '© All Rights Reserved.| Version 9.9 | SYZYGY Technologies, Malabe, Sri Lanka. | Tel: 077 4055 434 / 071 1616 192', 'Login Page Description', 'System general message', 'System Expired Message', 'Invoice Footer Text', 0, NULL, '2022-02-03 07:41:43', '6Le0JCsdAAAAAMz-cD3AL5Xh-SOCUCaXIP8dbZmi');

-- --------------------------------------------------------

--
-- Table structure for table `sms_lists`
--

CREATE TABLE `sms_lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `numbers` text NOT NULL,
  `count_numbers` int(10) NOT NULL DEFAULT 0,
  `is_group` enum('yes','no') NOT NULL DEFAULT 'no',
  `member_group` int(10) UNSIGNED DEFAULT NULL,
  `balamandala` int(10) UNSIGNED DEFAULT NULL,
  `gramseva_vasama` int(10) UNSIGNED DEFAULT NULL,
  `remove_duplicates` tinyint(1) NOT NULL DEFAULT 0,
  `message_type` enum('text','unicode') NOT NULL DEFAULT 'text',
  `message` text NOT NULL,
  `count_message` int(10) NOT NULL DEFAULT 0,
  `characters` int(10) NOT NULL,
  `schedule` tinyint(1) NOT NULL DEFAULT 0,
  `timezone` varchar(191) DEFAULT NULL,
  `schedule_date_time` datetime DEFAULT NULL,
  `sent_on` datetime NOT NULL,
  `is_unicode` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `type` enum('increase','decrease') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `tank_id` int(10) UNSIGNED DEFAULT NULL,
  `inventory_adjustment_account` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_transfer_requests`
--

CREATE TABLE `stock_transfer_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `request_location` int(10) UNSIGNED NOT NULL,
  `request_to_location` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `sub_category_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `qty` decimal(15,2) NOT NULL DEFAULT 0.00,
  `delivery_need_on` date NOT NULL,
  `status` enum('requested','issued','transit','received') NOT NULL DEFAULT 'requested',
  `notification` enum('ok','stop') NOT NULL DEFAULT 'ok',
  `good_condition` int(10) NOT NULL DEFAULT 0,
  `damage` int(10) NOT NULL DEFAULT 0,
  `short` int(10) NOT NULL DEFAULT 0,
  `expire` int(10) NOT NULL DEFAULT 0,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int(11) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `address` varchar(191) DEFAULT NULL,
  `contact_number` int(11) DEFAULT NULL,
  `stock` double NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `business_id`, `location_id`, `name`, `address`, `contact_number`, `stock`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'Main Store', '1', 1, 0, 1, '2021-07-25 14:24:30', '2021-07-25 14:24:30'),
(2, 2, 2, 'Store 2', '1', 1, 0, 1, '2021-07-25 14:24:53', '2021-07-25 14:24:53'),
(3, 2, 2, 'Store 3', '1', 1, 0, 1, '2021-07-25 14:25:15', '2021-07-25 14:25:15'),
(4, 2, 2, 'Stores 4', '1', 1, 0, 1, '2021-07-25 14:28:44', '2021-07-25 14:28:44'),
(5, 2, 2, 'Stores 5', '1', 1, 0, 1, '2021-07-25 14:32:30', '2021-07-25 14:32:30'),
(6, 3, 3, 'Main Store', '0', 0, 0, 1, '2022-02-03 06:14:28', '2022-02-03 06:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `trial_end_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `package_price` decimal(20,2) NOT NULL,
  `package_details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_id` int(10) UNSIGNED NOT NULL,
  `paid_via` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('approved','waiting','declined') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `business_id`, `package_id`, `start_date`, `trial_end_date`, `end_date`, `package_price`, `package_details`, `created_id`, `paid_via`, `payment_transaction_id`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, 2, 33, '2021-07-23', '2021-07-23', '2022-07-23', '1.00', '{\"location_count\":\"1\",\"user_count\":\"0\",\"customer_count\":\"0\",\"employee_count\":\"0\",\"product_count\":1,\"invoice_count\":\"0\",\"vehicle_count\":1,\"name\":\"EzyPetro with Accounting & Pumper Dashboard\",\"enable_sale_cmsn_agent\":\"1\",\"enable_restaurant\":\"0\",\"enable_booking\":\"0\",\"enable_crm\":\"0\",\"manufacturing_module\":0,\"mf_module\":\"0\",\"enable_sms\":\"0\",\"products\":\"1\",\"issue_customer_bill\":\"1\",\"hr_module\":\"0\",\"leads_module\":\"0\",\"hospital_system\":\"0\",\"contact_module\":\"1\",\"contact_supplier\":\"1\",\"contact_customer\":\"1\",\"contact_group_customer\":1,\"contact_group_supplier\":1,\"import_contact\":1,\"customer_reference\":1,\"customer_statement\":1,\"customer_payment\":1,\"outstanding_received\":1,\"issue_payment_detail\":1,\"enable_duplicate_invoice\":\"0\",\"mpcs_module\":\"0\",\"home_dashboard\":\"1\",\"enable_petro_module\":\"1\",\"enable_petro_dashboard\":1,\"enable_petro_task_management\":1,\"enable_petro_pump_management\":1,\"enable_petro_management_testing\":1,\"enable_petro_meter_reading\":1,\"enable_petro_pump_dashboard\":1,\"enable_petro_pumper_management\":1,\"enable_petro_daily_collection\":1,\"enable_petro_settlement\":1,\"enable_petro_list_settlement\":1,\"enable_petro_dip_management\":1,\"meter_resetting\":\"1\",\"pump_operator_dashboard\":\"1\",\"property_module\":\"0\",\"customer_order_own_customer\":\"1\",\"customer_order_general_customer\":\"0\",\"access_account\":\"1\",\"access_sms_settings\":\"0\",\"access_module\":\"1\",\"purchase\":1,\"stock_transfer\":1,\"service_staff\":0,\"enable_subscription\":0,\"add_sale\":1,\"stock_adjustment\":0,\"tables\":0,\"type_of_service\":0,\"pos_sale\":1,\"expenses\":1,\"modifiers\":0,\"kitchen\":0,\"banking_module\":\"0\",\"sale_module\":\"1\",\"all_sales\":\"1\",\"list_pos\":\"1\",\"list_draft\":\"0\",\"list_quotation\":\"0\",\"list_sell_return\":\"1\",\"shipment\":\"1\",\"discount\":\"1\",\"repair_module\":\"0\",\"tasks_management\":\"0\",\"report_module\":\"1\",\"product_report\":1,\"payment_status_report\":1,\"report_daily\":1,\"report_daily_summary\":1,\"report_profit_loss\":1,\"report_credit_status\":1,\"activity_report\":1,\"contact_report\":1,\"trending_product\":1,\"user_activity\":1,\"report_verification\":1,\"report_table\":1,\"report_staff_service\":1,\"report_register\":1,\"catalogue_qr\":\"0\",\"backup_module\":\"0\",\"notification_template_module\":\"0\",\"member_registration\":\"0\",\"user_management_module\":\"1\",\"settings_module\":\"1\",\"business_settings\":\"1\",\"business_location\":\"1\",\"invoice_settings\":\"1\",\"tax_rates\":\"0\",\"list_easy_payment\":\"0\",\"fleet_module\":\"0\",\"ezyboat_module\":\"0\",\"enable_custom_link\":0,\"visitors_registration_module\":\"0\",\"payday\":0,\"purchase_module\":1,\"all_purchase\":1,\"add_purchase\":1,\"import_purchase\":1,\"add_bulk_purchase\":1,\"pop_button_on_top_belt\":1,\"purchase_return\":1,\"enable_cheque_writing\":\"0\",\"cheque_templates\":0,\"write_cheque\":0,\"manage_stamps\":0,\"manage_payee\":0,\"cheque_number_list\":0,\"deleted_cheque_details\":0,\"printed_cheque_details\":0,\"default_setting\":0,\"monthly_total_sales_volumn\":\"0\",\"customer_settings\":\"0\",\"customer_to_directly_in_panel\":\"0\",\"notes_page\":\"0\",\"tasks_page\":\"0\",\"reminder_page\":\"0\",\"visitors\":\"0\",\"visitors_registration\":\"0\",\"visitors_registration_setting\":\"0\",\"visitors_district\":\"0\",\"visitors_town\":\"0\",\"disable_all_other_module_vr\":\"0\",\"pay_excess_commission\":\"0\",\"recover_shortage\":\"0\",\"pump_operator_ledger\":\"0\",\"commission_type\":\"0\",\"mpcs_form_settings\":\"0\",\"list_opening_values\":\"0\",\"merge_sub_category\":\"0\",\"enable_separate_customer_statement_no\":\"0\",\"edit_customer_statement\":\"0\",\"tank_dip_chart\":\"0\",\"ran_module\":\"0\",\"verification_report\":\"0\",\"monthly_report\":\"0\",\"comparison_report\":\"0\",\"orders\":\"0\",\"status_order\":\"0\",\"import_sale\":\"0\",\"reserved_stock\":\"0\",\"list_orders\":\"0\",\"upload_orders\":\"0\",\"subcriptions\":\"0\",\"over_limit_sales\":\"0\",\"upload_images\":\"0\",\"leads\":\"0\",\"day_count\":\"0\",\"leads_import\":\"0\",\"leads_settings\":\"0\",\"sms_module\":\"0\",\"cache_clear\":\"0\",\"list_sms\":\"0\",\"employee\":\"0\",\"teminated\":\"0\",\"award\":\"0\",\"leave_request\":\"0\",\"attendance\":\"0\",\"import_attendance\":\"0\",\"late_and_over_time\":\"0\",\"payroll\":\"0\",\"salary_details\":\"0\",\"basic_salary\":\"0\",\"payroll_payments\":\"0\",\"hr_reports\":\"0\",\"attendance_report\":\"0\",\"employee_report\":\"0\",\"payroll_report\":\"0\",\"notice_board\":\"0\",\"hr_settings\":\"0\",\"department\":\"0\",\"jobtitle\":\"0\",\"jobcategory\":\"0\",\"workingdays\":\"0\",\"workshift\":\"0\",\"holidays\":\"0\",\"leave_type\":\"0\",\"salary_grade\":\"0\",\"employment_status\":\"0\",\"salary_component\":\"0\",\"hr_prefix\":\"0\",\"hr_tax\":\"0\",\"religion\":\"0\",\"hr_setting_page\":\"0\",\"job_sheets\":\"0\",\"add_job_sheet\":\"0\",\"list_invoice\":\"0\",\"add_invoice\":\"0\",\"brands\":\"0\",\"select_pump_operator_in_settlement\":\"1\",\"repair_settings\":\"0\",\"customer_interest_deduct_option\":0}', 1, 'offline', '1', 'approved', NULL, '2021-07-24 23:34:54', '2022-02-14 11:53:16'),
(5, 3, 2, '2022-02-03', '2023-02-03', '2023-02-03', '1.00', '{\"location_count\":\"1\",\"user_count\":\"0\",\"customer_count\":\"0\",\"employee_count\":\"1\",\"product_count\":\"1000\",\"invoice_count\":\"0\",\"vehicle_count\":\"1\",\"name\":\"Premium\",\"enable_sale_cmsn_agent\":\"1\",\"enable_restaurant\":\"0\",\"enable_booking\":\"0\",\"enable_crm\":\"0\",\"manufacturing_module\":0,\"mf_module\":\"0\",\"enable_sms\":\"0\",\"products\":\"1\",\"issue_customer_bill\":\"1\",\"hr_module\":\"0\",\"leads_module\":\"0\",\"hospital_system\":\"0\",\"contact_module\":\"1\",\"contact_supplier\":\"1\",\"contact_customer\":\"1\",\"contact_group_customer\":1,\"contact_group_supplier\":1,\"import_contact\":1,\"customer_reference\":1,\"customer_statement\":1,\"customer_payment\":1,\"outstanding_received\":1,\"issue_payment_detail\":1,\"enable_duplicate_invoice\":\"0\",\"mpcs_module\":\"0\",\"home_dashboard\":\"1\",\"enable_petro_module\":\"1\",\"enable_petro_dashboard\":1,\"enable_petro_task_management\":1,\"enable_petro_pump_management\":1,\"enable_petro_management_testing\":1,\"enable_petro_meter_reading\":1,\"enable_petro_pump_dashboard\":1,\"enable_petro_pumper_management\":1,\"enable_petro_daily_collection\":1,\"enable_petro_settlement\":1,\"enable_petro_list_settlement\":1,\"enable_petro_dip_management\":1,\"meter_resetting\":\"1\",\"pump_operator_dashboard\":\"0\",\"property_module\":\"0\",\"customer_order_own_customer\":\"1\",\"customer_order_general_customer\":\"0\",\"access_account\":\"1\",\"access_sms_settings\":\"0\",\"access_module\":\"1\",\"purchase\":1,\"stock_transfer\":1,\"service_staff\":0,\"enable_subscription\":0,\"add_sale\":0,\"stock_adjustment\":1,\"tables\":0,\"type_of_service\":0,\"pos_sale\":0,\"expenses\":1,\"modifiers\":0,\"kitchen\":0,\"banking_module\":\"0\",\"sale_module\":\"0\",\"all_sales\":\"0\",\"list_pos\":\"0\",\"list_draft\":\"0\",\"list_quotation\":\"0\",\"list_sell_return\":\"0\",\"shipment\":\"0\",\"discount\":\"0\",\"repair_module\":\"0\",\"tasks_management\":\"0\",\"report_module\":\"1\",\"product_report\":1,\"payment_status_report\":1,\"report_daily\":1,\"report_daily_summary\":1,\"report_profit_loss\":1,\"report_credit_status\":1,\"activity_report\":1,\"contact_report\":1,\"trending_product\":1,\"user_activity\":1,\"report_verification\":1,\"report_table\":1,\"report_staff_service\":1,\"report_register\":1,\"catalogue_qr\":\"0\",\"backup_module\":\"1\",\"notification_template_module\":\"0\",\"member_registration\":\"0\",\"user_management_module\":\"1\",\"settings_module\":\"1\",\"business_settings\":\"1\",\"business_location\":\"1\",\"invoice_settings\":\"0\",\"tax_rates\":\"1\",\"list_easy_payment\":\"0\",\"fleet_module\":\"0\",\"ezyboat_module\":\"0\",\"enable_custom_link\":0,\"visitors_registration_module\":\"0\",\"payday\":0,\"purchase_module\":1,\"all_purchase\":1,\"add_purchase\":1,\"import_purchase\":1,\"add_bulk_purchase\":1,\"pop_button_on_top_belt\":1,\"purchase_return\":1,\"monthly_total_sales_volumn\":\"0\",\"customer_settings\":\"0\",\"customer_to_directly_in_panel\":\"0\",\"notes_page\":\"0\",\"tasks_page\":\"0\",\"reminder_page\":\"0\",\"visitors\":\"0\",\"visitors_registration\":\"0\",\"visitors_registration_setting\":\"0\",\"visitors_district\":\"0\",\"visitors_town\":\"0\",\"disable_all_other_module_vr\":\"0\",\"pay_excess_commission\":\"1\",\"recover_shortage\":\"1\",\"pump_operator_ledger\":\"1\",\"commission_type\":\"1\",\"mpcs_form_settings\":\"0\",\"list_opening_values\":\"0\",\"merge_sub_category\":\"0\",\"enable_separate_customer_statement_no\":\"0\",\"edit_customer_statement\":\"0\",\"enable_cheque_writing\":\"0\",\"tank_dip_chart\":\"0\",\"ran_module\":\"0\",\"verification_report\":\"0\",\"monthly_report\":\"0\",\"comparison_report\":\"0\",\"orders\":\"0\",\"status_order\":\"0\",\"import_sale\":\"0\",\"reserved_stock\":\"0\",\"list_orders\":\"0\",\"upload_orders\":\"0\",\"subcriptions\":\"0\",\"over_limit_sales\":\"0\",\"upload_images\":\"0\",\"leads\":\"0\",\"day_count\":\"0\",\"leads_import\":\"0\",\"leads_settings\":\"0\",\"sms_module\":\"0\",\"cache_clear\":\"0\",\"list_sms\":\"0\",\"employee\":\"0\",\"teminated\":\"0\",\"award\":\"0\",\"leave_request\":\"0\",\"attendance\":\"0\",\"import_attendance\":\"0\",\"late_and_over_time\":\"0\",\"payroll\":\"0\",\"salary_details\":\"0\",\"basic_salary\":\"0\",\"payroll_payments\":\"0\",\"hr_reports\":\"0\",\"attendance_report\":\"0\",\"employee_report\":\"0\",\"payroll_report\":\"0\",\"notice_board\":\"0\",\"hr_settings\":\"0\",\"department\":\"0\",\"jobtitle\":\"0\",\"jobcategory\":\"0\",\"workingdays\":\"0\",\"workshift\":\"0\",\"holidays\":\"0\",\"leave_type\":\"0\",\"salary_grade\":\"0\",\"employment_status\":\"0\",\"salary_component\":\"0\",\"hr_prefix\":\"0\",\"hr_tax\":\"0\",\"religion\":\"0\",\"hr_setting_page\":\"0\",\"job_sheets\":\"0\",\"add_job_sheet\":\"0\",\"list_invoice\":\"0\",\"add_invoice\":\"0\",\"brands\":\"0\",\"select_pump_operator_in_settlement\":\"1\",\"repair_settings\":\"0\",\"customer_interest_deduct_option\":0}', 1, 'offline', '3 Feb 2022', 'approved', NULL, '2022-02-03 06:04:29', '2022-02-04 08:14:56');

-- --------------------------------------------------------

--
-- Table structure for table `suggestions`
--

CREATE TABLE `suggestions` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) DEFAULT NULL,
  `date` date NOT NULL,
  `balamandalaya_id` int(10) NOT NULL,
  `service_area_id` int(10) NOT NULL,
  `heading` varchar(191) NOT NULL,
  `details` text NOT NULL,
  `is_common_problem` enum('yes','no') DEFAULT NULL,
  `area_name` varchar(191) NOT NULL,
  `state_of_urgency` enum('normal','medium','high') NOT NULL DEFAULT 'normal',
  `solution_given` enum('solved','Pending','Rejected') DEFAULT NULL,
  `upload_document` text NOT NULL,
  `remarks` text NOT NULL,
  `status` enum('closed','waiting_for_reponse','assigned_to') DEFAULT NULL,
  `assigned_to_member_id` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `superadmin_communicator_logs`
--

CREATE TABLE `superadmin_communicator_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_ids` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `superadmin_frontend_pages`
--

CREATE TABLE `superadmin_frontend_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_shown` tinyint(1) NOT NULL,
  `menu_order` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '2.19'),
(2, 'default_business_active_status', '1'),
(3, 'superadmin_version', '1.6'),
(4, 'app_currency_id', '2'),
(5, 'invoice_business_name', 'SYZYGY EzyPetRo'),
(6, 'invoice_business_landmark', 'Landmark'),
(7, 'invoice_business_zip', 'Zip'),
(8, 'invoice_business_state', 'State'),
(9, 'invoice_business_city', 'City'),
(10, 'invoice_business_country', 'Country'),
(11, 'email', 'support@syzygyfirst.systems'),
(12, 'package_expiry_alert_days', '5'),
(13, 'enable_business_based_username', '1'),
(14, 'manufacturing_version', '1.2'),
(15, 'superadmin_register_tc', NULL),
(16, 'welcome_email_subject', 'Email Subject'),
(17, 'welcome_email_body', '<p style=\"margin-left: 0in; margin-right: 0in;\"><span style=\"font-size: 11pt; background-color: #f1c40f;\"><span style=\"font-family: Calibri;\"><img src=\"https://syzygy.healthcare/ezypetro logo.png\" alt=\"\" width=\"122\" height=\"68\" /></span></span></p>\r\n<p style=\"margin-left: 0in; margin-right: 0in;\"><span style=\"font-size: 11pt; background-color: #f1c40f;\"><span style=\"font-family: Calibri;\">{business_name}, {owner_name}</span></span></p>\r\n<p style=\"margin-left: 0in; margin-right: 0in;\"><span style=\"font-size: 11.0pt;\"><span style=\"font-family: Calibri;\">&nbsp;</span></span><span style=\"font-size: 11.0pt;\"><span style=\"font-family: Calibri;\">We, SYZYGY Consultancy Group warmly welcome you to our SYZYGY Software Family.&nbsp;</span></span></p>\r\n<p style=\"margin-left: 0in; margin-right: 0in;\"><span style=\"font-size: 11.0pt;\"><span style=\"font-family: Calibri;\">&nbsp;</span></span><span style=\"font-size: 11.0pt;\"><span style=\"font-family: Calibri;\">Hope, that you would get all what you need to Manage your Business in the Right &amp; Smart way with SYZYGY Software.&nbsp;</span></span></p>\r\n<p style=\"margin-left: 0in; margin-right: 0in;\"><span style=\"font-size: 11.0pt;\"><span style=\"font-family: Calibri;\">&nbsp;</span></span><span style=\"font-size: 11.0pt;\"><span style=\"font-family: Calibri;\">{username}</span></span></p>\r\n<p style=\"margin-left: 0in; margin-right: 0in;\"><span style=\"font-size: 11.0pt;\"><span style=\"font-family: Calibri;\">&nbsp;</span></span><span style=\"font-size: 11.0pt;\"><span style=\"font-family: Calibri;\">For any help in this software, please contact us.</span></span></p>\r\n<p style=\"margin-left: 0in; margin-right: 0in;\"><span style=\"font-size: 11.0pt;\"><span style=\"font-family: Calibri;\">&nbsp;</span></span><span style=\"font-size: 11.0pt;\"><span style=\"font-family: Calibri;\">We wish you all the best and success.</span></span></p>\r\n<p style=\"margin-left: 0in; margin-right: 0in;\"><span style=\"font-size: 11.0pt;\"><span style=\"font-family: Calibri;\">&nbsp;</span></span><span style=\"font-size: 11.0pt;\"><span style=\"font-family: Calibri;\">Best Regards,</span></span></p>\r\n<p style=\"margin-left: 0in; margin-right: 0in;\"><span style=\"font-size: 11.0pt;\"><span style=\"font-family: Calibri;\">&nbsp;</span></span><span style=\"font-size: 11.0pt;\"><span style=\"font-family: Calibri;\">SYZYGY Management&nbsp;</span></span></p>'),
(18, 'superadmin_enable_register_tc', '0'),
(19, 'allow_email_settings_to_businesses', '0'),
(20, 'enable_new_business_registration_notification', '1'),
(21, 'enable_new_subscription_notification', '1'),
(22, 'enable_welcome_email', '1'),
(23, 'enable_lang_btn_login_page', '0'),
(24, 'enable_pricing_btn_login_page', '0'),
(25, 'enable_register_btn_login_page', '0'),
(26, 'patient_prefix', 'PT-'),
(27, 'patient_code_start_from', '0012'),
(28, 'hospital_prefix', 'HO-'),
(29, 'hospital_code_start_from', '0005'),
(30, 'laboratory_prefix', 'LB-'),
(31, 'laboratory_code_start_from', '0007'),
(32, 'pharmacy_prefix', 'PH-'),
(33, 'pharmacy_code_start_from', '0003'),
(34, 'upload_image_width', '680'),
(35, 'upload_image_height', '900'),
(37, 'default_number_of_customers', '30'),
(38, 'enable_customer_login', '0'),
(39, 'footer_top_margin', NULL),
(40, 'admin_invoice_footer', 'Thank You! Come Again.\r\n\r\nThis Software is developed by SYZYGY Technologies.   \r\nContact: 077 4055 434 / 071 1616 192'),
(41, 'sms_on_password_change', NULL),
(42, 'company_number_prefix', 'RA-'),
(43, 'company_starting_number', '7'),
(44, 'customer_welcome_email_body', NULL),
(45, 'customer_welcome_email_subject', NULL),
(46, 'enable_customer_welcome_email', '0'),
(47, 'default_payment_accounts', '{\"cash\":{\"is_enabled\":\"1\",\"account\":\"1\"},\"card\":{\"is_enabled\":\"1\",\"account\":\"9\"},\"cheque\":{\"is_enabled\":\"1\",\"account\":\"3\"},\"direct_bank_deposit\":{\"is_enabled\":\"1\",\"account\":\"2\"},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":\"2\"},\"other\":{\"account\":\"2\"},\"custom_pay_1\":{\"account\":\"2\"},\"custom_pay_2\":{\"account\":\"2\"}}'),
(48, 'upload_image_quality', '100'),
(49, 'enable_member_register_btn_login_page', '0'),
(50, 'enable_employee_login', '0'),
(51, 'visitor_business_name', 'V'),
(52, 'visitor_site_url', 'Visitor Site Url'),
(53, 'visitor_site_name', 'Visitor Site Name'),
(54, 'admin_msg_visitor_qr', NULL),
(55, 'visitor_code_color', NULL),
(56, 'not_enalbed_module_user_font_size', '14'),
(57, 'not_enalbed_module_user_color', '#C40202'),
(58, 'not_enalbed_module_user_message', 'You have not subscribed to this Module. If need to enable, Please contact SYZYGY on 077 4055 434 or 071 1616 192. Thank You.'),
(59, 'welcome_msg_body', NULL),
(60, 'visitor_welcome_email_subject', NULL),
(61, 'visitor_welcome_email_body', NULL),
(62, 'business_or_entity', 'buisness'),
(63, 'enable_visitor_register_btn_login_page', '0'),
(64, 'enable_welcome_msg', '0'),
(65, 'enable_individual_register_btn_login_page', '0'),
(66, 'enable_visitor_welcome_email', '0'),
(67, 'enable_admin_login', '1'),
(68, 'enable_member_login', '0'),
(69, 'enable_visitor_login', '0'),
(70, 'customer_supplier_security_deposit_current_liability_font_size', '14'),
(71, 'customer_supplier_security_deposit_current_liability_color', '#C40202'),
(72, 'customer_supplier_security_deposit_current_liability_message', 'Accounting Module Not Subscribed.'),
(73, 'patient_register_success_msg', NULL),
(74, 'patient_register_success_title', NULL),
(75, 'new_subscription_email_subject', NULL),
(76, 'new_subscription_email_body', NULL),
(77, 'customer_secrity_deposit_current_liability_checkbox', '1'),
(78, 'supplier_secrity_deposit_current_liability_checkbox', '0'),
(79, 'general_message_pump_operator_dashbaord', '0'),
(80, 'enable_patient_register_btn_login_page', '0'),
(81, 'show_referrals_in_register_page', '[\"my_health\"]'),
(82, 'show_give_away_gift_in_register_page', '[]'),
(83, 'company_register_success_title', NULL),
(84, 'company_register_success_msg', NULL),
(85, 'customer_register_success_title', NULL),
(86, 'customer_register_success_msg', NULL),
(87, 'visitor_register_success_title', NULL),
(88, 'visitor_register_success_msg', NULL),
(89, 'member_register_success_title', NULL),
(90, 'member_register_success_msg', NULL),
(91, 'enable_login_banner_image', '0'),
(92, 'enable_login_banner_html', '0'),
(93, 'login_banner_html', NULL),
(94, 'login_banner_image', NULL),
(95, 'general_message_pump_operator_dashbaord_checkbox', '1'),
(96, 'PAY_ONLINE_CURRENCY_TYPE', '[]'),
(97, 'helpdesk_system_url', 'https://syzygyfirst.systems/helpdeskpetro/'),
(98, 'create_individual_company_package', 'no'),
(99, 'new_subscription_email_subject_offline', NULL),
(100, 'new_subscription_email_body_offline', NULL),
(101, 'subscription_message_online_success_title', NULL),
(102, 'subscription_message_online_success_msg', NULL),
(103, 'subscription_message_offline_success_title', NULL),
(104, 'subscription_message_offline_success_msg', NULL),
(105, 'agent_register_success_title', NULL),
(106, 'agent_register_success_msg', NULL),
(107, 'agent_welcome_email_subject', NULL),
(108, 'agent_welcome_email_body', NULL),
(109, 'enable_agent_login', '0'),
(110, 'enable_agent_register_btn_login_page', '0'),
(111, 'general_message_petro_dashboard_checkbox', '0'),
(112, 'general_message_tank_management_checkbox', '0'),
(113, 'general_message_pump_management_checkbox', '0'),
(114, 'general_message_pumper_management_checkbox', '0'),
(115, 'general_message_daily_collection_checkbox', '0'),
(116, 'general_message_settlement_checkbox', '0'),
(117, 'general_message_list_settlement_checkbox', '0'),
(118, 'general_message_dip_management_checkbox', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tanks_transaction_details`
--

CREATE TABLE `tanks_transaction_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `settlement_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `purchase_order_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tank_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `location_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tank_qty` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `total_tank_balance` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `available_tank_qty` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `purchase_qty` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sold_qty` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `transaction_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tank_dip_charts`
--

CREATE TABLE `tank_dip_charts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `sheet_name` varchar(191) NOT NULL,
  `tank_manufacturer` varchar(191) NOT NULL,
  `tank_capacity` decimal(15,6) NOT NULL,
  `unit_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tank_dip_charts`
--

INSERT INTO `tank_dip_charts` (`id`, `business_id`, `date`, `sheet_name`, `tank_manufacturer`, `tank_capacity`, `unit_id`, `created_at`, `updated_at`) VALUES
(9, 1, '2020-11-06', '1', '1', '11.000000', 34, '2020-11-06 04:57:11', '2020-11-06 04:57:11');

-- --------------------------------------------------------

--
-- Table structure for table `tank_dip_chart_details`
--

CREATE TABLE `tank_dip_chart_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `tank_dip_chart_id` int(10) UNSIGNED NOT NULL,
  `dip_reading` decimal(15,3) NOT NULL,
  `dip_reading_value` decimal(15,3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tank_dip_chart_details`
--

INSERT INTO `tank_dip_chart_details` (`id`, `tank_dip_chart_id`, `dip_reading`, `dip_reading_value`, `created_at`, `updated_at`) VALUES
(15, 9, '1.000', '11.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(16, 9, '2.000', '30.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(17, 9, '3.000', '56.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(18, 9, '4.000', '86.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(19, 9, '5.000', '120.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(20, 9, '6.000', '157.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(21, 9, '7.000', '198.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(22, 9, '8.000', '242.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(23, 9, '9.000', '288.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(24, 9, '10.000', '337.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(25, 9, '11.000', '388.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(26, 9, '12.000', '442.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(27, 9, '13.000', '498.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(28, 9, '14.000', '555.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(29, 9, '15.000', '615.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(30, 9, '16.000', '677.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(31, 9, '17.000', '740.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(32, 9, '18.000', '805.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(33, 9, '19.000', '872.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(34, 9, '20.000', '941.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(35, 9, '21.000', '1011.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(36, 9, '22.000', '1083.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(37, 9, '23.000', '1156.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(38, 9, '24.000', '1230.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(39, 9, '25.000', '1306.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(40, 9, '26.000', '1384.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(41, 9, '27.000', '1462.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(42, 9, '28.000', '1542.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(43, 9, '29.000', '1623.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(44, 9, '30.000', '1706.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(45, 9, '31.000', '1789.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(46, 9, '32.000', '1874.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(47, 9, '33.000', '1960.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(48, 9, '34.000', '2047.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(49, 9, '35.000', '2135.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(50, 9, '36.000', '2224.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(51, 9, '37.000', '2314.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(52, 9, '38.000', '2405.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(53, 9, '39.000', '2498.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(54, 9, '40.000', '2591.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(55, 9, '41.000', '2685.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(56, 9, '42.000', '2780.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(57, 9, '43.000', '2876.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(58, 9, '44.000', '2972.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(59, 9, '45.000', '3070.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(60, 9, '46.000', '3168.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(61, 9, '47.000', '3268.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(62, 9, '48.000', '3368.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(63, 9, '49.000', '3469.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(64, 9, '50.000', '3570.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(65, 9, '51.000', '3673.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(66, 9, '52.000', '3776.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(67, 9, '53.000', '3880.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(68, 9, '54.000', '3984.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(69, 9, '55.000', '4089.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(70, 9, '56.000', '4195.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(71, 9, '57.000', '4302.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(72, 9, '58.000', '4409.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(73, 9, '59.000', '4517.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(74, 9, '60.000', '4626.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(75, 9, '61.000', '4735.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(76, 9, '62.000', '4845.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(77, 9, '63.000', '4955.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(78, 9, '64.000', '5066.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(79, 9, '65.000', '5177.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(80, 9, '66.000', '5289.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(81, 9, '67.000', '5402.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(82, 9, '68.000', '5515.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(83, 9, '69.000', '5628.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(84, 9, '70.000', '5742.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(85, 9, '71.000', '5857.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(86, 9, '72.000', '5972.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(87, 9, '73.000', '6088.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(88, 9, '74.000', '6204.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(89, 9, '75.000', '6320.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(90, 9, '76.000', '6437.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(91, 9, '77.000', '6554.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(92, 9, '78.000', '6672.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(93, 9, '79.000', '6790.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(94, 9, '80.000', '6908.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(95, 9, '82.000', '7146.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(96, 9, '83.000', '7266.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(97, 9, '84.000', '7386.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(98, 9, '85.000', '7506.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(99, 9, '86.000', '7626.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(100, 9, '87.000', '7747.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(101, 9, '88.000', '7869.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(102, 9, '89.000', '7990.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(103, 9, '90.000', '8112.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(104, 9, '91.000', '8234.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(105, 9, '92.000', '8351.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(106, 9, '93.000', '8479.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(107, 9, '94.000', '8602.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(108, 9, '95.000', '8725.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(109, 9, '96.000', '8848.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(110, 9, '97.000', '8972.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(111, 9, '98.000', '9096.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(112, 9, '99.000', '9220.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(113, 9, '100.000', '9344.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(114, 9, '101.000', '9468.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(115, 9, '102.000', '9593.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(116, 9, '103.000', '9717.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(117, 9, '104.000', '9842.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(118, 9, '105.000', '9967.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(119, 9, '106.000', '10092.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(120, 9, '107.000', '10218.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(121, 9, '108.000', '10343.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(122, 9, '109.000', '10496.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(123, 9, '110.000', '10595.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(124, 9, '111.000', '10720.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(125, 9, '112.000', '10846.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(126, 9, '113.000', '10972.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(127, 9, '114.000', '11098.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(128, 9, '115.000', '11224.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(129, 9, '116.000', '11350.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(130, 9, '117.000', '11477.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(131, 9, '118.000', '11603.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(132, 9, '119.000', '11729.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(133, 9, '120.000', '11855.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(134, 9, '121.000', '11982.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(135, 9, '122.000', '12118.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(136, 9, '123.000', '12244.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(137, 9, '124.000', '12371.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(138, 9, '125.000', '12497.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(139, 9, '126.000', '12623.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(140, 9, '127.000', '12749.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(141, 9, '128.000', '12876.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(142, 9, '129.000', '13002.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(143, 9, '130.000', '13128.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(144, 9, '131.000', '13254.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(145, 9, '132.000', '13380.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(146, 9, '133.000', '13506.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(147, 9, '134.000', '13631.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(148, 9, '135.000', '13757.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(149, 9, '136.000', '13883.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(150, 9, '137.000', '14008.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(151, 9, '138.000', '14133.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(152, 9, '139.000', '14259.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(153, 9, '140.000', '14384.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(154, 9, '141.000', '14508.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(155, 9, '142.000', '14633.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(156, 9, '143.000', '14758.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(157, 9, '144.000', '14882.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(158, 9, '145.000', '15006.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(159, 9, '146.000', '15130.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(160, 9, '147.000', '15254.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(161, 9, '148.000', '15377.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(162, 9, '149.000', '15501.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(163, 9, '150.000', '15624.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(164, 9, '151.000', '15746.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(165, 9, '152.000', '15869.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(166, 9, '153.000', '15991.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(167, 9, '154.000', '16113.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(168, 9, '155.000', '16235.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(169, 9, '156.000', '16356.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(170, 9, '157.000', '16478.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(171, 9, '158.000', '16598.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(172, 9, '159.000', '16719.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(173, 9, '160.000', '16839.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(174, 9, '161.000', '16959.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(175, 9, '162.000', '17078.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(176, 9, '163.000', '17198.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(177, 9, '164.000', '17316.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(178, 9, '165.000', '17435.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(179, 9, '166.000', '17553.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(180, 9, '167.000', '17650.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(181, 9, '168.000', '17787.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(182, 9, '169.000', '17904.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(183, 9, '170.000', '18020.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(184, 9, '171.000', '18136.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(185, 9, '172.000', '18252.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(186, 9, '173.000', '18367.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(187, 9, '174.000', '18481.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(188, 9, '175.000', '18595.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(189, 9, '176.000', '18709.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(190, 9, '177.000', '18822.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(191, 9, '178.000', '18934.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(192, 9, '179.000', '19046.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(193, 9, '180.000', '19157.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(194, 9, '181.000', '19268.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(195, 9, '182.000', '19378.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(196, 9, '183.000', '19448.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(197, 9, '184.000', '19597.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(198, 9, '185.000', '19705.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(199, 9, '186.000', '19813.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(200, 9, '187.000', '19920.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(201, 9, '188.000', '20027.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(202, 9, '189.000', '20132.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(203, 9, '190.000', '20238.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(204, 9, '191.000', '20342.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(205, 9, '192.000', '20446.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(206, 9, '193.000', '20549.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(207, 9, '194.000', '20651.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(208, 9, '195.000', '20752.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(209, 9, '196.000', '20853.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(210, 9, '197.000', '20953.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(211, 9, '198.000', '21052.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(212, 9, '199.000', '21150.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(213, 9, '200.000', '21248.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(214, 9, '201.000', '21344.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(215, 9, '202.000', '21440.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(216, 9, '203.000', '21535.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(217, 9, '204.000', '21629.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(218, 9, '205.000', '21722.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(219, 9, '206.000', '21814.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(220, 9, '207.000', '21905.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(221, 9, '208.000', '21995.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(222, 9, '209.000', '22083.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(223, 9, '210.000', '22171.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(224, 9, '211.000', '22258.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(225, 9, '212.000', '22344.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(226, 9, '213.000', '22428.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(227, 9, '214.000', '22512.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(228, 9, '215.000', '22594.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(229, 9, '216.000', '22675.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(230, 9, '217.000', '22754.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(231, 9, '218.000', '22833.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(232, 9, '219.000', '22910.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(233, 9, '220.000', '22986.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(234, 9, '221.000', '23060.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(235, 9, '222.000', '23133.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(236, 9, '223.000', '23204.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(237, 9, '224.000', '23274.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(238, 9, '225.000', '23342.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(239, 9, '226.000', '23409.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(240, 9, '227.000', '23473.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(241, 9, '228.000', '23537.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(242, 9, '229.000', '23598.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(243, 9, '230.000', '23657.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(244, 9, '231.000', '23715.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(245, 9, '232.000', '23770.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(246, 9, '233.000', '23823.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(247, 9, '234.000', '23874.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(248, 9, '235.000', '23922.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(249, 9, '236.000', '23968.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(250, 9, '237.000', '24011.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(251, 9, '238.000', '24051.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(252, 9, '239.000', '24088.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(253, 9, '240.000', '24121.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(254, 9, '241.000', '24150.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(255, 9, '242.000', '24175.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12'),
(256, 9, '243.000', '24193.000', '2020-11-06 04:57:12', '2020-11-06 04:57:12');

-- --------------------------------------------------------

--
-- Table structure for table `tank_purchase_lines`
--

CREATE TABLE `tank_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `tank_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(15,5) NOT NULL,
  `instock_qty` decimal(15,6) NOT NULL DEFAULT 0.000000,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tank_purchase_lines`
--

INSERT INTO `tank_purchase_lines` (`id`, `business_id`, `transaction_id`, `tank_id`, `product_id`, `quantity`, `instock_qty`, `created_at`, `updated_at`) VALUES
(1, 2, 4, 1, 1, '6000.00000', '0.000000', '2021-07-25 15:16:53', '2021-07-25 15:16:53'),
(2, 2, 5, 2, 1, '2500.00000', '0.000000', '2021-07-25 15:17:20', '2021-07-25 15:17:20'),
(3, 2, 6, 3, 2, '5000.00000', '0.000000', '2021-07-25 15:18:03', '2021-07-25 15:18:03'),
(4, 2, 7, 4, 3, '3000.00000', '0.000000', '2021-07-25 15:18:33', '2021-07-25 15:18:33'),
(5, 2, 8, 5, 3, '7000.00000', '0.000000', '2021-07-25 15:19:01', '2021-07-25 15:19:01'),
(6, 3, 49, 6, 5, '7750.00000', '0.000000', '2022-02-03 07:29:01', '2022-02-03 07:29:01');

-- --------------------------------------------------------

--
-- Table structure for table `tank_sell_lines`
--

CREATE TABLE `tank_sell_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `tank_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(15,5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tank_sell_lines`
--

INSERT INTO `tank_sell_lines` (`id`, `business_id`, `transaction_id`, `tank_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 3, 81, 6, 5, '3362.00000', '2022-02-03 09:12:25', '2022-02-03 09:12:25');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) NOT NULL,
  `date_and_time` datetime NOT NULL,
  `task_id` varchar(191) NOT NULL,
  `task_heading` varchar(191) NOT NULL,
  `task_details` text NOT NULL,
  `task_footer` text DEFAULT NULL,
  `group_id` int(10) DEFAULT NULL,
  `priority_id` int(10) UNSIGNED NOT NULL,
  `priority_name` varchar(191) DEFAULT NULL,
  `members` text NOT NULL,
  `status` enum('new','in_progress','on_hold','completed') NOT NULL DEFAULT 'new',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `estimated_hours` varchar(10) NOT NULL,
  `reminder` text NOT NULL,
  `color` varchar(50) NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `task_groups`
--

CREATE TABLE `task_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `prefix` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slab_amount` decimal(15,2) NOT NULL,
  `type` enum('fixed','percentage') NOT NULL,
  `tax_rate` decimal(15,2) NOT NULL,
  `slab_wise_rates` enum('yes','no') NOT NULL DEFAULT 'no',
  `previous_slab` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_superadmin_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_data`
--

CREATE TABLE `temp_data` (
  `id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `sale_create_data` text DEFAULT NULL,
  `pos_create_data` text DEFAULT NULL,
  `sale_return_data` text DEFAULT NULL,
  `stock_transfer_data` text DEFAULT NULL,
  `stock_adjustment_data` text DEFAULT NULL,
  `add_expense_data` text DEFAULT NULL,
  `add_pos_data` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `temp_data`
--

INSERT INTO `temp_data` (`id`, `business_id`, `sale_create_data`, `pos_create_data`, `sale_return_data`, `stock_transfer_data`, `stock_adjustment_data`, `add_expense_data`, `add_pos_data`, `created_at`, `updated_at`) VALUES
(1, 2, '{\"store_id\":null,\"price_later\":\"0\",\"location_id\":\"2\",\"price_group\":\"0\",\"default_price_group\":null,\"contact_id\":\"2\",\"pay_term_number\":null,\"pay_term_type\":null,\"transaction_date\":\"02\\/14\\/2022 15:51\",\"status\":null,\"need_to_reserve\":null,\"invoice_scheme_id\":\"2\",\"res_waiter_id\":null,\"search_product\":null,\"sell_price_tax\":\"includes\",\"discount_type\":\"percentage\",\"discount_amount\":\"0.00\",\"rp_redeemed\":\"0\",\"rp_redeemed_amount\":\"0\",\"tax_rate_id\":null,\"tax_calculation_amount\":\"0.00\",\"shipping_details\":null,\"shipping_address\":null,\"shipping_charges\":\"0.00\",\"shipping_status\":null,\"delivered_to\":null,\"final_total\":\"0.00\",\"sale_note\":null,\"is_direct_sale\":\"1\",\"payment\":[{\"amount\":\"0.00\",\"method\":null,\"account_id\":null,\"card_number\":null,\"card_holder_name\":null,\"card_transaction_number\":null,\"card_type\":null,\"card_month\":null,\"card_year\":null,\"card_security\":null,\"cheque_number\":null,\"cheque_date\":null,\"transaction_no_1\":null,\"transaction_no_2\":null,\"transaction_no_3\":null,\"note\":null}],\"order_no\":null,\"order_date\":\"02\\/14\\/2022\",\"customer_ref\":\"Please Select\",\"submit_type\":null,\"recur_interval\":null,\"recur_interval_type\":\"days\",\"recur_repetitions\":null,\"is_duplicate\":\"0\"}', '{\"invoice_no\":\"PO1\",\"contact_id\":null,\"ref_no\":null,\"transaction_date\":\"07\\/28\\/2021 13:03\",\"status\":null,\"location_id\":\"2\",\"store_id\":\"1\",\"exchange_rate\":\"1\",\"pay_term_number\":null,\"pay_term_type\":null,\"search_product\":null,\"total_before_tax\":\"0\",\"discount_type\":null,\"discount_amount\":\"0\",\"tax_id\":null,\"tax_amount\":\"0\",\"shipping_details\":null,\"shipping_charges\":\"0\",\"final_total\":\"0\",\"additional_notes\":null,\"payment\":[{\"amount\":\"0.00\",\"method\":\"2993\",\"account_id\":null,\"card_number\":null,\"card_holder_name\":null,\"card_transaction_number\":null,\"card_type\":null,\"card_month\":null,\"card_year\":null,\"card_security\":null,\"cheque_number\":null,\"cheque_date\":\"07\\/28\\/2021\",\"transaction_no_1\":null,\"transaction_no_2\":null,\"transaction_no_3\":null,\"note\":null}]}', NULL, NULL, NULL, '{\"location_id\":\"2\",\"expense_category_id\":null,\"ref_no\":\"EP2022\\/0001\",\"transaction_date\":\"02\\/14\\/2022 15:45\",\"expense_for\":null,\"fleet_id\":null,\"contact_id\":null,\"additional_notes\":null,\"tax_id\":null,\"tax_calculation_amount\":\"0\",\"final_total\":null,\"expense_account\":null,\"recur_interval\":null,\"recur_interval_type\":\"months\",\"recur_repetitions\":null,\"subscription_repeat_on\":null,\"payment\":[{\"amount\":null,\"method\":\"credit_expense\",\"controller_account\":null,\"card_number\":null,\"card_holder_name\":null,\"card_transaction_number\":null,\"card_type\":null,\"card_month\":null,\"card_year\":null,\"card_security\":null,\"cheque_number\":null,\"cheque_date\":\"02\\/14\\/2022\",\"transaction_no_1\":null,\"transaction_no_2\":null,\"transaction_no_3\":null,\"note\":null}]}', '{\"price_later\":\"0\",\"location_id\":\"2\",\"ref_no\":null,\"price_group\":\"0\",\"contact_id\":\"2\",\"pay_term_number\":null,\"pay_term_type\":null,\"search_product\":null,\"res_waiter_id\":null,\"sell_price_tax\":\"includes\",\"discount_type\":\"percentage\",\"discount_amount\":\"0.00\",\"rp_redeemed\":\"0\",\"rp_redeemed_amount\":\"0\",\"tax_rate_id\":null,\"tax_calculation_amount\":\"0.00\",\"shipping_details\":null,\"shipping_address\":null,\"shipping_status\":null,\"delivered_to\":null,\"shipping_charges\":\"0.00\",\"final_total\":\"0.00\",\"discount_type_modal\":\"percentage\",\"discount_amount_modal\":\"0.00\",\"order_tax_modal\":null,\"shipping_details_modal\":null,\"shipping_address_modal\":null,\"shipping_charges_modal\":\"0\",\"shipping_status_modal\":null,\"delivered_to_modal\":null,\"payment\":[{\"amount\":\"0.00\",\"method\":\"cash\",\"card_number\":null,\"card_holder_name\":null,\"card_transaction_number\":null,\"card_type\":null,\"card_month\":null,\"card_year\":null,\"card_security\":null,\"cheque_number\":null,\"cheque_date\":\"02\\/14\\/2022\",\"transaction_no_1\":null,\"transaction_no_2\":null,\"transaction_no_3\":null,\"note\":null}],\"sale_note\":null,\"staff_note\":null,\"additional_notes\":null,\"is_suspend\":\"0\",\"recur_interval\":null,\"recur_interval_type\":\"days\",\"recur_repetitions\":null,\"cat_id_suggestion\":\"0\",\"brand_id_suggestion\":\"0\",\"is_pos\":\"1\",\"is_duplicate\":\"0\",\"was_customer_wallet\":\"0.00\",\"in_customer_wallet\":\"0\"}', '2021-07-28 15:23:35', '2022-02-14 10:25:30'),
(2, 3, NULL, '{\"invoice_no\":\"PO2\",\"contact_id\":null,\"ref_no\":\"1\",\"transaction_date\":\"02\\/04\\/2022 17:31\",\"status\":\"received\",\"location_id\":\"3\",\"store_id\":\"6\",\"exchange_rate\":\"1\",\"pay_term_number\":null,\"pay_term_type\":null,\"search_product\":null,\"purchases\":[{\"product_id\":\"18\",\"variation_id\":\"18\",\"quantity\":\"1.00\",\"product_unit_id\":\"7\",\"sub_unit_id\":\"7\",\"pp_without_discount\":\"2616\",\"discount_percent\":\"0\",\"purchase_price\":\"2616.000000\",\"purchase_line_tax_id\":null,\"item_tax\":\"0.00\",\"purchase_price_inc_tax\":\"2616.000000\",\"profit_percent\":\"3.21\",\"default_sell_price\":\"2,700.00\"}],\"is_fuel_category\":\"0\",\"product_id\":\"18\",\"current_stock\":\"0\",\"total_before_tax\":\"2,616.00\",\"discount_type\":null,\"discount_amount\":\"0\",\"tax_id\":null,\"tax_amount\":\"0.00\",\"shipping_details\":null,\"shipping_charges\":\"0\",\"final_total\":\"2,616.00\",\"additional_notes\":null,\"payment\":[{\"amount\":\"2616\",\"method\":\"3037\",\"account_id\":null,\"card_number\":null,\"card_holder_name\":null,\"card_transaction_number\":null,\"card_type\":null,\"card_month\":null,\"card_year\":null,\"card_security\":null,\"cheque_number\":null,\"cheque_date\":\"02\\/04\\/2022\",\"transaction_no_1\":null,\"transaction_no_2\":null,\"transaction_no_3\":null,\"note\":null}]}', NULL, NULL, NULL, NULL, '[]', '2022-02-03 09:21:37', '2022-02-04 12:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `towns`
--

CREATE TABLE `towns` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `district_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(10) UNSIGNED DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `sub_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('received','pending','ordered','draft','final','order','transit','issued','outright_purchase','mortgaged') COLLATE utf8mb4_unicode_ci NOT NULL,
  `cheque_return_charges` decimal(15,6) NOT NULL DEFAULT 0.000000,
  `need_to_reserve` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_credit_sale` tinyint(1) NOT NULL DEFAULT 0,
  `credit_sale_id` int(10) DEFAULT NULL,
  `is_over_limit_credit_sale` tinyint(1) NOT NULL DEFAULT 0,
  `customer_limit` decimal(15,6) NOT NULL DEFAULT 0.000000,
  `over_limit_amount` decimal(15,6) NOT NULL DEFAULT 0.000000,
  `approved_user` int(10) UNSIGNED DEFAULT NULL,
  `requested_by` int(10) UNSIGNED DEFAULT NULL,
  `order_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT 0,
  `is_customer_order` tinyint(1) NOT NULL DEFAULT 0,
  `order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('paid','due','partial','pending','price_later') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_later` tinyint(1) NOT NULL DEFAULT 0,
  `adjustment_type` enum('normal','abnormal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int(11) UNSIGNED DEFAULT NULL,
  `pump_operator_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_entry_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deed_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deed_date` date DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,6) NOT NULL DEFAULT 0.000000 COMMENT 'Total before the \r\n\r\npurchase/invoice tax, this includeds the indivisual \r\n\r\nproduct tax',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,6) NOT NULL DEFAULT 0.000000,
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,6) DEFAULT 0.000000,
  `rp_redeemed` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,6) NOT NULL DEFAULT 0.000000 COMMENT 'rp is the short form of reward \r\n\r\npoints',
  `shipping_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(22,6) NOT NULL DEFAULT 0.000000,
  `additional_notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_total` decimal(22,6) NOT NULL DEFAULT 0.000000,
  `amount_paid_from_advance` decimal(15,6) NOT NULL DEFAULT 0.000000,
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `fleet_id` int(10) UNSIGNED DEFAULT NULL,
  `property_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_account` int(10) UNSIGNED DEFAULT NULL,
  `controller_account` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspend` tinyint(1) NOT NULL DEFAULT 0,
  `exchange_rate` decimal(20,6) NOT NULL DEFAULT 1.000000,
  `total_amount_recovered` decimal(22,6) DEFAULT NULL COMMENT 'Used for \r\n\r\nstock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `is_pos_return` tinyint(1) NOT NULL DEFAULT 0,
  `pos_invoice_return` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `import_batch` int(11) DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int(11) DEFAULT NULL,
  `packing_charge` decimal(22,6) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_3` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_4` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mfg_parent_production_purchase_id` int(11) DEFAULT NULL,
  `mfg_wasted_units` decimal(20,6) DEFAULT NULL,
  `mfg_production_cost` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `mfg_is_final` tinyint(1) NOT NULL DEFAULT 0,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT 0,
  `rp_earned` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `from_store` int(11) DEFAULT NULL,
  `order_addresses` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `is_duplicate` tinyint(1) NOT NULL DEFAULT 0,
  `is_settlement` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `imported` tinyint(1) NOT NULL DEFAULT 0,
  `advance_remaining` decimal(15,6) NOT NULL DEFAULT 0.000000,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `repair_brand_id` int(11) DEFAULT NULL,
  `repair_checklist` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repair_completed_on` datetime DEFAULT NULL,
  `repair_defects` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repair_device_id` int(11) DEFAULT NULL,
  `repair_due_date` datetime DEFAULT NULL,
  `repair_model_id` int(11) DEFAULT NULL,
  `repair_security_pattern` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repair_security_pwd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repair_serial_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repair_status_id` int(11) DEFAULT NULL,
  `repair_updates_notif` tinyint(1) NOT NULL DEFAULT 0,
  `repair_warranty_id` int(11) DEFAULT NULL,
  `subscription_repeat_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repair_job_sheet_id` int(10) UNSIGNED DEFAULT NULL,
  `finance_option_id` int(10) DEFAULT NULL COMMENT 'property sell finance option id reference',
  `balance_quantity` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `From_Account` int(11) NOT NULL DEFAULT 1,
  `To_Account` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `store_id`, `sub_type`, `status`, `cheque_return_charges`, `need_to_reserve`, `is_credit_sale`, `credit_sale_id`, `is_over_limit_credit_sale`, `customer_limit`, `over_limit_amount`, `approved_user`, `requested_by`, `order_no`, `order_date`, `customer_ref`, `is_quotation`, `is_customer_order`, `order_status`, `payment_status`, `price_later`, `adjustment_type`, `contact_id`, `pump_operator_id`, `customer_group_id`, `invoice_no`, `purchase_entry_no`, `deed_no`, `deed_date`, `ref_no`, `subscription_no`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `final_total`, `amount_paid_from_advance`, `expense_category_id`, `expense_for`, `fleet_id`, `property_id`, `expense_account`, `controller_account`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `is_pos_return`, `pos_invoice_return`, `opening_stock_product_id`, `created_by`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `mfg_parent_production_purchase_id`, `mfg_wasted_units`, `mfg_production_cost`, `mfg_is_final`, `is_created_from_api`, `rp_earned`, `from_store`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `is_duplicate`, `is_settlement`, `deleted_by`, `created_at`, `updated_at`, `imported`, `advance_remaining`, `deleted_at`, `repair_brand_id`, `repair_checklist`, `repair_completed_on`, `repair_defects`, `repair_device_id`, `repair_due_date`, `repair_model_id`, `repair_security_pattern`, `repair_security_pwd`, `repair_serial_no`, `repair_status_id`, `repair_updates_notif`, `repair_warranty_id`, `subscription_repeat_on`, `repair_job_sheet_id`, `finance_option_id`, `balance_quantity`, `From_Account`, `To_Account`) VALUES
(1, 2, 2, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'partial', 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2021/0001', NULL, '2021-07-01 00:00:00', '5000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '5000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2021-07-25 14:20:19', '2022-02-13 20:17:54', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(2, 2, 2, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2021/0002', NULL, '2021-07-01 00:00:00', '-2000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '-2000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2021-07-25 14:21:53', '2021-07-25 14:21:53', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(3, 2, 2, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2021/0003', NULL, '2021-07-01 00:00:00', '4000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '4000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2021-07-25 14:22:54', '2021-07-25 14:22:54', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(4, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-01 00:00:00', '600000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '600000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2021-07-25 15:16:53', '2021-07-25 15:16:53', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(5, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-01 00:00:00', '250000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '250000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2021-07-25 15:17:20', '2021-07-25 15:17:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(6, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-01 00:00:00', '650000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '650000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2021-07-25 15:18:03', '2021-07-25 15:18:03', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(7, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-01 00:00:00', '270000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '270000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2021-07-25 15:18:33', '2021-07-25 15:18:33', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(8, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-01 00:00:00', '630000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '630000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2021-07-25 15:19:01', '2021-07-25 15:19:01', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(9, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 14:44:19', '6150.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '6150.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2021-07-28 18:44:19', '2021-07-28 18:44:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(10, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0001', NULL, '2022-02-01 00:00:00', '23700.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '23700.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(11, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0002', NULL, '2022-02-01 00:00:00', '13400.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '13400.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(12, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0003', NULL, '2022-02-01 00:00:00', '19100.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '19100.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(13, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0004', NULL, '2022-02-01 00:00:00', '21350.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '21350.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(14, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0005', NULL, '2022-02-01 00:00:00', '1000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '1000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(15, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0006', NULL, '2022-02-01 00:00:00', '2095.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '2095.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(16, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0007', NULL, '2022-02-01 00:00:00', '2000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '2000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(17, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0008', NULL, '2022-02-01 00:00:00', '1870.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '1870.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(18, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0009', NULL, '2022-02-01 00:00:00', '4990.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '4990.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(19, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0010', NULL, '2022-02-01 00:00:00', '2220.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '2220.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(20, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0011', NULL, '2022-02-01 00:00:00', '3825.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '3825.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(21, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0012', NULL, '2022-02-01 00:00:00', '1460.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '1460.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(22, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0013', NULL, '2022-02-01 00:00:00', '2500.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '2500.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(23, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0014', NULL, '2022-02-01 00:00:00', '2660.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '2660.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(24, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0015', NULL, '2022-02-01 00:00:00', '2930.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '2930.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(25, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0016', NULL, '2022-02-01 00:00:00', '1125.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '1125.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(26, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0017', NULL, '2022-02-01 00:00:00', '3200.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '3200.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(27, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0018', NULL, '2022-02-01 00:00:00', '885.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '885.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(28, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0019', NULL, '2022-02-01 00:00:00', '1055.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '1055.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(29, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0020', NULL, '2022-02-01 00:00:00', '19955.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '19955.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(30, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0021', NULL, '2022-02-01 00:00:00', '3485.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '3485.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(31, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0022', NULL, '2022-02-01 00:00:00', '24000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '24000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:19', '2022-02-03 07:08:19', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(32, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0023', NULL, '2022-02-01 00:00:00', '3805.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '3805.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(33, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0024', NULL, '2022-02-01 00:00:00', '2000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '2000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(34, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0025', NULL, '2022-02-01 00:00:00', '1700.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '1700.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(35, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0026', NULL, '2022-02-01 00:00:00', '1500.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '1500.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(36, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0027', NULL, '2022-02-01 00:00:00', '320.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '320.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(37, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0028', NULL, '2022-02-01 00:00:00', '2100.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '2100.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(38, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0029', NULL, '2022-02-01 00:00:00', '2900.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '2900.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(39, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0030', NULL, '2022-02-01 00:00:00', '3025.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '3025.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(40, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0031', NULL, '2022-02-01 00:00:00', '4950.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '4950.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(41, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0032', NULL, '2022-02-01 00:00:00', '2540.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '2540.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(42, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0033', NULL, '2022-02-01 00:00:00', '3750.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '3750.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(43, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0034', NULL, '2022-02-01 00:00:00', '3185.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '3185.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(44, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0035', NULL, '2022-02-01 00:00:00', '6530.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '6530.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(45, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0036', NULL, '2022-02-01 00:00:00', '1575.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '1575.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(46, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0037', NULL, '2022-02-01 00:00:00', '67700.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '67700.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(47, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 46, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0038', NULL, '2022-02-01 00:00:00', '80185.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '80185.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(48, 3, 3, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0039', NULL, '2022-02-01 00:00:00', '158800.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '158800.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:08:20', '2022-02-03 07:08:20', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(49, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '660765.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '660765.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:29:01', '2022-02-03 07:29:01', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(50, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '70400.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '70400.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(51, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '22650.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '22650.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(52, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '1925.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '1925.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 8, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(53, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '25275.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '25275.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 9, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(54, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '1265.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '1265.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(55, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '4580.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '4580.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 11, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(56, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '3540.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '3540.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1);
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `store_id`, `sub_type`, `status`, `cheque_return_charges`, `need_to_reserve`, `is_credit_sale`, `credit_sale_id`, `is_over_limit_credit_sale`, `customer_limit`, `over_limit_amount`, `approved_user`, `requested_by`, `order_no`, `order_date`, `customer_ref`, `is_quotation`, `is_customer_order`, `order_status`, `payment_status`, `price_later`, `adjustment_type`, `contact_id`, `pump_operator_id`, `customer_group_id`, `invoice_no`, `purchase_entry_no`, `deed_no`, `deed_date`, `ref_no`, `subscription_no`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `final_total`, `amount_paid_from_advance`, `expense_category_id`, `expense_for`, `fleet_id`, `property_id`, `expense_account`, `controller_account`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `is_pos_return`, `pos_invoice_return`, `opening_stock_product_id`, `created_by`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `mfg_parent_production_purchase_id`, `mfg_wasted_units`, `mfg_production_cost`, `mfg_is_final`, `is_created_from_api`, `rp_earned`, `from_store`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `is_duplicate`, `is_settlement`, `deleted_by`, `created_at`, `updated_at`, `imported`, `advance_remaining`, `deleted_at`, `repair_brand_id`, `repair_checklist`, `repair_completed_on`, `repair_defects`, `repair_device_id`, `repair_due_date`, `repair_model_id`, `repair_security_pattern`, `repair_security_pwd`, `repair_serial_no`, `repair_status_id`, `repair_updates_notif`, `repair_warranty_id`, `subscription_repeat_on`, `repair_job_sheet_id`, `finance_option_id`, `balance_quantity`, `From_Account`, `To_Account`) VALUES
(57, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '2100.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '2100.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 13, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(58, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '2275.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '2275.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 14, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(59, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '14000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '14000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 15, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(60, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '16400.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '16400.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 16, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(61, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '126000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '126000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 17, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(62, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '0.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 21, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(63, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '0.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 22, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(64, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '0.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 23, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(65, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '0.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 24, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(66, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '0.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 25, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(67, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '12090.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '12090.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 27, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(68, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '87.250000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '87.250000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 28, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(69, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '2261.800000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '2261.800000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 29, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(70, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '1578.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '1578.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 30, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(71, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '450.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '450.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 31, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(72, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '836.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '836.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 32, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(73, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '19805.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '19805.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 33, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(74, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '2635.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '2635.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 34, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(75, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '1600.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '1600.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 35, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(76, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '125.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '125.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 36, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(77, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '4950.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '4950.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 38, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(78, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '15000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '15000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 40, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(79, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '1050.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '1050.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 41, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(80, 3, 3, NULL, NULL, NULL, 'opening_stock', NULL, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '6480.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '6480.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, 42, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-03 07:49:47', '2022-02-03 07:49:47', 1, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(81, 3, 3, NULL, NULL, NULL, 'sell', NULL, 'settlement', 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, NULL, 3, NULL, 'ST1', NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '334494.000000', NULL, '0.000000', NULL, '1.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '334494.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(82, 3, 3, NULL, NULL, NULL, 'settlement', NULL, 'cash_payment', 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, 7, NULL, NULL, 'ST1', NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '302444.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '302444.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(83, 3, 3, NULL, NULL, NULL, 'sell', NULL, 'credit_sale', 'final', '0.000000', NULL, 1, 1, 0, '0.000000', '0.000000', NULL, NULL, NULL, '2022-02-01', NULL, 0, 0, NULL, 'due', 0, NULL, 8, 3, NULL, 'ST1', NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '13050.000000', NULL, '0.000000', 'fixed', '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '13050.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(84, 3, 3, NULL, NULL, NULL, 'sell', NULL, 'credit_sale', 'final', '0.000000', NULL, 1, 2, 0, '0.000000', '0.000000', NULL, NULL, NULL, '2022-02-01', NULL, 0, 0, NULL, 'due', 0, NULL, 8, 3, NULL, 'ST1', NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', '19000.001000', NULL, '0.000000', 'fixed', '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '19000.001000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(86, 3, 3, NULL, NULL, NULL, 'purchase', 6, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, 49, NULL, NULL, 'PO1', NULL, NULL, NULL, 'CH-71880', NULL, '2022-02-01 14:55:00', '440000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '440000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'days', NULL, 0, 0, NULL, '2022-02-03 09:26:40', '2022-02-03 09:29:11', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(94, 3, 3, NULL, NULL, NULL, 'purchase', 6, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, 50, NULL, NULL, 'PO2', NULL, NULL, NULL, '786', NULL, '2022-02-04 17:26:00', '23.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '23.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', NULL, 0, 0, NULL, '2022-02-04 12:26:41', '2022-02-04 12:26:41', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(95, 3, 3, NULL, NULL, NULL, 'purchase', 6, NULL, 'received', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, 50, NULL, NULL, 'PO2', NULL, NULL, NULL, '786', NULL, '2022-02-04 17:26:00', '23.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '23.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', NULL, 0, 0, NULL, '2022-02-04 12:27:47', '2022-02-04 12:27:48', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(96, 2, 2, NULL, NULL, NULL, 'opening_balance', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'due', 0, NULL, 57, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0004', NULL, '2022-02-14 00:00:00', '20000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '20000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-13 19:43:59', '2022-02-13 19:43:59', 0, '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1),
(97, 2, 2, NULL, NULL, NULL, 'advance_payment', NULL, NULL, 'final', '0.000000', NULL, 0, NULL, 0, '0.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'paid', 0, NULL, 57, NULL, NULL, NULL, NULL, NULL, NULL, '2022/0003', NULL, '2022-02-14 00:00:00', '10000.000000', NULL, '0.000000', NULL, '0.000000', 0, '0.000000', NULL, NULL, NULL, NULL, '0.000000', NULL, NULL, '10000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '1.000000', NULL, NULL, NULL, 0, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000000', 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '2022-02-13 19:46:06', '2022-02-13 19:46:06', 0, '10000.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '0', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(11) UNSIGNED DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Used during sales to return the change',
  `amount` decimal(22,6) NOT NULL DEFAULT 0.000000,
  `method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other','credit_sale','credit_purchase','credit_expense','direct_bank_deposit') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfer_date` date DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `payment_for` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_option_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'property payment option id reference',
  `is_deposited` tinyint(1) NOT NULL DEFAULT 0,
  `payment_ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `double_entry_account` int(10) UNSIGNED DEFAULT NULL COMMENT 'use for excess payment ',
  `receivable_account` int(10) UNSIGNED DEFAULT NULL COMMENT 'use for short payment ',
  `paid_in_type` enum('customer_page','all_sale_page','settlement','customer_bulk','customer_simple') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `cheque_date`, `bank_name`, `bank_account_number`, `transfer_date`, `paid_on`, `created_by`, `payment_for`, `parent_id`, `note`, `document`, `payment_option_id`, `is_deposited`, `payment_ref_no`, `account_id`, `double_entry_account`, `receivable_account`, `paid_in_type`, `deleted_at`, `created_at`, `updated_at`, `reference_no`) VALUES
(1, 81, 3, 0, '302444.000000', 'cash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-01 00:00:00', 5, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'settlement', NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', NULL),
(4, 86, 3, 0, '180000.000000', 'cash', NULL, NULL, NULL, 'credit', NULL, '1', '22', NULL, NULL, '2022-02-03', NULL, NULL, NULL, '2022-02-01 14:57:00', 5, 49, NULL, NULL, NULL, NULL, 0, 'PP2022/0001', 3037, NULL, NULL, NULL, NULL, '2022-02-03 09:27:45', '2022-02-03 09:27:45', 'SP-85'),
(5, 86, 3, 0, '260000.000000', 'bank_transfer', NULL, NULL, NULL, 'credit', NULL, '1', '22', NULL, '514103', '2022-02-07', NULL, NULL, NULL, '2022-02-01 14:58:00', 5, 49, NULL, NULL, NULL, NULL, 0, 'PP2022/0002', 3081, NULL, NULL, NULL, NULL, '2022-02-03 09:29:11', '2022-02-03 09:29:11', 'SP-85'),
(13, 94, 3, 0, '23.000000', 'cash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-04', NULL, NULL, NULL, '2022-02-04 17:26:00', 5, 50, NULL, NULL, NULL, NULL, 0, 'PP2022/0003', 3037, NULL, NULL, NULL, NULL, '2022-02-04 12:26:41', '2022-02-04 12:26:41', NULL),
(14, 95, 3, 0, '23.000000', 'cash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-04', NULL, NULL, NULL, '2022-02-04 17:26:00', 5, 50, NULL, NULL, NULL, NULL, 0, 'PP2022/0004', 3037, NULL, NULL, NULL, NULL, '2022-02-04 12:27:47', '2022-02-04 12:27:47', NULL),
(15, 97, 2, 0, '10000.000000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-14 00:00:00', 2, 57, NULL, NULL, NULL, NULL, 0, '2022/0002', 2993, NULL, NULL, NULL, NULL, '2022-02-13 19:46:06', '2022-02-13 19:46:06', NULL),
(16, NULL, 2, 0, '1000.000000', 'cash', NULL, NULL, NULL, 'credit', NULL, '1', '22', NULL, NULL, '2022-02-14', NULL, NULL, NULL, '2022-02-14 01:47:00', 2, 3, NULL, NULL, NULL, NULL, 0, 'SP2022/0002', 2993, NULL, NULL, 'customer_page', NULL, '2022-02-13 20:17:54', '2022-02-13 20:17:54', NULL),
(17, 1, 2, 0, '1000.000000', 'cash', 'cash', NULL, NULL, 'credit', NULL, '1', '22', NULL, NULL, '2022-02-14', NULL, NULL, NULL, '2022-02-14 01:47:00', 2, 3, 16, NULL, NULL, NULL, 0, 'PP2022/0001', 2993, NULL, NULL, 'customer_page', NULL, '2022-02-13 20:17:54', '2022-02-13 20:17:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,6) NOT NULL DEFAULT 0.000000,
  `mfg_waste_percent` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `quantity_returned` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `unit_price_before_discount` decimal(22,6) NOT NULL DEFAULT 0.000000,
  `unit_price` decimal(22,6) DEFAULT NULL COMMENT 'Sell price \r\n\r\nexcluding tax',
  `line_discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_discount_amount` decimal(22,6) NOT NULL DEFAULT 0.000000,
  `unit_price_inc_tax` decimal(22,6) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,6) NOT NULL COMMENT 'Tax for one \r\n\r\nquantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `children_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `weight_excess` decimal(15,6) DEFAULT NULL,
  `weight_loss` decimal(15,6) DEFAULT NULL,
  `last_purchased_price` decimal(15,6) DEFAULT NULL COMMENT 'used for price later',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `balance_quantity` text COLLATE utf8mb4_unicode_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `mfg_waste_percent`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `weight_excess`, `weight_loss`, `last_purchased_price`, `created_at`, `updated_at`, `deleted_at`, `balance_quantity`) VALUES
(1, 81, 5, 5, '3362.000000', '0.000000', '0.000000', '87.000000', '87.000000', 'fixed', '0.000000', '87.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', NULL, '0'),
(2, 81, 6, 6, '2.000000', '0.000000', '0.000000', '23000.000000', '23000.000000', 'fixed', '4000.000000', '23000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', NULL, '0'),
(3, 83, 5, 5, '150.000000', '0.000000', '0.000000', '87.000000', '87.000000', 'fixed', '0.000000', '87.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', NULL, '0'),
(4, 84, 6, 6, '0.826087', '0.000000', '0.000000', '23000.000000', '23000.000000', 'fixed', '0.000000', '23000.000000', '0.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2022-02-03 09:12:25', '2022-02-03 09:12:25', NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `sell_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `qty_returned`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 7, '3362.0000', '0.0000', '2022-02-03 09:12:25', '2022-02-03 09:12:25'),
(2, 2, NULL, 8, '2.0000', '0.0000', '2022-02-03 09:12:25', '2022-02-03 09:12:25');

-- --------------------------------------------------------

--
-- Table structure for table `types_of_services`
--

CREATE TABLE `types_of_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `location_price_group` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `is_property` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_add_product_unit` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_add_pos_unit` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_add_sale_unit` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_add_project_unit` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_sell_land_block_unit` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `is_property`, `show_in_add_product_unit`, `show_in_add_pos_unit`, `show_in_add_sale_unit`, `show_in_add_project_unit`, `show_in_sell_land_block_unit`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'Pieces', 'Pc(s)', 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 2, NULL, '2021-07-20 14:32:44', '2021-07-20 14:32:44'),
(2, 2, 'Liters', 'Lts', 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 2, NULL, '2021-07-25 14:46:10', '2021-07-25 14:46:10'),
(3, 2, 'Grams', 'g', 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 2, NULL, '2021-07-25 14:46:31', '2021-07-25 14:46:31'),
(4, 2, 'Kilogram', 'kg', 1, 3, '1000.0000', 0, 1, 1, 1, 0, 0, 2, NULL, '2021-07-25 14:47:14', '2021-07-25 14:47:14'),
(5, 3, 'Pieces', 'Pc(s)', 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 5, NULL, '2022-02-03 06:03:22', '2022-02-03 06:03:22'),
(6, 3, 'Ltrs', 'Ltrs', 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 5, NULL, '2022-02-03 07:10:15', '2022-02-03 07:10:15'),
(7, 3, 'Nos', 'Nos', 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 5, NULL, '2022-02-03 07:10:25', '2022-02-03 07:10:25');

-- --------------------------------------------------------

--
-- Table structure for table `unload_stocks`
--

CREATE TABLE `unload_stocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date_and_time` datetime NOT NULL,
  `pump_operator_id` int(10) NOT NULL,
  `tank_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product` varchar(191) NOT NULL,
  `unloaded_qty` decimal(15,4) NOT NULL,
  `bill_no` varchar(191) NOT NULL,
  `dip_reading` decimal(15,4) NOT NULL,
  `current_stock` decimal(15,4) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_orders`
--

CREATE TABLE `uploaded_orders` (
  `id` int(10) NOT NULL,
  `contact_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `surname` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive','terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT 0,
  `commission_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT 0.00,
  `cmmsn_application` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cmmsn_units` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selected_contacts` tinyint(1) NOT NULL DEFAULT 0,
  `dob` date DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toggle_popup` tinyint(1) NOT NULL DEFAULT 0,
  `user_store` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_customer` tinyint(1) NOT NULL DEFAULT 0,
  `is_pump_operator` tinyint(1) NOT NULL DEFAULT 0,
  `pump_operator_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pump_operator_passcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_property_user` tinyint(1) NOT NULL DEFAULT 0,
  `property_user_passcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_superadmin_default` tinyint(1) NOT NULL DEFAULT 0,
  `give_away_gifts` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lock_screen` tinyint(1) NOT NULL DEFAULT 0,
  `max_sales_discount_percent` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `status`, `is_cmmsn_agnt`, `commission_type`, `cmmsn_percent`, `cmmsn_application`, `cmmsn_units`, `selected_contacts`, `dob`, `marital_status`, `blood_group`, `contact_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `toggle_popup`, `user_store`, `is_customer`, `is_pump_operator`, `pump_operator_id`, `pump_operator_passcode`, `is_property_user`, `property_user_passcode`, `is_superadmin_default`, `give_away_gifts`, `deleted_at`, `created_at`, `updated_at`, `lock_screen`, `max_sales_discount_percent`) VALUES
(1, NULL, 'syzygy', NULL, 'syzygy', 'vikum12@gmail.com', '$2y$10$DM/I12r2UboQ51yZia1IVOfj7AZp2ClaeTUZMGPuL.pPx9mNc3NUu', 'sin', NULL, NULL, 'KhceKyw4N9rGrit0hWbqz75djEFUj4URJzFuiFdI5rVSl5D6aWdooJd41ZFX', 1, 'active', 0, NULL, '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, 0, NULL, NULL, '2019-12-30 11:22:03', '2020-11-16 05:11:28', 0, NULL),
(2, NULL, 'Hi', 'Cool', 'cool', 'cool@1.com', '$2y$10$JTkbQNH93ONriGZlq9PlI.TlMfMA7hGITZGZ.ehmI4GArQXBjQuAq', 'en', NULL, NULL, 'BNs05LNEWoDAYqZtcWIkwFdDSDxtXJRFVsUeO8looSuvsw4XRBfFHfPr2q2h', 2, 'active', 0, NULL, '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, 0, NULL, NULL, '2021-07-20 14:32:44', '2022-02-13 21:20:55', 0, NULL),
(3, '', 'Test-1', '', 'Test-1', 'test1@1.com', '$2y$10$hDsyrPY3MUccRhPg2CH8t./00Ls4UulCqQ7iR1PTWVFGbYtrO3YWG', 'en', NULL, '1', NULL, 2, 'active', 0, NULL, '0.00', NULL, NULL, 0, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, 1, '15', 0, NULL, 0, NULL, NULL, '2021-07-31 12:31:58', '2021-07-31 12:31:58', 0, NULL),
(4, '', 'Test-2', '', 'Test-2', 'test@1.com', '$2y$10$R38Kmha1vcE4pP2FB70XqOaAv/tJmtnMnVPB3hsI6iyhjru2Y54cG', 'en', NULL, '1', NULL, 2, 'active', 0, NULL, '0.00', NULL, NULL, 0, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, 2, '31', 0, NULL, 0, NULL, NULL, '2021-07-31 12:32:58', '2021-07-31 12:32:58', 0, NULL),
(5, 'Ms', 'LKD', '1', 'LKD', 'LKD-B@1.COM', '$2y$10$uzbISgHK5dx1agFtzQ7lEO9cP5Esc3D0zjEqS9AA6dm9QNZ2yUlxe', 'en', NULL, NULL, 'lLQnKxLGqzorVDt9v5gjeeUM4xEqPdL4omZ65qw9xiGSoOIIjTOe70aaNWBV', 3, 'active', 0, NULL, '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, NULL, 0, NULL, NULL, '2022-02-03 06:03:22', '2022-02-04 09:42:47', 0, NULL),
(6, '', 'Office Sale', '', 'Office Sale', 'OfficeSale@1.com', '$2y$10$VPoHOmRvQBgeqLm/LVqpUu5lsGIBU1/2ppmTdrEIM24xlxFaFCTGO', 'en', NULL, '1', NULL, 3, 'active', 0, NULL, '0.00', NULL, NULL, 0, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, 3, '1', 0, NULL, 0, NULL, NULL, '2022-02-03 07:35:26', '2022-02-03 07:35:26', 0, NULL),
(7, '', 'Shahrukh Khan', '', 'CO-0001-3', 'abc@gmail.com', '$2y$10$MRsRNMC.6BffgKwBsaftdO82KiBVlTeZKKzMljR5OLS/fZSsvH5yu', 'en', NULL, NULL, NULL, 3, 'inactive', 0, NULL, '0.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, 0, NULL, 0, NULL, 0, NULL, NULL, '2022-02-08 11:28:02', '2022-02-08 11:28:02', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(30,6) DEFAULT NULL,
  `dpp_inc_tax` decimal(30,6) NOT NULL DEFAULT 0.000000,
  `profit_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `default_sell_price` decimal(30,6) DEFAULT NULL,
  `sell_price_inc_tax` decimal(30,6) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Contains the combo variation details',
  `default_multiple_unit_price` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`, `default_multiple_unit_price`) VALUES
(1, 'DUMMY', 1, '001', 1, NULL, '100.000000', '100.000000', '25.0000', '125.000000', '125.000000', '2021-07-25 15:08:32', '2021-07-25 15:08:32', NULL, '[]', NULL),
(2, 'DUMMY', 2, '0002', 2, NULL, '130.000000', '130.000000', '25.0000', '162.500000', '162.500000', '2021-07-25 15:09:12', '2021-07-25 15:09:12', NULL, '[]', NULL),
(3, 'DUMMY', 3, '0003', 3, NULL, '90.000000', '90.000000', '25.0000', '112.500000', '112.500000', '2021-07-25 15:10:20', '2021-07-25 15:10:20', NULL, '[]', NULL),
(4, 'DUMMY', 4, '0004', 4, NULL, '123.000000', '123.000000', '25.0000', '153.750000', '153.750000', '2021-07-28 18:44:03', '2021-07-28 18:44:03', NULL, '[]', NULL),
(5, 'DUMMY', 5, 'A0017L99', 5, NULL, '85.260000', '85.260000', '25.0000', '87.000000', '87.000000', '2022-02-03 07:27:48', '2022-02-03 07:27:48', NULL, '[]', NULL),
(6, 'DUMMY', 6, '1', 6, NULL, '17600.000000', '17600.000000', '25.0000', '23000.000000', '23000.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(7, 'DUMMY', 7, '2', 7, NULL, '7550.000000', '7550.000000', '25.0000', '8100.000000', '8100.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(8, 'DUMMY', 8, '3', 8, NULL, '1925.000000', '1925.000000', '25.0000', '2175.000000', '2175.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(9, 'DUMMY', 9, '4', 9, NULL, '5055.000000', '5055.000000', '25.0000', '5680.000000', '5680.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(10, 'DUMMY', 10, '5', 10, NULL, '1265.000000', '1265.000000', '25.0000', '1395.000000', '1395.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(11, 'DUMMY', 11, '6', 11, NULL, '1145.000000', '1145.000000', '25.0000', '1355.000000', '1355.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(12, 'DUMMY', 12, '7', 12, NULL, '1180.000000', '1180.000000', '25.0000', '1395.000000', '1395.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(13, 'DUMMY', 13, '8', 13, NULL, '210.000000', '210.000000', '25.0000', '250.000000', '250.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(14, 'DUMMY', 14, '9', 14, NULL, '455.000000', '455.000000', '25.0000', '530.000000', '530.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(15, 'DUMMY', 15, '10', 15, NULL, '14000.000000', '14000.000000', '25.0000', '23000.000000', '23000.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(16, 'DUMMY', 16, '11', 16, NULL, '16400.000000', '16400.000000', '25.0000', '20500.000000', '20500.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(17, 'DUMMY', 17, '12', 17, NULL, '12600.000000', '12600.000000', '25.0000', '15750.000000', '15750.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(18, 'DUMMY', 18, 'G1', 18, NULL, '2616.000000', '2616.000000', '25.0000', '2700.000000', '2700.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(19, 'DUMMY', 19, 'G2', 19, NULL, '1048.000000', '1048.000000', '25.0000', '1080.000000', '1080.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(20, 'DUMMY', 20, 'G3', 20, NULL, '495.000000', '495.000000', '25.0000', '510.000000', '510.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(21, 'DUMMY', 21, 'C1', 21, NULL, '23.000000', '23.000000', '-100.0000', '0.000000', '0.000000', '2022-02-03 07:49:47', '2022-02-04 12:26:41', NULL, '[]', NULL),
(22, 'DUMMY', 22, 'C2', 22, NULL, '0.000000', '0.000000', '25.0000', '0.000000', '0.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(23, 'DUMMY', 23, 'C3', 23, NULL, '0.000000', '0.000000', '25.0000', '0.000000', '0.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(24, 'DUMMY', 24, '13', 24, NULL, '0.000000', '0.000000', '25.0000', '0.000000', '0.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(25, 'DUMMY', 25, '14', 25, NULL, '0.000000', '0.000000', '25.0000', '0.000000', '0.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(26, 'DUMMY', 26, '15', 26, NULL, '430.000000', '430.000000', '25.0000', '470.000000', '470.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(27, 'DUMMY', 27, '16', 27, NULL, '310.000000', '310.000000', '25.0000', '350.000000', '350.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(28, 'DUMMY', 28, '17', 28, NULL, '87.250000', '87.250000', '25.0000', '110.000000', '110.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(29, 'DUMMY', 29, '18', 29, NULL, '52.600000', '52.600000', '25.0000', '60.000000', '60.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(30, 'DUMMY', 30, '19', 30, NULL, '105.200000', '105.200000', '25.0000', '120.000000', '120.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(31, 'DUMMY', 31, '20', 31, NULL, '45.000000', '45.000000', '25.0000', '50.000000', '50.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(32, 'DUMMY', 32, '21', 32, NULL, '836.000000', '836.000000', '25.0000', '950.000000', '950.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(33, 'DUMMY', 33, '22', 33, NULL, '85.000000', '85.000000', '25.0000', '100.000000', '100.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(34, 'DUMMY', 34, '23', 34, NULL, '85.000000', '85.000000', '25.0000', '100.000000', '100.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(35, 'DUMMY', 35, '24', 35, NULL, '200.000000', '200.000000', '25.0000', '250.000000', '250.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(36, 'DUMMY', 36, '25', 36, NULL, '125.000000', '125.000000', '25.0000', '160.000000', '160.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(37, 'DUMMY', 37, '26', 37, NULL, '210.000000', '210.000000', '25.0000', '250.000000', '250.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(38, 'DUMMY', 38, '27', 38, NULL, '550.000000', '550.000000', '25.0000', '700.000000', '700.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(39, 'DUMMY', 39, '28', 39, NULL, '950.000000', '950.000000', '25.0000', '1100.000000', '1100.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(40, 'DUMMY', 40, '29', 40, NULL, '3000.000000', '3000.000000', '25.0000', '3500.000000', '3500.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(41, 'DUMMY', 41, '30', 41, NULL, '350.000000', '350.000000', '25.0000', '400.000000', '400.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(42, 'DUMMY', 42, '31', 42, NULL, '405.000000', '405.000000', '25.0000', '480.000000', '480.000000', '2022-02-03 07:49:47', '2022-02-03 07:49:47', NULL, '[]', NULL),
(43, 'DUMMY', 43, '0043', 43, NULL, '6666.000000', '6666.000000', '25.0000', '8332.500000', '8332.500000', '2022-02-04 11:08:02', '2022-02-04 11:08:02', NULL, '[]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `price_group_id` int(10) UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, '8500.0000', '2021-07-25 15:16:53', '2021-07-25 15:17:20'),
(2, 2, 2, 2, 2, '5000.0000', '2021-07-25 15:18:03', '2021-07-25 15:18:03'),
(3, 3, 3, 3, 2, '10000.0000', '2021-07-25 15:18:33', '2021-07-25 15:19:01'),
(4, 4, 4, 4, 2, '50.0000', '2021-07-28 18:44:19', '2021-07-28 18:44:19'),
(5, 5, 5, 5, 3, '4388.0000', '2022-02-03 07:29:01', '2022-02-03 09:12:25'),
(6, 6, 6, 6, 3, '27.0000', '2022-02-03 07:49:47', '2022-02-03 09:26:40'),
(7, 7, 7, 7, 3, '3.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(8, 8, 8, 8, 3, '1.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(9, 9, 9, 9, 3, '5.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(10, 10, 10, 10, 3, '1.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(11, 11, 11, 11, 3, '4.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(12, 12, 12, 12, 3, '3.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(13, 13, 13, 13, 3, '10.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(14, 14, 14, 14, 3, '5.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(15, 15, 15, 15, 3, '1.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(16, 16, 16, 16, 3, '1.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(17, 17, 17, 17, 3, '10.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(18, 21, 21, 21, 3, '71.0000', '2022-02-03 07:49:47', '2022-02-04 12:27:47'),
(19, 22, 22, 22, 3, '18.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(20, 23, 23, 23, 3, '35.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(21, 24, 24, 24, 3, '2.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(22, 25, 25, 25, 3, '3.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(23, 27, 27, 27, 3, '39.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(24, 28, 28, 28, 3, '1.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(25, 29, 29, 29, 3, '43.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(26, 30, 30, 30, 3, '15.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(27, 31, 31, 31, 3, '10.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(28, 32, 32, 32, 3, '1.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(29, 33, 33, 33, 3, '233.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(30, 34, 34, 34, 3, '31.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(31, 35, 35, 35, 3, '8.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(32, 36, 36, 36, 3, '1.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(33, 38, 38, 38, 3, '9.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(34, 40, 40, 40, 3, '5.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(35, 41, 41, 41, 3, '3.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(36, 42, 42, 42, 3, '16.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47');

-- --------------------------------------------------------

--
-- Table structure for table `variation_store_details`
--

CREATE TABLE `variation_store_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL,
  `qty_available` decimal(16,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_store_details`
--

INSERT INTO `variation_store_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `store_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(1, 5, 5, 5, 6, NULL, '2022-02-03 07:27:48', '2022-02-03 07:27:48'),
(2, 6, 6, 6, 6, '29.0000', '2022-02-03 07:49:47', '2022-02-03 09:26:40'),
(3, 7, 7, 7, 6, '3.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(4, 8, 8, 8, 6, '1.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(5, 9, 9, 9, 6, '5.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(6, 10, 10, 10, 6, '1.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(7, 11, 11, 11, 6, '4.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(8, 12, 12, 12, 6, '3.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(9, 13, 13, 13, 6, '10.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(10, 14, 14, 14, 6, '5.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(11, 15, 15, 15, 6, '1.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(12, 16, 16, 16, 6, '1.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(13, 17, 17, 17, 6, '10.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(14, 18, 18, 18, 6, '0.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(15, 19, 19, 19, 6, '0.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(16, 20, 20, 20, 6, '0.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(17, 21, 21, 21, 6, '71.0000', '2022-02-03 07:49:47', '2022-02-04 12:27:47'),
(18, 22, 22, 22, 6, '18.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(19, 23, 23, 23, 6, '35.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(20, 24, 24, 24, 6, '2.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(21, 25, 25, 25, 6, '3.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(22, 26, 26, 26, 6, '0.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(23, 27, 27, 27, 6, '39.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(24, 28, 28, 28, 6, '1.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(25, 29, 29, 29, 6, '43.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(26, 30, 30, 30, 6, '15.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(27, 31, 31, 31, 6, '10.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(28, 32, 32, 32, 6, '1.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(29, 33, 33, 33, 6, '233.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(30, 34, 34, 34, 6, '31.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(31, 35, 35, 35, 6, '8.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(32, 36, 36, 36, 6, '1.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(33, 37, 37, 37, 6, '0.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(34, 38, 38, 38, 6, '9.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(35, 39, 39, 39, 6, '0.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(36, 40, 40, 40, 6, '5.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(37, 41, 41, 41, 6, '3.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(38, 42, 42, 42, 6, '16.0000', '2022-02-03 07:49:47', '2022-02-03 07:49:47'),
(39, 5, 5, 5, 0, '-3362.0000', '2022-02-03 09:12:25', '2022-02-03 09:12:25'),
(40, 6, 6, 6, 0, '-2.0000', '2022-02-03 09:12:25', '2022-02-03 09:12:25');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_transfers`
--

CREATE TABLE `variation_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `from_location` int(10) UNSIGNED NOT NULL,
  `from_store` int(10) UNSIGNED NOT NULL,
  `to_location` int(10) UNSIGNED NOT NULL,
  `to_store` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `from_variation_id` int(10) UNSIGNED NOT NULL,
  `to_variation_id` int(10) UNSIGNED NOT NULL,
  `qty` decimal(15,6) NOT NULL,
  `unit_cost` decimal(15,6) NOT NULL,
  `total_cost` decimal(15,6) NOT NULL,
  `sell_transfer_id` int(10) UNSIGNED DEFAULT NULL,
  `purchase_transfer_id` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unique_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `town_id` int(11) DEFAULT NULL,
  `business_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `land_number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male',
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_settings`
--

CREATE TABLE `visitor_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `enable_required_name` tinyint(4) NOT NULL DEFAULT 0,
  `enable_required_address` tinyint(4) NOT NULL DEFAULT 0,
  `enable_required_district` tinyint(4) NOT NULL DEFAULT 0,
  `enable_required_town` tinyint(4) NOT NULL DEFAULT 0,
  `enable_add_district` tinyint(4) NOT NULL DEFAULT 0,
  `enable_add_town` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` int(10) UNSIGNED NOT NULL,
  `visitor_id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL COMMENT 'business which visitor visit',
  `no_of_accompanied` int(10) NOT NULL DEFAULT 0,
  `unique_code` varchar(191) DEFAULT NULL,
  `date_and_time` datetime NOT NULL,
  `visited_date` date NOT NULL,
  `logged_in_time` timestamp NULL DEFAULT NULL,
  `logged_out_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

CREATE TABLE `warranties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `duration_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wastages`
--

CREATE TABLE `wastages` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date_and_time` datetime NOT NULL,
  `wastage_form_no` varchar(191) NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `goldsmith_id` int(10) UNSIGNED NOT NULL,
  `wastage` decimal(15,4) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `sub_category_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `working_days`
--

CREATE TABLE `working_days` (
  `id` int(10) NOT NULL,
  `business_id` int(11) NOT NULL,
  `days` varchar(50) NOT NULL,
  `flag` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_default` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_superadmin_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `working_days`
--

INSERT INTO `working_days` (`id`, `business_id`, `days`, `flag`, `created_at`, `updated_at`, `is_default`, `is_superadmin_default`) VALUES
(1, 1, 'Saturday', 1, '2020-01-20 13:40:40', '2020-01-20 14:10:56', 0, 0),
(2, 1, 'Sunday', 1, '2020-01-20 13:40:40', '2020-01-20 14:10:56', 0, 0),
(3, 1, 'Monday', 1, '2020-01-20 13:40:40', '2020-01-20 14:10:56', 0, 0),
(4, 1, 'Tuesday', 1, '2020-01-20 13:40:40', '2020-01-20 14:10:56', 0, 0),
(5, 1, 'Wednesday', 1, '2020-01-20 13:40:40', '2020-01-20 14:10:56', 0, 0),
(6, 1, 'Thursday', 1, '2020-01-20 13:40:40', '2020-01-20 14:10:56', 0, 0),
(7, 1, 'Friday', 1, '2020-01-20 13:40:40', '2020-01-20 14:10:56', 0, 0),
(15, 1, 'Saturday', 0, '2020-11-06 04:54:59', '2020-11-06 04:54:59', 0, 1),
(16, 1, 'Sunday', 0, '2020-11-06 04:54:59', '2020-11-06 04:54:59', 0, 1),
(17, 1, 'Monday', 0, '2020-11-06 04:54:59', '2020-11-06 04:54:59', 0, 1),
(18, 1, 'Tuesday', 0, '2020-11-06 04:54:59', '2020-11-06 04:54:59', 0, 1),
(19, 1, 'Wednesday', 0, '2020-11-06 04:54:59', '2020-11-06 04:54:59', 0, 1),
(20, 1, 'Thursday', 0, '2020-11-06 04:54:59', '2020-11-06 04:54:59', 0, 1),
(21, 1, 'Friday', 0, '2020-11-06 04:54:59', '2020-11-06 04:54:59', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `work_orders`
--

CREATE TABLE `work_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `date_and_time` datetime NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `goldsmith_id` int(10) UNSIGNED NOT NULL,
  `work_order_no` int(10) NOT NULL,
  `order_delivery_date` date NOT NULL,
  `note` text DEFAULT NULL,
  `customer_order_no` int(10) UNSIGNED DEFAULT NULL,
  `customer_id` int(10) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `work_order_items`
--

CREATE TABLE `work_order_items` (
  `id` int(10) NOT NULL,
  `work_order_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) NOT NULL,
  `qty` int(10) NOT NULL,
  `required_qty` int(10) NOT NULL,
  `weight_showroom_product` decimal(15,4) NOT NULL,
  `required_unit_weight` decimal(15,4) NOT NULL,
  `gold_qty` decimal(15,4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `work_shifts`
--

CREATE TABLE `work_shifts` (
  `id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `shift_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `shift_form` varchar(50) CHARACTER SET latin1 NOT NULL,
  `shift_to` varchar(50) CHARACTER SET latin1 NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_superadmin_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_groups`
--
ALTER TABLE `account_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_settings`
--
ALTER TABLE `account_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `balamandalayas`
--
ALTER TABLE `balamandalayas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `basic_salaries`
--
ALTER TABLE `basic_salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `block_close_reasons`
--
ALTER TABLE `block_close_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boat_trips`
--
ALTER TABLE `boat_trips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`);

--
-- Indexes for table `bussines_categories`
--
ALTER TABLE `bussines_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`),
  ADD KEY `cash_registers_location_id_index` (`location_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`);

--
-- Indexes for table `chequer_bank_accounts`
--
ALTER TABLE `chequer_bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chequer_currencies`
--
ALTER TABLE `chequer_currencies`
  ADD PRIMARY KEY (`iso`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `chequer_default_settings`
--
ALTER TABLE `chequer_default_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chequer_purchase_orders`
--
ALTER TABLE `chequer_purchase_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chequer_stamps`
--
ALTER TABLE `chequer_stamps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chequer_suppliers`
--
ALTER TABLE `chequer_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cheque_numbers`
--
ALTER TABLE `cheque_numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cheque_number_maintains`
--
ALTER TABLE `cheque_number_maintains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cheque_templates`
--
ALTER TABLE `cheque_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `close_current_sales`
--
ALTER TABLE `close_current_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_package_variables`
--
ALTER TABLE `company_package_variables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`);

--
-- Indexes for table `contact_groups`
--
ALTER TABLE `contact_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `contact_ledgers`
--
ALTER TABLE `contact_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crews`
--
ALTER TABLE `crews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crms`
--
ALTER TABLE `crms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`);

--
-- Indexes for table `crm_activities`
--
ALTER TABLE `crm_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_activity_details`
--
ALTER TABLE `crm_activity_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_comments`
--
ALTER TABLE `crm_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_groups`
--
ALTER TABLE `crm_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `current_meters`
--
ALTER TABLE `current_meters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_username_unique` (`username`);

--
-- Indexes for table `customer_payments`
--
ALTER TABLE `customer_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_references`
--
ALTER TABLE `customer_references`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_statements`
--
ALTER TABLE `customer_statements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_statement_details`
--
ALTER TABLE `customer_statement_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_statement_settings`
--
ALTER TABLE `customer_statement_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daily_collections`
--
ALTER TABLE `daily_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daily_vouchers`
--
ALTER TABLE `daily_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daily_voucher_items`
--
ALTER TABLE `daily_voucher_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `default_accounts`
--
ALTER TABLE `default_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `default_account_groups`
--
ALTER TABLE `default_account_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `default_account_types`
--
ALTER TABLE `default_account_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dip_readings`
--
ALTER TABLE `dip_readings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dip_resettings`
--
ALTER TABLE `dip_resettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_and_notes_business_id_index` (`business_id`),
  ADD KEY `document_and_notes_notable_id_index` (`notable_id`),
  ADD KEY `document_and_notes_created_by_index` (`created_by`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `edit_account_entries`
--
ALTER TABLE `edit_account_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `edit_contact_entries`
--
ALTER TABLE `edit_contact_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_awards`
--
ALTER TABLE `employee_awards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employment_statuses`
--
ALTER TABLE `employment_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `family_subscriptions`
--
ALTER TABLE `family_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fazol`
--
ALTER TABLE `fazol`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_options`
--
ALTER TABLE `finance_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fleets`
--
ALTER TABLE `fleets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form9c_sub_categories`
--
ALTER TABLE `form9c_sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_f17_details`
--
ALTER TABLE `form_f17_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_f17_headers`
--
ALTER TABLE `form_f17_headers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_f22_details`
--
ALTER TABLE `form_f22_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_f22_headers`
--
ALTER TABLE `form_f22_headers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuel_tanks`
--
ALTER TABLE `fuel_tanks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `give_away_gifts`
--
ALTER TABLE `give_away_gifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gramaseva_vasamas`
--
ALTER TABLE `gramaseva_vasamas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `helpers`
--
ALTER TABLE `helpers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_prefixes`
--
ALTER TABLE `hr_prefixes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_settings`
--
ALTER TABLE `hr_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_methods`
--
ALTER TABLE `income_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_settings`
--
ALTER TABLE `income_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `installments`
--
ALTER TABLE `installments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `installment_cycles`
--
ALTER TABLE `installment_cycles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`);

--
-- Indexes for table `issue_customer_bills`
--
ALTER TABLE `issue_customer_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issue_customer_bill_details`
--
ALTER TABLE `issue_customer_bill_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_categories`
--
ALTER TABLE `job_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_titles`
--
ALTER TABLE `job_titles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads_categories`
--
ALTER TABLE `leads_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_application_types`
--
ALTER TABLE `leave_application_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_groups`
--
ALTER TABLE `member_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merged_sub_categories`
--
ALTER TABLE `merged_sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meter_resettings`
--
ALTER TABLE `meter_resettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meter_sales`
--
ALTER TABLE `meter_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mfg_by_products`
--
ALTER TABLE `mfg_by_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mfg_ingredient_groups`
--
ALTER TABLE `mfg_ingredient_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mfg_recipes`
--
ALTER TABLE `mfg_recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mfg_recipes_product_id_index` (`product_id`),
  ADD KEY `mfg_recipes_variation_id_index` (`variation_id`);

--
-- Indexes for table `mfg_recipe_ingredients`
--
ALTER TABLE `mfg_recipe_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mfg_recipe_ingredients_mfg_recipe_id_foreign` (`mfg_recipe_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `module_permission_locations`
--
ALTER TABLE `module_permission_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mpcs_form_settings`
--
ALTER TABLE `mpcs_form_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `note_groups`
--
ALTER TABLE `note_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opening_meters`
--
ALTER TABLE `opening_meters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_incomes`
--
ALTER TABLE `other_incomes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_sales`
--
ALTER TABLE `other_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_variables`
--
ALTER TABLE `package_variables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patient_allergies`
--
ALTER TABLE `patient_allergies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_details`
--
ALTER TABLE `patient_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_doctors`
--
ALTER TABLE `patient_doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_medicines`
--
ALTER TABLE `patient_medicines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_payments`
--
ALTER TABLE `patient_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_prescriptions`
--
ALTER TABLE `patient_prescriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_tests`
--
ALTER TABLE `patient_tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payhere`
--
ALTER TABLE `payhere`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_options`
--
ALTER TABLE `payment_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_onlines`
--
ALTER TABLE `pay_onlines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penalties`
--
ALTER TABLE `penalties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacy_products`
--
ALTER TABLE `pharmacy_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescription_medicines`
--
ALTER TABLE `prescription_medicines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescription_tests`
--
ALTER TABLE `prescription_tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printed_cheque_details`
--
ALTER TABLE `printed_cheque_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`),
  ADD KEY `products_warranty_id_index` (`warranty_id`);

--
-- Indexes for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD KEY `product_locations_product_id_index` (`product_id`),
  ADD KEY `product_locations_location_id_index` (`location_id`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_account_settings`
--
ALTER TABLE `property_account_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_blocks`
--
ALTER TABLE `property_blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_finalizes`
--
ALTER TABLE `property_finalizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_sell_lines`
--
ALTER TABLE `property_sell_lines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_taxes`
--
ALTER TABLE `property_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pumper_day_entries`
--
ALTER TABLE `pumper_day_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pumps`
--
ALTER TABLE `pumps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pump_operators`
--
ALTER TABLE `pump_operators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pump_operator_assignments`
--
ALTER TABLE `pump_operator_assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pump_operator_payments`
--
ALTER TABLE `pump_operator_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pump_operator_payments_business_id_foreign` (`business_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `purchase_lines_lot_number_index` (`lot_number`);

--
-- Indexes for table `receive_work_orders`
--
ALTER TABLE `receive_work_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_groups`
--
ALTER TABLE `referral_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_starting_codes`
--
ALTER TABLE `referral_starting_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reimbursements`
--
ALTER TABLE `reimbursements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `religions`
--
ALTER TABLE `religions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route_invoice_numbers`
--
ALTER TABLE `route_invoice_numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route_operations`
--
ALTER TABLE `route_operations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route_products`
--
ALTER TABLE `route_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_components`
--
ALTER TABLE `salary_components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_grades`
--
ALTER TABLE `salary_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_officers`
--
ALTER TABLE `sales_officers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `service_areas`
--
ALTER TABLE `service_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `settlements`
--
ALTER TABLE `settlements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settlement_card_payments`
--
ALTER TABLE `settlement_card_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settlement_cash_payments`
--
ALTER TABLE `settlement_cash_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settlement_cheque_payments`
--
ALTER TABLE `settlement_cheque_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settlement_credit_sale_payments`
--
ALTER TABLE `settlement_credit_sale_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settlement_excess_payments`
--
ALTER TABLE `settlement_excess_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settlement_expense_payments`
--
ALTER TABLE `settlement_expense_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settlement_shortage_payments`
--
ALTER TABLE `settlement_shortage_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_lists`
--
ALTER TABLE `sms_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_id_fk` (`business_id`),
  ADD KEY `location_id_fk` (`location_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_business_id_foreign` (`business_id`),
  ADD KEY `subscriptions_package_id_index` (`package_id`),
  ADD KEY `subscriptions_created_id_index` (`created_id`);

--
-- Indexes for table `suggestions`
--
ALTER TABLE `suggestions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `superadmin_communicator_logs`
--
ALTER TABLE `superadmin_communicator_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `superadmin_frontend_pages`
--
ALTER TABLE `superadmin_frontend_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tanks_transaction_details`
--
ALTER TABLE `tanks_transaction_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tank_dip_charts`
--
ALTER TABLE `tank_dip_charts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tank_dip_chart_details`
--
ALTER TABLE `tank_dip_chart_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tank_purchase_lines`
--
ALTER TABLE `tank_purchase_lines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tank_sell_lines`
--
ALTER TABLE `tank_sell_lines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_groups`
--
ALTER TABLE `task_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `temp_data`
--
ALTER TABLE `temp_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `towns`
--
ALTER TABLE `towns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`),
  ADD KEY `transactions_sub_type_index` (`sub_type`),
  ADD KEY `transactions_return_parent_id_index` (`return_parent_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`),
  ADD KEY `transaction_payments_parent_id_index` (`parent_id`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `transaction_sell_lines_children_type_index` (`children_type`),
  ADD KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_line_id` (`sell_line_id`),
  ADD KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  ADD KEY `purchase_line_id` (`purchase_line_id`);

--
-- Indexes for table `types_of_services`
--
ALTER TABLE `types_of_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_of_services_business_id_index` (`business_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `units_base_unit_id_index` (`base_unit_id`);

--
-- Indexes for table `unload_stocks`
--
ALTER TABLE `unload_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploaded_orders`
--
ALTER TABLE `uploaded_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`);

--
-- Indexes for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`),
  ADD KEY `variations_variation_value_id_index` (`variation_value_id`);

--
-- Indexes for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_store_details`
--
ALTER TABLE `variation_store_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`),
  ADD KEY `variation_store_details_store_index` (`store_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_transfers`
--
ALTER TABLE `variation_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_settings`
--
ALTER TABLE `visitor_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `working_days`
--
ALTER TABLE `working_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_orders`
--
ALTER TABLE `work_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_order_items`
--
ALTER TABLE `work_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_shifts`
--
ALTER TABLE `work_shifts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3085;

--
-- AUTO_INCREMENT for table `account_groups`
--
ALTER TABLE `account_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `account_settings`
--
ALTER TABLE `account_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `balamandalayas`
--
ALTER TABLE `balamandalayas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `basic_salaries`
--
ALTER TABLE `basic_salaries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `block_close_reasons`
--
ALTER TABLE `block_close_reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `boat_trips`
--
ALTER TABLE `boat_trips`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bussines_categories`
--
ALTER TABLE `bussines_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `chequer_bank_accounts`
--
ALTER TABLE `chequer_bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chequer_default_settings`
--
ALTER TABLE `chequer_default_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chequer_purchase_orders`
--
ALTER TABLE `chequer_purchase_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chequer_stamps`
--
ALTER TABLE `chequer_stamps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chequer_suppliers`
--
ALTER TABLE `chequer_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cheque_numbers`
--
ALTER TABLE `cheque_numbers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cheque_number_maintains`
--
ALTER TABLE `cheque_number_maintains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cheque_templates`
--
ALTER TABLE `cheque_templates`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `close_current_sales`
--
ALTER TABLE `close_current_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_package_variables`
--
ALTER TABLE `company_package_variables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `components`
--
ALTER TABLE `components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `contact_groups`
--
ALTER TABLE `contact_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact_ledgers`
--
ALTER TABLE `contact_ledgers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `crews`
--
ALTER TABLE `crews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crms`
--
ALTER TABLE `crms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_activities`
--
ALTER TABLE `crm_activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_activity_details`
--
ALTER TABLE `crm_activity_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_comments`
--
ALTER TABLE `crm_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_groups`
--
ALTER TABLE `crm_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `current_meters`
--
ALTER TABLE `current_meters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_payments`
--
ALTER TABLE `customer_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_references`
--
ALTER TABLE `customer_references`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_statements`
--
ALTER TABLE `customer_statements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_statement_details`
--
ALTER TABLE `customer_statement_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_statement_settings`
--
ALTER TABLE `customer_statement_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daily_collections`
--
ALTER TABLE `daily_collections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daily_vouchers`
--
ALTER TABLE `daily_vouchers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daily_voucher_items`
--
ALTER TABLE `daily_voucher_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `default_accounts`
--
ALTER TABLE `default_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `default_account_groups`
--
ALTER TABLE `default_account_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `default_account_types`
--
ALTER TABLE `default_account_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dip_readings`
--
ALTER TABLE `dip_readings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dip_resettings`
--
ALTER TABLE `dip_resettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `edit_account_entries`
--
ALTER TABLE `edit_account_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `edit_contact_entries`
--
ALTER TABLE `edit_contact_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_awards`
--
ALTER TABLE `employee_awards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employment_statuses`
--
ALTER TABLE `employment_statuses`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `family_subscriptions`
--
ALTER TABLE `family_subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fazol`
--
ALTER TABLE `fazol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_options`
--
ALTER TABLE `finance_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fleets`
--
ALTER TABLE `fleets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form9c_sub_categories`
--
ALTER TABLE `form9c_sub_categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_f17_details`
--
ALTER TABLE `form_f17_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_f17_headers`
--
ALTER TABLE `form_f17_headers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_f22_details`
--
ALTER TABLE `form_f22_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_f22_headers`
--
ALTER TABLE `form_f22_headers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fuel_tanks`
--
ALTER TABLE `fuel_tanks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `give_away_gifts`
--
ALTER TABLE `give_away_gifts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gramaseva_vasamas`
--
ALTER TABLE `gramaseva_vasamas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `helpers`
--
ALTER TABLE `helpers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_prefixes`
--
ALTER TABLE `hr_prefixes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_settings`
--
ALTER TABLE `hr_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income_methods`
--
ALTER TABLE `income_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income_settings`
--
ALTER TABLE `income_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `installments`
--
ALTER TABLE `installments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `installment_cycles`
--
ALTER TABLE `installment_cycles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `issue_customer_bills`
--
ALTER TABLE `issue_customer_bills`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issue_customer_bill_details`
--
ALTER TABLE `issue_customer_bill_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_categories`
--
ALTER TABLE `job_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_titles`
--
ALTER TABLE `job_titles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads_categories`
--
ALTER TABLE `leads_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_application_types`
--
ALTER TABLE `leave_application_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member_groups`
--
ALTER TABLE `member_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `merged_sub_categories`
--
ALTER TABLE `merged_sub_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meter_resettings`
--
ALTER TABLE `meter_resettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meter_sales`
--
ALTER TABLE `meter_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mfg_by_products`
--
ALTER TABLE `mfg_by_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mfg_ingredient_groups`
--
ALTER TABLE `mfg_ingredient_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mfg_recipes`
--
ALTER TABLE `mfg_recipes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mfg_recipe_ingredients`
--
ALTER TABLE `mfg_recipe_ingredients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT for table `module_permission_locations`
--
ALTER TABLE `module_permission_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mpcs_form_settings`
--
ALTER TABLE `mpcs_form_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `note_groups`
--
ALTER TABLE `note_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `opening_meters`
--
ALTER TABLE `opening_meters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `other_incomes`
--
ALTER TABLE `other_incomes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `other_sales`
--
ALTER TABLE `other_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `package_variables`
--
ALTER TABLE `package_variables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_allergies`
--
ALTER TABLE `patient_allergies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_details`
--
ALTER TABLE `patient_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_doctors`
--
ALTER TABLE `patient_doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_medicines`
--
ALTER TABLE `patient_medicines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_payments`
--
ALTER TABLE `patient_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_prescriptions`
--
ALTER TABLE `patient_prescriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_tests`
--
ALTER TABLE `patient_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payhere`
--
ALTER TABLE `payhere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_options`
--
ALTER TABLE `payment_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pay_onlines`
--
ALTER TABLE `pay_onlines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penalties`
--
ALTER TABLE `penalties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT for table `pharmacy_products`
--
ALTER TABLE `pharmacy_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescription_medicines`
--
ALTER TABLE `prescription_medicines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescription_tests`
--
ALTER TABLE `prescription_tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `printed_cheque_details`
--
ALTER TABLE `printed_cheque_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_account_settings`
--
ALTER TABLE `property_account_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_blocks`
--
ALTER TABLE `property_blocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_finalizes`
--
ALTER TABLE `property_finalizes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_sell_lines`
--
ALTER TABLE `property_sell_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_taxes`
--
ALTER TABLE `property_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pumper_day_entries`
--
ALTER TABLE `pumper_day_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pumps`
--
ALTER TABLE `pumps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pump_operators`
--
ALTER TABLE `pump_operators`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pump_operator_assignments`
--
ALTER TABLE `pump_operator_assignments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pump_operator_payments`
--
ALTER TABLE `pump_operator_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `receive_work_orders`
--
ALTER TABLE `receive_work_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_groups`
--
ALTER TABLE `referral_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_starting_codes`
--
ALTER TABLE `referral_starting_codes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reimbursements`
--
ALTER TABLE `reimbursements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `religions`
--
ALTER TABLE `religions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `route_invoice_numbers`
--
ALTER TABLE `route_invoice_numbers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `route_operations`
--
ALTER TABLE `route_operations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `route_products`
--
ALTER TABLE `route_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_components`
--
ALTER TABLE `salary_components`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_grades`
--
ALTER TABLE `salary_grades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_officers`
--
ALTER TABLE `sales_officers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_areas`
--
ALTER TABLE `service_areas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settlements`
--
ALTER TABLE `settlements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settlement_card_payments`
--
ALTER TABLE `settlement_card_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settlement_cash_payments`
--
ALTER TABLE `settlement_cash_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settlement_cheque_payments`
--
ALTER TABLE `settlement_cheque_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settlement_credit_sale_payments`
--
ALTER TABLE `settlement_credit_sale_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settlement_excess_payments`
--
ALTER TABLE `settlement_excess_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settlement_expense_payments`
--
ALTER TABLE `settlement_expense_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settlement_shortage_payments`
--
ALTER TABLE `settlement_shortage_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_lists`
--
ALTER TABLE `sms_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `suggestions`
--
ALTER TABLE `suggestions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `superadmin_communicator_logs`
--
ALTER TABLE `superadmin_communicator_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `superadmin_frontend_pages`
--
ALTER TABLE `superadmin_frontend_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `tanks_transaction_details`
--
ALTER TABLE `tanks_transaction_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tank_dip_charts`
--
ALTER TABLE `tank_dip_charts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tank_dip_chart_details`
--
ALTER TABLE `tank_dip_chart_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;

--
-- AUTO_INCREMENT for table `tank_purchase_lines`
--
ALTER TABLE `tank_purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tank_sell_lines`
--
ALTER TABLE `tank_sell_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_groups`
--
ALTER TABLE `task_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_data`
--
ALTER TABLE `temp_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `towns`
--
ALTER TABLE `towns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `types_of_services`
--
ALTER TABLE `types_of_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `unload_stocks`
--
ALTER TABLE `unload_stocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uploaded_orders`
--
ALTER TABLE `uploaded_orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `variation_store_details`
--
ALTER TABLE `variation_store_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_transfers`
--
ALTER TABLE `variation_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_settings`
--
ALTER TABLE `visitor_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warranties`
--
ALTER TABLE `warranties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `working_days`
--
ALTER TABLE `working_days`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `work_orders`
--
ALTER TABLE `work_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_order_items`
--
ALTER TABLE `work_order_items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_shifts`
--
ALTER TABLE `work_shifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contact_groups`
--
ALTER TABLE `contact_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pump_operator_payments`
--
ALTER TABLE `pump_operator_payments`
  ADD CONSTRAINT `pump_operator_payments_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
