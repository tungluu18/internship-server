-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th6 14, 2018 lúc 03:35 CH
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
-- Cấu trúc bảng cho bảng `admin`
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
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `donvi`, `vnumail`, `mail`, `phone`) VALUES
(5, 'Quản lý sinh viên', 'Đại học Công nghệ Đại học Quốc gia Hà Nội', NULL, NULL, NULL),
(8, 'Phòng Đào tạo', 'Đại học Công nghệ Đại học Quốc gia Hà Nội', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `assignment`
--

CREATE TABLE `assignment` (
  `assignmentId` int(10) NOT NULL,
  `studentId` int(10) NOT NULL,
  `lecturerId` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_vietnamese_ci,
  `file` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `score` double DEFAULT NULL,
  `comment` text COLLATE utf8mb4_vietnamese_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `assignment`
--

INSERT INTO `assignment` (`assignmentId`, `studentId`, `lecturerId`, `name`, `content`, `file`, `score`, `comment`) VALUES
(1, 1, 6, 'Báo cáo ngày 14/6/2018', 'ahihi', '/document/[1528990457719]He thong quan ly thuc tap.pdf', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employinfo`
--

CREATE TABLE `employinfo` (
  `employId` int(10) NOT NULL,
  `partnerId` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_vietnamese_ci,
  `plaintext` text COLLATE utf8mb4_vietnamese_ci,
  `postedDate` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `expireDate` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `employinfo`
--

INSERT INTO `employinfo` (`employId`, `partnerId`, `title`, `content`, `plaintext`, `postedDate`, `expireDate`) VALUES
(1, 7, '15 Senior C/ C++ Developers –up to 1500$', '<p style=\"text-align:start;\"></p>\n<img src=\"https://itviec.com/system/production/assets/images/12329/framgia-inc-headline-photo-crop.jpg\" alt=\"undefined\" style=\"float:none;height: auto;width: auto\"/>\n<p></p>\n<p><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">Top 3 Reasons To Join Us</span></p>\n<p></p>\n<ul>\n<li><span style=\"color: rgb(51,51,51);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Attractive income- up to 1500$</span></li>\n<li><span style=\"color: rgb(51,51,51);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Good benefit package</span></li>\n<li><span style=\"color: rgb(51,51,51);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Work with best developers</span></li>\n</ul>\n<p style=\"text-align:start;\"></p>\n<p></p>\n<h2><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">The Job</span></h2>\n<p></p>\n<p></p>\n<p><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">We are looking for 15 Senior C/ C++ Developers at Ho Chi Minh, Ha Noi and Da Nang</span><br></p>\n<ul>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Participate in projects developing application for Healthcare companies.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Work with project members, responsible for the design/code review, development, and implementation &amp; testing of software applications in a Windows environment.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Implement task lists, estimate deliver assignments as functional specifications, quality standards and project schedules.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Consistently delivers high-quality services and meet customer requirements.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Other assignments from Project Manager.</span></li>\n</ul>\n<p></p>\n<p style=\"text-align:start;\"></p>\n<h2><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">Your Skills and Experience</span></h2>\n<p></p>\n<p></p>\n<ul>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">2 or more years programming in C/C++, Window API, MFC, GDI/GDI+, Window SDK.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Have deep knowledge in Object Oriented Programming Methodology.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Ability to analyze / study new technical, new framework.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Experience in Design Principles, Design Patterns, UML.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Have knowledge in advance programming techniques such as Multithread programing, IPC, Memory Management.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Experience in working with Japanese and know Japanese language is an advantage</span></li>\n</ul>\n<p></p>\n<p style=\"text-align:start;\"></p>\n<h2><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">Why You\'ll Love Working Here</span></h2>\n<p></p>\n<p></p>\n<ul>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Successful candidates will be offered a friendly, motivated working environment;</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Get involve in major full-cycle project with large scale and opportunities to work directly with specialists and experts in system designing in Japanese top corporations in producing medical services.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Challenging position with high chances for promotion</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Very attractive salary;</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">“FPT care” health insurance provided by AON and is exclusive for FPT employees.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Company shuttle buses provide convenient way of transportation for all employees.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">F-Town Campus provides many facilities for FPT Software employees such as football ground, basketball &amp; volleyball, gym center, cafeteria, etc.</span>&nbsp;</li>\n</ul>\n', '\n\n\nThe Job\n\n\nWe are looking for 15 Senior C/ C++ Developers at Ho Chi Minh, Ha Noi and Da Nang\n\nParticipate in projects developing application for Healthcare companies.\nWork with project members, responsible for the design/code review, development, and implementation &amp; testing of software applications in a Windows environment.\nImplement task lists, estimate deliver assignments as functional specifications, quality standards and project schedules.\nConsistently delivers high-quality services and meet customer requirements.\nOther assignments from Project Manager.\n\n\n\nWhy You\'ll Love Working Here\n\n\n\nSuccessful candidates will be offered a friendly, motivated working environment;\nGet involve in major full-cycle project with large scale and opportunities to work directly with specialists and experts in system designing in Japanese top corporations in producing medical services.\nChallenging position with high chances for promotion\nVery attractive salary;\n“FPT care” health insurance provided by AON and is exclusive for FPT employees.\nCompany shuttle buses provide convenient way of transportation for all employees.\nF-Town Campus provides many facilities for FPT Software employees such as football ground, basketball &amp; volleyball, gym center, cafeteria, etc.&nbsp;\n\n', '1528209698403', '1529254800000'),
(2, 7, '15 Senior Ruby on rail –up to 1500$', '<p style=\"text-align:start;\"></p>\n<img src=\"https://itviec.com/system/production/assets/images/5423/ominext-headline-photo-compress.jpg\" alt=\"undefined\" style=\"float:none;height: auto;width: auto\"/>\n<p></p>\n<p><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">Top 3 Reasons To Join Us</span></p>\n<ul>\n<li><span style=\"color: rgb(51,51,51);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Môi trường làm việc chuyên nghiệp, hiện đại</span></li>\n<li><span style=\"color: rgb(51,51,51);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Cơ hội phát triển nghề nghiệp rộng mở.</span></li>\n<li><span style=\"color: rgb(51,51,51);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Lương và Chế độ đãi ngộ vô cùng hấp dẫn</span></li>\n</ul>\n<h2><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">The Job</span></h2>\n<h2><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Phát triển ứng dụng Web sử dụng Ruby on rails</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Phân tích yêu cầu hệ thống/ đặc điểm kĩ thuật</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Hỗ trợ các thành viên khác để giải quyết các vấn đề kĩ thuật</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Chỉnh sửa và bảo trì hệ thống</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Viết tài liệu kĩ thuật</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Làm việc theo sự phân công của Trưởng nhóm / Quản lý, phối hợp với các thành viên trong nhóm để phát triển sản phẩm.</span></h2>\n<p></p>\n<p style=\"text-align:start;\"></p>\n<h2><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">Your Skills and Experience</span></h2>\n<p></p>\n<p></p>\n<p><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Có kinh nghiệm lập trình Front End: HTML5, CSS3, Javascript.</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Có kinh nghiệm với Angular, React là một lợi thế</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Có kiến thức về web service (RESTful).</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Có khả năng thiết kế, tối ưu database (SQL, NoSQL).</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Có kinh nghiệm sử dụng các dịch vụ Cloud như AWS, Google Cloud, Heroku là một lợi thế.</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Có khả năng đọc hiểu tiếng Anh, biết tiếng Nhật là một lợi thế.</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Nhiệt tình và cẩn thận trong công việc.</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Có niềm đam mê, khám phá, học hỏi công nghệ mới.</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Sẵn sàng chuyển đổi công nghệ, ngôn ngữ mới.</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Kinh nghiệm: Có ít nhất 1 năm kinh nghiệm ở vị trí tương đương.</span></p>\n<p></p>\n<p style=\"text-align:start;\"></p>\n<h2><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">Why You\'ll Love Working Here</span></h2>\n<p></p>\n<p></p>\n<p><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\"><strong>* CHẾ ĐỘ LƯƠNG THƯỞNG</strong></span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Lương khởi điểm hấp dẫn, tương xứng năng lực: 500USD ~ 1500USD</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Chính sách thưởng phong phú: Thưởng tháng lương 13 + thưởng nóng dự án + thưởng nhân viên xuất sắc hàng tháng + thưởng tân binh xuất sắc + các khoản thưởng khác</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Đánh giá định kỳ 2 lần / năm</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Được khám sức khỏe định kỳ 1 lần/năm</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Được hưởng các chế độ BHYT, BHXH, BHTN theo quy định nhà nước</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Được tặng quà, thăm hỏi nhân các dịp cưới hỏi, hiếu hỉ, ốm đau…</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Trợ cấp thai sản hấp dẫn cho nhân viên nữ</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Trợ cấp ngoại ngữ 12 tháng liên tục theo trình độ để khuyến khích nhân viên trau dồi vốn tiếng Nhật:</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">+N1: 5.000.000 VNĐ/tháng</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">+N2: 3.000.000 VNĐ/tháng</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">+N3: 1.000.000 VNĐ/tháng</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Thời gian làm việc:</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">+ Từ 8:00 - 17:30 (nghỉ trưa 1 giờ 30’) từ thứ Hai đến thứ Sáu</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">+ Nghỉ thứ Bảy, Chủ nhật, nghỉ các ngày lễ, Tết theo quy định của Pháp luật, nghỉ ngày nghỉ riêng của công ty</span></p>\n<p><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\"><strong>*CHẾ ĐỘ ĐÀO TẠO</strong></span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Cơ hội tiếp cận và học hỏi công nghệ tiên tiến, đặc biệt được các chuyên gia Nhật chuyển giao những công nghệ mới nhất</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Được trau dồi kiến thức khi được tìm hiểu và tham gia các dự án lớn trong lĩnh vực y tế</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Được đăng ký lớp tiếng Nhật miễn phí 2 buổi/tuần xây dựng cho các trình độ khác nhau</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Được hỗ trợ kinh phí học tập và đào tạo. Đồng thời nâng cao chuyên môn và kỹ năng mềm với các buổi seminar kỹ thuật, hội thảo kỹ năng tổ chức thường xuyên tại công ty</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Có cơ hội được làm việc tại Nhật Bản</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">- Làm việc trong môi trường hiện đại, trẻ trung, văn hóa mở với nhiều hoạt động văn hóa tinh thần: du lịch, nghỉ dưỡng, party sự kiện…</span>&nbsp;</p>\n', '\n\n\nThe Job\n- Phát triển ứng dụng Web sử dụng Ruby on rails- Phân tích yêu cầu hệ thống/ đặc điểm kĩ thuật- Hỗ trợ các thành viên khác để giải quyết các vấn đề kĩ thuật- Chỉnh sửa và bảo trì hệ thống- Viết tài liệu kĩ thuật- Làm việc theo sự phân công của Trưởng nhóm / Quản lý, phối hợp với các thành viên trong nhóm để phát triển sản phẩm.\n\n\nWhy You\'ll Love Working Here\n\n\n* CHẾ ĐỘ LƯƠNG THƯỞNG- Lương khởi điểm hấp dẫn, tương xứng năng lực: 500USD ~ 1500USD- Chính sách thưởng phong phú: Thưởng tháng lương 13 + thưởng nóng dự án + thưởng nhân viên xuất sắc hàng tháng + thưởng tân binh xuất sắc + các khoản thưởng khác- Đánh giá định kỳ 2 lần / năm- Được khám sức khỏe định kỳ 1 lần/năm- Được hưởng các chế độ BHYT, BHXH, BHTN theo quy định nhà nước- Được tặng quà, thăm hỏi nhân các dịp cưới hỏi, hiếu hỉ, ốm đau…- Trợ cấp thai sản hấp dẫn cho nhân viên nữ- Trợ cấp ngoại ngữ 12 tháng liên tục theo trình độ để khuyến khích nhân viên trau dồi vốn tiếng Nhật:+N1: 5.000.000 VNĐ/tháng+N2: 3.000.000 VNĐ/tháng+N3: 1.000.000 VNĐ/tháng- Thời gian làm việc:+ Từ 8:00 - 17:30 (nghỉ trưa 1 giờ 30’) từ thứ Hai đến thứ Sáu+ Nghỉ thứ Bảy, Chủ nhật, nghỉ các ngày lễ, Tết theo quy định của Pháp luật, nghỉ ngày nghỉ riêng của công ty\n*CHẾ ĐỘ ĐÀO TẠO- Cơ hội tiếp cận và học hỏi công nghệ tiên tiến, đặc biệt được các chuyên gia Nhật chuyển giao những công nghệ mới nhất- Được trau dồi kiến thức khi được tìm hiểu và tham gia các dự án lớn trong lĩnh vực y tế- Được đăng ký lớp tiếng Nhật miễn phí 2 buổi/tuần xây dựng cho các trình độ khác nhau- Được hỗ trợ kinh phí học tập và đào tạo. Đồng thời nâng cao chuyên môn và kỹ năng mềm với các buổi seminar kỹ thuật, hội thảo kỹ năng tổ chức thường xuyên tại công ty- Có cơ hội được làm việc tại Nhật Bản- Làm việc trong môi trường hiện đại, trẻ trung, văn hóa mở với nhiều hoạt động văn hóa tinh thần: du lịch, nghỉ dưỡng, party sự kiện…&nbsp;\n', '1528209858720', '1529254800000'),
(3, 7, 'front-end đi ve lốp pờ', '<p style=\"text-align:start;\"></p>\n<img src=\"https://invexi.com/wp-content/uploads/2015/06/frontend.jpg\" alt=\"undefined\" style=\"float:none;height: auto;width: auto\"/>\n<p></p>\n<p></p>\n<h2><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">The Job</span></h2>\n<p></p>\n<p></p>\n<p><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">As a Web Developer, you will be responsible for creating and maintaining websites.</span><br><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">You will utilise your knowledge and understanding of HTML, CSS and JavaScript, as well as cross-browser differences and web standards to take projects from design conception to completion.</span></p>\n<p style=\"text-align:start;\"></p>\n<h2><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">Your Skills and Experience</span></h2>\n<p></p>\n<p></p>\n<ul>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\"><strong>At least 3 years experience in web development</strong></span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Strong JavaScript skill</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Experience about Jquery, HTML5, CSS3, Animation</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">SPA framework ie AngularJS Blackbone.js, Bootstrap.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Knowledge in AOP, JPA, Hibernate, Javascript, AJAX, etc.</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Mobile application development, experience is a plus.</span></li>\n</ul>\n<p></p>\n<p style=\"text-align:start;\"></p>\n<h2><span style=\"color: rgb(53,53,53);background-color: rgb(255,255,255);font-size: 27px;font-family: Roboto Condensed\", sans-serif;\">Why You\'ll Love Working Here</span></h2>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\"><strong>Because we give you an environment to:</strong></span></p>\n<ul>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Build World class product(s).</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Enjoy competitive salary with lucrative add-ons such as project success bonus and opportunity to travel across Asia-Pacific region.</span></li>\n</ul>\n<p><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\"><strong>Benefits:</strong></span></p>\n<ul>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">13th + 14th + 15th month salary</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Performance Bonus</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\"><strong>MacBook</strong></span> <span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">— we like to work with the best equipment,</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Social insurance, health insurance, unemployment insurance according to Labor Laws</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Join the exciting activities of the company: Company trip, Team Building events, Year end partry,…</span></li>\n<li><span style=\"color: rgb(58,58,58);background-color: rgb(255,255,255);font-size: 16px;font-family: Roboto, sans-serif;\">Opportunities to work and have training at global bases.</span>&nbsp;</li>\n</ul>\n', '\n\n\n\nYour Skills and Experience\n\n\n\nAt least 3 years experience in web development\nStrong JavaScript skill\nExperience about Jquery, HTML5, CSS3, Animation\nSPA framework ie AngularJS Blackbone.js, Bootstrap.\nKnowledge in AOP, JPA, Hibernate, Javascript, AJAX, etc.\nMobile application development, experience is a plus.\n\n\n\n', '1528218813550', '1529254800000'),
(4, 7, 'asdasd', '<p>asdasd</p>\n', 'asdasd\n', '1528978822079', '1514764800000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `following`
--

CREATE TABLE `following` (
  `followingId` int(11) NOT NULL,
  `employId` int(10) DEFAULT NULL,
  `studentId` int(10) DEFAULT NULL,
  `partnerId` int(10) NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'waiting for interview'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `following`
--

INSERT INTO `following` (`followingId`, `employId`, `studentId`, `partnerId`, `status`) VALUES
(1, 1, 1, 7, 'accepted'),
(3, 3, 1, 7, 'rejected'),
(4, 3, 2, 7, 'waiting for interview'),
(5, 1, 2, 7, 'accepted');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `intern`
--

CREATE TABLE `intern` (
  `internId` int(10) NOT NULL,
  `studentId` int(10) NOT NULL,
  `lecturerId` int(10) NOT NULL,
  `partnerId` int(10) DEFAULT NULL,
  `partnerComment` text COLLATE utf8mb4_vietnamese_ci,
  `assignmentId` int(11) DEFAULT NULL,
  `internshipTermId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `intern`
--

INSERT INTO `intern` (`internId`, `studentId`, `lecturerId`, `partnerId`, `partnerComment`, `assignmentId`, `internshipTermId`) VALUES
(1, 1, 6, 7, NULL, NULL, 2),
(2, 1, 6, 0, NULL, NULL, 1),
(3, 2, 6, 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `internshipterm`
--

CREATE TABLE `internshipterm` (
  `internshipTermId` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `startTime` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `endTime` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `internshipterm`
--

INSERT INTO `internshipterm` (`internshipTermId`, `name`, `startTime`, `endTime`) VALUES
(1, 'Thực tập hè 2018', '1527786000000', '1530291600000'),
(2, 'Thực tập mùa đông 2018', '1527786000000', '1530118800000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `knex_migrations`
--

CREATE TABLE `knex_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `knex_migrations`
--

INSERT INTO `knex_migrations` (`id`, `name`, `batch`, `migration_time`) VALUES
(1, '20180506192905_create_user_table.js', 1, '2018-05-06 12:34:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `knex_migrations_lock`
--

CREATE TABLE `knex_migrations_lock` (
  `is_locked` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `knex_migrations_lock`
--

INSERT INTO `knex_migrations_lock` (`is_locked`) VALUES
(0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lecturer`
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
-- Đang đổ dữ liệu cho bảng `lecturer`
--

INSERT INTO `lecturer` (`id`, `name`, `mail`, `vnumail`, `phone`, `ghichu`) VALUES
(6, 'Lê Đình Thanh', 'ledinhthanh@gmail.com', 'thanhld@vnu.edu.vn', '0987 257 504 ', NULL),
(10, 'Phạm Ngọc Hùng', 'hungpn@gmail.com', 'hungpn@vnu.edu.vn', NULL, 'Không cần phải nói thêm gì cả.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `message`
--

CREATE TABLE `message` (
  `messageId` int(10) NOT NULL,
  `senderId` int(10) NOT NULL,
  `receiverId` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `replyTo` int(11) DEFAULT NULL,
  `content` text COLLATE utf8mb4_vietnamese_ci,
  `seen` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `message`
--

INSERT INTO `message` (`messageId`, `senderId`, `receiverId`, `title`, `replyTo`, `content`, `seen`) VALUES
(1, 2, 6, 'Lời chào', NULL, 'Chào bạn nha!', 0),
(2, 2, 6, 'Lời chào', NULL, 'Bye bạn nha!', 0),
(3, 1, 2, 'Lời nhắc nhơ', NULL, 'Làm bài nào người anh em', 1),
(4, 2, 1, 'Trả lời người anh em', NULL, 'Ok bro, Rush B non stop', 1),
(5, 2, 1, 'Lời hỏi thăm', NULL, 'Chú ăn cơm chưa ? ', 1),
(6, 1, 2, 'Chuyện yêu nước', NULL, 'Chú đừng đi theo bọn phản động đả kích mà đi biểu tình nhé', 1),
(7, 2, 1, 'Làm bạn yên tâm', 6, 'Làm xong bài tập lớn anh mới vào Nam với bà con, chú cứ yên tâm ?', 1),
(8, 2, 1, 'abcd', NULL, '<p>ahihi</p>\n', 1),
(9, 2, 1, 'adsad', NULL, '<p></p>\n<img src=\"https://lonelyplanetwp.imgix.net/2017/11/winter-lights-roppongi-tokyo-b4f60a4cc18b.jpg?crop=entropy&fit=crop&h=421&sharp=10&vib=20&w=748\" alt=\"undefined\" style=\"float:none;height: 200px;width: 500px\"/>\n<p></p>\n', 1),
(10, 2, 1, 'as', NULL, '<p>213312</p>\n', 0),
(11, 2, 1, 'Re: Chuyện yêu nước', 6, '<p>Uwf</p>\n', 1),
(12, 2, 1, 'Hello', NULL, '<p>Hello</p>\n', 1),
(13, 2, 1, 'sds', NULL, '<p>wqwwqeqeqwqeq</p>\n', 0),
(14, 7, 1, 'Chào em', NULL, '<p>Chào em nhé</p>\n', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `partner`
--

CREATE TABLE `partner` (
  `id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `contact` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `thongtin` text COLLATE utf8mb4_vietnamese_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `partner`
--

INSERT INTO `partner` (`id`, `name`, `contact`, `thongtin`) VALUES
(3, 'SAMSUNG Việt Nam', 'sadasdasdasd', 'Note 7 sẽ nổ vỡ mặt bạn'),
(7, 'Framgia', NULL, NULL),
(11, 'Toshiba Việt Nam', 'ahihi', 'điện tử điện lạnh');

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
(3, 1, 10, 'đẹp trai'),
(3, 2, 2, 'dasa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student`
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
-- Đang đổ dữ liệu cho bảng `student`
--

INSERT INTO `student` (`id`, `name`, `mssv`, `class`, `khoa`, `nganh`, `diachi`, `ngaysinh`, `vnumail`, `GPA`, `namtotnghiep`, `email`, `skypeID`, `facebook`, `phone`, `vitri`, `kynang`, `chungchi`, `kinhnghiem`, `sothich`, `dinhhuong`, `ghichu`) VALUES
(1, 'Lưu Quang Tùng', '16020036', 'QH2016-I/CQ-C-CLC', 61, 'Công nghệ thông tin', 'chùa láng', '1998-12-18', '16020036@vnu.edu.vn', 2.9, 2020, 'tungluu18@gmail.com', 'tungdeptraiaaa', 'Tùng Lưu', '0964 537 271', 'Phó bí thư', 'Code bằng MS word', NULL, 'Lập trình pascal và C++ 3 năm', 'asdasd', 'thu nhập 2000$/ngày', 'em chỉ nói phét thôi'),
(2, 'Con thủy quái', '16021294', 'QH2016-I/CQ-C-CLC', 61, 'Công nghệ thông tin', NULL, '1998-10-23', '16020069@vnu.edu.vn', 3.9, 2020, 'giangth2310@gmail.com', '5000$', 'Trương Hoàng Giang', '0964 537 272', 'Phó chi hội', 'Debug bằng mắt', NULL, 'React + Redux + Angular', '123123', NULL, NULL),
(4, 'Trần Quang Bách', '16020001', 'QH2016-I/CQ-C-A-C', 61, 'Khoa học máy tính', NULL, '1998-06-05', '16020001@vnu.edu.vn', 4, 2020, 'bachquangtran98@gmail.com', '10000$', 'Quang Bitch', '0964 537 272', 'Khối trưởng\n', 'Viết Server bằng Assembly', NULL, 'ML + AI + Python + Data Analyst', 'hahaahah', NULL, NULL),
(9, 'Doãn Chí Bình', '15020036', 'QH2015-I/CQ-C-A-K', 60, 'Công nghệ cop code', NULL, '1998-09-06', NULL, 1, NULL, 'ạdaksjdklajdasjkldajldjaskldjaskldjklasjdklasjdkla', NULL, NULL, NULL, NULL, NULL, NULL, 'ahihik', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `studenteditable`
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
-- Đang đổ dữ liệu cho bảng `studenteditable`
--

INSERT INTO `studenteditable` (`id`, `email`, `skypeID`, `facebook`, `phone`, `vitri`, `kynang`, `chungchi`, `kinhnghiem`, `sothich`, `dinhhuong`, `ghichu`) VALUES
(1, 'tungluu18@gmail.com', 'asdasd', 'Tùng Lưu', '0964 537 271', 'Phó bí thư', 'Code bằng MS word', NULL, 'Lập trình pascal và C++ 3 năm', NULL, '2000$', NULL),
(2, 'giangth2310@gmail.com', '123123', 'Trương Hoàng Giang', '0964 537 272', 'Phó chi hội', 'Debug bằng mắt', NULL, 'React + Redux + Angular', NULL, '5000$', 'aaaaa'),
(4, 'bachquangtran98@gmail.com', 'hahaahah', 'Bách Quang', '0964 537 272', 'Khối trưởng', 'Viết Server bằng Assembly', NULL, 'ML + AI + Python + Data Analyst', NULL, '10000$', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `studentfollowme`
--

CREATE TABLE `studentfollowme` (
  `studentId` int(11) NOT NULL,
  `lecturerId` int(11) NOT NULL,
  `yearOfLecture` int(11) NOT NULL,
  `linkOfReport` text,
  `comment` text,
  `mark` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `studentfollowme`
--

INSERT INTO `studentfollowme` (`studentId`, `lecturerId`, `yearOfLecture`, `linkOfReport`, `comment`, `mark`) VALUES
(1, 6, 0, NULL, NULL, NULL),
(2, 6, 2018, 'asdasdasdasdasdasdasdasdasdasdasdasdasdasd', 'đẹp trai', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `avatar` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT '/avatar/0.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `type`, `avatar`) VALUES
(1, 'tungluu18', '$2a$10$s3eC0Gv5hLesmzr2g5LQkOffnG/dCKNKP1aXGLrIIBrgKkrT9c2gO', 'student', '/avatar/avatarImg-1526535513037.jpg'),
(2, 'giangth2310', '$2a$10$FvVFzQlQISjejUiNdPk41OoJwSk1Cm97OY.EYaFuhkNGcaJk1jEO2', 'student', '/avatar/2.jpg'),
(3, 'samsungvn', '$2a$10$P2unJ0iu1smIsIuJq.meROfDxiOYk6/.pvBqV6NNUsFA7d5OtL.9W', 'partner', '/avatar/avatarImg-1526535617897.jpg'),
(4, 'tranquangbach', '$2a$10$CgP3PfaIBongmztEaynlwuW/kA3dx5zVud/qdlnvv0TGQys5VAf3C', 'student', '/avatar/avatarImg-1526535540078.jpg'),
(5, 'quanlysinhvien', '$2a$10$LnkVas0fW3e.n0OK.sAKTu7yD5EkTF3tH1C98khPPhhElKfDcWua2', 'admin', '/avatar/0.jpg'),
(6, 'ledinhthanh', '$2a$10$UccMFPoyBKiv/tKTCMBg4eVOV7/SHGbjb.w83EXb.yDaXtgBWfxSq', 'lecturer', '/avatar/0.jpg'),
(7, 'framgia', '$2a$10$FL0Gqr0DkjxEUafk8BWZpO.oIFMcjxm85sUvIEmFrrNfkE6Ya33Im', 'partner', '/avatar/avatarImg-1526535652363.jpg'),
(8, 'pdt', '$2a$10$rJGuw8GzppfOwRQ7Cvr5f.7kLkPehpCy1oe/uk9ZRqeGYug3jT/0C', 'admin', '/avatar/0.jpg'),
(9, '15020063', '$2a$10$eIE6fUp5jHKOaMBRMCSWTuAOCZLUs2HVVfNaRRr.FE3bMulquptOO', 'student', '/avatar/avatarImg-1526535570759.jpg'),
(10, 'phamngochung', '$2a$10$.pYgd8NFmHlbw9ex5IAnTeDQy6nZ43fE3gJJw9dFeU5VZdpwdHtY2', 'lecturer', '/avatar/avatarImg-1528977950603.jpg'),
(11, 'toshiba', '$2a$10$EiC6fW6f0tXPCTcEMbC91.ZhdvHhquFRccrjcvyA3syN2uckRfTgy', 'partner', '/avatar/0.jpg'),
(12, '', '', '', '/avatar/0.jpg'),
(13, '', '', '', '/avatar/0.jpg');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`assignmentId`),
  ADD KEY `fk_assignment_student` (`studentId`),
  ADD KEY `fk_assignment_lecturer` (`lecturerId`);

--
-- Chỉ mục cho bảng `employinfo`
--
ALTER TABLE `employinfo`
  ADD PRIMARY KEY (`employId`),
  ADD KEY `fk_employeeinfo` (`partnerId`);

--
-- Chỉ mục cho bảng `following`
--
ALTER TABLE `following`
  ADD PRIMARY KEY (`followingId`),
  ADD KEY `following_ibfk_1` (`employId`),
  ADD KEY `following_ibfk_2` (`studentId`);

--
-- Chỉ mục cho bảng `intern`
--
ALTER TABLE `intern`
  ADD PRIMARY KEY (`internId`),
  ADD KEY `fk_intern_student` (`studentId`),
  ADD KEY `fk_intern_lecturer` (`lecturerId`),
  ADD KEY `fk_intern_partner` (`partnerId`),
  ADD KEY `fk_intern_internshipTermId` (`internshipTermId`);

--
-- Chỉ mục cho bảng `internshipterm`
--
ALTER TABLE `internshipterm`
  ADD PRIMARY KEY (`internshipTermId`);

--
-- Chỉ mục cho bảng `knex_migrations`
--
ALTER TABLE `knex_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lecturer`
--
ALTER TABLE `lecturer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `message`
--
ALTER TABLE `message`
  ADD KEY `fk_message_senderId` (`senderId`),
  ADD KEY `fk_message_receiverId` (`receiverId`);

--
-- Chỉ mục cho bảng `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `rateforstudent`
--
ALTER TABLE `rateforstudent`
  ADD PRIMARY KEY (`partnerId`,`studentId`),
  ADD KEY `studentid` (`studentId`);

--
-- Chỉ mục cho bảng `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `studenteditable`
--
ALTER TABLE `studenteditable`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `studentfollowme`
--
ALTER TABLE `studentfollowme`
  ADD PRIMARY KEY (`studentId`),
  ADD KEY `fkey` (`lecturerId`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT cho bảng `following`
--
ALTER TABLE `following`
  MODIFY `followingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT cho bảng `intern`
--
ALTER TABLE `intern`
  MODIFY `internId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `knex_migrations`
--
ALTER TABLE `knex_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `lecturer`
--
ALTER TABLE `lecturer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT cho bảng `partner`
--
ALTER TABLE `partner`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT cho bảng `student`
--
ALTER TABLE `student`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT cho bảng `studenteditable`
--
ALTER TABLE `studenteditable`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_admin` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `assignment`
--
ALTER TABLE `assignment`
  ADD CONSTRAINT `fk_assignment_lecturer` FOREIGN KEY (`lecturerId`) REFERENCES `lecturer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_assignment_student` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `employinfo`
--
ALTER TABLE `employinfo`
  ADD CONSTRAINT `fk_employeeinfo` FOREIGN KEY (`partnerId`) REFERENCES `partner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `following`
--
ALTER TABLE `following`
  ADD CONSTRAINT `following_ibfk_1` FOREIGN KEY (`employId`) REFERENCES `employinfo` (`employId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `following_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `intern`
--
ALTER TABLE `intern`
  ADD CONSTRAINT `fk_intern_internshipTermId` FOREIGN KEY (`internshipTermId`) REFERENCES `internshipterm` (`internshipTermId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_intern_lecturer` FOREIGN KEY (`lecturerId`) REFERENCES `lecturer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_intern_student` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `lecturer`
--
ALTER TABLE `lecturer`
  ADD CONSTRAINT `fk_lecturer` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_message_receiverId` FOREIGN KEY (`receiverId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_message_senderId` FOREIGN KEY (`senderId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `partner`
--
ALTER TABLE `partner`
  ADD CONSTRAINT `fk_partner` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `rateforstudent`
--
ALTER TABLE `rateforstudent`
  ADD CONSTRAINT `rateforstudent_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rateforstudent_ibfk_2` FOREIGN KEY (`partnerId`) REFERENCES `partner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `studenteditable`
--
ALTER TABLE `studenteditable`
  ADD CONSTRAINT `fk_studentEditable` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `studentfollowme`
--
ALTER TABLE `studentfollowme`
  ADD CONSTRAINT `fkey` FOREIGN KEY (`lecturerId`) REFERENCES `lecturer` (`id`),
  ADD CONSTRAINT `fkey1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
