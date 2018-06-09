-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th6 09, 2018 lúc 03:07 SA
-- Phiên bản máy phục vụ: 5.7.17-log
-- Phiên bản PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `interndb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rateforstudent`
--

CREATE TABLE `rateforstudent` (
  `partnerId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `mark` int(11) DEFAULT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `rateforstudent`
--

INSERT INTO `rateforstudent` (`partnerId`, `studentId`, `mark`, `comment`) VALUES
(3, 1, 10, 'dasdsadasd'),
(3, 2, 2, 'dasa');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `rateforstudent`
--
ALTER TABLE `rateforstudent`
  ADD PRIMARY KEY (`partnerId`,`studentId`),
  ADD KEY `studentid` (`studentId`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `rateforstudent`
--
ALTER TABLE `rateforstudent`
  ADD CONSTRAINT `rateforstudent_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rateforstudent_ibfk_2` FOREIGN KEY (`partnerId`) REFERENCES `partner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
