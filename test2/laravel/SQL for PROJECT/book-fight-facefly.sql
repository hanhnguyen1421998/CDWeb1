-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2019 at 10:26 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fight-facefly_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

CREATE TABLE `airports` (
  `airport_id` int(11) NOT NULL,
  `airport_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `airport_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `airport_city_id` tinyint(4) NOT NULL,
  `airport_province_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `airports`
--

INSERT INTO `airports` (`airport_id`, `airport_name`, `airport_code`, `airport_city_id`, `airport_province_id`) VALUES
(1, 'Sân Bay Nội Bài', 'VVNB/HAN', 2, 1),
(2, 'Sân Bay Tân Sơn Nhất', 'VVTS/SGN', 1, 2),
(3, 'Sân Bay Liên Khương', 'VVDL/DLI', 6, 4),
(4, 'Sân Bay Quốc Tế Đà Năng', 'VVDN/DAD', 5, 3),
(5, 'Sân bay Phù Cát – Bình Định', 'VVPC/UIH', 0, 6),
(6, 'Sân bay Tuy Hòa – Phú Yên', 'VVTH/TBB', 0, 5),
(7, 'Sân bay Quốc tế Cần Thơ', 'VVCT/VCA', 0, 7),
(8, 'Sân Bay Quốc Vĩnh', 'QC/TDC', 0, 2),
(9, 'Sân Bay Changi', 'IATA', 3, 0),
(10, 'Sân bay Hartsfield Jackson Atlanta', 'ATL', 8, 0),
(11, 'sân bay John F. Kennedy', 'JFK', 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `airways`
--

CREATE TABLE `airways` (
  `airways_id` int(11) NOT NULL,
  `airways_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `airway_country_id` tinyint(4) NOT NULL,
  `airways_total_revanue` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `airways`
--

INSERT INTO `airways` (`airways_id`, `airways_name`, `airway_country_id`, `airways_total_revanue`) VALUES
(1, 'Vietjet air', 1, 3150000),
(2, 'Vietnam Airlines', 1, 15525000),
(3, 'JetStar', 1, 14175000),
(4, 'Japan Airlines', 3, 0),
(5, 'All Nippon Airways', 7, 0),
(6, 'Cathay Pacific', 5, 0),
(7, 'Lufthansa', 2, 0),
(8, 'Hainan Airlines', 4, 0),
(9, 'Thai Airways', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(4) NOT NULL,
  `country_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `country_coop` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`, `country_coop`) VALUES
(1, 'Việt Nam', '1-3-7-4'),
(2, 'Đức', ''),
(3, 'Nhật Bản', '1-7'),
(4, 'Trung Quốc', '1'),
(5, 'Hồng Công', '1'),
(6, 'Thái Lan', '1'),
(7, 'Mỹ', '3-7');

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `flight_id` int(11) NOT NULL,
  `airways_id` int(11) NOT NULL,
  `flight_time_from` datetime NOT NULL,
  `flight_time_to` datetime NOT NULL,
  `flight_city_from_id` tinyint(4) NOT NULL,
  `flight_city_to_id` tinyint(4) NOT NULL,
  `flight_price` double NOT NULL,
  `flight_parent_id` tinyint(4) DEFAULT '0',
  `flight_seat` tinyint(4) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`flight_id`, `airways_id`, `flight_time_from`, `flight_time_to`, `flight_city_from_id`, `flight_city_to_id`, `flight_price`, `flight_parent_id`, `flight_seat`, `updated_at`, `created_at`) VALUES
