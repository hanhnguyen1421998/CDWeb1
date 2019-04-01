-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2019 at 09:57 AM
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
-- Database: `book-fight-facefly`
--

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

CREATE TABLE `airports` (
  `id_airport` int(11) NOT NULL,
  `name_airport` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `airports`
--

INSERT INTO `airports` (`id_airport`, `name_airport`) VALUES
(1, 'Sân bay Tân Sơn Nhất'),
(2, 'Sân bay Nội Bài'),
(3, 'Sân bay Seoul'),
(4, 'Sân bay Đà Nẵng'),
(5, 'Sân bay Tokyo'),
(6, 'Sân bay Singapore'),
(7, 'Sân bay BangKok'),
(8, 'Sân bay Berlin'),
(9, 'Sân bay Pusan');

-- --------------------------------------------------------

--
-- Table structure for table `airways`
--

CREATE TABLE `airways` (
  `airways_id` int(11) NOT NULL,
  `airways_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `airways`
--

INSERT INTO `airways` (`airways_id`, `airways_name`) VALUES
(1, 'Vietjet air'),
(2, 'Vietnam Airlines'),
(3, 'JetStar'),
(4, 'Seoul Airline'),
(5, 'Berlin Airline'),
(6, 'Tokyo Airline'),
(7, 'Pusan Airline'),
(8, 'BangKok Airline');

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
  `flight_direction` int(11) NOT NULL,
  `flight_price` double NOT NULL,
  `flight_parent_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`flight_id`, `airways_id`, `flight_time_from`, `flight_time_to`, `flight_city_from_id`, `flight_city_to_id`, `flight_direction`, `flight_price`, `flight_parent_id`) VALUES
(3, 2, '2019-02-22 18:45:00', '2019-02-22 19:50:00', 1, 2, 0, 823, 0),
(4, 2, '2019-02-22 18:00:00', '2019-02-22 02:55:00', 3, 4, 1, 431, 3),
(5, 3, '2019-02-22 17:45:00', '2019-02-22 03:00:00', 5, 6, 1, 4315, 0),
(6, 1, '2019-02-22 18:45:00', '2019-02-22 02:55:00', 2, 4, 0, 5000, 0),
(7, 2, '2019-02-22 14:30:00', '2019-02-22 02:55:00', 2, 3, 0, 5000, 5),
(8, 1, '2019-02-22 14:30:00', '2019-02-22 02:55:00', 2, 3, 0, 50000, 0),
(9, 3, '2019-02-22 18:45:00', '2019-02-22 19:50:00', 1, 2, 1, 823, 0),
(10, 1, '2019-02-22 17:45:00', '2019-02-22 02:50:00', 2, 1, 1, 1000, 0),
(11, 3, '2019-02-22 18:00:00', '2019-02-22 02:55:00', 2, 1, 1, 431, 3);

-- --------------------------------------------------------

--
-- Table structure for table `flights_booking`
--

CREATE TABLE `flights_booking` (
  `booking_id` int(11) NOT NULL,
  `user_id` tinyint(4) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `total_price` double NOT NULL,
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

INSERT INTO `flights_booking` (`booking_id`, `user_id`, `flight_id`, `total_price`, `Payment_Method`, `card_number`, `card_name`, `ccv_code`, `updated_at`, `created_at`) VALUES
(1, 5, 3, 8230, 'transfer', 103, 'Visa', 123, '2019-03-05 22:17:04', '2019-03-05 22:17:04'),
(2, 5, 3, 823, 'transfer', NULL, NULL, NULL, '2019-03-07 09:10:02', '2019-03-07 09:10:02'),
(3, 6, 1, 20000, 'transfer', NULL, NULL, NULL, '2019-03-09 17:37:39', '2019-03-09 17:37:39'),
(4, 5, 1, 20000, 'transfer', NULL, NULL, NULL, '2019-03-10 08:04:40', '2019-03-10 08:04:40'),
(5, 5, 1, 20000, 'transfer', NULL, NULL, NULL, '2019-03-10 08:05:09', '2019-03-10 08:05:09'),
(6, 5, 1, 20000, 'transfer', NULL, NULL, NULL, '2019-03-10 08:06:21', '2019-03-10 08:06:21'),
(7, 5, 1, 20000, 'transfer', NULL, NULL, NULL, '2019-03-10 08:10:22', '2019-03-10 08:10:22'),
(8, 5, 1, 20000, 'transfer', NULL, NULL, NULL, '2019-03-10 08:11:00', '2019-03-10 08:11:00'),
(9, 8, 1, 20000, 'credit_card', 105, 'Visa', 49, '2019-03-11 19:30:25', '2019-03-11 19:30:25'),
(10, 8, 1, 20000, 'transfer', NULL, NULL, NULL, '2019-03-13 22:24:24', '2019-03-13 22:24:24'),
(11, 8, 1, 20000, 'transfer', NULL, NULL, NULL, '2019-03-13 22:25:49', '2019-03-13 22:25:49'),
(12, 8, 1, 20000, 'transfer', NULL, NULL, NULL, '2019-03-14 13:24:54', '2019-03-14 13:24:54'),
(13, 8, 1, 20000, 'transfer', NULL, NULL, NULL, '2019-03-14 13:25:39', '2019-03-14 13:25:39');

-- --------------------------------------------------------

--
-- Table structure for table `flight_class`
--

CREATE TABLE `flight_class` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flight_class`
--

INSERT INTO `flight_class` (`id`, `name`) VALUES
(1, 'Economy Flex'),
(2, 'Economy Standard'),
(3, 'Business');

-- --------------------------------------------------------

--
-- Table structure for table `list_cities`
--

CREATE TABLE `list_cities` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_airport` int(11) NOT NULL,
  `id_national` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `list_cities`
--

INSERT INTO `list_cities` (`city_id`, `city_name`, `city_code`, `id_airport`, `id_national`) VALUES
(1, 'TP. Hồ Chí Minh', 'SNG', 1, 1),
(2, 'Hà Nội', 'HAN', 2, 1),
(3, 'Singapore', 'SIN', 6, 5),
(4, 'PuSan', 'PUS', 9, 2),
(5, 'Đà Nẵng', 'DAD', 4, 1),
(6, 'Đà Lạt', 'DAL', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `national_flight`
--

CREATE TABLE `national_flight` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `national_flight`
--

INSERT INTO `national_flight` (`id`, `name`) VALUES
(1, 'Viet Nam'),
(2, 'Korean'),
(3, 'ThaiLand'),
(4, 'Austraylia'),
(5, 'Singapore'),
(6, 'American');

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
(24, 'mr', 'Hanh', 'Nguyen', 8, 3, '2019-03-13 22:25:49', '2019-03-13 22:25:49'),
(25, 'mr', 'Phuc', 'Nguyen', 8, 3, '2019-03-13 22:25:49', '2019-03-13 22:25:49'),
(26, 'mr', 'Hanh', 'Nguyen', 8, 9, '2019-03-14 13:24:54', '2019-03-14 13:24:54'),
(27, 'mr', 'Phuc', 'Nguyen', 8, 9, '2019-03-14 13:24:54', '2019-03-14 13:24:54'),
(28, 'mr', 'aaaa', 'axx', 8, 6, '2019-03-14 13:25:39', '2019-03-14 13:25:39'),
(29, 'mr', 'bbbbbb', 'aaaaa', 8, 6, '2019-03-14 13:25:39', '2019-03-14 13:25:39'),
(30, 'mr', 'wwwwwwwwwww', 'eeeeeeee', 8, 6, '2019-03-14 13:25:39', '2019-03-14 13:25:39');

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `user_phone`, `user_gender`, `user_bird`, `user_adress`, `attempt`, `last_access`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'Hạnh Nguyễn', 'hanh@gmail.com', NULL, '$2y$10$mPzcGs8cvgBsgix641hnReR9wvOx83bca9cSMzX5bikOjeyvyBbhi', '0333688942', 1, '1998-02-14', 'Thủ Đức', 0, '2019-03-14 01:14:11', NULL, '2019-03-11 12:02:55', '2019-03-14 06:14:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`id_airport`);

--
-- Indexes for table `airways`
--
ALTER TABLE `airways`
  ADD PRIMARY KEY (`airways_id`),
  ADD UNIQUE KEY `airways_id` (`airways_id`),
  ADD KEY `airways_id_2` (`airways_id`);

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
-- Indexes for table `flight_class`
--
ALTER TABLE `flight_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `list_cities`
--
ALTER TABLE `list_cities`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `national_flight`
--
ALTER TABLE `national_flight`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`passenger_id`);

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
  MODIFY `id_airport` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `airways`
--
ALTER TABLE `airways`
  MODIFY `airways_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `flights_booking`
--
ALTER TABLE `flights_booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `flight_class`
--
ALTER TABLE `flight_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `list_cities`
--
ALTER TABLE `list_cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `national_flight`
--
ALTER TABLE `national_flight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `transit`
--
ALTER TABLE `transit`
  MODIFY `transit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
