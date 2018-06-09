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
-- Cấu trúc bảng cho bảng `studentfollowme`
--

CREATE TABLE `studentfollowme` (
  `studentId` int(11) NOT NULL,
  `lectureId` int(11) NOT NULL,
  `yearOfLecture` int(11) NOT NULL,
  `linkOfReport` text,
  `commentOfLecture` text,
  `mark` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `studentfollowme`
--

INSERT INTO `studentfollowme` (`studentId`, `lectureId`, `yearOfLecture`, `linkOfReport`, `commentOfLecture`, `mark`) VALUES
(1, 6, 2018, NULL, NULL, NULL),
(2, 6, 2018, 'asdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'header', 1),
(4, 10, 2017, NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `studentfollowme`
--
ALTER TABLE `studentfollowme`
  ADD PRIMARY KEY (`studentId`),
  ADD KEY `fkey` (`lectureId`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `studentfollowme`
--
ALTER TABLE `studentfollowme`
  ADD CONSTRAINT `fkey` FOREIGN KEY (`lectureId`) REFERENCES `lecturer` (`id`),
  ADD CONSTRAINT `fkey1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