(1, 2, '2019-05-14 00:00:00', '2019-05-15 00:00:00', 1, 3, 2100000, 0, 3, '2019-03-26 11:34:09', '2019-03-14 09:31:59'),
(2, 8, '2019-05-14 00:00:00', '2019-05-18 00:00:00', 1, 4, 6300000, 0, 2, '2019-03-25 13:51:43', '2019-03-14 13:30:56'),
(3, 8, '2019-05-14 00:00:00', '2019-05-18 00:00:00', 1, 4, 6300000, 2, 2, '2019-03-25 13:45:42', '2019-03-14 13:31:05'),
(4, 2, '2019-05-14 00:00:00', '2019-05-15 00:00:00', 1, 2, 525000, 0, 20, '2019-04-01 15:24:30', '2019-03-14 13:48:47'),
(5, 3, '2019-05-15 00:00:00', '2019-05-15 00:00:00', 2, 1, 1050000, 0, 9, '2019-04-01 15:24:30', '2019-03-14 13:49:34'),
(11, 1, '2019-05-21 21:44:00', '2019-05-21 21:44:00', 1, 5, 525000, 0, 0, '2019-03-21 21:45:34', '2019-03-21 21:45:34'),
(14, 1, '2019-05-23 22:00:00', '2019-05-23 06:00:00', 1, 10, 3150000, 0, 1, '2019-03-23 22:35:12', '2019-03-23 18:58:11'),
(15, 4, '2019-04-24 09:30:00', '2019-04-29 00:30:00', 9, 8, 30000000, 0, 10, '2019-03-24 09:51:41', '2019-03-24 09:40:05'),
(16, 3, '2019-04-25 05:30:00', '2019-04-26 10:30:00', 5, 9, 6000000, 0, 0, '2019-03-24 10:15:50', '2019-03-24 10:15:50'),
(17, 2, '2019-05-24 10:30:00', '2019-05-25 02:00:00', 1, 8, 1050000, 18, 0, '2019-03-24 10:20:07', '2019-03-24 10:20:07'),
(18, 5, '2019-05-24 10:30:00', '2019-05-25 02:00:00', 7, 8, 50000, 0, 0, '2019-03-24 10:20:07', '2019-03-24 10:20:07'),
(19, 2, '2019-04-26 22:24:00', '2019-04-26 22:24:00', 1, 5, 2000000, 0, 0, '2019-03-26 22:24:32', '2019-03-26 22:24:32'),
(21, 5, '2019-04-26 22:25:00', '2019-04-26 22:25:00', 7, 10, 500000, 0, 0, '2019-03-26 22:26:26', '2019-03-26 22:26:26'),
(22, 2, '2019-05-29 13:03:00', '2019-05-29 13:03:00', 1, 6, 2100000, 0, 0, '2019-03-29 13:04:01', '2019-03-29 13:04:01'),
(23, 3, '2019-04-29 13:04:00', '2019-05-29 13:04:00', 6, 1, 2000000, 0, 0, '2019-03-29 13:04:50', '2019-03-29 13:04:50'),
(24, 2, '2019-04-29 13:06:00', '2019-04-30 13:06:00', 1, 9, 3000000, 0, 1, '2019-03-29 15:20:07', '2019-03-29 13:07:47'),
(26, 2, '2019-05-29 14:21:00', '2019-05-29 14:21:00', 1, 10, 525000, 0, 0, '2019-03-29 14:21:33', '2019-03-29 14:21:33');

-- --------------------------------------------------------

--
-- Table structure for table `flights_booking`
--

CREATE TABLE `flights_booking` (
  `booking_id` int(11) NOT NULL,
  `user_id` tinyint(4) NOT NULL,
  `fb_flight_id` int(11) NOT NULL,
  `total_price` double NOT NULL,
  `fb_total_person` tinyint(4) DEFAULT '0',
  `Payment_Method` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `card_number` int(3) DEFAULT NULL,
  `card_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ccv_code` int(3) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flights_booking`
--

INSERT INTO `flights_booking` (`booking_id`, `user_id`, `fb_flight_id`, `total_price`, `fb_total_person`, `Payment_Method`, `card_number`, `card_name`, `ccv_code`, `updated_at`, `created_at`) VALUES
(32, 10, 4, 2362500, 3, 'credit_card', 223, 'Visa', 33, '2019-04-01 15:24:30', '2019-04-01 15:24:30'),
(33, 10, 5, 4725000, 3, 'credit_card', 223, 'Visa', 33, '2019-04-01 15:24:30', '2019-04-01 15:24:30');

-- --------------------------------------------------------

--
-- Table structure for table `list_cities`
--

CREATE TABLE `list_cities` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_country_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `list_cities`
--

INSERT INTO `list_cities` (`city_id`, `city_name`, `city_code`, `city_country_id`) VALUES
(1, 'TP. Hồ Chí Minh', 'SNG', 1),
(2, 'Hà Nội', 'HAN', 1),
(3, 'Singapore', 'SIN', 0),
(4, 'PuSan', 'PUS', 0),
(5, 'Đà Nẵng', 'DAD', 1),
(6, 'Đà Lạt', 'DAL', 1),
(7, ' New York', 'NY', 7),
(8, 'Los Angeles', 'LA', 7),
(9, 'Tokyo', 'TKO', 3),
(10, 'OSaKa', 'OSA', 3);

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `passenger_id` int(11) NOT NULL,
  `passenger_title` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `passenger_first_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `passenger_last_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `passenger_user_id` tinyint(4) NOT NULL,
  `passenger_fl_id` tinyint(4) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`passenger_id`, `passenger_title`, `passenger_first_name`, `passenger_last_name`, `passenger_user_id`, `passenger_fl_id`, `updated_at`, `created_at`) VALUES
(33, 'mr', 'Hạnh', 'Nguyễn', 10, 4, NULL, NULL),
(34, 'mr', 'Phúc', 'Nguyễn', 10, 4, NULL, NULL),
(35, 'mr', 'Vĩnh', 'Dương', 10, 4, NULL, NULL),
(36, 'mr', 'Hạnh', 'Nguyễn', 10, 5, NULL, NULL),
(37, 'mr', 'Phúc', 'Nguyễn', 10, 5, NULL, NULL),
(38, 'mr', 'Vĩnh', 'Dương', 10, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `province_id` int(11) NOT NULL,
  `province_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`province_id`, `province_name`) VALUES
