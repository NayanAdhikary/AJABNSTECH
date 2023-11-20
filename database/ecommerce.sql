-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2023 at 04:32 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'motorolla'),
(5, 'LG'),
(7, 'Intel'),
(8, 'Red Gear'),
(9, 'MSI'),
(10, 'Asus'),
(11, 'Acer'),
(12, 'HP'),
(13, 'Lenovo'),
(14, 'Dell'),
(15, 'Razer');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1),
(150, 73, '::1', 26, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Computers'),
(5, 'Laptops'),
(7, 'Accessories');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'puneethreddy951@gmail.com'),
(5, 'puneethreddy@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Puneeth', 'puneethreddy951@gmail.com', 'Bangalore, Kumbalagodu, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234),
(2, 26, 'Nayan Adhikary', 'joydevadhikary468@gmail.com', 'lkahifff', 'kahshffsf', 'aeraf', 710125, 'Visa', '6464 1164 4511 6541', '11/25', 1, 5000, 140);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000),
(91, 2, 71, 1, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Samsung galaxy s7 edge', 5000, 'Samsung galaxy s7 edge', 'product07.png', 'samsung mobile electronics'),
(2, 1, 3, 'iPhone 5s', 25000, 'iphone 5s', 'http___pluspng.com_img-png_iphone-hd-png-iphone-apple-png-file-550.png', 'mobile iphone apple'),
(3, 1, 3, 'iPad air 2', 30000, 'ipad apple brand', 'da4371ffa192a115f922b1c0dff88193.png', 'apple ipad tablet'),
(4, 1, 3, 'iPhone 6s', 32000, 'Apple iPhone ', 'http___pluspng.com_img-png_iphone-6s-png-iphone-6s-gold-64gb-1000.png', 'iphone apple mobile'),
(5, 1, 2, 'iPad 2', 10000, 'samsung ipad', 'iPad-air.png', 'ipad tablet samsung'),
(6, 1, 1, 'samsung Laptop r series', 35000, 'samsung Black combination Laptop', 'laptop_PNG5939.png', 'samsung laptop '),
(7, 1, 1, 'Laptop Pavillion', 50000, 'Laptop Hp Pavillion', 'laptop_PNG5930.png', 'Laptop Hp Pavillion'),
(8, 1, 4, 'Sony', 40000, 'Sony Mobile', '530201353846AM_635_sony_xperia_z.png', 'sony mobile'),
(9, 1, 3, 'iPhone New', 12000, 'iphone', 'iphone-hd-png-iphone-apple-png-file-550.png', 'iphone apple mobile'),
(34, 6, 4, 'Emergency Light', 1000, 'Emergency Light', 'emergency light.JPG', 'emergency light'),
(36, 6, 5, 'Iron', 1500, 'gj', 'iron.JPG', 'iron'),
(37, 6, 5, 'LED TV', 20000, 'LED TV', 'images (4).jpg', 'led tv lg'),
(38, 6, 4, 'Microwave Oven', 3500, 'Microwave Oven', 'images.jpg', 'Microwave Oven'),
(39, 6, 5, 'Mixer Grinder', 2500, 'Mixer Grinder', 'singer-mixer-grinder-mg-46-medium_4bfa018096c25dec7ba0af40662856ef.jpg', 'Mixer Grinder'),
(45, 1, 2, 'Samsung Galaxy Note 3', 10000, '0', 'samsung_galaxy_note3_note3neo.JPG', 'samsung galaxy Note 3 neo'),
(46, 1, 2, 'Samsung Galaxy Note 3', 10000, '', 'samsung_galaxy_note3_note3neo.JPG', 'samsung galxaxy note 3 neo'),
(47, 4, 6, 'Laptop', 650, 'nbk', 'product01.png', 'Dell Laptop'),
(48, 1, 7, 'Headphones', 250, 'Headphones', 'product05.png', 'Headphones Sony'),
(49, 1, 7, 'Headphones', 250, 'Headphones', 'product05.png', 'Headphones Sony'),
(71, 1, 2, 'Samsung galaxy s7', 5000, 'Samsung galaxy s7', 'product07.png', 'samsung mobile electronics'),
(72, 7, 2, 'sony Headphones', 3500, 'sony Headphones', 'product02.png', 'sony Headphones electronics gadgets'),
(73, 7, 2, 'samsung Headphones', 3500, 'samsung Headphones', 'product05.png', 'samsung Headphones electronics gadgets'),
(74, 1, 1, 'HP i5 laptop', 5500, 'HP i5 laptop', 'product01.png', 'HP i5 laptop electronics'),
(75, 1, 1, 'HP i7 laptop 8gb ram', 5500, 'HP i7 laptop 8gb ram', 'product03.png', 'HP i7 laptop 8gb ram electronics'),
(76, 1, 5, 'sony note 6gb ram', 4500, 'sony note 6gb ram', 'product04.png', 'sony note 6gb ram mobile electronics'),
(77, 1, 4, 'MSV laptop 16gb ram NVIDEA Graphics', 5499, 'MSV laptop 16gb ram', 'product06.png', 'MSV laptop 16gb ram NVIDEA Graphics electronics'),
(78, 1, 5, 'dell laptop 8gb ram intel integerated Graphics', 4579, 'dell laptop 8gb ram intel integerated Graphics', 'product08.png', 'dell laptop 8gb ram intel integerated Graphics electronics'),
(79, 7, 2, 'camera with 3D pixels', 2569, 'camera with 3D pixels', 'product09.png', 'camera with 3D pixels camera electronics gadgets'),
(83, 7, 7, 'Intel i 9 13th gen processor', 45, 'Here are some specifications for the Intel Core i9-13900K 13th generation processor: \r\nCores: 24 cores\r\nThreads: 32 threads\r\nP-Core Clock Speed: 3 GHz\r\nTurbo Boost Max Frequency: 5.7 GHz\r\nCache Memory: 36 MB\r\nSocket: LGA 1700\r\nMemory: Dual-Channel DDR5-5600 ECC\r\nGraphics: Integrated Intel UHD 770\r\nArchitecture: Hybrid Core\r\nPlatform: Windows 10\r\nThe i9-13900K also has: \r\n150W processor base power\r\n20 PCIe lanes (16 PCIe 5.0 and four PCIe 4.0 lanes)\r\n36 MB Intel Smart Cache\r\nUp to 26 billion transistors\r\nIntel Hyper-Threading technology', '1700472758_i9 processor.png', 'Intel i 9 13th gen processor'),
(84, 5, 9, 'MSI Bravo 15 Ryzen 7 Octa Core 5800H - (16 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/AMD Radeon RX6500M/144 Hz) Bravo 15 B5ED-035IN Gaming Laptop  (15.6 inch, Black, 2.35 Kg)', 85000, '\r\nExperience the power of MD Ryzen 5000 Mobile Processor with AMD Radeon RX 6500M Graphics card for immersive gaming. You can connect instantly to the gaming world with WiFi 6E. It has a high refresh rate to provide you with smooth visuals. The thermal solutions for CPU and GPU with CoolerBoost 3 enables you with uninterrupted gaming sessions. It has a wide range of ports so that you can connect multiple devices at the same time.', '1700475746_71+r5INyowS.jpg', 'MSI Bravo 15 Ryzen 7 Octa Core 5800H - (16 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/AMD Radeon RX6500M/144 Hz) Bravo 15 B5ED-035IN Gaming Laptop  (15.6 inch, Black, 2.35 Kg)'),
(85, 5, 10, 'ASUS ROG Strix G16 (2023), Intel Core i5 13th Gen 13450HX - (16 GB/1 TB SSD/Windows 11 Home/6 GB Graphics/NVIDIA GeForce RTX 3050) G614JJ-N3088WS Gaming Laptop  (16 Inch, Gray, 2.50 Kg, With MS Office)', 94990, 'Raise Your Game. Carry Your Squad.\r\nThe Strix G18 is ready to immerse you in the latest games like never before. Featuring a 13th Intel® Core™ HX processor, NVIDIA® GeForce RTX™ 40-Series GPU with a NVIDIA Advanced Optimus support.\r\n\r\n\r\nPerformance\r\nPowered by a 13th Gen Intel® HX-Series Processor and NVIDIA GeForce RTX 30-Series Laptop GPU boasting a max TGP of 140W with Dynamic Boost, be ready to dominate the competition in all of the latest games. Backed up with a dedicated MUX Switch and NVIDIA Advanced Optimus support, With PCIe Gen4x4 SSD storage and 4800 MHz of DDR5 RAM, large game libraries and intense multitasking sessions are a breeze for this gaming machine.', '1700476295_10ba85ac-574d-4e91-b759-97b749543a9c.__CR0,0,300,300_PT0_SX300_V1___.jpg', 'ASUS ROG Strix G16 (2023), Intel Core i5 13th Gen 13450HX - (16 GB/1 TB SSD/Windows 11 Home/6 GB Graphics/NVIDIA GeForce RTX 3050) G614JJ-N3088WS Gaming Laptop  (16 Inch, Gray, 2.50 Kg, With MS Office)'),
(86, 5, 2, 'SAMSUNG Galaxy Book3 360 Intel EVO Core i5 13th Gen 1340P - (16 GB/512 GB SSD/Windows 11 Home) NP750QFG-KA2IN Thin and Light Laptop  (15.6 Inch, Graphite, 1.46 Kg, With MS Office)', 114990, 'Specifications\r\nGeneral\r\nSales Package\r\nLaptop, S-Pen, Adapter, Cable\r\nModel Number\r\nNP750QFG-KA2IN\r\nPart Number\r\nNP750QFG-KA2IN\r\nModel Name\r\nGalaxy Book3 360\r\nSeries\r\nGalaxy Book3 360 Intel EVO\r\nColor\r\nGraphite\r\nType\r\nThin and Light Laptop\r\nSuitable For\r\nProcessing & Multitasking\r\nMS Office Provided\r\nYes\r\nProcessor And Memory Features\r\nProcessor Brand\r\nIntel\r\nProcessor Name\r\nCore i5\r\nProcessor Generation\r\n13th Gen\r\nSSD\r\nYes\r\nSSD Capacity\r\n512 GB\r\nRAM\r\n16 GB\r\nRAM Type\r\nDDR4X\r\nProcessor Variant\r\n1340P\r\nClock Speed\r\nMax Turbo Frequency up to 4.6 GHz\r\nGraphic Processor\r\nIntel Integrated Iris Xe\r\nOperating System\r\nOperating System\r\nWindows 11 Home\r\nPort And Slot Features\r\nUSB Port\r\n1 x USB 3.2, 1 x USB Type - C, 1 x USB Type -C with Thunderbolt\r\nHDMI Port\r\n1 x HDMI\r\nDisplay And Audio Features\r\nTouchscreen\r\nYes\r\nScreen Size\r\n39.62 cm (15.6 Inch)\r\nScreen Resolution\r\n1920 x 1080 Pixel\r\nScreen Type\r\nSuper Amoled FHD display\r\nSpeakers\r\nYes\r\nInternal Mic\r\nYes\r\nConnectivity Features\r\nWireless LAN\r\nWiFi 6e\r\nBluetooth\r\nYes\r\nDimensions\r\nDimensions\r\n355.0 x 228.2 x 13.7 mm\r\nWeight\r\n1.46 Kg\r\nAdditional Features\r\nDisk Drive\r\nNot Available\r\nWeb Camera\r\n1080p\r\nFinger Print Sensor\r\nYes\r\nFace Recognition\r\nNo\r\nKeyboard\r\nFull Size Keyboard\r\nBacklit Keyboard\r\nYes\r\nWarranty\r\nWarranty Summary\r\n1 Year Onsite Warranty\r\nWarranty Service Type\r\nOnsite\r\nCovered in Warranty\r\nManufacturing Defects\r\nNot Covered in Warranty\r\nAccidental Damage, Wear & Tear', '1700488710_download.jpg', 'SAMSUNG Galaxy Book3 360 Intel EVO Core i5 13th Gen 1340P - (16 GB/512 GB SSD/Windows 11 Home) NP750QFG-KA2IN Thin and Light Laptop  (15.6 Inch, Graphite, 1.46 Kg, With MS Office)');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Pandey', 'puneethreddy951@gmail.com', 'puneeth', '9448121558', '123456789', 'sdcjns,djc'),
(15, 'hemu', 'ajhgdg', 'puneethreddy951@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(26, 'Nayan', 'Adhikary', 'joydevadhikary468@gmail.com', 'joydevadhikary468@', '9330494579', 'lkahifff', 'kahshffsf'),
(27, 'Asish', 'Das', 'kagsugugf@gmail.com', '1234567890', '9632145897', 'jaysgf', 'kasgfugffoa');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(26, 'Nayan', 'Adhikary', 'joydevadhikary468@gmail.com', 'joydevadhikary468@', '9330494579', 'lkahifff', 'kahshffsf'),
(27, 'Asish', 'Das', 'kagsugugf@gmail.com', '1234567890', '9632145897', 'jaysgf', 'kasgfugffoa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
