-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 28, 2019 at 12:54 PM
-- Server version: 10.3.17-MariaDB-0+deb10u1
-- PHP Version: 7.3.11-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `factor`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_list`
--

CREATE TABLE `access_list` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rfid_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `access_list`
--

INSERT INTO `access_list` (`user_id`, `name`, `rfid_code`) VALUES
(3, 'bud', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `access_log`
--

CREATE TABLE `access_log` (
  `access_id` int(11) NOT NULL,
  `rfid_presented` varchar(20) DEFAULT NULL,
  `rfid_presented_datetime` datetime DEFAULT NULL,
  `rfid_granted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `access_log`
--

INSERT INTO `access_log` (`access_id`, `rfid_presented`, `rfid_presented_datetime`, `rfid_granted`) VALUES
(116, '1234', '2019-11-26 00:12:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `twilio_api_credentials`
--

CREATE TABLE `twilio_api_credentials` (
  `id` int(11) NOT NULL,
  `account_sid` varchar(50) NOT NULL,
  `auth_token` varchar(50) NOT NULL,
  `twilio_sms_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_list`
--
ALTER TABLE `access_list`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `rfid_code` (`rfid_code`);

--
-- Indexes for table `access_log`
--
ALTER TABLE `access_log`
  ADD PRIMARY KEY (`access_id`);

--
-- Indexes for table `twilio_api_credentials`
--
ALTER TABLE `twilio_api_credentials`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_list`
--
ALTER TABLE `access_list`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `access_log`
--
ALTER TABLE `access_log`
  MODIFY `access_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