(1, 'Hà Nội'),
(2, 'Thành phố Hồ Chí Minh'),
(3, 'Đà Nẵng'),
(4, 'Lâm Đồng'),
(5, 'Phú Yên'),
(6, 'Bình Định'),
(7, 'Cần Thơ');

-- --------------------------------------------------------

--
-- Table structure for table `transit`
--

CREATE TABLE `transit` (
  `transit_id` int(11) NOT NULL,
  `transit_city_id` tinyint(4) NOT NULL,
  `transit_time` datetime NOT NULL,
  `flight_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `user_phone` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_gender` int(2) DEFAULT NULL,
  `user_bird` date DEFAULT NULL,
  `user_adress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempt` int(2) DEFAULT NULL,
  `last_access` datetime DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `user_phone`, `user_gender`, `user_bird`, `user_adress`, `attempt`, `last_access`, `remember_token`, `created_at`, `updated_at`, `level`) VALUES
(10, 'hanh', 'hanh@gmail.com', NULL, '$2y$10$hL6WO8KnUP4GjtPH.ezTpemmUFqHD2sAqgTf38z0hYojDFJDgtZvC', NULL, NULL, NULL, NULL, 0, '2019-04-01 03:22:31', NULL, '2019-04-01 08:14:46', '2019-04-01 08:22:31', 0),
(11, 'HanhNguyen', 'admin@gmail.com', NULL, '$2y$10$nGtwueW1w31JxENra4vbz.UFlVJ0OBrVlXY6RueFdxQcXC6T0XrIq', '0333688942', 1, '1998-02-14', 'Thủ Đức', 0, '2019-04-01 03:19:40', NULL, '2019-04-01 08:17:36', '2019-04-01 08:19:41', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`airport_id`);

--
-- Indexes for table `airways`
--
ALTER TABLE `airways`
  ADD PRIMARY KEY (`airways_id`),
  ADD UNIQUE KEY `airways_id` (`airways_id`),
  ADD KEY `airways_id_2` (`airways_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`flight_id`),
  ADD UNIQUE KEY `flight_id` (`flight_id`),
  ADD KEY `flight_id_2` (`flight_id`),
  ADD KEY `airways_id` (`airways_id`),
  ADD KEY `flight_city_to_id` (`flight_city_to_id`),
  ADD KEY `flight_city_from_id` (`flight_city_from_id`);

--
-- Indexes for table `flights_booking`
--
ALTER TABLE `flights_booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `list_cities`
--
ALTER TABLE `list_cities`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`passenger_id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`province_id`);

--
-- Indexes for table `transit`
--
ALTER TABLE `transit`
  ADD PRIMARY KEY (`transit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airports`
--
ALTER TABLE `airports`
  MODIFY `airport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `airways`
--
ALTER TABLE `airways`
  MODIFY `airways_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `flights_booking`
--
ALTER TABLE `flights_booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `list_cities`
--
ALTER TABLE `list_cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `province_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transit`
--
ALTER TABLE `transit`
  MODIFY `transit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`airways_id`) REFERENCES `airways` (`airways_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
