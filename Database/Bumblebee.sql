

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";




--
-- Database: `vantage`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', '2017-01-24 16:21:18', '26-02-2021 09:06:52 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(4, 'Mobile', 'Mobile phone', '2017-01-24 19:17:37', '30-01-2017 12:22:24 AM'),
(5, 'Accessories', 'accessories', '2017-01-24 19:19:32', ''),
(6, 'Tablet', 'Tablets', '2017-01-24 19:19:54', ''),
(8, 'AIRPODS', 'AIRPODS', '2021-02-28 17:26:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(10, 4, '79', 1, '2021-03-02 18:20:32', 'COD', 'Delivered'),
(11, 4, '60', 5, '2021-03-03 04:09:37', 'COD', 'in Process'),
(12, 4, '60', 1, '2021-03-03 07:15:15', 'COD', NULL),
(13, 4, '75', 5, '2021-03-03 16:53:38', 'Internet Banking', NULL),
(14, 4, '60', 5, '2021-03-03 17:10:07', 'Debit / Credit card', NULL),
(15, 4, '69', 4, '2021-03-04 04:45:51', 'Debit / Credit card', NULL),
(16, 4, '60', 1, '2021-03-05 15:12:37', NULL, NULL),
(17, 4, '79', 1, '2021-03-05 15:12:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2017-03-10 19:36:45'),
(2, 1, 'Delivered', 'Order Has been delivered', '2017-03-10 19:37:31'),
(3, 3, 'Delivered', 'Product delivered successfully', '2017-03-10 19:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2017-03-10 19:50:36'),
(5, 10, 'Delivered', 'jk', '2021-03-02 20:04:51'),
(6, 11, 'in Process', 'segregs', '2021-03-03 16:54:33');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(60, 4, 'I PHONE 11PRO MAX PURPLE', 'APPLE', 95000, 100000, '<div>DISPLAY<span style=\"white-space:pre\">	</span> Super Retina XDR OLED, HDR10, 800 nits (typ), 1200 nits (peak)</div><div>PLATFORM iOS 14.1, upgradable to iOS 14.4</div><div>Chipset<span style=\"white-space:pre\">	</span> Apple A14 Bionic (5 nm)</div><div>CPU<span style=\"white-space:pre\">	</span> Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</div>', 'iphone11-purple-select-2019.png', 'iphone11-purple-select-2019.png', 'iphone11-purple-select-2019.png', 0, 'In Stock', '2021-02-28 15:54:33', NULL),
(61, 4, 'I PHONE 11PRO MAX BLACK', 'APPLE', 95000, 100000, '<div>DISPLAY<span style=\"white-space:pre\">	</span> Super Retina XDR OLED, HDR10, 800 nits (typ), 1200 nits (peak)</div><div>PLATFORM iOS 14.1, upgradable to iOS 14.4</div><div>Chipset<span style=\"white-space:pre\">	</span> Apple A14 Bionic (5 nm)</div><div>CPU<span style=\"white-space:pre\">	</span> Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</div>', 'iphone11-black-select-2019.png', 'iphone11-black-select-2019.png', 'iphone11-black-select-2019.png', 0, 'In Stock', '2021-02-28 15:55:17', NULL),
(62, 4, 'I PHONE 11PRO MAX RED', 'APPLE', 95000, 100000, '<div>DISPLAY<span style=\"white-space:pre\">	</span> Super Retina XDR OLED, HDR10, 800 nits (typ), 1200 nits (peak)</div><div>PLATFORM iOS 14.1, upgradable to iOS 14.4</div><div>Chipset<span style=\"white-space:pre\">	</span> Apple A14 Bionic (5 nm)</div><div>CPU<span style=\"white-space:pre\">	</span> Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</div>', 'iphone11-red-select-2019.png', 'iphone11-red-select-2019.png', 'iphone11-red-select-2019.png', 0, 'In Stock', '2021-02-28 15:55:55', NULL),
(63, 4, 'I PHONE 11PRO MAX WHITE', 'APPLE', 95000, 100000, '<div>DISPLAY<span style=\"white-space:pre\">	</span> Super Retina XDR OLED, HDR10, 800 nits (typ), 1200 nits (peak)</div><div>PLATFORM iOS 14.1, upgradable to iOS 14.4</div><div>Chipset<span style=\"white-space:pre\">	</span> Apple A14 Bionic (5 nm)</div><div>CPU<span style=\"white-space:pre\">	</span> Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</div>', 'iphone11-white-select-2019.png', 'iphone11-white-select-2019.png', 'iphone11-white-select-2019.png', 0, 'In Stock', '2021-02-28 15:56:43', NULL),
(64, 4, 'I PHONE 11PRO MAX GREEN', 'APPLE', 95000, 100000, '<div>DISPLAY<span style=\"white-space:pre\">	</span> Super Retina XDR OLED, HDR10, 800 nits (typ), 1200 nits (peak)</div><div>PLATFORM iOS 14.1, upgradable to iOS 14.4</div><div>Chipset<span style=\"white-space:pre\">	</span> Apple A14 Bionic (5 nm)</div><div>CPU<span style=\"white-space:pre\">	</span> Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</div>', 'iphone11-green-select-2019.png', 'iphone11-green-select-2019.png', 'iphone11-green-select-2019.png', 0, 'In Stock', '2021-02-28 16:00:48', NULL),
(65, 4, 'I PHONE 12PRO MAX BLUE ', 'APPLE', 150000, 150000, '<div>DISPLAY<span style=\"white-space:pre\">	</span> Super Retina XDR OLED, HDR10, 800 nits (typ), 1200 nits (peak)</div><div>PLATFORM iOS 14.1, upgradable to iOS 14.4</div><div>Chipset<span style=\"white-space:pre\">	</span> Apple A14 Bionic (5 nm)</div><div>CPU<span style=\"white-space:pre\">	</span> Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</div>', 'blue.png', 'blue.png', 'blue.png', 0, 'In Stock', '2021-02-28 16:01:32', NULL),
(66, 4, 'I PHONE 12PRO MAX GOLD', 'APPLE', 150000, 150000, '<div>DISPLAY<span style=\"white-space:pre\">	</span> Super Retina XDR OLED, HDR10, 800 nits (typ), 1200 nits (peak)</div><div>PLATFORM iOS 14.1, upgradable to iOS 14.4</div><div>Chipset<span style=\"white-space:pre\">	</span> Apple A14 Bionic (5 nm)</div><div>CPU<span style=\"white-space:pre\">	</span> Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</div>', 'Gold.png', 'Gold.png', 'Gold.png', 0, 'In Stock', '2021-02-28 16:02:16', NULL),
(67, 4, 'I PHONE 12PRO MAX GRAPHITE ', 'APPLE', 150000, 150000, '<div>DISPLAY<span style=\"white-space:pre\">	</span> Super Retina XDR OLED, HDR10, 800 nits (typ), 1200 nits (peak)</div><div>PLATFORM iOS 14.1, upgradable to iOS 14.4</div><div>Chipset<span style=\"white-space:pre\">	</span> Apple A14 Bionic (5 nm)</div><div>CPU<span style=\"white-space:pre\">	</span> Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</div>', 'Graphite.png', 'Graphite.png', 'Graphite.png', 0, 'In Stock', '2021-02-28 16:03:11', NULL),
(68, 4, 'I PHONE 12PRO MAX WHITE', 'APPLE', 150000, 150000, '<div>DISPLAY<span style=\"white-space:pre\">	</span> Super Retina XDR OLED, HDR10, 800 nits (typ), 1200 nits (peak)</div><div>PLATFORM iOS 14.1, upgradable to iOS 14.4</div><div>Chipset<span style=\"white-space:pre\">	</span> Apple A14 Bionic (5 nm)</div><div>CPU<span style=\"white-space:pre\">	</span> Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</div>', 'White.png', 'White.png', 'White.png', 0, 'In Stock', '2021-02-28 16:04:00', NULL),
(69, 5, 'WATCH SERIES 6 YELLOW ', 'APPLE', 80000, 80000, '<div><font color=\"#000000\"><b><br></b></font></div><div><font color=\"#000000\"><b>DISPLAY<span style=\"white-space:pre\">		</span>Retina LTPO OLED, 1000 nits (peak)</b></font></div><div><font color=\"#000000\"><b>Dimensions<span style=\"white-space:pre\">	</span>44 x 38 x 10.7 mm (1.73 x 1.50 x 0.42 in)</b></font></div><div><font color=\"#000000\"><b>Weight<span style=\"white-space:pre\">	</span>47.8 g (1.69 oz)</b></font></div><div><font color=\"#000000\"><b>Build<span style=\"white-space:pre\">	</span>Glass front (Sapphire crystal), ceramic/sapphire crystal back, stainless steel frame</b></font></div><div><font color=\"#000000\"><b>SIM<span style=\"white-space:pre\">	</span>eSIM</b></font></div>', 'MGQQ3_VW_34FR+watch-44-stainless-silver-cell-6s_VW_34FR_WF_CO.jpg', 'MGQQ3_VW_34FR+watch-44-stainless-silver-cell-6s_VW_34FR_WF_CO.jpg', 'MGQQ3_VW_34FR+watch-44-stainless-silver-cell-6s_VW_34FR_WF_CO.jpg', 0, 'In Stock', '2021-02-28 16:54:40', NULL),
(70, 5, 'WATCH SERIES 6 RED', 'APPLE', 80000, 80000, '<div><b>DISPLAY<span style=\"white-space: pre;\">		</span>Retina LTPO OLED, 1000 nits (peak)<br></b></div><div><b>Dimensions<span style=\"white-space:pre\">	</span>44 x 38 x 10.7 mm (1.73 x 1.50 x 0.42 in)</b></div><div><b>Weight<span style=\"white-space:pre\">	</span>47.8 g (1.69 oz)</b></div><div><b>Build<span style=\"white-space:pre\">	</span>Glass front (Sapphire crystal), ceramic/sapphire crystal back, stainless steel frame</b></div><div><b>SIM<span style=\"white-space:pre\">	</span>eSIM</b></div>', 'MG463_VW_34FR+watch-44-alum-red-nc-6s_VW_34FR_WF_CO (1).jpg', 'MG463_VW_34FR+watch-44-alum-red-nc-6s_VW_34FR_WF_CO (1).jpg', 'MG463_VW_34FR+watch-44-alum-red-nc-6s_VW_34FR_WF_CO (1).jpg', 0, 'In Stock', '2021-02-28 16:56:11', NULL),
(71, 5, 'WATCH SERIES 6 BLUE', 'APPLE', 80000, 80000, '<div><b>DISPLAY<span style=\"white-space: pre;\">		</span>Retina LTPO OLED, 1000 nits (peak)<br></b></div><div><b>Dimensions<span style=\"white-space: pre;\">	</span>44 x 38 x 10.7 mm (1.73 x 1.50 x 0.42 in)</b></div><div><b>Weight<span style=\"white-space: pre;\">	</span>47.8 g (1.69 oz)</b></div><div><b>Build<span style=\"white-space: pre;\">	</span>Glass front (Sapphire crystal), ceramic/sapphire crystal back, stainless steel frame</b></div><div><b>SIM<span style=\"white-space: pre;\">	</span>eSIM</b></div>', 'MY9K2_VW_34FR+watch-44-stainless-gold-cell-6s_VW_34FR_WF_CO.jpg', 'MGX43_VW_34FR+watch-44-alum-blue-nc-6s_VW_34FR_WF_CO.jpg', '', 0, 'In Stock', '2021-02-28 16:56:59', NULL),
(72, 4, 'WATCH SERIES 6 GREEN', 'APPLE', 80000, 80000, '<div><b>DISPLAY<span style=\"white-space: pre;\">		</span>Retina LTPO OLED, 1000 nits (peak)<br></b></div><div><b>Dimensions<span style=\"white-space: pre;\">	</span>44 x 38 x 10.7 mm (1.73 x 1.50 x 0.42 in)</b></div><div><b>Weight<span style=\"white-space: pre;\">	</span>47.8 g (1.69 oz)</b></div><div><b>Build<span style=\"white-space: pre;\">	</span>Glass front (Sapphire crystal), ceramic/sapphire crystal back, stainless steel frame</b></div><div><b>SIM<span style=\"white-space: pre;\">	</span>eSIM</b></div>', 'MJ4W3_VW_34FR+watch-44-alum-spacegray-nc-blackunity6s_VW_34FR_WF_CO.jpg', 'MJ4W3_VW_34FR+watch-44-alum-spacegray-nc-blackunity6s_VW_34FR_WF_CO.jpg', '', 0, 'In Stock', '2021-02-28 16:57:47', NULL),
(73, 5, 'WATCH SERIES 6 PINK', 'APPLE', 80000, 80000, '<div><b>DISPLAY<span style=\"white-space: pre;\">		</span>Retina LTPO OLED, 1000 nits (peak)<br></b></div><div><b>Dimensions<span style=\"white-space: pre;\">	</span>44 x 38 x 10.7 mm (1.73 x 1.50 x 0.42 in)</b></div><div><b>Weight<span style=\"white-space: pre;\">	</span>47.8 g (1.69 oz)</b></div><div><b>Build<span style=\"white-space: pre;\">	</span>Glass front (Sapphire crystal), ceramic/sapphire crystal back, stainless steel frame</b></div><div><b>SIM<span style=\"white-space: pre;\">	</span>eSIM</b></div>', 'MTPM2_VW_34FR+watch-44-alum-gold-nc-6s_VW_34FR_WF_CO.jpg', 'MTPM2_VW_34FR+watch-44-alum-gold-nc-6s_VW_34FR_WF_CO.jpg', 'MTPM2_VW_34FR+watch-44-alum-gold-nc-6s_VW_34FR_WF_CO.jpg', 0, 'In Stock', '2021-02-28 16:58:28', NULL),
(74, 5, 'WATCH SERIES 6 WHITE', 'APPLE', 80000, 80000, '<div><b>DISPLAY<span style=\"white-space: pre;\">		</span>Retina LTPO OLED, 1000 nits (peak)<br></b></div><div><b>Dimensions<span style=\"white-space: pre;\">	</span>44 x 38 x 10.7 mm (1.73 x 1.50 x 0.42 in)</b></div><div><b>Weight<span style=\"white-space: pre;\">	</span>47.8 g (1.69 oz)</b></div><div><b>Build<span style=\"white-space: pre;\">	</span>Glass front (Sapphire crystal), ceramic/sapphire crystal back, stainless steel frame</b></div><div><b>SIM<span style=\"white-space: pre;\">	</span>eSIM</b></div>', 'MX8D2_VW_34FR+watch-40-alum-silver-nc-nike6s_VW_34FR_WF_SI.jpg', 'MX8D2_VW_34FR+watch-40-alum-silver-nc-nike6s_VW_34FR_WF_SI.jpg', '', 0, 'In Stock', '2021-02-28 17:01:29', NULL),
(75, 8, 'AIR POD PRO MAX BLACK', 'APPLE', 55000, 55000, '<div>Apple-designed dynamic driver</div><div>Active Noise Cancellation</div><div>Transparency mode</div><div>Adaptive EQ</div><div>Spatial audio with dynamic head tracking1</div>', 'airpods-max-select-spacegray-202011.png', 'airpods-max-select-spacegray-202011.png', '', 0, 'In Stock', '2021-02-28 17:29:46', NULL),
(76, 8, 'AIR POD PRO MAX PINK', 'APPLE', 55000, 55000, '<div>Apple-designed dynamic driver</div><div>Active Noise Cancellation</div><div>Transparency mode</div><div>Adaptive EQ</div><div>Spatial audio with dynamic head tracking1</div>', 'airpods-max-select-pink-202011.png', 'airpods-max-select-pink-202011.png', '', 0, 'In Stock', '2021-02-28 17:30:17', NULL),
(77, 8, 'AIR POD PRO MAX GREEN', 'APPLE', 55000, 55000, '<div>Apple-designed dynamic driver</div><div>Active Noise Cancellation</div><div>Transparency mode</div><div>Adaptive EQ</div><div>Spatial audio with dynamic head tracking1</div>', 'airpods-max-select-green-202011.png', 'airpods-max-select-green-202011.png', '', 0, 'In Stock', '2021-02-28 17:30:50', NULL),
(78, 8, 'AIR POD PRO MAX BLUE', 'APPLE', 55000, 55000, '<div>Apple-designed dynamic driver</div><div>Active Noise Cancellation</div><div>Transparency mode</div><div>Adaptive EQ</div><div>Spatial audio with dynamic head tracking1</div>', 'airpods-max-select-skyblue-202011.png', 'airpods-max-select-skyblue-202011.png', 'airpods-max-select-skyblue-202011.png', 0, 'In Stock', '2021-02-28 17:31:25', NULL),
(79, 6, 'I PAD AIR PRO MAX', 'APPLE', 200000, 200000, '<div>Liquid Retina display</div><div>ProMotion technology</div><div>Wide color display (P3)</div><div>True Tone display</div><div>Fingerprint-resistant oleophobic coating</div>', '22.jpg', '22.jpg', '22.jpg', 0, 'In Stock', '2021-02-28 17:54:35', NULL),
(80, 6, 'I PAD AIR PRO MAX GRAY', 'APPLE', 200000, 200000, '<div>Liquid Retina display</div><div>ProMotion technology</div><div>Wide color display (P3)</div><div>True Tone display</div><div>Fingerprint-resistant oleophobic coating</div>', '12.jpg', '12.jpg', '', 0, 'In Stock', '2021-02-28 17:55:32', NULL),
(81, 6, 'I PAD AIR PRO MAX BLACK', 'APPLE', 200000, 200000, '<div>Liquid Retina display</div><div>ProMotion technology</div><div>Wide color display (P3)</div><div>True Tone display</div><div>Fingerprint-resistant oleophobic coating</div>', '11.jpg', '11.jpg', '', 0, 'In Stock', '2021-02-28 17:56:32', NULL),
(82, 6, 'I PAD AIR PRO MAX', 'APPLE', 200000, 200000, '<div>Liquid Retina display</div><div>ProMotion technology</div><div>Wide color display (P3)</div><div>True Tone display</div><div>Fingerprint-resistant oleophobic coating</div>', '1.jpg', '1.jpg', '1.jpg', 0, 'In Stock', '2021-02-28 17:57:15', NULL),
(83, 6, 'I PAD AIR PRO MAX GREEN', 'APPLE', 200000, 200000, '<div>Liquid Retina display</div><div>ProMotion technology</div><div>Wide color display (P3)</div><div>True Tone display</div><div>Fingerprint-resistant oleophobic coating</div>', '2.jpg', '2.jpg', '2.jpg', 0, 'In Stock', '2021-02-28 17:57:49', NULL),
(86, 5, 'test', 'APPLE', 100000, 100000, 'smnsdgjfb', 'Acess.png', '222 (1).png', '', 0, 'In Stock', '2021-03-06 07:38:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(26, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-02-26 15:03:54', NULL, 1),
(27, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-02-27 11:27:34', '27-02-2021 04:58:31 PM', 1),
(28, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-02-27 11:30:21', '27-02-2021 06:34:32 PM', 1),
(29, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-02-27 13:04:59', '27-02-2021 06:49:28 PM', 1),
(30, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-02-27 14:01:10', '27-02-2021 10:02:29 PM', 1),
(31, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-02-27 16:32:38', NULL, 1),
(32, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-02-27 18:05:31', '27-02-2021 11:52:10 PM', 1),
(33, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-02-27 18:22:15', '28-02-2021 12:09:12 AM', 1),
(34, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-02-28 04:48:14', NULL, 1),
(35, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-02-28 05:11:33', NULL, 1),
(36, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-02-28 12:28:43', NULL, 1),
(37, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-02-28 15:15:28', NULL, 1),
(38, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-02-28 15:22:02', NULL, 1),
(39, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-02-28 18:06:19', NULL, 1),
(40, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-01 14:08:21', NULL, 1),
(41, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-01 14:34:54', NULL, 1),
(42, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-01 18:38:34', '02-03-2021 12:30:49 AM', 1),
(43, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-01 19:00:55', '02-03-2021 12:31:17 AM', 1),
(44, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-01 19:13:48', NULL, 1),
(45, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-01 19:24:41', NULL, 1),
(46, '', 0x3a3a3100000000000000000000000000, '2021-03-02 13:46:22', NULL, 0),
(47, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-02 13:46:25', NULL, 1),
(48, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-02 14:36:56', NULL, 1),
(49, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-02 14:43:00', NULL, 1),
(50, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-02 15:33:33', NULL, 1),
(51, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-02 18:11:05', NULL, 1),
(52, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-02 18:16:13', NULL, 1),
(53, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-02 18:25:30', NULL, 1),
(54, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-02 19:54:40', NULL, 1),
(55, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-03 04:08:24', NULL, 1),
(56, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-03 06:48:45', NULL, 1),
(57, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-03 07:15:02', NULL, 1),
(58, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-03 14:00:07', NULL, 1),
(59, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-03 16:50:51', NULL, 1),
(60, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-03 16:53:13', NULL, 1),
(61, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-03 17:10:01', NULL, 1),
(62, '', 0x3a3a3100000000000000000000000000, '2021-03-03 19:45:48', NULL, 0),
(63, '', 0x3a3a3100000000000000000000000000, '2021-03-03 19:46:26', NULL, 0),
(64, '', 0x3a3a3100000000000000000000000000, '2021-03-03 19:46:50', NULL, 0),
(65, '', 0x3a3a3100000000000000000000000000, '2021-03-03 19:47:32', NULL, 0),
(66, '', 0x3a3a3100000000000000000000000000, '2021-03-03 19:53:03', NULL, 0),
(67, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-03 19:55:25', NULL, 1),
(68, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-04 04:45:38', NULL, 1),
(69, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-04 06:58:28', NULL, 1),
(70, '', 0x3a3a3100000000000000000000000000, '2021-03-04 07:04:35', NULL, 0),
(71, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-04 07:04:39', NULL, 1),
(72, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-04 13:05:13', NULL, 1),
(73, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-04 14:13:11', NULL, 1),
(74, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-04 17:57:07', NULL, 1),
(75, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-05 07:58:05', NULL, 1),
(76, 'Ethan@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-05 13:23:40', NULL, 1),
(77, 'Ethan@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-05 13:24:55', NULL, 1),
(78, 'Ethan@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-05 13:30:34', NULL, 1),
(79, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-05 15:11:53', NULL, 1),
(80, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-05 18:50:42', NULL, 1),
(81, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-05 18:52:33', NULL, 1),
(82, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-06 03:47:00', NULL, 1),
(83, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-06 03:47:29', NULL, 1),
(84, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-06 05:01:06', NULL, 1),
(85, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-06 06:50:53', NULL, 1),
(86, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-06 06:52:19', NULL, 1),
(87, 'dhanush@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-06 07:31:09', NULL, 1),
(88, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2021-03-06 07:35:21', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(4, 'Dhanush', 'dhanush@gmail.com', 123123, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-26 15:03:44', NULL),
(5, 'Ethan', 'Ethan@gmail.com', 771185683, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-05 13:23:25', NULL),
(6, 'Test', 'test@gmail.com', 771185683, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-06 07:34:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17'),
(2, 4, 32, '2021-02-27 16:12:18'),
(3, 4, 40, '2021-02-28 05:12:51'),
(4, 4, 39, '2021-02-28 05:26:14'),
(5, 4, 48, '2021-02-28 12:29:12'),
(6, 4, 49, '2021-02-28 12:29:24'),
(7, 4, 54, '2021-02-28 15:33:20'),
(12, 1, 60, '2021-03-05 15:31:56'),
(13, 1, 61, '2021-03-05 15:32:03'),
(14, 4, 79, '2021-03-05 18:50:54');

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
