-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2022 at 01:39 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kelon`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `password` varchar(4) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `summary` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `firstname`, `lastname`, `email`, `phone`, `password`, `city`, `state`, `job_title`, `summary`) VALUES
(106, 'Kingson', 'Ejikeme', 'kingsonejikeme@gmail.com', '+2348064106990', '1234', 'Ikeja', 'Lagos', 'Software Development', 'I love code.');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `salary` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `location` varchar(6) DEFAULT NULL,
  `company_name` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `requirements` text DEFAULT NULL,
  `application_deadline` date DEFAULT NULL,
  `recruiter_id` int(11) DEFAULT NULL,
  `date_posted` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `job_title`, `salary`, `type`, `location`, `company_name`, `details`, `requirements`, `application_deadline`, `recruiter_id`, `date_posted`) VALUES
(1, 'Automation Specialist II', '$36944.76', 'part-time', 'onsite', 'Wordware', 'quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin', 'cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a', '2022-09-14', 1, '2022-08-24 04:01:38'),
(2, 'Civil Engineer', '$32130.74', 'contract', 'hybrid', 'Edgeblab', 'amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed', 'in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc', '2022-09-21', 4, '2022-08-24 04:01:38'),
(3, 'Director of Sales', '$70386.85', 'part-time', 'onsite', 'Meezzy', 'urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non', 'sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam tristique', '2022-09-30', 1, '2022-08-24 04:01:38'),
(4, 'Geological Engineer', '$12321.05', 'full-time', 'remote', 'Wordtune', 'augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum', 'ipsum dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum', '2022-09-27', 4, '2022-08-24 04:01:38'),
(5, 'General Manager', '$90784.51', 'part-time', 'remote', 'Thoughtbeat', 'curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus', 'in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus', '2022-10-03', 3, '2022-08-24 04:01:38'),
(6, 'Compensation Analyst', '$49155.76', 'internship', 'onsite', 'Youspan', 'fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis', 'felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam', '2022-09-08', 4, '2022-08-24 04:01:38'),
(7, 'Programmer Analyst I', '$50492.51', 'part-time', 'hybrid', 'Oyondu', 'donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna', 'vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce', '2022-10-01', 4, '2022-08-24 04:01:38'),
(8, 'Paralegal', '$62187.33', 'contract', 'hybrid', 'Realcube', 'nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut', 'vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium', '2022-09-20', 5, '2022-08-24 04:01:38'),
(9, 'Information Systems Manager', '$99992.81', 'full-time', 'remote', 'Dazzlesphere', 'fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis', 'euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien', '2022-09-03', 5, '2022-08-24 04:01:38'),
(10, 'Associate Professor', '$78243.40', 'internship', 'hybrid', 'Vimbo', 'lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis', 'mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum', '2022-09-14', 3, '2022-08-24 04:01:38'),
(11, 'Food Chemist', '$43647.39', 'part-time', 'remote', 'Realfire', 'mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit', 'a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla', '2022-09-07', 5, '2022-08-24 04:01:38'),
(12, 'Assistant Media Planner', '$70438.55', 'full-time', 'hybrid', 'Zoomcast', 'id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget', 'in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh', '2022-09-23', 4, '2022-08-24 04:01:38'),
(13, 'Marketing Assistant', '$98593.70', 'full-time', 'onsite', 'Cogibox', 'nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet', 'at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula', '2022-09-03', 2, '2022-08-24 04:01:38'),
(14, 'Assistant Professor', '$15297.93', 'full-time', 'onsite', 'Linkbuzz', 'justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non', 'lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat', '2022-10-08', 2, '2022-08-24 04:01:38'),
(15, 'Operator', '$57186.64', 'full-time', 'onsite', 'Eayo', 'justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum', 'eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat', '2022-09-22', 4, '2022-08-24 04:01:38'),
(16, 'Financial Advisor', '$32866.26', 'part-time', 'onsite', 'Flipstorm', 'curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non', 'massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra', '2022-09-12', 3, '2022-08-24 04:01:38'),
(17, 'Analog Circuit Design manager', '$53237.65', 'part-time', 'onsite', 'Yadel', 'faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel', 'cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst', '2022-09-20', 4, '2022-08-24 04:01:38'),
(18, 'Programmer Analyst III', '$42571.57', 'contract', 'onsite', 'Reallinks', 'accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa', 'metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus', '2022-09-18', 1, '2022-08-24 04:01:38'),
(19, 'Structural Analysis Engineer', '$32857.92', 'part-time', 'hybrid', 'Eadel', 'elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla', 'faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst', '2022-10-03', 2, '2022-08-24 04:01:38'),
(20, 'Senior Editor', '$82640.62', 'full-time', 'onsite', 'Zooxo', 'iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci', 'integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti', '2022-10-07', 4, '2022-08-24 04:01:38'),
(21, 'Electrical Engineer', '$54110.31', 'internship', 'remote', 'Mymm', 'pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet', 'in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus', '2022-09-13', 4, '2022-08-24 04:01:38'),
(22, 'Paralegal', '$74474.09', 'full-time', 'onsite', 'Abata', 'ipsum dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in', 'porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque', '2022-09-21', 3, '2022-08-24 04:01:38'),
(23, 'Help Desk Technician', '$35087.27', 'part-time', 'onsite', 'Twiyo', 'tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in', 'leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in', '2022-09-13', 3, '2022-08-24 04:01:38'),
(24, 'Quality Control Specialist', '$77007.08', 'contract', 'hybrid', 'Demivee', 'non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis', 'luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in', '2022-09-28', 4, '2022-08-24 04:01:38'),
(25, 'Information Systems Manager', '$92852.34', 'contract', 'onsite', 'Realpoint', 'in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum', 'et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis', '2022-10-02', 4, '2022-08-24 04:01:38'),
(26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-24 07:11:33'),
(27, 'a', 's', 'a', 'a', 's', 's', 'NULL', '2022-08-20', 72, '2022-08-24 07:26:14'),
(28, 'a', 'a', 'a', 'a', 'a', 'a', 'NULL', '2022-08-20', 72, '2022-08-24 07:26:56'),
(29, 'a', 'a', 'a', 'a', 'a', 'a', 'NULL', '2022-08-20', 72, '2022-08-24 07:27:58'),
(30, 'a', 'a', 'a', 'a', 'a', 'a', 'NULL', '2022-08-20', 72, '2022-08-24 07:28:32'),
(31, 'a', 'a', 'a', 'a', 'a', 'a', 'NULL', '2022-08-20', 72, '0000-00-00 00:00:00'),
(32, 'a', 'a', 'a', 'a', 'a', 'a', 'NULL', '2022-08-20', 72, '0000-00-00 00:00:00'),
(33, 'a', 'a', 'a', 'a', 'a', 'a', 'NULL', '2022-08-20', 72, '0000-00-00 00:00:00'),
(34, 'a', 's', 'a', 'a', 'a', 'a', 'NULL', '2022-08-20', 72, '0000-00-00 00:00:00'),
(35, 'a', 's', 'a', 'a', 'a', 'a', 'NULL', '2022-08-20', 72, '2022-10-09 23:00:00'),
(36, 'a', 'a', 'a', 'a', 'a', 'a', 'NULL', '2022-08-20', 72, '2022-10-09 23:00:00'),
(37, 'Dancer', '$50,000', 'Full time', 'Remote', 'Atilogwu plc', 'Ekueme', 'NULL', '2022-09-02', 72, '0000-00-00 00:00:00'),
(38, 'Dancer', '$50,000', 'Full time', 'Remote', 'Atilogwu plc', 'Ekueme', 'NULL', '2022-09-02', 72, '0000-00-00 00:00:00'),
(39, 'Frrontend Developer', '$500,000', 'Full-time', 'Remote', 'Paystack', 'Design beautiful UI', 'NULL', '2022-08-31', 73, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `recruiters`
--

CREATE TABLE `recruiters` (
  `recruiter_id` int(11) NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `phone` text NOT NULL,
  `company_name` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `industry` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recruiters`
--

INSERT INTO `recruiters` (`recruiter_id`, `firstname`, `lastname`, `email`, `password`, `phone`, `company_name`, `city`, `state`, `industry`) VALUES
(72, 'Jane', 'Uzoma', 'juzo@gmail.com', '1234', '234809678576', 'Microsoft', 'Manchester', 'UK', 'Tech'),
(73, 'John', 'Willy', 'jwills@gmail.com', '1234', '1209384756', 'IBM', 'Ikorodu', 'Lagos', 'Data Science'),
(74, 'Jane', 'Luke', 'jl@gmail.com', '1234', '09009909889', 'Google', 'Fremont', 'ON', 'Tech');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `recruiter_id` (`recruiter_id`);

--
-- Indexes for table `recruiters`
--
ALTER TABLE `recruiters`
  ADD PRIMARY KEY (`recruiter_id`),
  ADD UNIQUE KEY `email` (`email`) USING HASH,
  ADD UNIQUE KEY `phone` (`phone`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `recruiters`
--
ALTER TABLE `recruiters`
  MODIFY `recruiter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `recruiter_id` FOREIGN KEY (`recruiter_id`) REFERENCES `recruiters` (`recruiter_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
