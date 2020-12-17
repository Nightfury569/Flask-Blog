-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2020 at 07:05 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `connection`
--

-- --------------------------------------------------------

--
-- Table structure for table `feed`
--

CREATE TABLE `feed` (
  `feedback_id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `feedback` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `person_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(20) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `user-name` varchar(15) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `user-name`, `password`, `name`) VALUES
(1, 'Pain', 'Pch', 'Prantik');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `sl_num` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `subheading` varchar(25) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `img2` varchar(400) DEFAULT NULL,
  `n` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`sl_num`, `name`, `slug`, `title`, `subheading`, `content`, `date`, `img2`, `n`) VALUES
(1, 'Prantik', '', 'My first post', 'It\'s about yesterday', 'I ate rice yesterday.', '2020-07-10 18:16:03', 'https://scontent.fccu11-1.fna.fbcdn.net/v/t1.0-9/97049418_741390416398107_6436518962804031488_n.jpg?_nc_cat=100&_nc_sid=09cbfe&_nc_ohc=SqQbm16hHJAAX_p8WKo&_nc_ht=scontent.fccu11-1.fna&oh=dd39664f14cd2c9a40dbef46e1bc5b7f&oe=5F2B529E', 1),
(2, 'Max', 'Max', 'The sun', 'How hot is the sun ?', 'It\'s temprature is around 5778K', '2020-07-11 00:04:25', 'https://img.etimg.com/thumb/msid-75488540,width-640,resizemode-4,imgsize-573673/low-power-mode.jpg', 1),
(3, 'Michelle', 'Michelle', 'The stars', 'Facts:', 'They are more than 4.24 light-years away.', '2020-07-11 01:22:22', 'https://cdn.britannica.com/38/111338-050-D23BE7C8/Stars-NGC-290-Hubble-Space-Telescope.jpg', 2),
(12, 'Navin', 'Navin', 'Random', 'I am good', '', '2020-07-11 00:45:44', '', NULL),
(13, 'Prantik', 'Prantik', '2nd Time', 'Ok bro', '', '2020-07-11 00:46:28', 'https://scontent.fccu11-1.fna.fbcdn.net/v/t1.0-9/97049418_741390416398107_6436518962804031488_n.jpg?_nc_cat=100&_nc_sid=09cbfe&_nc_ohc=SqQbm16hHJAAX_p8WKo&_nc_ht=scontent.fccu11-1.fna&oh=dd39664f14cd2c9a40dbef46e1bc5b7f&oe=5F2B529E', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feed`
--
ALTER TABLE `feed`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`sl_num`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feed`
--
ALTER TABLE `feed`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `sl_num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
