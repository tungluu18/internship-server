-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 05, 2018 at 04:53 PM
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
-- Table structure for table `employinfo`
--

CREATE TABLE `employinfo` (
  `employId` int(10) NOT NULL,
  `companyId` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_vietnamese_ci,
  `plaintext` text COLLATE utf8mb4_vietnamese_ci,
  `date_create` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `employinfo`
--

INSERT INTO `employinfo` (`employId`, `companyId`, `title`, `content`, `plaintext`, `date_create`) VALUES
(1, 7, '15 Senior C/ C++ Developers –up to 1500$', '<p style=\"text-align:start;\"></p>\n<img src=\"https://itviec.com/system/production/assets/images/12329/framgia-inc-headline-photo-crop.jpg\" alt=\"undefined\" style=\"float:none;height: auto;width: auto\"/>\n<p></p>\n<p><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">Top 3 Reasons To Join Us</span></p>\n<p></p>\n<ul>\n<li><span style=\"color: rgb(51,51,51);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Attractive income- up to 1500$</span></li>\n<li><span style=\"color: rgb(51,51,51);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Good benefit package</span></li>\n<li><span style=\"color: rgb(51,51,51);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Work with best developers</span></li>\n</ul>\n<p style=\"text-align:start;\"></p>\n<p></p>\n<h2><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">The Job</span></h2>\n<p></p>\n<p></p>\n<p><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">We are looking for 15 Senior C/ C++ Developers at Ho Chi Minh, Ha Noi and Da Nang</span><br></p>\n<ul>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Participate in projects developing application for Healthcare companies.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Work with project members, responsible for the design/code review, development, and implementation &amp; testing of software applications in a Windows environment.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Implement task lists, estimate deliver assignments as functional specifications, quality standards and project schedules.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Consistently delivers high-quality services and meet customer requirements.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Other assignments from Project Manager.</span></li>\n</ul>\n<p></p>\n<p style=\"text-align:start;\"></p>\n<h2><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">Your Skills and Experience</span></h2>\n<p></p>\n<p></p>\n<ul>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">2 or more years programming in C/C++, Window API, MFC, GDI/GDI+, Window SDK.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Have deep knowledge in Object Oriented Programming Methodology.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Ability to analyze / study new technical, new framework.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Experience in Design Principles, Design Patterns, UML.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Have knowledge in advance programming techniques such as Multithread programing, IPC, Memory Management.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Experience in working with Japanese and know Japanese language is an advantage</span></li>\n</ul>\n<p></p>\n<p style=\"text-align:start;\"></p>\n<h2><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">Why You\'ll Love Working Here</span></h2>\n<p></p>\n<p></p>\n<ul>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Successful candidates will be offered a friendly, motivated working environment;</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Get involve in major full-cycle project with large scale and opportunities to work directly with specialists and experts in system designing in Japanese top corporations in producing medical services.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Challenging position with high chances for promotion</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Very attractive salary;</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">“FPT care” health insurance provided by AON and is exclusive for FPT employees.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Company shuttle buses provide convenient way of transportation for all employees.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">F-Town Campus provides many facilities for FPT Software employees such as football ground, basketball &amp; volleyball, gym center, cafeteria, etc.</span>&nbsp;</li>\n</ul>\n', '\n\n\nThe Job\n\n\nWe are looking for 15 Senior C/ C++ Developers at Ho Chi Minh, Ha Noi and Da Nang\n\nParticipate in projects developing application for Healthcare companies.\nWork with project members, responsible for the design/code review, development, and implementation &amp; testing of software applications in a Windows environment.\nImplement task lists, estimate deliver assignments as functional specifications, quality standards and project schedules.\nConsistently delivers high-quality services and meet customer requirements.\nOther assignments from Project Manager.\n\n\n\nWhy You\'ll Love Working Here\n\n\n\nSuccessful candidates will be offered a friendly, motivated working environment;\nGet involve in major full-cycle project with large scale and opportunities to work directly with specialists and experts in system designing in Japanese top corporations in producing medical services.\nChallenging position with high chances for promotion\nVery attractive salary;\n“FPT care” health insurance provided by AON and is exclusive for FPT employees.\nCompany shuttle buses provide convenient way of transportation for all employees.\nF-Town Campus provides many facilities for FPT Software employees such as football ground, basketball &amp; volleyball, gym center, cafeteria, etc.&nbsp;\n\n', '1528209698403'),
(2, 7, '15 Senior Ruby on rail –up to 1500$', '<p style=\"text-align:start;\"></p>\n<img src=\"https://itviec.com/system/production/assets/images/5423/ominext-headline-photo-compress.jpg\" alt=\"undefined\" style=\"float:none;height: auto;width: auto\"/>\n<p></p>\n<p><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">Top 3 Reasons To Join Us</span></p>\n<ul>\n<li><span style=\"color: rgb(51,51,51);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Môi trường làm việc chuyên nghiệp, hiện đại</span></li>\n<li><span style=\"color: rgb(51,51,51);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Cơ hội phát triển nghề nghiệp rộng mở.</span></li>\n<li><span style=\"color: rgb(51,51,51);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Lương và Chế độ đãi ngộ vô cùng hấp dẫn</span></li>\n</ul>\n<h2><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">The Job</span></h2>\n<h2><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Phát triển ứng dụng Web sử dụng Ruby on rails</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Phân tích yêu cầu hệ thống/ đặc điểm kĩ thuật</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Hỗ trợ các thành viên khác để giải quyết các vấn đề kĩ thuật</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Chỉnh sửa và bảo trì hệ thống</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Viết tài liệu kĩ thuật</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Làm việc theo sự phân công của Trưởng nhóm / Quản lý, phối hợp với các thành viên trong nhóm để phát triển sản phẩm.</span></h2>\n<p></p>\n<p style=\"text-align:start;\"></p>\n<h2><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">Your Skills and Experience</span></h2>\n<p></p>\n<p></p>\n<p><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Có kinh nghiệm lập trình Front End: HTML5, CSS3, Javascript.</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Có kinh nghiệm với Angular, React là một lợi thế</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Có kiến thức về web service (RESTful).</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Có khả năng thiết kế, tối ưu database (SQL, NoSQL).</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Có kinh nghiệm sử dụng các dịch vụ Cloud như AWS, Google Cloud, Heroku là một lợi thế.</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Có khả năng đọc hiểu tiếng Anh, biết tiếng Nhật là một lợi thế.</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Nhiệt tình và cẩn thận trong công việc.</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Có niềm đam mê, khám phá, học hỏi công nghệ mới.</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Sẵn sàng chuyển đổi công nghệ, ngôn ngữ mới.</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Kinh nghiệm: Có ít nhất 1 năm kinh nghiệm ở vị trí tương đương.</span></p>\n<p></p>\n<p style=\"text-align:start;\"></p>\n<h2><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">Why You\'ll Love Working Here</span></h2>\n<p></p>\n<p></p>\n<p><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\"><strong>* CHẾ ĐỘ LƯƠNG THƯỞNG</strong></span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Lương khởi điểm hấp dẫn, tương xứng năng lực: 500USD ~ 1500USD</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Chính sách thưởng phong phú: Thưởng tháng lương 13 + thưởng nóng dự án + thưởng nhân viên xuất sắc hàng tháng + thưởng tân binh xuất sắc + các khoản thưởng khác</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Đánh giá định kỳ 2 lần / năm</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Được khám sức khỏe định kỳ 1 lần/năm</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Được hưởng các chế độ BHYT, BHXH, BHTN theo quy định nhà nước</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Được tặng quà, thăm hỏi nhân các dịp cưới hỏi, hiếu hỉ, ốm đau…</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Trợ cấp thai sản hấp dẫn cho nhân viên nữ</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Trợ cấp ngoại ngữ 12 tháng liên tục theo trình độ để khuyến khích nhân viên trau dồi vốn tiếng Nhật:</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">+N1: 5.000.000 VNĐ/tháng</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">+N2: 3.000.000 VNĐ/tháng</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">+N3: 1.000.000 VNĐ/tháng</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Thời gian làm việc:</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">+ Từ 8:00 - 17:30 (nghỉ trưa 1 giờ 30’) từ thứ Hai đến thứ Sáu</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">+ Nghỉ thứ Bảy, Chủ nhật, nghỉ các ngày lễ, Tết theo quy định của Pháp luật, nghỉ ngày nghỉ riêng của công ty</span></p>\n<p><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\"><strong>*CHẾ ĐỘ ĐÀO TẠO</strong></span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Cơ hội tiếp cận và học hỏi công nghệ tiên tiến, đặc biệt được các chuyên gia Nhật chuyển giao những công nghệ mới nhất</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Được trau dồi kiến thức khi được tìm hiểu và tham gia các dự án lớn trong lĩnh vực y tế</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Được đăng ký lớp tiếng Nhật miễn phí 2 buổi/tuần xây dựng cho các trình độ khác nhau</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Được hỗ trợ kinh phí học tập và đào tạo. Đồng thời nâng cao chuyên môn và kỹ năng mềm với các buổi seminar kỹ thuật, hội thảo kỹ năng tổ chức thường xuyên tại công ty</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Có cơ hội được làm việc tại Nhật Bản</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Làm việc trong môi trường hiện đại, trẻ trung, văn hóa mở với nhiều hoạt động văn hóa tinh thần: du lịch, nghỉ dưỡng, party sự kiện…</span>&nbsp;</p>\n', '\n\n\nThe Job\n- Phát triển ứng dụng Web sử dụng Ruby on rails- Phân tích yêu cầu hệ thống/ đặc điểm kĩ thuật- Hỗ trợ các thành viên khác để giải quyết các vấn đề kĩ thuật- Chỉnh sửa và bảo trì hệ thống- Viết tài liệu kĩ thuật- Làm việc theo sự phân công của Trưởng nhóm / Quản lý, phối hợp với các thành viên trong nhóm để phát triển sản phẩm.\n\n\nWhy You\'ll Love Working Here\n\n\n* CHẾ ĐỘ LƯƠNG THƯỞNG- Lương khởi điểm hấp dẫn, tương xứng năng lực: 500USD ~ 1500USD- Chính sách thưởng phong phú: Thưởng tháng lương 13 + thưởng nóng dự án + thưởng nhân viên xuất sắc hàng tháng + thưởng tân binh xuất sắc + các khoản thưởng khác- Đánh giá định kỳ 2 lần / năm- Được khám sức khỏe định kỳ 1 lần/năm- Được hưởng các chế độ BHYT, BHXH, BHTN theo quy định nhà nước- Được tặng quà, thăm hỏi nhân các dịp cưới hỏi, hiếu hỉ, ốm đau…- Trợ cấp thai sản hấp dẫn cho nhân viên nữ- Trợ cấp ngoại ngữ 12 tháng liên tục theo trình độ để khuyến khích nhân viên trau dồi vốn tiếng Nhật:+N1: 5.000.000 VNĐ/tháng+N2: 3.000.000 VNĐ/tháng+N3: 1.000.000 VNĐ/tháng- Thời gian làm việc:+ Từ 8:00 - 17:30 (nghỉ trưa 1 giờ 30’) từ thứ Hai đến thứ Sáu+ Nghỉ thứ Bảy, Chủ nhật, nghỉ các ngày lễ, Tết theo quy định của Pháp luật, nghỉ ngày nghỉ riêng của công ty\n*CHẾ ĐỘ ĐÀO TẠO- Cơ hội tiếp cận và học hỏi công nghệ tiên tiến, đặc biệt được các chuyên gia Nhật chuyển giao những công nghệ mới nhất- Được trau dồi kiến thức khi được tìm hiểu và tham gia các dự án lớn trong lĩnh vực y tế- Được đăng ký lớp tiếng Nhật miễn phí 2 buổi/tuần xây dựng cho các trình độ khác nhau- Được hỗ trợ kinh phí học tập và đào tạo. Đồng thời nâng cao chuyên môn và kỹ năng mềm với các buổi seminar kỹ thuật, hội thảo kỹ năng tổ chức thường xuyên tại công ty- Có cơ hội được làm việc tại Nhật Bản- Làm việc trong môi trường hiện đại, trẻ trung, văn hóa mở với nhiều hoạt động văn hóa tinh thần: du lịch, nghỉ dưỡng, party sự kiện…&nbsp;\n', '1528209858720');

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
(3, 'SAMSUNG Việt Nam', 'sadasdasdasd', 'Note 7 sẽ nổ vỡ mặt bạn'),
(7, 'Framgia', NULL, NULL),
(11, 'Toshiba Việt Nam', 'ahihi', 'điện tử điện lạnh');

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
(1, 'Lưu Quang Tùng', '16020036', 'QH2016-I/CQ-C-CLC', 61, 'Công nghệ thông tin', 'chùa láng', '1998-12-18', '16020036@vnu.edu.vn', 2.9, 2020, 'tungluu18@gmail.com', 'tungdeptrai', 'Tùng Lưu', '0964 537 271', 'Phó bí thư', 'Code bằng MS word', NULL, 'Lập trình pascal và C++ 3 năm', 'asdasd', 'thu nhập 2000$/ngày', 'em chỉ nói phét thôi'),
(2, 'Con thủy quái', '16021294', 'QH2016-I/CQ-C-CLC', 61, 'Công nghệ thông tin', NULL, '1998-10-23', '16020069@vnu.edu.vn', 3.9, 2020, 'giangth2310@gmail.com', '5000$', 'Trương Hoàng Giang', '0964 537 272', 'Phó chi hội', 'Debug bằng mắt', NULL, 'React + Redux + Angular', '123123', NULL, NULL),
(4, 'Trần Quang Bách', '16020001', 'QH2016-I/CQ-C-A-C', 61, 'Khoa học máy tính', NULL, '1998-06-05', '16020001@vnu.edu.vn', 4, 2020, 'bachquangtran98@gmail.com', '10000$', 'Quang Bitch', '0964 537 272', 'Khối trưởng\n', 'Viết Server bằng Assembly', NULL, 'ML + AI + Python + Data Analyst', 'hahaahah', NULL, NULL),
(9, 'Doãn Chí Bình', '15020036', 'QH2015-I/CQ-C-A-K', 60, 'Công nghệ cop code', NULL, '1998-09-06', NULL, 1, NULL, 'ạdaksjdklajdasjkldajldjaskldjaskldjklasjdklasjdkla', NULL, NULL, NULL, NULL, NULL, NULL, 'ahihik', NULL, NULL, NULL);

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
(1, 'tungluu18', '$2a$10$s3eC0Gv5hLesmzr2g5LQkOffnG/dCKNKP1aXGLrIIBrgKkrT9c2gO', 'student', '/avatar/avatarImg-1526535513037.jpg'),
(2, 'giangth2310', '$2a$10$nBv85rt8bHnvuB5jZnR77O3zLQ5VSs.Qya6F.kFEyflWs7dxhmtki', 'student', '/avatar/2.jpg'),
(3, 'samsungvn', '$2a$10$P2unJ0iu1smIsIuJq.meROfDxiOYk6/.pvBqV6NNUsFA7d5OtL.9W', 'partner', '/avatar/avatarImg-1526535617897.jpg'),
(4, 'tranquangbach', '$2a$10$CgP3PfaIBongmztEaynlwuW/kA3dx5zVud/qdlnvv0TGQys5VAf3C', 'student', '/avatar/avatarImg-1526535540078.jpg'),
(5, 'quanlysinhvien', '$2a$10$LnkVas0fW3e.n0OK.sAKTu7yD5EkTF3tH1C98khPPhhElKfDcWua2', 'admin', NULL),
(6, 'ledinhthanh', '$2a$10$UccMFPoyBKiv/tKTCMBg4eVOV7/SHGbjb.w83EXb.yDaXtgBWfxSq', 'lecturer', NULL),
(7, 'framgia', '$2a$10$FL0Gqr0DkjxEUafk8BWZpO.oIFMcjxm85sUvIEmFrrNfkE6Ya33Im', 'partner', '/avatar/avatarImg-1526535652363.jpg'),
(8, 'pdt', '$2a$10$rJGuw8GzppfOwRQ7Cvr5f.7kLkPehpCy1oe/uk9ZRqeGYug3jT/0C', 'admin', NULL),
(9, '15020063', '$2a$10$eIE6fUp5jHKOaMBRMCSWTuAOCZLUs2HVVfNaRRr.FE3bMulquptOO', 'student', '/avatar/avatarImg-1526535570759.jpg'),
(11, 'toshiba', '$2a$10$EiC6fW6f0tXPCTcEMbC91.ZhdvHhquFRccrjcvyA3syN2uckRfTgy', 'partner', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employinfo`
--
ALTER TABLE `employinfo`
  ADD PRIMARY KEY (`employId`),
  ADD KEY `fk_employeeinfo` (`companyId`);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_admin` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employinfo`
--
ALTER TABLE `employinfo`
  ADD CONSTRAINT `fk_employeeinfo` FOREIGN KEY (`companyId`) REFERENCES `partner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
