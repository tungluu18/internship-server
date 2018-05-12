-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 12, 2018 at 06:32 PM
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
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `donvi` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `vnumail` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `mail` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `donvi`, `vnumail`, `mail`, `phone`) VALUES
(5, 'Quản lý sinh viên', 'Đại học Công nghệ Đại học Quốc gia Hà Nội', NULL, NULL, NULL),
(8, 'Phòng Đào tạo', 'Đại học Công nghệ Đại học Quốc gia Hà Nội', NULL, NULL, NULL);

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
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `mail` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `vnumail` varchar(59) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `ghichu` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`id`, `name`, `mail`, `vnumail`, `phone`, `ghichu`) VALUES
(6, 'Lê Đình Thanh', 'ledinhthanh@gmail.com', 'thanhld@vnu.edu.vn', '0987 257 504 ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

CREATE TABLE `partner` (
  `id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `contact` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `thongtin` text COLLATE utf8mb4_vietnamese_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `partner`
--

INSERT INTO `partner` (`id`, `name`, `contact`, `thongtin`) VALUES
(3, 'SAMSUNG Việt Nam', NULL, NULL),
(7, 'Framgia', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `mssv` varchar(10) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `class` varchar(20) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `khoa` int(10) DEFAULT NULL,
  `nganh` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `diachi` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `ngaysinh` varchar(10) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `vnumail` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `GPA` double DEFAULT NULL,
  `namtotnghiep` year(4) DEFAULT NULL,
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
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `mssv`, `class`, `khoa`, `nganh`, `diachi`, `ngaysinh`, `vnumail`, `GPA`, `namtotnghiep`, `email`, `skypeID`, `facebook`, `phone`, `vitri`, `kynang`, `chungchi`, `kinhnghiem`, `sothich`, `dinhhuong`, `ghichu`) VALUES
(1, 'Lưu Quang Tùng', '16020036', 'QH2016-I/CQ-C-CLC', 61, 'Công nghệ thông tin', NULL, '1998-12-18', '16020036@vnu.edu.vn', 2.9, 2020, 'tungluu18@gmail.com', '2000$', 'Tùng Lưu', '0964 537 271', 'Phó bí thư', 'Code bằng MS word', NULL, 'Lập trình pascal và C++ 3 năm', 'asdasd', NULL, NULL),
(2, 'Con thủy quái', '16021294', 'QH2016-I/CQ-C-CLC', 61, 'Công nghệ thông tin', NULL, '1998-10-23', '16020069@vnu.edu.vn', 3.9, 2020, 'giangth2310@gmail.com', '5000$', 'Trương Hoàng Giang', '0964 537 272', 'Phó chi hội', 'Debug bằng mắt', NULL, 'React + Redux + Angular', '123123', NULL, NULL),
(4, 'Trần Quang Bách', '16020001', 'QH2016-I/CQ-C-A-C', 61, 'Khoa học máy tính', NULL, '1998-06-05', '16020001@vnu.edu.vn', 4, 2020, 'bachquangtran98@gmail.com', '10000$', 'Quang Bitch', '0964 537 272', 'Khối trưởng\n', 'Viết Server bằng Assembly', NULL, 'ML + AI + Python + Data Analyst', 'hahaahah', NULL, NULL),
(9, 'Doãn Chí Bình', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ahihik', NULL, NULL, NULL);

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
(1, 'tungluu18@gmail.com', 'asdasd', 'Tùng Lưu', '0964 537 271', 'Phó bí thư', 'Code bằng MS word', NULL, 'Lập trình pascal và C++ 3 năm', NULL, '2000$', NULL),
(2, 'giangth2310@gmail.com', '123123', 'Trương Hoàng Giang', '0964 537 272', 'Phó chi hội', 'Debug bằng mắt', NULL, 'React + Redux + Angular', NULL, '5000$', 'aaaaa'),
(4, 'bachquangtran98@gmail.com', 'hahaahah', 'Bách Quang', '0964 537 272', 'Khối trưởng', 'Viết Server bằng Assembly', NULL, 'ML + AI + Python + Data Analyst', NULL, '10000$', NULL),
(9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `studentxdxd`
--

CREATE TABLE `studentxdxd` (
  `id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `mssv` varchar(10) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `class` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `khoa` int(10) DEFAULT NULL,
  `nganh` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `diachi` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `ngaysinh` varchar(10) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `vnumail` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `GPA` double DEFAULT NULL,
  `namtotnghiep` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `studentxdxd`
--

INSERT INTO `studentxdxd` (`id`, `name`, `mssv`, `class`, `khoa`, `nganh`, `diachi`, `ngaysinh`, `vnumail`, `GPA`, `namtotnghiep`) VALUES
(1, 'Lưu Quang Tùng', '16020036', 'QH2016-I/CQ-C-CLC', 61, 'Công nghệ thông tin', NULL, '1998-12-18', '16020036@vnu.edu.vn', 2.9, 2020),
(2, 'Con thủy quái', '16021294', 'QH2016-I/CQ-C-CLC', 61, 'Công nghệ thông tin', NULL, '1998-10-23', '16020069@vnu.edu.vn', 3.9, 2020),
(4, 'Trần Quang Bách', '16020001', 'QH2016-I/CQ-C-A-C', 61, 'Khoa học máy tính', NULL, '1998-06-05', '16020001@vnu.edu.vn', 4, 2020);

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
(8, 'pdt', '$2a$10$rJGuw8GzppfOwRQ7Cvr5f.7kLkPehpCy1oe/uk9ZRqeGYug3jT/0C', 'admin', NULL),
(9, '15020063', '$2a$10$eIE6fUp5jHKOaMBRMCSWTuAOCZLUs2HVVfNaRRr.FE3bMulquptOO', 'student', NULL);

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
-- Indexes for table `studentxdxd`
--
ALTER TABLE `studentxdxd`
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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `studenteditable`
--
ALTER TABLE `studenteditable`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `studentxdxd`
--
ALTER TABLE `studentxdxd`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
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
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studenteditable`
--
ALTER TABLE `studenteditable`
  ADD CONSTRAINT `fk_studentEditable` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studentxdxd`
--
ALTER TABLE `studentxdxd`
  ADD CONSTRAINT `fk_student` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
