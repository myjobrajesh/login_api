-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 17, 2016 at 01:44 AM
-- Server version: 5.6.22
-- PHP Version: 5.6.23-1+deprecated+dontuse+deb.sury.org~trusty+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vortilla`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `street1` varchar(255) DEFAULT NULL,
  `street2` varchar(255) DEFAULT NULL,
  `street3` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `state_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `name`, `street1`, `street2`, `street3`, `city`, `postcode`, `state_id`) VALUES
(1, 'Tony', 'Floor 42, Room 7', 'Stark Industries', NULL, 'New York', '1234', 7),
(2, 'Thor', 'The Citadel', 'Middle of the city', NULL, 'Asgard', '5678', 2),
(3, 'Charles', 'Xavier''s School for Gifted Youngsters', '1 One Way', NULL, 'Western Massachusetts', '9012', 4);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
(1, 'Australia');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `person_id` int(10) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `active_from` datetime NOT NULL,
  `active_thru` datetime DEFAULT NULL,
  `is_primary` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`person_id`,`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`person_id`, `email`, `pass`, `active_from`, `active_thru`, `is_primary`) VALUES
(1, 'tony@stark.com', '$2y$10$.QgWpo5EzjQSjBZ6rpQIjuctBMjuJKUUx5ZPJQxoPMNB7QiCOTdqC', '2014-01-01 00:00:00', NULL, 1),
(2, 'thecap@marvel.com', '$2y$10$.QgWpo5EzjQSjBZ6rpQIjuctBMjuJKUUx5ZPJQxoPMNB7QiCOTdqC', '2013-12-25 00:00:00', '2014-01-01 00:00:00', 1),
(8, 'charles@xmen.com', '$2y$10$.QgWpo5EzjQSjBZ6rpQIjuctBMjuJKUUx5ZPJQxoPMNB7QiCOTdqC', '2014-02-01 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0bb59bea28c7ae1f5fb010fa1eb5987a28e15d6af8a3a1ae3ef7fbf06bf152be633922a86a54d5a4', NULL, 2, NULL, '[]', 0, '2016-12-16 12:55:25', '2016-12-16 12:55:25', '2016-12-31 18:25:25'),
('0e328e57e84dea55dcc41a5f5ff104d1a941307d2185808844dbcdd7e64acd05111da77befffc671', 1, 2, NULL, '[]', 1, '2016-12-16 13:26:16', '2016-12-16 13:26:16', '2016-12-31 18:56:16'),
('2e66114eed8ee9a6912c51ac5dd9609278fd7b2cbe29ea974a175a325c20d492308f55dce8bce042', 1, 2, NULL, '[]', 1, '2016-12-16 14:34:28', '2016-12-16 14:34:28', '2016-12-31 20:04:28'),
('5277598e533c16d2b819e475ca901d74edd44f4046cd7b53b465a7739f9d41daa626a9579a6bab7a', NULL, 2, NULL, '[]', 0, '2016-12-16 12:55:37', '2016-12-16 12:55:37', '2016-12-31 18:25:37'),
('92d02877ad68e9d4751dd0fa0eae66ded8c503eaf471fad31d30c10253f82ed6cf14a063aacb8918', NULL, 2, NULL, '[]', 0, '2016-12-16 12:58:51', '2016-12-16 12:58:51', '2016-12-31 18:28:51'),
('a5183ad84abf743a9499e6c49aae69eefb0d67e1ee01f4695ac3163c146da712aa9fe3e53d7fec52', NULL, 2, NULL, '[]', 0, '2016-12-16 12:48:57', '2016-12-16 12:48:57', '2016-12-31 18:18:57'),
('f8bcb309da81e1ad6cd4eda1c3aa5657735d934f91cb1474d17afa1b5c00f63b071e5a24e139190d', 1, 2, NULL, '[]', 1, '2016-12-16 13:11:31', '2016-12-16 13:11:31', '2016-12-31 18:41:31');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'AdYpFCLuLCk0sausXBzmx9b5Th2rTYrVlC8od0XW', 'http://localhost/vortilla/public', 1, 0, 0, '2016-12-16 07:47:23', '2016-12-16 07:47:23'),
(2, NULL, 'Laravel Password Grant Client', 'BITzCzupTWtHL69ojgAVCM3bv3Nbui2JTOVMsmSl', 'http://localhost/vortilla/public', 0, 1, 0, '2016-12-16 07:47:23', '2016-12-16 07:47:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2016-12-16 07:47:23', '2016-12-16 07:47:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('123765ea03ab322c887e0eef28944ff4bc2457a083e4205f133b7bbad4f3d6c85793ed7707b89086', '2e66114eed8ee9a6912c51ac5dd9609278fd7b2cbe29ea974a175a325c20d492308f55dce8bce042', 0, '2017-01-15 20:04:28'),
('35f4a4975d49debdc60c73461307abca623aca8260da45932849e3f63616a7eaf5416f3c177726ae', '5277598e533c16d2b819e475ca901d74edd44f4046cd7b53b465a7739f9d41daa626a9579a6bab7a', 0, '2017-01-15 18:25:37'),
('3b14e456dc458882ab4d72a54a8a37440b589a6e2d4e6ed34876a3ad93820523bbc664e2bebd8440', 'a5183ad84abf743a9499e6c49aae69eefb0d67e1ee01f4695ac3163c146da712aa9fe3e53d7fec52', 0, '2017-01-15 18:18:57'),
('97bc9b7cf917e9b7fb090a2bcd0e852cc0e08dcf2b13f08214caa1e182b46b49ffc218ce83ed73db', '0bb59bea28c7ae1f5fb010fa1eb5987a28e15d6af8a3a1ae3ef7fbf06bf152be633922a86a54d5a4', 0, '2017-01-15 18:25:25'),
('dc47076881f4be1454c526bf22a36b81c4e55e07c0242a5264a8fe997ef36741cab49145353c82c9', '92d02877ad68e9d4751dd0fa0eae66ded8c503eaf471fad31d30c10253f82ed6cf14a063aacb8918', 0, '2017-01-15 18:28:51'),
('f45c5c9771b9003397bf1779d34bb1375673095749aa579cec3cdb6347ba375522df8e4905b04acd', 'f8bcb309da81e1ad6cd4eda1c3aa5657735d934f91cb1474d17afa1b5c00f63b071e5a24e139190d', 0, '2017-01-15 18:41:32'),
('f7d8e3fa6250a1d357954e3543c28a0f2c813ebc05e23094da8d5862219e78e83f0df95d21327a41', '0e328e57e84dea55dcc41a5f5ff104d1a941307d2185808844dbcdd7e64acd05111da77befffc671', 0, '2017-01-15 18:56:16');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `name`) VALUES
(1, 'Iron Man'),
(2, 'Captain America'),
(3, 'Thor'),
(4, 'Black Widow'),
(5, 'Wolverine'),
(6, 'Storm'),
(7, 'Rogue'),
(8, 'Professor X');

-- --------------------------------------------------------

--
-- Table structure for table `person_address`
--

CREATE TABLE IF NOT EXISTS `person_address` (
  `person_id` int(10) unsigned NOT NULL,
  `address_id` int(10) unsigned NOT NULL,
  `active_from` datetime NOT NULL,
  `active_thru` datetime DEFAULT NULL,
  `is_primary` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`person_id`,`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person_address`
--

INSERT INTO `person_address` (`person_id`, `address_id`, `active_from`, `active_thru`, `is_primary`) VALUES
(1, 1, '2014-01-01 00:00:00', NULL, 1),
(3, 2, '2014-10-01 00:00:00', NULL, NULL),
(8, 3, '2013-07-20 11:59:59', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `country_id`, `name`) VALUES
(1, 1, 'ACT'),
(2, 1, 'NSW'),
(3, 1, 'NT'),
(4, 1, 'QLD'),
(5, 1, 'SA'),
(6, 1, 'TAS'),
(7, 1, 'VIC'),
(8, 1, 'WA');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
