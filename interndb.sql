-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 10, 2018 at 04:04 PM
-- Server version: 5.7.17-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `interndb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`) VALUES
(5, NULL),
(8, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `knex_migrations`
--

CREATE TABLE `knex_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `knex_migrations`
--

INSERT INTO `knex_migrations` (`id`, `name`, `batch`, `migration_time`) VALUES
(1, '20180506192905_create_user_table.js', 1, '2018-05-06 12:34:10');

-- --------------------------------------------------------

--
-- Table structure for table `knex_migrations_lock`
--

CREATE TABLE `knex_migrations_lock` (
  `is_locked` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `knex_migrations_lock`
--

INSERT INTO `knex_migrations_lock` (`is_locked`) VALUES
(0);

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE `lecturer` (
  `id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`id`, `name`) VALUES
(6, 'Lê Đình Thanh');

-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

CREATE TABLE `partner` (
  `id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `partner`
--

INSERT INTO `partner` (`id`, `name`) VALUES
(3, 'SAMSUNG Việt Nam'),
(7, 'Framgia');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `mssv` varchar(10) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `class` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `khoa` int(10) DEFAULT NULL,
  `nganh` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `diachi` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `ngaysinh` date DEFAULT NULL,
  `emailVNU` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `GPA` double DEFAULT NULL,
  `namtotnghiep` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `mssv`, `class`, `khoa`, `nganh`, `diachi`, `ngaysinh`, `emailVNU`, `GPA`, `namtotnghiep`) VALUES
(1, 'Lưu Quang Tùng', '16020036', 'QH2016-I/CQ-C-CLC', 61, 'Công nghệ thông tin', NULL, '1998-12-18', NULL, 2.9, 2020),
(2, 'Trương Hoàng Giang', '160020069', 'QH2016-I/CQ-C-CLC', 61, 'Công nghệ thông tin', NULL, '1998-10-23', NULL, 3.9, 2020),
(4, 'Trần Quang Bách', NULL, 'QH2016-I/CQ-C-A-C', 61, 'Khoa học máy tính', NULL, '1998-06-05', NULL, 4, 2020);

-- --------------------------------------------------------

--
-- Table structure for table `studenteditable`
--

CREATE TABLE `studenteditable` (
  `id` int(10) NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `skypeID` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `facebook` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `vitri` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `kynang` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `chungchi` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `kinhnghiem` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `sothich` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `dinhhuong` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `ghichu` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `studenteditable`
--

INSERT INTO `studenteditable` (`id`, `email`, `skypeID`, `facebook`, `phone`, `vitri`, `kynang`, `chungchi`, `kinhnghiem`, `sothich`, `dinhhuong`, `ghichu`) VALUES
(1, 'tungluu18@gmail.com', NULL, NULL, '0964 537 271', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'giangth2310@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `avatar` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `type`, `avatar`) VALUES
(1, 'tungluu18', '$2a$10$Zir6WjTWket3iLFT6FK1pueK7BBc8UY7ZWXlq44VqIOzkok2PyDwu', 'student', '/avatar/1.jpg'),
(2, 'giangth2310', '$2a$10$x.THs51X7VVtuUFy/qaXDeLC99FnLrZmx4HNLp7UonnBceyPHSfly', 'student', '/avatar/2.jpg'),
(3, 'samsungvn', '$2a$10$P2unJ0iu1smIsIuJq.meROfDxiOYk6/.pvBqV6NNUsFA7d5OtL.9W', 'partner', '/avatar/3.jpg'),
(4, 'tranquangbach', '$2a$10$ecbRK4snDNwdjs91qcPxf.DHHfgk4hA/xCmmoJghC5DlohOglJemi', 'student', NULL),
(5, 'quanlysinhvien', '$2a$10$LnkVas0fW3e.n0OK.sAKTu7yD5EkTF3tH1C98khPPhhElKfDcWua2', 'admin', NULL),
(6, 'ledinhthanh', '$2a$10$UccMFPoyBKiv/tKTCMBg4eVOV7/SHGbjb.w83EXb.yDaXtgBWfxSq', 'lecturer', NULL),
(7, 'framgia', '$2a$10$FL0Gqr0DkjxEUafk8BWZpO.oIFMcjxm85sUvIEmFrrNfkE6Ya33Im', 'partner', NULL),
(8, 'pdt', '$2a$10$rJGuw8GzppfOwRQ7Cvr5f.7kLkPehpCy1oe/uk9ZRqeGYug3jT/0C', 'admin', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `knex_migrations`
--
ALTER TABLE `knex_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `studenteditable`
--
ALTER TABLE `studenteditable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `knex_migrations`
--
ALTER TABLE `knex_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lecturer`
--
ALTER TABLE `lecturer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `partner`
--
ALTER TABLE `partner`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `studenteditable`
--
ALTER TABLE `studenteditable`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_admin` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD CONSTRAINT `fk_lecturer` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `partner`
--
ALTER TABLE `partner`
  ADD CONSTRAINT `fk_partner` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studenteditable`
--
ALTER TABLE `studenteditable`
  ADD CONSTRAINT `fk_studentEditable` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
