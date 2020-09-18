-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2020 at 02:28 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', 'test123', '09-08-2020 12:05:25 AM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'Electrical', 'Fans, lights, electricity, etc', '2017-03-28 07:10:55', '2020-09-17 06:21:07'),
(2, 'Plumber', 'Sink, water, etc', '2017-06-11 10:54:06', '2020-09-17 06:21:57'),
(3, 'Carpenter', 'Cupboard, nail, door, window, etc', '2020-09-17 06:23:11', NULL),
(4, 'Other', 'Special case', '2020-09-17 07:41:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaintremark`
--

INSERT INTO `complaintremark` (`id`, `complaintNumber`, `status`, `remark`, `remarkDate`) VALUES
(9, 27, 'in process', 'sent engineer', '2020-09-17 20:13:08'),
(10, 27, 'closed', 'Done', '2020-09-17 20:20:41'),
(11, 28, 'in process', 'cannot find engineer', '2020-09-17 20:22:06');

-- --------------------------------------------------------

--
-- Table structure for table `englogin`
--

CREATE TABLE `englogin` (
  `id` int(10) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `englogin`
--

INSERT INTO `englogin` (`id`, `password`) VALUES
(1234, 'engineer');

-- --------------------------------------------------------

--
-- Table structure for table `hall`
--

CREATE TABLE `hall` (
  `id` int(11) NOT NULL,
  `hall` varchar(255) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hall`
--

INSERT INTO `hall` (`id`, `hall`, `description`, `postingDate`, `updationDate`) VALUES
(14, 'Utility', 'Utility Building', '2020-09-17 07:37:18', NULL),
(16, 'E2 bungalow', 'E2  bungalow', '2020-09-17 07:39:55', NULL),
(19, 'E1 Bungalow', 'E1 Bungalow', '2020-09-17 07:47:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(5, 1, 'Wifi ', '2020-09-17 06:24:27', NULL),
(6, 4, 'general', '2020-09-17 07:41:50', NULL),
(7, 4, 'Food', '2020-09-17 15:45:53', NULL),
(8, 3, 'pest control', '2020-09-17 20:22:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `complaintType` varchar(255) DEFAULT NULL,
  `hall` varchar(255) DEFAULT NULL,
  `room` int(11) NOT NULL,
  `complaintDetails` mediumtext DEFAULT NULL,
  `pdt` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`complaintNumber`, `userId`, `category`, `subcategory`, `complaintType`, `hall`, `room`, `complaintDetails`, `pdt`, `regDate`, `status`, `lastUpdationDate`) VALUES
(27, 6, 1, 'Wifi ', 'General Query', 'Utility', 312, 'today 2pm', '', '2020-09-17 19:37:45', 'closed', '2020-09-17 20:20:41'),
(28, 6, 2, 'Select Subcategory', ' Complaint', 'Utility', 108, 'tomorrow 6pm', '', '2020-09-17 19:48:15', 'in process', '2020-09-17 20:22:06'),
(29, 6, 3, 'Select Subcategory', ' Complaint', 'E2 bungalow', 108, '', 'today right now', '2020-09-17 19:51:26', NULL, NULL),
(30, 6, 1, 'Wifi ', ' Complaint', 'Utility', 108, 'wifi not working', 'today 9pm', '2020-09-17 20:10:03', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `email`, `userip`, `loginTime`, `logout`, `status`) VALUES
(27, 0, 'Takia', 0x3a3a3100000000000000000000000000, '2020-09-04 17:27:43', '', 0),
(28, 0, 'Takia', 0x3a3a3100000000000000000000000000, '2020-09-04 17:27:50', '', 0),
(29, 0, 'takia1404@gmail.com', 0x3a3a3100000000000000000000000000, '2020-09-04 17:28:14', '', 0),
(30, 0, 'Cony', 0x3a3a3100000000000000000000000000, '2020-09-04 17:28:51', '', 0),
(31, 3, 'someone@email.com', 0x3a3a3100000000000000000000000000, '2020-09-04 17:29:50', '', 1),
(32, 3, 'someone@email.com', 0x3a3a3100000000000000000000000000, '2020-09-04 18:01:24', '04-09-2020 11:32:11 PM', 1),
(33, 3, 'someone@email.com', 0x3a3a3100000000000000000000000000, '2020-09-04 19:16:31', '', 1),
(34, 3, 'someone@email.com', 0x3a3a3100000000000000000000000000, '2020-09-04 23:30:40', '', 1),
(35, 4, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-15 11:59:01', '15-09-2020 05:31:03 PM', 1),
(36, 4, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-15 12:08:56', '', 1),
(37, 5, 'takia@iut.com', 0x3a3a3100000000000000000000000000, '2020-09-16 04:28:34', '16-09-2020 10:03:21 AM', 1),
(38, 6, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 06:34:33', '17-09-2020 12:07:08 PM', 1),
(39, 6, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 08:29:14', '17-09-2020 02:15:04 PM', 1),
(40, 6, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 08:53:27', '17-09-2020 09:44:12 PM', 1),
(41, 6, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 15:58:01', '17-09-2020 10:20:09 PM', 1),
(42, 6, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 17:03:49', '18-09-2020 12:29:57 AM', 1),
(43, 0, 'tabia1404@gmail.com', 0x3a3a3100000000000000000000000000, '2020-09-17 18:31:42', '', 0),
(44, 0, 'tabia1404@gmail.com', 0x3a3a3100000000000000000000000000, '2020-09-17 18:32:09', '', 0),
(45, 0, 'tabia1404@gmail.com', 0x3a3a3100000000000000000000000000, '2020-09-17 18:34:02', '', 0),
(46, 0, 'tabia1404@gmail.com', 0x3a3a3100000000000000000000000000, '2020-09-17 18:34:41', '', 0),
(47, 6, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 18:35:04', '', 1),
(48, 6, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 18:47:05', '18-09-2020 12:49:36 AM', 1),
(49, 0, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 19:16:59', '', 0),
(50, 0, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 19:17:09', '', 0),
(51, 0, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 19:21:19', '', 0),
(52, 6, '', 0x3a3a3100000000000000000000000000, '2020-09-17 19:21:44', '', 1),
(53, 6, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 19:34:48', '18-09-2020 01:34:52 AM', 1),
(54, 6, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 19:36:47', '18-09-2020 01:38:16 AM', 1),
(55, 6, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 19:47:35', '18-09-2020 01:48:19 AM', 1),
(56, 6, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 19:50:11', '18-09-2020 01:51:32 AM', 1),
(57, 6, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 20:07:56', '18-09-2020 02:10:07 AM', 1),
(58, 6, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 20:13:35', '18-09-2020 02:15:04 AM', 1),
(59, 6, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 20:17:03', '18-09-2020 02:19:53 AM', 1),
(60, 6, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 20:21:00', '18-09-2020 02:21:21 AM', 1),
(61, 6, 'takiamosharref@iut-dhaka.edu', 0x3a3a3100000000000000000000000000, '2020-09-17 20:23:56', '18-09-2020 02:50:20 AM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sid` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactNo` bigint(11) DEFAULT NULL,
  `hall` varchar(255) DEFAULT NULL,
  `room` int(11) NOT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `sid`, `password`, `contactNo`, `hall`, `room`, `userImage`, `regDate`, `status`) VALUES
(2, 'Takia', 'takia1404@gmail.com', 0, '81dc9bdb52d04dc20036dbd8313ed055', 0, NULL, 0, NULL, '2020-09-04 17:27:30', 1),
(6, 'Takia Mosharref', 'takiamosharref@iut-dhaka.edu', 0, '186a157b2992e7daed3677ce8e9fe40f', 0, 'Utility', 108, 'eaba5b931f8e8dea26145045acfbe3aa.jpg', '2020-09-17 06:34:15', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `englogin`
--
ALTER TABLE `englogin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hall`
--
ALTER TABLE `hall`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `hall`
--
ALTER TABLE `hall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
