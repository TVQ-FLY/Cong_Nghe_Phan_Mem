-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 07, 2023 lúc 10:05 AM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_ql_quancafe`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `ID` int(11) NOT NULL,
  `username` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`ID`, `username`, `password`, `name`) VALUES
(1, 'admin', 'admin', 'Admin'),
(2, 'duyen60k2', '123456', 'Duyen'),
(3, 'quyen60k2', '123456', 'Quyen'),
(4, 'congnghephanmem', '123456', 'doan');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `drinks`
--

CREATE TABLE `drinks` (
  `ID` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `drinks`
--

INSERT INTO `drinks` (`ID`, `name`, `price`, `start_date`, `end_date`) VALUES
(1, 'Sữa chua đánh đá', 25000, '2023-01-01', '2023-12-12'),
(2, 'Nước cam nguyên chất', 40000, '2023-01-01', '2023-12-12'),
(3, 'Sinh tố xoài', 25000, '2023-01-01', '2023-12-12'),
(4, 'Cà phê', 40000, '2023-01-01', '2023-12-12'),
(5, 'Bạc xỉu', 30000, '2023-01-01', '2023-06-06'),
(6, 'Cà phê đen', 20000, '2023-01-01', '2023-06-06'),
(7, 'Cà phê đá', 40000, '2023-01-01', '2023-01-31'),
(8, 'Bò húc', 15000, '2023-01-01', '2023-06-06'),
(9, 'Sinh tố dâu', 25000, '2023-01-01', '2023-12-12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice`
--

CREATE TABLE `invoice` (
  `ID` int(11) NOT NULL,
  `account_ID` int(11) NOT NULL,
  `invoice_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tables_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `total_price` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `invoice`
--

INSERT INTO `invoice` (`ID`, `account_ID`, `invoice_date`, `tables_id`, `status`, `total_price`) VALUES
(8, 1, '2023-03-05 00:04:50', 1, 1, 260000),
(9, 1, '2023-03-05 00:04:47', 2, 1, 200000),
(10, 1, '2023-03-05 00:04:43', 5, 1, 170000),
(11, 1, '2023-03-05 00:07:15', 2, 1, 300000),
(12, 1, '2023-04-09 14:11:40', 1, 1, 40000),
(13, 1, '2023-04-20 00:53:27', 2, 1, 30000),
(14, 1, '2023-04-20 02:01:10', 5, 0, 0),
(15, 1, '2023-04-24 08:39:25', 4, 0, 0),
(16, 1, '2023-04-24 08:43:32', 3, 0, 0),
(17, 1, '2023-04-24 08:43:41', 2, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL,
  `drinks_ID` int(11) NOT NULL,
  `count` int(50) NOT NULL,
  `invoice_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`ID`, `drinks_ID`, `count`, `invoice_ID`) VALUES
(13, 4, 1, 8),
(14, 6, 1, 8),
(15, 5, 1, 9),
(16, 7, 1, 10),
(17, 6, 1, 11),
(18, 4, 1, 11),
(19, 5, 1, 11),
(20, 7, 1, 11),
(22, 4, 1, 12),
(24, 5, 1, 13),
(25, 6, 1, 14),
(26, 6, 12, 15),
(27, 6, 1, 16),
(29, 5, 1, 17);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tables`
--

CREATE TABLE `tables` (
  `ID` int(11) NOT NULL,
  `table_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tables`
--

INSERT INTO `tables` (`ID`, `table_name`, `note`, `status`) VALUES
(1, 'Bàn 1', '', 0),
(2, 'Bàn 2', '', 1),
(3, 'Bàn 3', '', 1),
(4, 'Bàn 4', '', 1),
(5, 'Bàn 5', '', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `drinks`
--
ALTER TABLE `drinks`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `account_ID` (`account_ID`),
  ADD KEY `tables_id` (`tables_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `drinks_ID` (`drinks_ID`),
  ADD KEY `invoice_ID` (`invoice_ID`);

--
-- Chỉ mục cho bảng `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `drinks`
--
ALTER TABLE `drinks`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `invoice`
--
ALTER TABLE `invoice`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `tables`
--
ALTER TABLE `tables`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`account_ID`) REFERENCES `account` (`ID`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`tables_id`) REFERENCES `tables` (`ID`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`drinks_ID`) REFERENCES `drinks` (`ID`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`invoice_ID`) REFERENCES `invoice` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
