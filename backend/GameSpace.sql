-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Pi 16.Jan 2026, 18:58
-- Verzia serveru: 10.4.32-MariaDB
-- Verzia PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `gamespace`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `accordion`
--

CREATE TABLE `accordion` (
  `idAccordion` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `accordion`
--

INSERT INTO `accordion` (`idAccordion`, `title`, `description`, `created_at`, `last_update`) VALUES
(9, 'Môžem vrátiť alebo vymeniť tovar?', 'Áno, máte právo na vrátenie tovaru do 14 dní od jeho doručenia alebo na výmenu produktu za iný kus.', '2026-01-13 12:31:13', '2026-01-13 12:31:13'),
(10, 'Ako zistím kompatibilitu príslušenstva s mojou konzolou alebo PC?', 'Každý produkt má uvedené kompatibilné platformy v popise produktu. Ak si nie ste istí, kontaktujte našu zákaznícku podporu.', '2026-01-13 12:31:26', '2026-01-13 12:31:26'),
(11, 'Sú všetky produkty nové a originálne?', 'Áno, všetky hry a príslušenstvo na GameSpace sú originálne, nové a zaručene od oficiálnych distribútorov.', '2026-01-13 12:31:39', '2026-01-13 12:31:39'),
(12, 'Aké typy hier sú dostupné na GameSpace?', 'a GameSpace nájdete široký výber hier pre PC, konzoly (PlayStation, Xbox, Nintendo) aj mobilné zariadenia, vrátane akčných, RPG, športových a strategických hier.', '2026-01-13 12:32:00', '2026-01-13 12:32:00'),
(13, 'Ponúkate aj herné príslušenstvo?', 'Áno, máme široký sortiment herného príslušenstva – myši, klávesnice, headsety, ovládače, podložky a ďalšie doplnky pre hráčov.', '2026-01-13 12:32:32', '2026-01-13 12:32:32');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `address`
--

CREATE TABLE `address` (
  `idAddress` int(11) NOT NULL,
  `city` varchar(60) NOT NULL,
  `postal_code` varchar(15) NOT NULL,
  `street` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `address`
--

INSERT INTO `address` (`idAddress`, `city`, `postal_code`, `street`, `created_at`, `last_update`) VALUES
(1, 'asd', 'sad', 'asd', '2025-12-16 13:16:45', '2025-12-16 13:16:45'),
(2, 'safasf', '123456', 'asfasf', '2025-12-16 13:21:07', '2025-12-16 13:21:07'),
(3, 'asf', 'asf', 'asf', '2025-12-16 13:40:25', '2025-12-16 13:40:25'),
(4, 'asf', 'asf', 'asf', '2025-12-16 13:44:42', '2025-12-16 13:44:42'),
(5, 'asf', 'asf', 'asf', '2025-12-16 13:49:13', '2025-12-16 13:49:13'),
(6, 'asf', 'asdasd', 'asf', '2025-12-16 13:53:49', '2025-12-16 13:53:49'),
(7, 'asf', 'asf', 'asf', '2025-12-16 13:55:44', '2025-12-16 13:55:44'),
(9, 'asf', 'asf', 'asf', '2025-12-16 14:04:08', '2025-12-16 14:04:08'),
(10, 'asf', 'asf', 'asf', '2025-12-16 14:08:27', '2025-12-16 14:08:27'),
(11, 'Hfs', '123456', 'Asf', '2025-12-16 15:00:34', '2025-12-16 15:00:34'),
(12, 'Male', '95182', 'Velke', '2025-12-19 15:40:57', '2025-12-19 15:40:57'),
(13, 'Malé Vozokany', '95182', 'Hlavná ulica 81/21', '2025-12-21 12:40:31', '2025-12-21 12:40:31'),
(14, 'Adsad', '95182', 'Asds', '2025-12-25 15:20:14', '2025-12-25 15:20:14'),
(15, 'Male', '95182', 'SD', '2025-12-27 13:14:18', '2025-12-27 13:14:18'),
(16, 'Malé Vozokany', '12344', 'Hlavná ulica 81/2', '2025-12-27 14:27:50', '2026-01-15 13:30:48'),
(17, 'Male', '95182', 'Velke', '2025-12-27 14:47:03', '2025-12-27 14:47:03'),
(18, 'DAS', '85182', 'SSA', '2026-01-10 10:16:44', '2026-01-10 10:16:44'),
(19, 'Male', '95182', 'Velke', '2026-01-10 12:11:58', '2026-01-10 12:11:58'),
(20, 'Male', '123456', 'Velke', '2026-01-10 17:29:12', '2026-01-10 17:29:12'),
(21, 'Male', '123456', 'Velke', '2026-01-11 12:58:33', '2026-01-11 12:58:33'),
(22, 'Malé Vozokany', '12345', 'Hlavná ulica 81/21', '2026-01-13 14:56:19', '2026-01-13 14:56:19'),
(23, 'Malé Vozokany', '95182', 'Hlavná ulica 30/10', '2026-01-14 08:38:58', '2026-01-14 08:38:58'),
(24, 'Malé Vozokany', '95182', 'Hlavná ulica 30/10', '2026-01-15 12:52:59', '2026-01-15 12:52:59'),
(31, 'Malé Vozokany', '95182', 'Hlavná ulica 30/10', '2026-01-15 17:15:35', '2026-01-15 17:15:35'),
(32, 'Malé Vozokany', '95182', 'Hlavná ulica 30/10', '2026-01-15 17:16:52', '2026-01-15 17:16:52'),
(33, 'Malé Vozokany', '95182', 'Hlavná ulica 30/10', '2026-01-15 17:43:37', '2026-01-15 17:43:37'),
(34, 'Malé Vozokany', '95182', 'Hlavná ulica 30/10', '2026-01-16 16:20:07', '2026-01-16 16:20:07'),
(35, 'Malé Vozokany', '95182', 'Hlavná ulica 30/10', '2026-01-16 17:24:04', '2026-01-16 17:24:04');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `category`
--

CREATE TABLE `category` (
  `idCategory` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `category`
--

INSERT INTO `category` (`idCategory`, `name`, `parent_id`, `slug`) VALUES
(1, 'Hry', NULL, 'hry'),
(2, 'Notebooky a PC', NULL, 'notebooky-a-pc'),
(3, 'Príslušenstvo', NULL, 'príslušenstvo'),
(4, 'Konzoly', NULL, 'konzoly'),
(5, 'Doplnky', NULL, 'doplnky'),
(22, 'Akčné', 1, 'akcne'),
(23, 'RPG', 1, 'rpg'),
(24, 'Strategické', 1, 'strategicke'),
(25, 'Simulačné', 1, 'simulacne'),
(26, 'Športové', 1, 'sportove'),
(27, 'Pre deti', 1, 'pre-deti'),
(28, 'Indie', 1, 'indie'),
(29, 'Hororové', 1, 'hororove'),
(30, 'Adventúry', 1, 'adventury'),
(31, 'Multiplayer', 1, 'multiplayer'),
(33, 'VR', 1, 'vr'),
(34, 'Sci-fi', 1, 'sci-fi'),
(35, 'Laptopy', 2, 'laptopy'),
(36, 'Desktop PC', 2, 'desktop-pc'),
(37, 'All-in-One', 2, 'all-in-one'),
(38, 'Gaming PC', 2, 'gaming-pc'),
(39, 'Monitory', 2, 'monitory'),
(40, 'Klávesnice', 3, 'klavesnice'),
(41, 'Myši', 3, 'mysi'),
(42, 'Slúchadlá', 3, 'sluchadla'),
(43, 'Externé disky', 3, 'externe-disky'),
(44, 'USB a káble', 3, 'usb-a-kable'),
(45, 'Herné konzoly', 4, 'herne-konzoly'),
(46, 'Konzolové príslušenstvo', 4, 'konzolove-prislusenstvo'),
(47, 'Retro konzoly', 4, 'retro-konzoly'),
(48, 'Ovládače a gamepady', 4, 'ovladace-gamepady'),
(49, 'Tašky a púzdra', 5, 'tasky-puzdra'),
(50, 'Stojany a držiaky', 5, 'stojany-drziaky'),
(51, 'Podložky a doplnky', 5, 'podlozky-doplnky'),
(52, 'Dobíjacie karty', 5, 'dobijacie-karty');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `footer`
--

CREATE TABLE `footer` (
  `idFooter` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `icon_name` varchar(80) NOT NULL,
  `background_color` varchar(30) NOT NULL,
  `color` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `footer`
--

INSERT INTO `footer` (`idFooter`, `link`, `icon_name`, `background_color`, `color`, `created_at`, `last_update`) VALUES
(1, 'https://facebook.com', 'fab fa-facebook-f', '#1877F2', '#ffffff', '2025-12-07 16:46:45', '2025-12-07 16:46:45'),
(2, 'https://instagram.com', 'fab fa-instagram', '#E1306C', '#ffffff', '2025-12-07 16:46:45', '2025-12-07 16:46:45'),
(3, 'https://youtube.com', 'fab fa-youtube', '#FF0000', '#ffffff', '2025-12-07 16:46:45', '2025-12-07 16:46:45'),
(4, 'https://linkedin.com', 'fab fa-linkedin-in', '#0077B5', '#ffffff', '2025-12-07 16:46:45', '2025-12-07 16:46:45');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `items`
--

CREATE TABLE `items` (
  `idItems` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `price` float NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `alt` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `html_description` text NOT NULL,
  `is_deleted` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `items`
--

INSERT INTO `items` (`idItems`, `name`, `price`, `description`, `image`, `created_at`, `last_update`, `alt`, `release_date`, `slug`, `html_description`, `is_deleted`) VALUES
(1, 'The Legend of Zelda: Breath of the Wild', 59.99, 'Open-world action-adventure game set in Hyrule.', 'http://localhost/GameSpace/img/user/zelda.jpg', '2025-12-09 07:16:09', '2026-01-14 07:43:20', 'The Legend of Zelda: Breath of the Wild cover', '2017-03-03', 'the-legend-of-zelda-breath-of-the-wild', '', 0),
(2, 'Minecraft', 26.95, 'Sandbox game about placing blocks and going on adventures.', 'http://localhost/GameSpace/img/user/minecraft.jpg', '2025-12-09 07:16:09', '2026-01-15 12:52:59', 'Minecraft cover', '2011-11-18', 'minecraft', '', 0),
(3, 'Cyberpunk 2077', 49.99, 'Futuristic open-world RPG in a dystopian city.', 'http://localhost/GameSpace/img/user/cyberpunk2077.jpg', '2025-12-09 07:16:09', '2026-01-15 12:52:59', 'Cyberpunk 2077 cover', '2020-12-10', 'cyberpunk-2077', '', 0),
(4, 'God of War', 39.99, 'Action-adventure game following Kratos and his son.', 'http://localhost/GameSpace/img/user/god_of_war.jpg', '2025-12-09 07:16:09', '2026-01-10 17:24:58', 'God of War cover', '2018-04-20', 'god-of-war', '', 0),
(5, 'Among Us', 4.99, 'Multiplayer social deduction game set on a spaceship.', 'http://localhost/GameSpace/img/user/among_us.jpg', '2025-12-09 07:16:09', '2026-01-14 08:38:58', 'Among Us cover', '2018-06-15', 'among-us', '', 0),
(8, 'OfficeMate 15\"', 899.5, 'Reliable notebook for office tasks with 16GB RAM and 256GB SSD.', 'officemate_15.jpg', '2025-12-11 09:09:12', '2026-01-16 12:16:41', 'OfficeMate 15\" laptop', '2025-03-05', 'officemate-15', '', 1),
(9, 'CompactBook 13\"', 749.99, 'Ultra-portable 13-inch notebook with long battery life.', 'compactbook_13.jpg', '2025-12-11 09:09:12', '2026-01-16 12:16:38', 'CompactBook 13\" laptop', '2025-01-22', 'compactbook-13', '', 1),
(10, 'PowerStation 15\"', 1599.99, 'Powerful 15-inch PC laptop with 32GB RAM and 1TB SSD.', 'powerstation_15.jpg', '2025-12-11 09:09:12', '2026-01-16 12:16:35', 'PowerStation 15\" laptop', '2025-04-01', 'powerstation-15', '', 1),
(11, 'Notebook X1', 1199, 'Slim notebook with touchscreen and 16GB RAM.', 'notebook_x1.jpg', '2025-12-11 09:09:12', '2026-01-16 12:16:32', 'Notebook X1 touchscreen laptop', '2025-02-28', 'notebook-x1', '', 1),
(12, 'Gaming Mini 15\"', 1999.99, 'Compact gaming notebook with RTX 4070 and 16GB RAM.', 'gaming_mini_15.jpg', '2025-12-11 09:09:12', '2026-01-16 12:16:30', 'Gaming Mini 15\" laptop', '2025-03-12', 'gaming-mini-15', '', 1),
(13, 'EcoBook 14\"', 679.5, 'Eco-friendly notebook with energy-efficient processor.', 'ecobook_14.jpg', '2025-12-11 09:09:12', '2026-01-16 12:16:27', 'EcoBook 14\" laptop', '2025-04-05', 'ecobook-14', '', 1),
(14, 'ProStation 16\"', 1899.99, 'Professional workstation laptop with 64GB RAM.', 'prostation_16.jpg', '2025-12-11 09:09:12', '2026-01-16 12:16:23', 'ProStation 16\" laptop', '2025-01-30', 'prostation-16', '', 1),
(15, 'TravelBook 13\"', 799.99, 'Light and portable notebook ideal for travel.', 'travelbook_13.jpg', '2025-12-11 09:09:12', '2026-01-16 12:16:20', 'TravelBook 13\" laptop', '2025-02-20', 'travelbook-13', '', 1),
(16, 'Gaming Mouse X200', 49.99, 'High-precision gaming mouse with RGB lighting.', 'http://localhost/GameSpace/img/user/x200.webp', '2025-12-11 09:33:33', '2026-01-13 14:50:06', 'Gaming Mouse X200', '2025-05-10', 'gaming-mouse-x200', '', 0),
(17, 'Mechanical Keyboard K75', 89.99, 'Mechanical keyboard with customizable RGB keys.', 'http://localhost/GameSpace/img/user/k75.webp', '2025-12-11 09:33:33', '2026-01-13 14:52:37', 'Mechanical Keyboard K75', '2025-06-01', 'mechanical-keyboard-k75', '', 0),
(18, 'Wireless Headset H7', 79.99, 'Wireless headset with surround sound.', 'http://localhost/GameSpace/img/user/h7.jpg', '2025-12-11 09:33:33', '2026-01-13 14:51:19', 'Wireless Headset H7', '2025-07-15', 'wireless-headset-h7', '', 0),
(19, 'Herná konzola Sony PlayStation 5 (typ modelu - slim) + 2x bezdrátový ovladač DualSense', 610, 'herná konzola Playstation 5 • modulárny dizajn • interná pamäť 1 000 GB (825 GB dostupných používateľov) • podpora HDR a 4K/8K • 8-jadrový procesor AMD Zen 2', 'http://localhost/GameSpace/img/user/slideshow_696a348b3fde4.jpg', '2025-12-11 09:35:48', '2026-01-16 12:52:27', 'PlayStation 5', '2020-11-12', 'herná-konzola-sony-playstation-5-(typ-modelu---slim)-+-2x-bezdrátový-ovladač-dualsense', '<h3 data-start=\"164\" data-end=\"188\"><strong data-start=\"168\" data-end=\"188\">Vylep&scaron;en&yacute; dizajn</strong></h3>\r\n<ul data-start=\"189\" data-end=\"521\">\r\n<li data-start=\"189\" data-end=\"292\">\r\n<p data-start=\"191\" data-end=\"292\"><strong data-start=\"191\" data-end=\"209\">Kompaktn&eacute; &scaron;asi</strong> &ndash; o 30 % men&scaron;ie rozmery a o 18 % niž&scaron;ia hmotnosť pri zachovan&iacute; rovnak&eacute;ho v&yacute;konu.</p>\r\n</li>\r\n<li data-start=\"293\" data-end=\"393\">\r\n<p data-start=\"295\" data-end=\"393\"><strong data-start=\"295\" data-end=\"315\">Modul&aacute;rny dizajn</strong> s oddeliteľnou externou optickou mechanikou (USB-C) pre jednoduch&yacute; upgrade.</p>\r\n</li>\r\n<li data-start=\"394\" data-end=\"521\">\r\n<p data-start=\"396\" data-end=\"521\">Vylep&scaron;en&yacute; syst&eacute;m chladenia s rebrinovou &scaron;trukt&uacute;rou &ndash; konzola zost&aacute;va <strong data-start=\"465\" data-end=\"493\">tich&aacute; a bez prehrievania</strong> aj pri maxim&aacute;lnej z&aacute;ťaži.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"523\" data-end=\"526\" />\r\n<h3 data-start=\"528\" data-end=\"551\"><strong data-start=\"532\" data-end=\"551\">V&yacute;konn&yacute; hardv&eacute;r</strong></h3>\r\n<ul data-start=\"552\" data-end=\"836\">\r\n<li data-start=\"552\" data-end=\"619\">\r\n<p data-start=\"554\" data-end=\"619\"><strong data-start=\"554\" data-end=\"586\">8-jadrov&yacute; procesor AMD Zen 2</strong> a grafick&yacute; čip <strong data-start=\"602\" data-end=\"616\">AMD RDNA 2</strong>.</p>\r\n</li>\r\n<li data-start=\"620\" data-end=\"715\">\r\n<p data-start=\"622\" data-end=\"715\"><strong data-start=\"622\" data-end=\"668\">Intern&aacute; pam&auml;ť 1 000 GB (825 GB dostupn&yacute;ch)</strong> so SSD r&yacute;chlosťou prenosu d&aacute;t až <strong data-start=\"702\" data-end=\"712\">9 GB/s</strong>.</p>\r\n</li>\r\n<li data-start=\"716\" data-end=\"836\">\r\n<p data-start=\"718\" data-end=\"836\">Podpora <strong data-start=\"726\" data-end=\"742\">HDR, 4K a 8K</strong>, technol&oacute;gia <strong data-start=\"756\" data-end=\"771\">Ray Tracing</strong> a <strong data-start=\"774\" data-end=\"785\">120 FPS</strong> pre realistick&uacute; grafiku a plynul&yacute; hern&yacute; z&aacute;žitok.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"838\" data-end=\"841\" />\r\n<h3 data-start=\"843\" data-end=\"869\"><strong data-start=\"847\" data-end=\"869\">Ovl&aacute;dače DualSense</strong></h3>\r\n<ul data-start=\"870\" data-end=\"1007\">\r\n<li data-start=\"870\" data-end=\"927\">\r\n<p data-start=\"872\" data-end=\"927\">S&uacute;časťou balenia <strong data-start=\"889\" data-end=\"924\">2&times; bezdr&ocirc;tov&yacute; ovl&aacute;dač DualSense</strong>.</p>\r\n</li>\r\n<li data-start=\"928\" data-end=\"1007\">\r\n<p data-start=\"930\" data-end=\"1007\">Vylep&scaron;en&aacute; <strong data-start=\"940\" data-end=\"958\">hmatov&aacute; odozva</strong> a adapt&iacute;vne sp&uacute;&scaron;ťače zvy&scaron;uj&uacute; pohltenie do hry.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1009\" data-end=\"1012\" />\r\n<h3 data-start=\"1014\" data-end=\"1046\"><strong data-start=\"1018\" data-end=\"1046\">Knižnica a online služby</strong></h3>\r\n<ul data-start=\"1047\" data-end=\"1204\">\r\n<li data-start=\"1047\" data-end=\"1128\">\r\n<p data-start=\"1049\" data-end=\"1128\">Hrajte <strong data-start=\"1056\" data-end=\"1081\">exkluz&iacute;vne tituly PS5</strong> alebo stiahnite hry z <strong data-start=\"1104\" data-end=\"1125\">PlayStation Store</strong>.</p>\r\n</li>\r\n<li data-start=\"1129\" data-end=\"1204\">\r\n<p data-start=\"1131\" data-end=\"1204\">Podpora <strong data-start=\"1139\" data-end=\"1165\">streamovania 4K obsahu</strong> a ďal&scaron;&iacute;ch aplik&aacute;ci&iacute; (Netflix, atď.).</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1206\" data-end=\"1209\" />\r\n<h3 data-start=\"1211\" data-end=\"1238\"><strong data-start=\"1215\" data-end=\"1238\">Porty a konektivita</strong></h3>\r\n<ul data-start=\"1239\" data-end=\"1319\">\r\n<li data-start=\"1239\" data-end=\"1286\">\r\n<p data-start=\"1241\" data-end=\"1286\"><strong data-start=\"1241\" data-end=\"1284\">LAN (Ethernet), Wi-Fi ac, Bluetooth 5.1</strong></p>\r\n</li>\r\n<li data-start=\"1287\" data-end=\"1319\">\r\n<p data-start=\"1289\" data-end=\"1319\"><strong data-start=\"1289\" data-end=\"1317\">HDMI, 3&times; USB-A, 1&times; USB-C</strong></p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1321\" data-end=\"1324\" />\r\n<h3 data-start=\"1326\" data-end=\"1347\"><strong data-start=\"1330\" data-end=\"1347\">Obsah balenia</strong></h3>\r\n<p>&nbsp;</p>\r\n<ul data-start=\"1348\" data-end=\"1452\">\r\n<li data-start=\"1348\" data-end=\"1385\">\r\n<p data-start=\"1350\" data-end=\"1385\">Konzola PlayStation 5 (D Chassis)</p>\r\n</li>\r\n<li data-start=\"1386\" data-end=\"1410\">\r\n<p data-start=\"1388\" data-end=\"1410\">2&times; ovl&aacute;dač DualSense</p>\r\n</li>\r\n<li data-start=\"1411\" data-end=\"1452\">\r\n<p data-start=\"1413\" data-end=\"1452\">HDMI k&aacute;bel, USB k&aacute;bel, nap&aacute;jac&iacute; k&aacute;bel</p>\r\n</li>\r\n</ul>', 0),
(20, 'Xbox Series X – 1 TB Carbon Black', 730, 'Herná konzola k televízoru – SSD 1024 GB, Blu-ray (4K), možnosť hrania v 4K, menu v slovenčine, 1× herný ovládač v balení, čierna farba', 'http://localhost/GameSpace/img/user/slideshow_696a341292606.webp', '2025-12-11 09:35:48', '2026-01-16 12:50:26', 'Xbox Series X', '2020-11-10', 'xbox-series-x-–-1-tb-carbon-black', '<h3 data-start=\"147\" data-end=\"169\"><strong data-start=\"151\" data-end=\"169\">&Scaron;pičkov&yacute; v&yacute;kon</strong></h3>\r\n<ul data-start=\"170\" data-end=\"434\">\r\n<li data-start=\"170\" data-end=\"245\">\r\n<p data-start=\"172\" data-end=\"245\">Grafick&yacute; v&yacute;kon až <strong data-start=\"190\" data-end=\"207\">12 teraflopov</strong> s podporou <strong data-start=\"219\" data-end=\"242\">DirectX ray tracing</strong>.</p>\r\n</li>\r\n<li data-start=\"246\" data-end=\"368\">\r\n<p data-start=\"248\" data-end=\"368\">&Scaron;peci&aacute;lny <strong data-start=\"258\" data-end=\"270\">SSD disk</strong> a architekt&uacute;ra <strong data-start=\"286\" data-end=\"303\">Xbox Velocity</strong> umožňuj&uacute; r&yacute;chle nač&iacute;tanie a <strong data-start=\"332\" data-end=\"365\">plynul&eacute; hranie až pri 120 FPS</strong>.</p>\r\n</li>\r\n<li data-start=\"369\" data-end=\"434\">\r\n<p data-start=\"371\" data-end=\"434\">Hranie v <strong data-start=\"380\" data-end=\"396\">4K rozl&iacute;&scaron;en&iacute;</strong> s neuveriteľnou vizu&aacute;lnou kvalitou.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"436\" data-end=\"439\" />\r\n<h3 data-start=\"441\" data-end=\"471\"><strong data-start=\"445\" data-end=\"471\">Obrovsk&aacute; knižnica hier</strong></h3>\r\n<ul data-start=\"472\" data-end=\"696\">\r\n<li data-start=\"472\" data-end=\"526\">\r\n<p data-start=\"474\" data-end=\"526\">Pr&iacute;stup k tis&iacute;com hier zo &scaron;tyroch gener&aacute;ci&iacute; Xboxu.</p>\r\n</li>\r\n<li data-start=\"527\" data-end=\"600\">\r\n<p data-start=\"529\" data-end=\"600\"><strong data-start=\"529\" data-end=\"564\">Stovky optimalizovan&yacute;ch titulov</strong> s lep&scaron;ou grafikou a hrateľnosťou.</p>\r\n</li>\r\n<li data-start=\"601\" data-end=\"696\">\r\n<p data-start=\"603\" data-end=\"696\">Hrajte popul&aacute;rne tituly ako <strong data-start=\"631\" data-end=\"684\">Minecraft Legends, Halo Infinite, Forza Horizon 5</strong> a ďal&scaron;ie.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"698\" data-end=\"701\" />\r\n<h3 data-start=\"703\" data-end=\"734\"><strong data-start=\"707\" data-end=\"734\">Xbox Game Pass Ultimate</strong></h3>\r\n<ul data-start=\"735\" data-end=\"996\">\r\n<li data-start=\"735\" data-end=\"818\">\r\n<p data-start=\"737\" data-end=\"818\">Najlep&scaron;&iacute; z&aacute;žitok z&iacute;skate s <strong data-start=\"764\" data-end=\"791\">Xbox Game Pass Ultimate</strong> (pred&aacute;va sa samostatne).</p>\r\n</li>\r\n<li data-start=\"819\" data-end=\"924\">\r\n<p data-start=\"821\" data-end=\"924\">Buďte medzi prv&yacute;mi, ktor&iacute; si zahraj&uacute; nov&eacute; hry ako <strong data-start=\"871\" data-end=\"884\">Starfield</strong> a <strong data-start=\"887\" data-end=\"907\">Forza Motorsport</strong> v deň vydania.</p>\r\n</li>\r\n<li data-start=\"925\" data-end=\"996\">\r\n<p data-start=\"927\" data-end=\"996\">Neust&aacute;le sa prid&aacute;vaj&uacute; nov&eacute; hry, takže nikdy nezostanete bez z&aacute;bavy.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"998\" data-end=\"1001\" />\r\n<h3 data-start=\"1003\" data-end=\"1029\"><strong data-start=\"1007\" data-end=\"1029\">Hranie s priateľmi</strong></h3>\r\n<p>&nbsp;</p>\r\n<ul data-start=\"1030\" data-end=\"1152\">\r\n<li data-start=\"1030\" data-end=\"1091\">\r\n<p data-start=\"1032\" data-end=\"1091\">Konzola podporuje <strong data-start=\"1050\" data-end=\"1064\">cross-play</strong> s PC a cloudov&yacute;m hran&iacute;m.</p>\r\n</li>\r\n<li data-start=\"1092\" data-end=\"1152\">\r\n<p data-start=\"1094\" data-end=\"1152\">Užite si stovky hier s priateľmi kdekoľvek a kedykoľvek.</p>\r\n</li>\r\n</ul>', 0),
(21, 'Nintendo Switch (OLED model) White', 349.99, 'Herná konzola – 7\" OLED displej, 1280 × 720, 60 Hz, 64 GB, slot na pamäťové karty, batéria 4310 mAh, biela farba', 'http://localhost/GameSpace/img/user/slideshow_696a34f77b8b7.webp', '2025-12-11 09:35:48', '2026-01-16 12:54:15', 'Nintendo Switch OLED', '2021-10-08', 'nintendo-switch-(oled-model)-white', '<h3 data-start=\"155\" data-end=\"178\"><strong data-start=\"159\" data-end=\"178\">V&yacute;konn&yacute; hardv&eacute;r</strong></h3>\r\n<ul data-start=\"179\" data-end=\"302\">\r\n<li data-start=\"179\" data-end=\"245\">\r\n<p data-start=\"181\" data-end=\"245\"><strong data-start=\"181\" data-end=\"206\">Procesor NVIDIA Tegra</strong> zabezpečuje plynul&yacute; v&yacute;kon pri hran&iacute;.</p>\r\n</li>\r\n<li data-start=\"246\" data-end=\"302\">\r\n<p data-start=\"248\" data-end=\"302\">Zdokonalen&yacute; model pon&uacute;ka <strong data-start=\"273\" data-end=\"299\">64 GB intern&eacute; &uacute;ložisko</strong>.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"304\" data-end=\"307\" />\r\n<h3 data-start=\"309\" data-end=\"329\"><strong data-start=\"313\" data-end=\"329\">OLED displej</strong></h3>\r\n<ul data-start=\"330\" data-end=\"461\">\r\n<li data-start=\"330\" data-end=\"461\">\r\n<p data-start=\"332\" data-end=\"461\"><strong data-start=\"332\" data-end=\"351\">7\" OLED displej</strong> poskytuje jasnej&scaron;ie farby, vy&scaron;&scaron;&iacute; kontrast a mimoriadne obrazov&eacute; parametre oproti predch&aacute;dzaj&uacute;cej gener&aacute;cii.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"463\" data-end=\"466\" />\r\n<h3 data-start=\"468\" data-end=\"505\"><strong data-start=\"472\" data-end=\"505\">Modul&aacute;rny a flexibiln&yacute; dizajn</strong></h3>\r\n<ul data-start=\"506\" data-end=\"716\">\r\n<li data-start=\"506\" data-end=\"584\">\r\n<p data-start=\"508\" data-end=\"584\">Konzola funguje ako <strong data-start=\"528\" data-end=\"547\">prenosn&yacute; tablet</strong> s odn&iacute;mateľn&yacute;mi ovl&aacute;dačmi Joy-Con.</p>\r\n</li>\r\n<li data-start=\"585\" data-end=\"646\">\r\n<p data-start=\"587\" data-end=\"646\">R&yacute;chle pripojenie k telev&iacute;zoru cez <strong data-start=\"622\" data-end=\"643\">dokovaciu stanicu</strong>.</p>\r\n</li>\r\n<li data-start=\"647\" data-end=\"716\">\r\n<p data-start=\"649\" data-end=\"716\">Integrovan&yacute; <strong data-start=\"661\" data-end=\"684\">nastaviteľn&yacute; stojan</strong> pre pohodln&eacute; hranie na stole.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"718\" data-end=\"721\" />\r\n<h3 data-start=\"723\" data-end=\"758\"><strong data-start=\"727\" data-end=\"758\">Vylep&scaron;en&aacute; dokovacia stanica</strong></h3>\r\n<ul data-start=\"759\" data-end=\"873\">\r\n<li data-start=\"759\" data-end=\"816\">\r\n<p data-start=\"761\" data-end=\"816\"><strong data-start=\"761\" data-end=\"773\">LAN port</strong> pre stabiln&eacute; pripojenie k dom&aacute;cej sieti.</p>\r\n</li>\r\n<li data-start=\"817\" data-end=\"873\">\r\n<p data-start=\"819\" data-end=\"873\">Kvalitnej&scaron;ie reproduktory pre lep&scaron;&iacute; zvukov&yacute; z&aacute;žitok.</p>\r\n</li>\r\n</ul>', 0),
(23, 'PlayStation Plus Premium – Kredit 120 EUR (12M členstvo) – SK', 120, 'Funkcia služby PlayStation Plus Premium – 120 EUR\r\nZdokonaľte svoj zážitok s konzolou PlayStation 4 a PlayStation 5 vďaka prístupu k online hraniu pre viacerých hráčov, mesačným hrám, knižnici PS Plus Collection, knižnične viac ako 400 PS4 a PS5 hier, niekoľkým titulom firmy Ubisoft, exkluzívnym zľavám a tiež možnosti hrať a streamovať niektoré legendárne kúsky PS1, PS2, PS3 a PSP. Program Premium tiež dovolí vyskúšať si exkluzívny trial verzie doposiaľ nevydaných hier. Táto dobíjacia karta do vašej peňaženky načerpá 120 EUR, čo je hodnota PlayStation Plus Premium na 12 mesiacov .', 'http://localhost/GameSpace/img/user/slideshow_696a3c50939ec.jpg', '2025-12-11 09:36:32', '2026-01-16 17:57:21', 'PlayStation Plus Premium', '2021-07-15', 'playstation-plus-premium-–-kredit-120-eur-(12m-členstvo)-–-sk', '<h2>Funkcia služby PlayStation Plus Premium &ndash; 120 EUR</h2>\n<p>Zdokonaľte svoj z&aacute;žitok s konzolou PlayStation 4 a PlayStation 5 vďaka pr&iacute;stupu k&nbsp;online hraniu pre viacer&yacute;ch hr&aacute;čov, mesačn&yacute;m hr&aacute;m, knižnici PS Plus Collection, knižnične viac ako 400 PS4 a PS5 hier, niekoľk&yacute;m titulom firmy Ubisoft, exkluz&iacute;vnym zľav&aacute;m a tiež možnosti hrať a streamovať niektor&eacute; legend&aacute;rne k&uacute;sky PS1, PS2, PS3 a PSP. Program Premium tiež dovol&iacute; vysk&uacute;&scaron;ať si exkluz&iacute;vny trial verzie doposiaľ nevydan&yacute;ch hier. T&aacute;to dob&iacute;jacia karta&nbsp;do va&scaron;ej peňaženky načerp&aacute; 120 EUR, čo je hodnota PlayStation Plus Premium na 12 mesiacov&nbsp;.</p>', 0),
(24, 'Steam peňaženka – 50€', 50, 'Dobíjacia karta – Steam Wallet. Kupón, vďaka ktorému môžete nakúpiť akekoľvek z tisícov hier, originálnych herných prídavkov, kreatívneho softvéru atď. Pomocou virtuálnej Steam peňaženky získate univerzálny kredit pre svoj účet bez nutnosti zadávania platobných kariet.', 'http://localhost/GameSpace/img/user/slideshow_696a3a3994dbc.jpg', '2025-12-11 09:36:32', '2026-01-16 13:16:41', 'Steam peňaženka – 50€', '2022-01-10', 'steam-peňaženka-–-50€', '<p data-start=\"133\" data-end=\"325\">Dobite si svoju <strong data-start=\"149\" data-end=\"168\">Steam peňaženku</strong> r&yacute;chlo a pohodlne bez potreby platobnej karty. S t&yacute;mto darčekov&yacute;m k&oacute;dom z&iacute;skate 50 &euro; na n&aacute;kup hier, DLC alebo in&eacute;ho digit&aacute;lneho obsahu na platforme Steam.</p>\r\n<p data-start=\"327\" data-end=\"545\">Steam je digit&aacute;lna distribučn&aacute; platforma spoločnosti <strong data-start=\"380\" data-end=\"389\">Valve</strong>, ktor&aacute; okrem n&aacute;kupu hier poskytuje aj multiplayerov&eacute; a komunikačn&eacute; funkcie pre hr&aacute;čov. Aplik&aacute;cia je dostupn&aacute; na každom poč&iacute;tači a je kompletne v če&scaron;tine.</p>\r\n<hr data-start=\"547\" data-end=\"550\" />\r\n<h3 data-start=\"552\" data-end=\"578\"><strong data-start=\"556\" data-end=\"578\">Kľ&uacute;čov&eacute; vlastnosti</strong></h3>\r\n<ul data-start=\"579\" data-end=\"742\">\r\n<li data-start=\"579\" data-end=\"618\">\r\n<p data-start=\"581\" data-end=\"618\">Dob&iacute;jacia karta s hodnotou <strong data-start=\"608\" data-end=\"616\">50 &euro;</strong></p>\r\n</li>\r\n<li data-start=\"619\" data-end=\"655\">\r\n<p data-start=\"621\" data-end=\"655\"><strong data-start=\"621\" data-end=\"653\">Bez nutnosti platobnej karty</strong></p>\r\n</li>\r\n<li data-start=\"656\" data-end=\"708\">\r\n<p data-start=\"658\" data-end=\"708\">Použiteľn&aacute; na v&scaron;etky produkty dostupn&eacute; na Steame</p>\r\n</li>\r\n<li data-start=\"709\" data-end=\"742\">\r\n<p data-start=\"711\" data-end=\"742\">Steam aplik&aacute;cia <strong data-start=\"727\" data-end=\"740\">v če&scaron;tine</strong></p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"744\" data-end=\"747\" />\r\n<h3 data-start=\"749\" data-end=\"773\"><strong data-start=\"753\" data-end=\"773\">Ako uplatniť k&oacute;d</strong></h3>\r\n<ol data-start=\"774\" data-end=\"967\">\r\n<li data-start=\"774\" data-end=\"865\">\r\n<p data-start=\"777\" data-end=\"865\">Spustite Steam a kliknite vľavo hore na <strong data-start=\"817\" data-end=\"863\">&bdquo;Hry&ldquo; &rarr; &bdquo;Uplatniť k&oacute;d pre Steam peňaženku&ldquo;</strong></p>\r\n</li>\r\n<li data-start=\"866\" data-end=\"885\">\r\n<p data-start=\"869\" data-end=\"885\">Vložte v&aacute;&scaron; k&oacute;d</p>\r\n</li>\r\n<li data-start=\"886\" data-end=\"913\">\r\n<p data-start=\"889\" data-end=\"913\">Vyplňte potrebn&eacute; &uacute;daje</p>\r\n</li>\r\n<li data-start=\"914\" data-end=\"967\">\r\n<p data-start=\"917\" data-end=\"967\">Potvrďte &ndash; a peňaženka je pripraven&aacute; na použitie</p>\r\n</li>\r\n</ol>', 0),
(25, 'Red Dead Redemption 2', 49.99, 'Epic Western action-adventure game by Rockstar Games.', 'http://localhost/GameSpace/img/user/red_dead_2.jpg', '2025-12-12 14:19:10', '2026-01-14 08:38:58', 'Red Dead Redemption 2 cover', '2018-10-26', 'red-dead-redemption-2', '', 0),
(26, 'The Witcher 3: Wild Hunt', 29.99, 'Open-world RPG following Geralt of Rivia.', 'http://localhost/GameSpace/img/user/witcher_3.jpg', '2025-12-12 14:19:10', '2026-01-15 11:18:49', 'The Witcher 3 cover', '2015-05-19', 'the-witcher-3:-wild-hunt', '', 0),
(27, 'Elden Ring', 59.99, 'Open-world action RPG by FromSoftware and George R. R. Martin.', 'http://localhost/GameSpace/img/user/elden_ring.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'Elden Ring cover', '2022-02-25', 'elden-ring', '', 0),
(28, 'Hogwarts Legacy', 69.99, 'Open-world RPG set in the Harry Potter universe.', 'http://localhost/GameSpace/img/user/hogwarts_legacy.jpg', '2025-12-12 14:19:10', '2026-01-10 17:29:12', 'Hogwarts Legacy cover', '2023-02-10', 'hogwarts-legacy', '', 0),
(29, 'Grand Theft Auto V', 19.99, 'Action-adventure game set in Los Santos.', 'http://localhost/GameSpace/img/user/gta5.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'GTA V cover', '2013-09-17', 'grand-theft-auto-v', '', 0),
(30, 'Baldur\'s Gate 3', 69.99, 'Top-tier CRPG based on D&D rules.', 'http://localhost/GameSpace/img/user/baldur_gate_3.jpg', '2025-12-12 14:19:10', '2026-01-15 11:21:43', 'Baldur\'s Gate 3 cover', '2023-08-03', 'baldur\'s-gate-3', '', 0),
(31, 'Starfield', 69.99, 'Starfield je epické sci-fi RPG, ktoré spája rozsiahly vesmír, hlboký príbeh a moderný otvorený svet. Hráč sa vydáva na cestu medzi hviezdami, kde objavuje neznáme planéty, stretáva mimozemské civilizácie a rozhoduje o osude kolonizovaných svetov.', 'http://localhost/GameSpace/img/user/slideshow_6968bacf90939.jpg', '2025-12-12 14:19:10', '2026-01-15 10:00:47', 'Starfield cover', '2023-09-06', 'starfield', '<p><strong>Starfield</strong> je epick&aacute; sci-fi RPG hra, ktor&aacute; sp&aacute;ja rozsiahly vesm&iacute;r, hlbok&yacute; pr&iacute;beh a modern&yacute; otvoren&yacute; svet. Hr&aacute;č sa vyd&aacute; na cestu medzi hviezdami, kde objavuje nezn&aacute;me plan&eacute;ty, stret&aacute;va mimozemsk&eacute; civiliz&aacute;cie a rozhoduje o osude kolonizovan&yacute;ch svetov.</p>\r\n\r\n<p>Ako kapit&aacute;n vlastnej vesm&iacute;rnej lode m&aacute;te slobodu rozhodn&uacute;ť, ktor&eacute; misie prijmete, ktor&eacute; plan&eacute;ty presk&uacute;mate a ako budete reagovať na stretnutia s nov&yacute;mi druhmi. Každ&eacute; rozhodnutie ovplyvňuje politick&uacute;, ekonomick&uacute; aj mor&aacute;lnu rovnov&aacute;hu v celom galaxii.</p>\r\n\r\n<h2>Otvoren&yacute; vesm&iacute;r a plan&eacute;ty</h2>\r\n\r\n<p>Hern&yacute; svet Starfield je rozsiahly a dynamick&yacute;, s stovkami plan&eacute;t na presk&uacute;manie. Každ&aacute; plan&eacute;ta m&aacute; jedinečn&uacute; bi&oacute;m, fl&oacute;ru, faunu a miestne prostredie, ktor&eacute; vpl&yacute;va na hrateľnosť a pr&iacute;behov&eacute; udalosti.</p>\r\n\r\n<p>Detaily prostred&iacute; podporuj&uacute; pocit skutočnej prieskumn&eacute;j misie. Hudobn&yacute; podklad a zvukov&eacute; efekty umocňuj&uacute; pocit nekonečn&eacute;ho vesm&iacute;ru a objavovania.</p>\r\n\r\n<h2>Vesm&iacute;rny a s&uacute;bojov&yacute; syst&eacute;m</h2>\r\n\r\n<p>Starfield kombinuje real-time a taktick&eacute; prvky boja. Hr&aacute;č ovl&aacute;da loď aj pos&aacute;dku, využ&iacute;va technologick&eacute; vylep&scaron;enia a taktiku, aby prežil stretnutia s nepriateľmi alebo nehostinn&eacute; plan&eacute;ty.</p>\r\n\r\n<ul>\r\n<li>Prieskum plan&eacute;t a vesm&iacute;rnych stan&iacute;c</li>\r\n<li>Vesm&iacute;rne bitky s možnosťou takticky riadiť pos&aacute;dku</li>\r\n<li>Pokročil&eacute; upgrady lod&iacute; a vybavenia</li>\r\n</ul>\r\n\r\n<h2>Postavy a frakcie</h2>\r\n\r\n<p>Starfield obsahuje rozmanit&eacute; postavy a frakcie s vlastn&yacute;mi motiv&aacute;ciami, ciele a hist&oacute;riou. Interakcie s nimi ovplyvňuj&uacute; politick&uacute; situ&aacute;ciu, ekonomiku a pr&iacute;beh v celej galaxii.</p>\r\n\r\n<p>Voľby hr&aacute;ča ovplyvňuj&uacute; vzťahy s postavami aj výsledok hlavn&eacute;ho pr&iacute;behu. Mor&aacute;lne dilemy a etick&eacute; rozhodnutia tvoria jadro zážitku a nútia premý&scaron;ľať nad následkami.</p>\r\n\r\n<h2>Hlavn&eacute; prvky hry</h2>\r\n\r\n<ul>\r\n<li><span style=\"background-color: #ffffff; color: #000000;\">Obrovsk&yacute; otvoren&yacute; vesm&iacute;r na prieskum</span></li>\r\n<li><span style=\"background-color: #ffffff; color: #000000;\">Hlbok&yacute; pr&iacute;beh a rozvinut&eacute; postavy</span></li>\r\n<li><span style=\"background-color: #ffffff; color: #000000;\">Pokročil&yacute; vesm&iacute;rny a s&uacute;bojov&yacute; syst&eacute;m</span></li>\r\n<li><span style=\"background-color: #ffffff; color: #000000;\">R&ocirc;zne frakcie a možnosti diplomacie alebo konfliktu</span></li>\r\n<li><span style=\"background-color: #ffffff; color: #000000;\">Rozhodnutia hr&aacute;ča ovplyvňuj&uacute; pr&iacute;beh a prostredie</span></li>\r\n</ul>\r\n\r\n<h2>Z&aacute;ver</h2>\r\n\r\n<p>Starfield je hra pre hr&aacute;čov, ktor&iacute; hľadaj&uacute; slobodu, objavovanie a hlbok&yacute; vesm&iacute;rny pr&iacute;beh. Poskytuje kombin&aacute;ciu emocion&aacute;lneho narat&iacute;vu, strat&eacute;gického myslenia a nekonečnej prieskumn&eacute;j slobody, ktor&aacute; vás pohlt&iacute; na desiatky hod&iacute;n.</p>', 0),
(32, 'Assassin\'s Creed Valhalla', 39.99, 'Viking adventure in Assassin\'s Creed franchise.', 'http://localhost/GameSpace/img/user/ac_valhalla.jpg', '2025-12-12 14:19:10', '2026-01-15 11:19:59', 'Assassin\'s Creed Valhalla cover', '2020-11-10', 'assassin\'s-creed-valhalla', '', 0),
(33, 'Far Cry 6', 49.99, 'Open-world shooter set on Yara.', 'http://localhost/GameSpace/img/user/far_cry_6.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'Far Cry 6 cover', '2021-10-07', 'far-cry-6', '', 0),
(34, 'The Last of Us Part I', 69.99, 'Remake of the iconic survival adventure.', 'http://localhost/GameSpace/img/user/last_of_us_1.jpg', '2025-12-12 14:19:10', '2026-01-15 11:20:19', 'The Last of Us Part I cover', '2022-09-02', 'the-last-of-us-part-i', '', 0),
(35, 'The Last of Us Part II', 39.99, 'Emotional action-adventure set in a post-apocalypse.', 'http://localhost/GameSpace/img/user/last_of_us_2.jpg', '2025-12-12 14:19:10', '2026-01-15 11:20:38', 'The Last of Us Part II cover', '2020-06-19', 'the-last-of-us-part-ii', '', 0),
(36, 'Ghost of Tsushima', 49.99, 'Samurai open-world game set in feudal Japan.', 'http://localhost/GameSpace/img/user/ghost_of_thushima.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'Ghost of Tsushima cover', '2020-07-17', 'ghost-of-tsushima', '', 0),
(37, 'Horizon Forbidden West', 59.99, 'Sci-fi open-world adventure with Aloy.', 'http://localhost/GameSpace/img/user/horizon_forbidden_west.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'Horizon Forbidden West cover', '2022-02-18', 'horizon-forbidden-west', '', 0),
(38, 'Spider-Man Remastered', 49.99, 'Superhero action game by Insomniac.', 'http://localhost/GameSpace/img/user/spiderman.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'Spider-Man Remastered cover', '2020-11-12', 'spider-man-remastered', '', 0),
(39, 'Spider-Man: Miles Morales', 39.99, 'Standalone spin-off starring Miles.', 'http://localhost/GameSpace/img/user/spiderman_miles_morales.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'Spider-Man Miles Morales cover', '2020-11-12', 'spider-man-miles-morales', '', 0),
(40, 'Call of Duty: Modern Warfare II', 69.99, 'FPS reboot sequel from Infinity Ward.', 'http://localhost/GameSpace/img/user/mw_2.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'MW2 2022 cover', '2022-10-28', 'cod-modern-warfare-2', '', 0),
(41, 'Call of Duty: Black Ops Cold War', 49.99, 'Cold War-era shooter in CoD series.', 'http://localhost/GameSpace/img/user/cod_co.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'Cold War cover', '2020-11-13', 'cod-black-ops-cold-war', '', 0),
(42, 'Battlefield 2042', 29.99, 'Large-scale modern warfare shooter.', 'http://localhost/GameSpace/img/user/bf_2042.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'Battlefield 2042 cover', '2021-11-19', 'battlefield-2042', '', 0),
(43, 'Doom Eternal', 29.99, 'Fast-paced demon-slaying FPS.', 'http://localhost/GameSpace/img/user/doom_eternal.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'Doom Eternal cover', '2020-03-20', 'doom-eternal', '', 0),
(44, 'Forza Horizon 5', 59.99, 'Open-world racing in Mexico.', 'http://localhost/GameSpace/img/user/forza_horizon_5.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'Forza Horizon 5 cover', '2021-11-09', 'forza-horizon-5', '', 0),
(45, 'FIFA 24', 69.99, 'Latest football simulation entry.', 'http://localhost/GameSpace/img/user/fc_24.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'FIFA 24 cover', '2023-09-29', 'fifa-24', '', 0),
(46, 'NBA 2K24', 59.99, 'Basketball simulation by 2K Sports.', 'http://localhost/GameSpace/img/user/nba24.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'NBA 2K24 cover', '2023-09-08', 'nba-2k24', '', 0),
(47, 'Mortal Kombat 1', 59.99, 'Reboot of the iconic fighting game.', 'http://localhost/GameSpace/img/user/mortal_kombat_1.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'Mortal Kombat 1 cover', '2023-09-19', 'mortal-kombat-1', '', 0),
(48, 'Tekken 8', 69.99, 'Latest entry in Tekken fighting franchise.', 'http://localhost/GameSpace/img/user/tekken_8.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'Tekken 8 cover', '2024-01-26', 'tekken-8', '', 0),
(49, 'Street Fighter 6', 59.99, 'Capcom’s newest fighting game.', 'http://localhost/GameSpace/img/user/street_fighter_6.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'Street Fighter 6 cover', '2023-06-02', 'street-fighter-6', '', 0),
(50, 'Diablo IV', 69.99, 'Dark action RPG by Blizzard.', 'http://localhost/GameSpace/img/user/diablo_4.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'Diablo IV cover', '2023-06-06', 'diablo-4', '', 0),
(59, 'Star Wars Jedi: Survivor', 69.99, 'Action-adventure starring Cal Kestis.', 'http://localhost/GameSpace/img/user/slideshow_6968f17f8b0d9.jpg', '2025-12-12 14:19:10', '2026-01-15 13:54:07', 'Star Wars Jedi Survivor cover', '2023-04-28', 'star-wars-jedi:-survivor', '<p>asfafsafas</p>', 0),
(61, 'Dead Space Remake', 59.99, 'Horror sci-fi remake by EA Motive.', 'http://localhost/GameSpace/img/user/dead_space.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'Dead Space Remake cover', '2023-01-27', 'dead-space-remake', '', 0),
(63, 'Resident Evil Village', 39.99, 'First-person survival horror.', 'http://localhost/GameSpace/img/user/village.jpg', '2025-12-12 14:19:10', '2026-01-10 17:23:06', 'Resident Evil Village cover', '2021-05-07', 'resident-evil-village', '', 0),
(75, 'Clair Obscur: Expedition 33', 49.99, '„Rok čo rok nás vymazáva.“ Veďte členov Expedície 33 na ich ceste za zničením Paintress, aby už nikdy nemohla maľovať smrť. Preskúmajte svet zázrakov inšpirovaný Belle Époque France a bojujte s jedinečnými nepriateľmi v tomto ťahovom RPG s mechanikou v reálnom čase. Raz do roka sa Paintress zobudí a namaľuje na svoj monolit.a', 'http://localhost/GameSpace/img/user/slideshow_6968ecdc0d53c.jpg', '2025-12-21 11:54:56', '2026-01-15 17:36:09', 'expedition-33', '2025-04-25', 'clair-obscur:-expedition-33', '<p><strong>Expedition 33</strong> je atmosf&eacute;rick&aacute; pr&iacute;behov&aacute; hra, ktor&aacute; sp&aacute;ja hlbok&yacute; narat&iacute;v, umeleck&yacute; vizu&aacute;lny &scaron;t&yacute;l a modern&yacute; ťahov&yacute; s&uacute;bojov&yacute; syst&eacute;m. Hr&aacute;č sa ocit&aacute; v temnom, no fascinuj&uacute;com svete, kde každ&yacute; rok z&aacute;hadn&aacute; entita zn&aacute;ma ako Maliarka vymaže zo sveta ľud&iacute;, ktor&iacute; dosiahnu určit&yacute; vek. Tento rok padla voľba na č&iacute;slo 33.</p>\r\n<p>Ako člen poslednej exped&iacute;cie m&aacute;te jedin&uacute; &uacute;lohu &ndash; zastaviť tento ne&uacute;prosn&yacute; cyklus a čeliť osudu, ktor&yacute; sa zd&aacute; byť vopred nap&iacute;san&yacute;. Každ&yacute; krok vpred je sprev&aacute;dzan&yacute; ot&aacute;zkami o živote, smrti, obete a n&aacute;deji. Pr&iacute;beh je rozpr&aacute;van&yacute; emocion&aacute;lne, s d&ocirc;razom na postavy, ich vn&uacute;torn&eacute; konflikty a vzťahy.</p>\r\n<h2>Jedinečn&yacute; svet a atmosf&eacute;ra</h2>\r\n<p>Hern&yacute; svet Expedition 33 je in&scaron;pirovan&yacute; umeleck&yacute;mi smermi ako surrealizmus a belle &eacute;poque, č&iacute;m vytv&aacute;ra nezameniteľn&uacute; atmosf&eacute;ru pln&uacute; kontrastov. Kr&aacute;sa a rozklad tu existuj&uacute; bok po boku a každ&yacute; nov&yacute; regi&oacute;n rozpr&aacute;va vlastn&yacute; pr&iacute;beh bez potreby slov.</p>\r\n<p>Prostredia s&uacute; bohat&eacute; na detaily a podporuj&uacute; pocit melanch&oacute;lie, ktor&yacute; sa nesie celou hrou. Hudobn&yacute; sprievod podčiarkuje em&oacute;cie a umocňuje dramatick&eacute; momenty pr&iacute;behu.</p>\r\n<h2>S&uacute;bojov&yacute; syst&eacute;m</h2>\r\n<p>Hra využ&iacute;va modern&yacute; ťahov&yacute; s&uacute;bojov&yacute; syst&eacute;m obohaten&yacute; o prvky v re&aacute;lnom čase. Spr&aacute;vne načasovanie &uacute;tokov, obrany a &scaron;peci&aacute;lnych schopnost&iacute; m&aacute; z&aacute;sadn&yacute; vplyv na priebeh boja. Každ&aacute; postava m&aacute; vlastn&eacute; schopnosti a &scaron;t&yacute;l boja, čo umožňuje strategick&eacute; kombin&aacute;cie a r&ocirc;zne hern&eacute; pr&iacute;stupy.</p>\r\n<ul>\r\n<li>Taktick&eacute; ťahov&eacute; s&uacute;boje s dynamick&yacute;mi prvkami</li>\r\n<li>Unik&aacute;tne schopnosti jednotliv&yacute;ch členov exped&iacute;cie</li>\r\n<li>Postupn&eacute; odhaľovanie siln&yacute;ch aj slab&yacute;ch str&aacute;nok nepriateľov</li>\r\n</ul>\r\n<h2>Postavy a pr&iacute;beh</h2>\r\n<p>Členovia Expedition 33 nie s&uacute; len bojovn&iacute;ci, ale ľudia s vlastn&yacute;mi obavami, spomienkami a motiv&aacute;ciami. Počas hry sa ich pr&iacute;behy prehlbuj&uacute; prostredn&iacute;ctvom dial&oacute;gov a kľ&uacute;čov&yacute;ch rozhodnut&iacute;.</p>\r\n<p>Hr&aacute;čove voľby m&ocirc;žu ovplyvniť nielen vzťahy medzi postavami, ale aj samotn&yacute; v&yacute;voj pr&iacute;behu. Mor&aacute;lne dilemy často nemaj&uacute; jednoznačne spr&aacute;vne rie&scaron;enie a n&uacute;tia zamyslieť sa nad n&aacute;sledkami vlastn&yacute;ch činov.</p>\r\n<h2>Hlavn&eacute; prvky hry</h2>\r\n<ul>\r\n<li><span style=\"background-color: #ffffff; color: #000000;\">Siln&yacute; pr&iacute;behov&yacute; z&aacute;žitok zameran&yacute; na em&oacute;cie a atmosf&eacute;ru</span></li>\r\n<li><span style=\"background-color: #ffffff; color: #000000;\">Origin&aacute;lny umeleck&yacute; &scaron;t&yacute;l a jedinečn&yacute; svet</span></li>\r\n<li><span style=\"background-color: #ffffff; color: #000000;\">Prepracovan&yacute; s&uacute;bojov&yacute; syst&eacute;m s taktickou hĺbkou</span></li>\r\n<li><span style=\"background-color: #ffffff; color: #000000;\">Zapam&auml;tateľn&eacute; postavy a dospel&eacute; t&eacute;my</span></li>\r\n<li><span style=\"background-color: #ffffff; color: #000000;\">D&ocirc;raz na rozhodnutia a ich n&aacute;sledky</span></li>\r\n</ul>\r\n<h2>Z&aacute;ver</h2>\r\n<p>Expedition 33 je hra, ktor&aacute; sa neboj&iacute; kl&aacute;sť ťažk&eacute; ot&aacute;zky a rozpr&aacute;vať pr&iacute;beh o pominuteľnosti života a sile ľudskej v&ocirc;le. Je určen&aacute; hr&aacute;čom, ktor&iacute; hľadaj&uacute; viac než len akciu &ndash; chc&uacute; hlbok&yacute; z&aacute;žitok, ktor&yacute; v nich zanech&aacute; stopu e&scaron;te dlho po dohran&iacute;.</p>', 0),
(82, 'MacBook Air 13\" M4 SK 2025 Strieborný', 1149, 'MacBook – Apple M4 (10-jadrový), 13,6\" IPS lesklý 2560 × 1664 px, RAM 16 GB, Apple Apple M4 8-jadrová GPU, SSD 256 GB, podsvietená klávesnica, webkamera, čítačka odtlačkov prstov, WiFi 6E, WiFi, Bluetooth, hmotnosť 1,24 kg, macOS', 'http://localhost/GameSpace/img/user/slideshow_696a2a31e3b9a.jpg', '2026-01-16 12:04:53', '2026-01-16 12:15:29', 'MacBook Air 13', '2025-02-05', 'macbook-air-13\"-m4-sk-2025-strieborný', '<p>Notebook &bull; Uhlopriečka: 13,6\" &bull; Dotykov&yacute; displej: nie &bull; 2560 &times; 1664 &nbsp;bodov &bull; Procesor: Apple M2 M2 (8-jadrov&yacute; - &Uacute;ložisko: SSD:256 &nbsp;GB &bull; Pam&auml;ť RAM: 16&nbsp;GB &bull; Grafika: zdieľan&aacute; pam&auml;ť &bull; grafick&aacute; karta: M2 8&times; GPU &bull; Konektivita: Bluetooth , Wi-Fi &bull; Ďal&scaron;ie porty: 3,5 mm audio jack &bull; V&yacute;bava: kovov&eacute; &scaron;asi, podsvieten&aacute; kl&aacute;vesnica, Thunderbolt 3, webkamera &bull; Operačn&yacute; syst&eacute;m: macOS Sequoia</p>\r\n<div id=\"amp-review-banner\" data-amp-resource-datart_products=\"1904194\" data-amp-banner=\"product_detail.article_banner\" data-amp-attached=\"8\"></div>\r\n<p>Elegantn&yacute; notebook Apple MacBook Air M2 zaujme celokovov&yacute;m preveden&iacute;m Midnight. Spoľahliv&yacute; chod zabezpeč&iacute; čip Apple M2 zložen&yacute; z 8-jadrov&eacute;ho CPU procesora, 8-jadrov&eacute;ho GPU procesora a 16-jadrov&eacute;ho Neural Engine spolu so 16GB operačnou pam&auml;ťou RAM. D&aacute;ta si ulož&iacute;te na SSD disk s kapacitou 256GB. 13,6-palcov&yacute; Liquid Retina IPS displej s technol&oacute;giou True Tone a jasom 500 nitov zobraz&iacute; obsah v rozl&iacute;&scaron;en&iacute; 2560x1664 px. MacBook je vybaven&yacute; portmi 2x USB-C (Thunderbolt 3), 3.5 mm jackom, nap&aacute;jac&iacute;m konektorom MagSafe 3, technol&oacute;giami Wi-Fi 6 a Bluetooth 5.0, FaceTime HD kamerou, kl&aacute;vesnicou so SK lokaliz&aacute;ciou a Touch ID. Operačn&yacute;m syst&eacute;mom je macOS.</p>\r\n<div>\r\n<div>\r\n<h2><a href=\"https://www.nay.sk/prejdi-na-mac\" target=\"null\"><picture><source media=\"(max-width: 767px)\" data-srcset=\"https://cdn.nay.sk/images/wysiwygModulCMobile/3/1909453.png, https://cdn.nay.sk/images/wysiwygModulCMobile-2x/3/1909453.png 2x\" /><source media=\"(min-width: 768px)\" data-srcset=\"https://cdn.nay.sk/images/wysiwygModulCDesktop/1/1909451.png, https://cdn.nay.sk/images/wysiwygModulCDesktop-2x/1/1909451.png 2x\" /></picture></a></h2>\r\n</div>\r\n</div>\r\n<h3>Očaruj&uacute;ci dizajn v &scaron;tyroch farb&aacute;ch</h3>\r\n<p>Apple MacBook Air 13&nbsp;zaujme &scaron;t&yacute;lov&yacute;m&nbsp;ultratenk&yacute;m celohlin&iacute;kov&yacute;m &scaron;asi&nbsp;vyroben&yacute;m z recyklovan&yacute;ch materi&aacute;lov. S hr&uacute;bkou&nbsp;1,13 cm&nbsp;a hmotnosťou&nbsp;len 1,24 kg&nbsp;predstavuje ľahko prenosn&eacute;ho a praktick&eacute;ho spoločn&iacute;ka na cesty. MacBook sa pred&aacute;va v&nbsp;&scaron;tyroch n&aacute;dhern&yacute;ch farebn&yacute;ch prevedeniach&nbsp;&ndash; hviezdne biely, vesm&iacute;rne siv&yacute;, strieborn&yacute; a polnočne modr&yacute;.</p>\r\n<p>&nbsp;</p>\r\n<h3>Superv&yacute;konn&yacute; čip M2</h3>\r\n<p>Bezkonkurenčn&yacute; v&yacute;kon pri pr&aacute;ci v grafick&yacute;ch programoch či streamovan&iacute; zabezpeč&iacute; inovat&iacute;vny&nbsp;čip Apple M2, ktor&yacute; pozost&aacute;va z 8-jadrov&eacute;ho CPU, 8-jadrov&eacute;ho GPU a 16-jadrov&eacute;ho Neural Engine.&nbsp;Celodenn&uacute; v&yacute;drž až 18 hod&iacute;n&nbsp;zabezpeč&iacute; vstavan&aacute; 52,6Wh bat&eacute;ria.</p>\r\n<p>&nbsp;</p>\r\n<h3>13.6&ldquo; Liquid Retina displej</h3>\r\n<p>Pohlcuj&uacute;ci obraz v rozl&iacute;&scaron;en&iacute;&nbsp;2560 x 1664 pixelov&nbsp;s vysok&yacute;m kontrastom a ostr&yacute;mi detailmi zobraz&iacute;&nbsp;13,6-palcov&yacute; Liquid Retina displej&nbsp;s technol&oacute;giou&nbsp;True Tone&nbsp;a jasom&nbsp;až 500 nitov.</p>\r\n<p>&nbsp;</p>\r\n<h3>Videohovory so skvel&yacute;m zvukom a obrazom</h3>\r\n<p>MacBook Air&nbsp;je vybaven&yacute;&nbsp;1080p FaceTime HD kamerou, ktor&aacute; spolu so&nbsp;s&uacute;stavou 3 mikrof&oacute;nov&nbsp;a&nbsp;4-reproduktorovou zvukovou s&uacute;stavou&nbsp;s priestorov&yacute;m zvukom zaist&iacute; vysok&uacute; kvalitu prenosu pri videohovorov či streamovan&iacute;.</p>\r\n<p>&nbsp;</p>\r\n<h3>Pohodln&aacute; kl&aacute;vesnica a Touch ID</h3>\r\n<p>Pohodln&aacute; a tich&aacute; kl&aacute;vesnica&nbsp;Magic Keyboard&nbsp;s funkčn&yacute;mi kl&aacute;vesmi a v&auml;č&scaron;&iacute;m&nbsp;Force Touch trackpadom&nbsp;umožn&iacute; r&yacute;chle p&iacute;sanie a efekt&iacute;vnu pr&aacute;cu. Nech&yacute;ba&nbsp;Touch ID&nbsp;pre jednoduch&eacute; odomykanie zariadenia i potvrdzovanie n&aacute;kupov a platieb len priložen&iacute;m prstu.</p>\r\n<p>&nbsp;</p>\r\n<h3>Spoľahliv&eacute; pripojenie</h3>\r\n<p>Apple MacBook Air 13&nbsp;m&aacute; vo v&yacute;bave nap&aacute;jac&iacute; konektor&nbsp;MagSafe&nbsp;a&nbsp;dva porty Thunderbolt,&nbsp;ktor&eacute; posl&uacute;žia na vysokor&yacute;chlostn&eacute; pripojenie i nap&aacute;janie perif&eacute;ri&iacute; a taktiež pripojenie k monitoru s rozl&iacute;&scaron;en&iacute;m až 6K. S&uacute;časťou je aj&nbsp;3.5 mm audio jack.</p>', 0),
(83, 'Lenovo Legion Pro 5 16IRX10 Eclipse Black', 1829, 'Herný notebook – Intel Core i9 14900HX Raptor Lake Refresh, 16\" IPS antireflexný 2560 × 1600 240 Hz, RAM 32 GB DDR5, NVIDIA GeForce RTX 5060 8 GB 115 W (MUX Switch), SSD 1000 GB, numerická klávesnica, podsvietená RGB klávesnica, webkamera, USB 3.2 Gen 1, USB 3.2 Gen 2, USB-C, WiFi 6, hmotnosť 2,4 kg, Windows 11 Home', 'http://localhost/GameSpace/img/user/product_696a2abe6d858.webp', '2026-01-16 12:10:38', '2026-01-16 12:15:02', 'Lenovo Legion Pro 5', '2024-06-05', 'lenovo-legion-pro-5-16irx10-eclipse-black', '<p>notebook &bull; 16&Prime; uhlopriečka &bull; samostatn&aacute; grafick&aacute; karta NVIDIA&reg; GeForce RTX&trade; 5070 (8 GB) &bull; 2560 &times; 1440 px &bull; procesor Intel Core Ultra 7 255HX (20-jadrov&yacute; &ndash; až 5,2 GHz) &bull; &uacute;ložisko SSD 1 024 GB &bull; pam&auml;ť RAM 32 GB &bull; HDMI &bull; 2&times; USB-C &bull; 3&times; USB 3.2 &bull; Bluetooth 5.4 &bull; Wi-Fi 7 &bull; kl&aacute;vesnica s numerickou časťou &bull; podsvieten&aacute; kl&aacute;vesnica &bull; bez operačn&eacute;ho syst&eacute;mu</p>\r\n<div id=\"amp-review-banner\" data-amp-resource-datart_products=\"1926255\" data-amp-banner=\"product_detail.article_banner\" data-amp-attached=\"8\"></div>\r\n<h2><br />Lenovo Legion Pro 5 16IAX10, čierna</h2>\r\n<p>Hern&yacute; notebook&nbsp;Lenovo Legion Pro 5&nbsp;prin&aacute;&scaron;a v&yacute;kon stoln&eacute;ho poč&iacute;tača, ktor&yacute; si m&ocirc;žete zobrať kamkoľvek. S procesorom&nbsp;Intel Core Ultra&nbsp;a grafickou kartou&nbsp;NVIDIA GeForce RTX 5070&nbsp;uspokoj&iacute; najn&aacute;ročnej&scaron;&iacute;ch hr&aacute;čov aj profesion&aacute;lov, čo potvrdzuje okrem in&eacute;ho&nbsp;Lenovo AI Engine+. Najvy&scaron;&scaron;&iacute;ch kval&iacute;t dosahuje tiež displej o veľkosti&nbsp;16\" s OLED technol&oacute;giou&nbsp;a frekvenciou&nbsp;165 Hz. Notebook je navy&scaron;e vyzbrojen&yacute; pokročilou chladiacou technol&oacute;giou&nbsp;Coldfront, ktor&aacute; udržuje optim&aacute;lne teploty aj pri maxim&aacute;lnom zaťažen&iacute;.&nbsp;Bat&eacute;ria s kapacitou 80 Wh&nbsp;potom zaist&iacute;, že je pripraven&yacute; na dlh&eacute; hern&eacute; marat&oacute;ny aj na pr&aacute;cu na cest&aacute;ch.</p>\r\n<p>&nbsp;</p>\r\n<hr />\r\n<p>&nbsp;</p>\r\n<h3>Kľ&uacute;čov&eacute; vlastnosti:</h3>\r\n<ul>\r\n<li>V&yacute;kon na &uacute;rovni stoln&eacute;ho poč&iacute;tača &ndash;&nbsp;Intel Core Ultra&nbsp;a&nbsp;NVIDIA GeForce RTX 5070</li>\r\n<li>Lenovo AI Engine+&nbsp;pre vylep&scaron;en&eacute; hern&eacute; z&aacute;žitky s umelou inteligenciou</li>\r\n<li>Fascinuj&uacute;ci&nbsp;16&Prime; OLED displej&nbsp;s vysok&yacute;m jasom,&nbsp;165 Hz&nbsp;a&nbsp;100% DCI-P3&nbsp;pre brilantn&yacute; obraz</li>\r\n<li>Technol&oacute;gia Coldfront&nbsp;pre prvotriedne chladenie</li>\r\n<li>Nad&scaron;tandardn&aacute; v&yacute;drž vďaka bat&eacute;rii s veľkorysou kapacitou&nbsp;80 Wh</li>\r\n<li>Skvel&aacute; kl&aacute;vesnica&nbsp;Legion TrueStrike</li>\r\n</ul>\r\n<h3>V&yacute;kon na &uacute;rovni stoln&eacute;ho poč&iacute;tača</h3>\r\n<p>&nbsp;</p>\r\n<p>Lenovo Legion Pro 5 pon&uacute;ka v&yacute;kon porovnateľn&yacute; so stoln&yacute;mi poč&iacute;tačmi, a to pri udržan&iacute; skvelej mobility. Vďaka procesorom Intel Core Ultra a grafickej karte NVIDIA&reg; GeForce RTX&trade; 5070 sa m&ocirc;žete te&scaron;iť na &uacute;plne plynul&eacute; hranie aj multitasking bez kompromisov</p>', 0);
INSERT INTO `items` (`idItems`, `name`, `price`, `description`, `image`, `created_at`, `last_update`, `alt`, `release_date`, `slug`, `html_description`, `is_deleted`) VALUES
(84, 'ASUS TUF Gaming F16 FX608JH-RV010 Jaeger Gray kovový', 1278, 'Herný notebook – Intel Core i5 13450HX Raptor Lake, 16\" IPS antireflexný 1920 × 1200 165 Hz, RAM 16 GB DDR5, NVIDIA GeForce RTX 5050 8 GB 115 W (MUX Switch), SSD 512 GB, numerická klávesnica, podsvietená RGB klávesnica, webkamera, USB 3.2 Gen 2, USB-C, WiFi 6E, Bluetooth, hmotnosť 2,2 kg', 'http://localhost/GameSpace/img/user/product_696a2b743d613.jpg', '2026-01-16 12:13:40', '2026-01-16 12:37:15', 'ASUS TUF Gaming F16 ', '2025-07-04', 'asus-tuf-gaming-f16-fx608jh-rv010-jaeger-gray-kovový', '<p data-start=\"109\" data-end=\"141\"><strong data-start=\"109\" data-end=\"119\">Model:</strong> ASUS TUF Gaming F16</p>\r\n<hr data-start=\"143\" data-end=\"146\" />\r\n<h3 data-start=\"148\" data-end=\"172\"><strong data-start=\"152\" data-end=\"172\">Operating System</strong></h3>\r\n<ul data-start=\"173\" data-end=\"192\">\r\n<li data-start=\"173\" data-end=\"192\">\r\n<p data-start=\"175\" data-end=\"192\">Windows 11 Home</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"194\" data-end=\"197\" />\r\n<h3 data-start=\"199\" data-end=\"216\"><strong data-start=\"203\" data-end=\"216\">Processor</strong></h3>\r\n<ul data-start=\"217\" data-end=\"371\">\r\n<li data-start=\"217\" data-end=\"255\">\r\n<p data-start=\"219\" data-end=\"255\">Intel&reg; Core&trade; i5-13450HX (13th Gen)</p>\r\n</li>\r\n<li data-start=\"256\" data-end=\"297\">\r\n<p data-start=\"258\" data-end=\"297\">Base / Boost: 2.4 GHz (up to 4.6 GHz)</p>\r\n</li>\r\n<li data-start=\"298\" data-end=\"314\">\r\n<p data-start=\"300\" data-end=\"314\">Cache: 20 MB</p>\r\n</li>\r\n<li data-start=\"315\" data-end=\"371\">\r\n<p data-start=\"317\" data-end=\"371\">Cores: 10 (6 Performance cores + 4 Efficiency cores)</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"373\" data-end=\"376\" />\r\n<h3 data-start=\"378\" data-end=\"392\"><strong data-start=\"382\" data-end=\"392\">Memory</strong></h3>\r\n<ul data-start=\"393\" data-end=\"439\">\r\n<li data-start=\"393\" data-end=\"420\">\r\n<p data-start=\"395\" data-end=\"420\">16 GB DDR5-5600 SO-DIMM</p>\r\n</li>\r\n<li data-start=\"421\" data-end=\"439\">\r\n<p data-start=\"423\" data-end=\"439\">Maximum: 64 GB</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"441\" data-end=\"444\" />\r\n<h3 data-start=\"446\" data-end=\"461\"><strong data-start=\"450\" data-end=\"461\">Storage</strong></h3>\r\n<ul data-start=\"462\" data-end=\"561\">\r\n<li data-start=\"462\" data-end=\"496\">\r\n<p data-start=\"464\" data-end=\"496\">512 GB PCIe&reg; 4.0 NVMe&trade; M.2 SSD</p>\r\n</li>\r\n<li data-start=\"497\" data-end=\"529\">\r\n<p data-start=\"499\" data-end=\"529\">Expandable: 2x M.2 SSD slots</p>\r\n</li>\r\n<li data-start=\"530\" data-end=\"561\">\r\n<p data-start=\"532\" data-end=\"561\">Optical Drive: Not included</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"563\" data-end=\"566\" />\r\n<h3 data-start=\"568\" data-end=\"594\"><strong data-start=\"572\" data-end=\"594\">Display &amp; Graphics</strong></h3>\r\n<ul data-start=\"595\" data-end=\"770\">\r\n<li data-start=\"595\" data-end=\"642\">\r\n<p data-start=\"597\" data-end=\"642\">Display: 16\" FHD+ (1920x1200, 16:10, WUXGA)</p>\r\n</li>\r\n<li data-start=\"643\" data-end=\"708\">\r\n<p data-start=\"645\" data-end=\"708\">Panel: Anti-reflective IPS, 300 nits, 165Hz, NTSC 72%, G-Sync</p>\r\n</li>\r\n<li data-start=\"709\" data-end=\"743\">\r\n<p data-start=\"711\" data-end=\"743\">GPU: NVIDIA&reg; GeForce RTX&trade; 5050</p>\r\n</li>\r\n<li data-start=\"744\" data-end=\"770\">\r\n<p data-start=\"746\" data-end=\"770\">GPU Memory: 8 GB GDDR7</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"772\" data-end=\"775\" />\r\n<h3 data-start=\"777\" data-end=\"799\"><strong data-start=\"781\" data-end=\"799\">Audio &amp; Camera</strong></h3>\r\n<ul data-start=\"800\" data-end=\"897\">\r\n<li data-start=\"800\" data-end=\"837\">\r\n<p data-start=\"802\" data-end=\"837\">Speakers: 2x, Dolby Atmos, Hi-Res</p>\r\n</li>\r\n<li data-start=\"838\" data-end=\"872\">\r\n<p data-start=\"840\" data-end=\"872\">Microphone: AI Noise-Canceling</p>\r\n</li>\r\n<li data-start=\"873\" data-end=\"897\">\r\n<p data-start=\"875\" data-end=\"897\">Webcam: 1080p FHD IR</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"899\" data-end=\"902\" />\r\n<h3 data-start=\"904\" data-end=\"928\"><strong data-start=\"908\" data-end=\"928\">Keyboard &amp; Input</strong></h3>\r\n<ul data-start=\"929\" data-end=\"1039\">\r\n<li data-start=\"929\" data-end=\"946\">\r\n<p data-start=\"931\" data-end=\"946\">Touchpad: Yes</p>\r\n</li>\r\n<li data-start=\"947\" data-end=\"988\">\r\n<p data-start=\"949\" data-end=\"988\">Keyboard: 1-zone RGB Chiclet, Backlit</p>\r\n</li>\r\n<li data-start=\"989\" data-end=\"1012\">\r\n<p data-start=\"991\" data-end=\"1012\">Numeric Keypad: Yes</p>\r\n</li>\r\n<li data-start=\"1013\" data-end=\"1039\">\r\n<p data-start=\"1015\" data-end=\"1039\">Fingerprint Reader: No</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1041\" data-end=\"1044\" />\r\n<h3 data-start=\"1046\" data-end=\"1066\"><strong data-start=\"1050\" data-end=\"1066\">Connectivity</strong></h3>\r\n<ul data-start=\"1067\" data-end=\"1146\">\r\n<li data-start=\"1067\" data-end=\"1092\">\r\n<p data-start=\"1069\" data-end=\"1092\">LAN: 10/100/1000 Mbps</p>\r\n</li>\r\n<li data-start=\"1093\" data-end=\"1146\">\r\n<p data-start=\"1095\" data-end=\"1146\">Wireless: Wi-Fi 6E (802.11ax 2x2) + Bluetooth 5.3</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1148\" data-end=\"1151\" />\r\n<h3 data-start=\"1153\" data-end=\"1166\"><strong data-start=\"1157\" data-end=\"1166\">Ports</strong></h3>\r\n<ul data-start=\"1167\" data-end=\"1407\">\r\n<li data-start=\"1167\" data-end=\"1220\">\r\n<p data-start=\"1169\" data-end=\"1220\">1x Thunderbolt&trade; 4 (DisplayPort / G-SYNC, 40 Gb/s)</p>\r\n</li>\r\n<li data-start=\"1221\" data-end=\"1279\">\r\n<p data-start=\"1223\" data-end=\"1279\">1x USB 3.2 Gen 2 Type-C (DisplayPort / Power, 10 Gb/s)</p>\r\n</li>\r\n<li data-start=\"1280\" data-end=\"1317\">\r\n<p data-start=\"1282\" data-end=\"1317\">3x USB 3.2 Gen 2 Type-A (10 Gb/s)</p>\r\n</li>\r\n<li data-start=\"1318\" data-end=\"1337\">\r\n<p data-start=\"1320\" data-end=\"1337\">1x HDMI 2.1 FRL</p>\r\n</li>\r\n<li data-start=\"1338\" data-end=\"1353\">\r\n<p data-start=\"1340\" data-end=\"1353\">1x RJ45 LAN</p>\r\n</li>\r\n<li data-start=\"1354\" data-end=\"1384\">\r\n<p data-start=\"1356\" data-end=\"1384\">1x 3.5 mm combo audio jack</p>\r\n</li>\r\n<li data-start=\"1385\" data-end=\"1407\">\r\n<p data-start=\"1387\" data-end=\"1407\">1x Power connector</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1409\" data-end=\"1412\" />\r\n<h3 data-start=\"1414\" data-end=\"1437\"><strong data-start=\"1418\" data-end=\"1437\">Battery &amp; Power</strong></h3>\r\n<ul data-start=\"1438\" data-end=\"1505\">\r\n<li data-start=\"1438\" data-end=\"1478\">\r\n<p data-start=\"1440\" data-end=\"1478\">Battery: 90 Wh, 4-cell Li-ion (4S1P)</p>\r\n</li>\r\n<li data-start=\"1479\" data-end=\"1505\">\r\n<p data-start=\"1481\" data-end=\"1505\">Power Adapter: 280W AC</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1507\" data-end=\"1510\" />\r\n<h3 data-start=\"1512\" data-end=\"1539\"><strong data-start=\"1516\" data-end=\"1539\">Design &amp; Dimensions</strong></h3>\r\n<ul data-start=\"1540\" data-end=\"1622\">\r\n<li data-start=\"1540\" data-end=\"1562\">\r\n<p data-start=\"1542\" data-end=\"1562\">Color: Jaeger Gray</p>\r\n</li>\r\n<li data-start=\"1563\" data-end=\"1603\">\r\n<p data-start=\"1565\" data-end=\"1603\">Dimensions: 354 x 269 x 17.9&ndash;27.3 mm</p>\r\n</li>\r\n<li data-start=\"1604\" data-end=\"1622\">\r\n<p data-start=\"1606\" data-end=\"1622\">Weight: 2.2 kg</p>\r\n</li>\r\n</ul>', 0),
(85, 'Acer Predator/Orion 3000/i7-12700/1TBSSD+1TB/32G/RTX3060/W11', 1895.19, 'Kľúčové vlastnosti * Model: Acer PREDATOR Orion 3000 (PO3-640) * Prevedenie: Midi Tower * Operačný systém: Windows 11 Home * Procesor: Intel Core i7-12700 (12C, 1.6/4.9 GHz) * Pevný disk: 1024GB M.2 SSD + 1000GB_7200 SATA * Optická mechanika: nie * Grafická karta:NVIDIA RTX 3060 12GB GDDR6 HDMI/3xDP * Pamäť: 32 GB (2 x 16) DDR4 + 2x free slot * Max. veľkosť: 64 GB * ', 'http://localhost/GameSpace/img/user/product_696a2c9f45bf6.jpg', '2026-01-16 12:18:39', '2026-01-16 12:18:39', 'Acer Predator', '2025-01-29', 'acer-predator/orion-3000/i7-12700/1tbssd+1tb/32g/rtx3060/w11', '<div>\r\n<h2>Kľ&uacute;čov&eacute; vlastnosti</h2>\r\n</div>\r\n<div>\r\n<div id=\"product_desc_full_m3\">\r\n<ul>\r\n<li>Model: Acer PREDATOR Orion 3000 (PO3-640)</li>\r\n<li>Prevedenie: Midi Tower</li>\r\n<li>Operačn&yacute; syst&eacute;m: Windows 11 Home</li>\r\n<li>Procesor: Intel Core i7-12700 (12C, 1.6/4.9 GHz)</li>\r\n<li>Pevn&yacute; disk: 1024GB M.2 SSD + 1000GB_7200 SATA</li>\r\n<li>Optick&aacute; mechanika: nie</li>\r\n<li>Grafick&aacute; karta:NVIDIA RTX 3060 12GB GDDR6 HDMI/3xDP</li>\r\n<li>Pam&auml;ť: 32 GB (2 x 16) DDR4 + 2x free slot</li>\r\n<li>Max. veľkosť: 64 GB</li>\r\n<li>Počet poz&iacute;cii (celkom / voľn&eacute;): 4/2</li>\r\n<li>Sieť: Killer Ethernet E2600 (2.5 GbE)</li>\r\n<li>Bezdr&ocirc;tov&aacute; komunik&aacute;cia: 802.11ax/ac/a/b/g/n, Wi-Fi 6 and Bluetooth 5</li>\r\n</ul>\r\n</div>\r\n</div>', 0),
(86, 'Lenovo Legion T5 26IAB7', 2001.79, 'Zakúpením tohto produktu získate Herný balíček v hodnote 137€. Balíček hier obsahuje: Gotham Knights, Redout 2 a program XSplit Premium Suite (predplatné na 3 mesiace). Pre uplatnenie balíčka je potrebná registrácia na webe. Počítač Lenovo Legion T5 v prevedení Tower s objemom 26 litrov prináša dokonalý herný zážitok v exkluzívnom prevedení. Skvelý výkon podporí vaše herné úsilie a vďaka atraktívnemu dizajnu bude toto zariadenie dokonalým doplnkom pre váš domov. ', 'http://localhost/GameSpace/img/user/product_696a2daf8e27f.jpg', '2026-01-16 12:23:11', '2026-01-16 12:23:11', 'Lenovo Legion T5', '2025-06-04', 'lenovo-legion-t5-26iab7', '<div align=\"left\">\r\n<div>Poč&iacute;tač Lenovo Legion T5 v preveden&iacute; Tower s objemom 26 litrov prin&aacute;&scaron;a dokonal&yacute; hern&yacute; z&aacute;žitok v exkluz&iacute;vnom preveden&iacute;. Skvel&yacute; v&yacute;kon podpor&iacute; va&scaron;e hern&eacute; &uacute;silie a vďaka atrakt&iacute;vnemu dizajnu bude toto zariadenie dokonal&yacute;m doplnkom pre v&aacute;&scaron; domov.<br /><br /></div>\r\n</div>\r\n<div align=\"left\">\r\n<div>\r\n<h2>Kľ&uacute;čov&eacute; vlastnosti</h2>\r\n<ul>\r\n<li>V&yacute;konn&yacute; procesor Intel Core a dedikovan&aacute; hern&aacute; grafika</li>\r\n<li>Bezprobl&eacute;mov&yacute; multitasking medzi hran&iacute;m a ďal&scaron;&iacute;mi aplik&aacute;ciami</li>\r\n<li>Vynikaj&uacute;ci syst&eacute;m chladenia zabraňuje prehrievaniu</li>\r\n<li>R&yacute;chly a jednoduch&yacute; pr&iacute;stup k syst&eacute;mov&yacute;m inform&aacute;ci&aacute;m prostredn&iacute;ctvom aplik&aacute;cie Lenovo</li>\r\n</ul>\r\n</div>\r\n</div>', 0),
(87, 'ACER PC Predator Orion 3000 PO3-640- i5-12400F,16GB,512GBSSD,GTX 1660 SUPER,W11H', 1180.79, 'Kľúčové vlastnosti * Model: Acer Predator Orion 3000 PO3-640 * Prevedenie: Midi Tower * Operačný systém: Windows 11 Home * Procesor: Intel Core i5-12400F (6C, 2.5/4.4 GHz) * Pevný disk: 512 GB M.2 SSD * Optická mechanika: nie * Grafická karta:NVIDIA GeForce GTX 1660 Super 6GB DVI/HDMI/DP * Pamäť: 16 GB (1 x 16) DDR4 + 3x free slot * Max. veľkosť: 64 GB', 'http://localhost/GameSpace/img/user/product_696a2e082b4a1.jpg', '2026-01-16 12:24:40', '2026-01-16 12:24:40', 'ACER PC Predator Orion 3000', '2025-06-05', 'acer-pc-predator-orion-3000-po3-640--i5-12400f,16gb,512gbssd,gtx-1660-super,w11h', '<h2>Kľ&uacute;čov&eacute; vlastnosti</h2>\r\n<ul>\r\n<li>Model: Acer Predator Orion 3000 PO3-640</li>\r\n<li>Prevedenie: Midi Tower</li>\r\n<li>Operačn&yacute; syst&eacute;m: Windows 11 Home</li>\r\n<li>Procesor: Intel Core i5-12400F (6C, 2.5/4.4 GHz)</li>\r\n<li>Pevn&yacute; disk: 512 GB M.2 SSD</li>\r\n<li>Optick&aacute; mechanika: nie</li>\r\n<li>Grafick&aacute; karta:NVIDIA GeForce GTX 1660 Super 6GB DVI/HDMI/DP</li>\r\n<li>Pam&auml;ť: 16 GB (1 x 16) DDR4 + 3x free slot</li>\r\n<li>Max. veľkosť: 64 GB</li>\r\n<li>Počet poz&iacute;cii (celkom / voľn&eacute;): 4/2</li>\r\n<li>Sieť: Gigabit Ethernet</li>\r\n<li>Bezdr&ocirc;tov&aacute; komunik&aacute;cia: WiFi 6 MU-MIMO + BT5.1</li>\r\n</ul>', 0),
(88, 'Acer Predator/Orion 3000/Tower/i5-11400F/16GB/1TB SSD/GTX 1660', 1118, 'Acer Predator/Orion 3000/Tower/i5-11400F/16GB/1TB SSD/GTX 1660\r\nHra na plný plyn Hrajte na plný plyn s inovovaným herným počítačom ACER Predator Orion 3000. Nalaďte sa na hranie s inšpiratívnou konštrukciou, ktorá vo vás prebudí hráča. Špičkový výkon sa hodí aj pre prácu, editovanie, streamovanie, tvorbu aj dizajn. * lkonické šasi Predator Nenechajte sa zmiasťveľkosťou. V čiernočiernom púzdre je ukrytý herný kolos pripravený ukázať svoju kuráž. Šasi so značkou Predator bolo navrhnuté podľa nášho loga.', 'http://localhost/GameSpace/img/user/product_696a2eab475eb.jpg', '2026-01-16 12:27:23', '2026-01-16 12:27:23', 'Acer Predator', '2024-06-12', 'acer-predator/orion-3000/tower/i5-11400f/16gb/1tb-ssd/gtx-1660', '<div align=\"left\">\r\n<div>\r\n<h2>Hra na pln&yacute; plyn</h2>\r\nHrajte na pln&yacute; plyn s inovovan&yacute;m hern&yacute;m poč&iacute;tačom ACER Predator Orion 3000. Nalaďte sa na hranie s in&scaron;pirat&iacute;vnou kon&scaron;trukciou, ktor&aacute; vo v&aacute;s prebud&iacute; hr&aacute;ča. &Scaron;pičkov&yacute; v&yacute;kon sa hod&iacute; aj pre pr&aacute;cu, editovanie, streamovanie, tvorbu aj dizajn.<br /><br /></div>\r\n</div>\r\n<div align=\"left\">\r\n<div>\r\n<h2>O produkte</h2>\r\n<p>lkonick&eacute; &scaron;asi Predator<br />Nenechajte sa zmiasťveľkosťou. V čiernočiernom p&uacute;zdre je ukryt&yacute; hern&yacute; kolos pripraven&yacute; uk&aacute;zať svoju kur&aacute;ž. &Scaron;asi so značkou Predator bolo navrhnut&eacute; podľa n&aacute;&scaron;ho loga. Ostr&eacute; uhly, odtiene čiernej a &scaron;edej farby a podsvietenie LED charakterizuj&uacute; legend&aacute;rny rad Orion..</p>\r\n<p>&nbsp;</p>\r\n<p>Spoznajte mriežky<br />Každ&yacute; hern&yacute; poč&iacute;tač sa trochu zapot&iacute;. To v&scaron;ak vyrie&scaron;ia dve mriežky v prednej a ľavej časti krytu, ktor&eacute; funguj&uacute; ako sanie a umožňuj&uacute; v&aacute;&scaron;mu syst&eacute;mu zostat\' v chlade a voľne d&yacute;chať. .</p>\r\n<p>&nbsp;</p>\r\n<p>Miesto k odpočinku<br />Nechajte svoju nahlavn&uacute; s&uacute;pravu po n&aacute;ročnom hran&iacute; odpočin&uacute;t\' a odložte ju na jeden zo svojich stojanov pre sl&uacute;chadl&aacute;. Boli ste ned&aacute;vno na LAN party a nechce sa v&aacute;m oh&yacute;bat\' za poč&iacute;tač? Využite dva porty USB 3.1 Gen2 a pohodlne umiestnen&eacute; audiokonektory.</p>\r\n<p>&nbsp;</p>\r\n<p>Toľko pam&auml;te<br />Č&iacute;m viac, t&yacute;m lep&scaron;ie. Ked\' m&aacute;te k dispoz&iacute;cii až 64GB pam&auml;te DDR4, m&oacute;žete spustiť &uacute;pine čokol\'vek. Ot&aacute;zkou zost&aacute;va, ako s t&yacute;m v&scaron;etk&yacute;m naložit?</p>\r\n<p>&nbsp;</p>\r\n<p>Zvuk Sound BľasterX<br />Vylep&scaron;ite a zosilnite, čo počujete, vd\'aka neuveriteľn&yacute;m n&aacute;strojom, ktor&eacute; pon&uacute;ka spracovanie zvuku Pre Gaming zvukovej karty Sound BlasterX0. Zbohom priemeru, nech žije v&yacute;nimočnostl Scout Mode je n&aacute;stroj, ktor&yacute; v&aacute;m m&aacute; pom&ocirc;cť počut\' to, čo nem&oacute;žete vidieť: vytvor&iacute; kontrast určit&yacute;ch zvukov, aby ste rozpoznali najmen&scaron;&iacute; pohyb a mohli na neho reagovat\'.</p>\r\n</div>\r\n</div>', 0),
(89, 'ASUS ROG Strix SCAR 18/Ultra 9 275HX/64GB/2TB SSD/18\" WQXGA/RTX 5090/Win11Pro/Off Black', 5429, 'Model: ASUS ROG Strix SCAR 18 Part Number: G835LX-NEBULA007X PROCESOR Model: Intel® Core™ Ultra 9 Processor 275HX 2.7 GHz (36MB Cache, up to 5.4 GHz, 24 cores, 24 Threads); Intel® AI Boost NPU up to 13TOPS OPERAČNÝ SYSTÉM Operačný systém: Windows 11 Pro DISPLEJ/GRAFIKA Typ displeja: LCD Dotykový: - Podsvietenie: LED Rozlíšenie displeja [px]: 2560 x 1600 (WQXGA) Uhlopriečka displeja [\"]: 18 Pomer strán: 16:10 Technológia displeja (povrch, frekvencia): IPS-level Druh grafickej karty: Dedikovaná Grafická karta: NVIDIA® GeForce RTX™ 5090 ', 'http://localhost/GameSpace/img/user/product_696a2f18aaff8.jpg', '2026-01-16 12:29:12', '2026-01-16 12:34:34', 'ASUS ROG Strix SCAR 18', '2025-09-10', 'asus-rog-strix-scar-18/ultra-9-275hx/64gb/2tb-ssd/18\"-wqxga/rtx-5090/win11pro/off-black', '<p data-start=\"121\" data-end=\"193\"><strong data-start=\"121\" data-end=\"131\">Model:</strong> ASUS ROG Strix SCAR 18<br data-start=\"154\" data-end=\"157\" /><strong data-start=\"157\" data-end=\"173\">Part Number:</strong> G835LX-NEBULA007X</p>\r\n<hr data-start=\"195\" data-end=\"198\" />\r\n<h3 data-start=\"200\" data-end=\"217\"><strong data-start=\"204\" data-end=\"217\">Processor</strong></h3>\r\n<ul data-start=\"218\" data-end=\"405\">\r\n<li data-start=\"218\" data-end=\"265\">\r\n<p data-start=\"220\" data-end=\"265\">Model: Intel&reg; Core&trade; Ultra 9 Processor 275HX</p>\r\n</li>\r\n<li data-start=\"266\" data-end=\"307\">\r\n<p data-start=\"268\" data-end=\"307\">Base / Boost: 2.7 GHz (up to 5.4 GHz)</p>\r\n</li>\r\n<li data-start=\"308\" data-end=\"324\">\r\n<p data-start=\"310\" data-end=\"324\">Cache: 36 MB</p>\r\n</li>\r\n<li data-start=\"325\" data-end=\"366\">\r\n<p data-start=\"327\" data-end=\"366\">Cores / Threads: 24 Cores, 24 Threads</p>\r\n</li>\r\n<li data-start=\"367\" data-end=\"405\">\r\n<p data-start=\"369\" data-end=\"405\">Intel&reg; AI Boost NPU: Up to 13 TOPS</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"407\" data-end=\"410\" />\r\n<h3 data-start=\"412\" data-end=\"436\"><strong data-start=\"416\" data-end=\"436\">Operating System</strong></h3>\r\n<ul data-start=\"437\" data-end=\"455\">\r\n<li data-start=\"437\" data-end=\"455\">\r\n<p data-start=\"439\" data-end=\"455\">Windows 11 Pro</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"457\" data-end=\"460\" />\r\n<h3 data-start=\"462\" data-end=\"488\"><strong data-start=\"466\" data-end=\"488\">Display &amp; Graphics</strong></h3>\r\n<ul data-start=\"489\" data-end=\"708\">\r\n<li data-start=\"489\" data-end=\"521\">\r\n<p data-start=\"491\" data-end=\"521\">Display Type: LCD, IPS-level</p>\r\n</li>\r\n<li data-start=\"522\" data-end=\"535\">\r\n<p data-start=\"524\" data-end=\"535\">Touch: No</p>\r\n</li>\r\n<li data-start=\"536\" data-end=\"554\">\r\n<p data-start=\"538\" data-end=\"554\">Backlight: LED</p>\r\n</li>\r\n<li data-start=\"555\" data-end=\"593\">\r\n<p data-start=\"557\" data-end=\"593\">Resolution: 2560 x 1600 px (WQXGA)</p>\r\n</li>\r\n<li data-start=\"594\" data-end=\"607\">\r\n<p data-start=\"596\" data-end=\"607\">Size: 18\"</p>\r\n</li>\r\n<li data-start=\"608\" data-end=\"631\">\r\n<p data-start=\"610\" data-end=\"631\">Aspect Ratio: 16:10</p>\r\n</li>\r\n<li data-start=\"632\" data-end=\"687\">\r\n<p data-start=\"634\" data-end=\"687\">Dedicated GPU: NVIDIA&reg; GeForce RTX&trade; 5090 Laptop GPU</p>\r\n</li>\r\n<li data-start=\"688\" data-end=\"708\">\r\n<p data-start=\"690\" data-end=\"708\">GPU Memory: 8 GB</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"710\" data-end=\"713\" />\r\n<h3 data-start=\"715\" data-end=\"730\"><strong data-start=\"719\" data-end=\"730\">Storage</strong></h3>\r\n<ul data-start=\"731\" data-end=\"815\">\r\n<li data-start=\"731\" data-end=\"748\">\r\n<p data-start=\"733\" data-end=\"748\">Drives: 1 SSD</p>\r\n</li>\r\n<li data-start=\"749\" data-end=\"782\">\r\n<p data-start=\"751\" data-end=\"782\">SSD Type: M.2 NVMe&trade; PCIe&reg; 4.0</p>\r\n</li>\r\n<li data-start=\"783\" data-end=\"815\">\r\n<p data-start=\"785\" data-end=\"815\">Capacity: 1TB + 1TB (RAID 0)</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"817\" data-end=\"820\" />\r\n<h3 data-start=\"822\" data-end=\"842\"><strong data-start=\"826\" data-end=\"842\">Memory (RAM)</strong></h3>\r\n<ul data-start=\"843\" data-end=\"961\">\r\n<li data-start=\"843\" data-end=\"896\">\r\n<p data-start=\"845\" data-end=\"896\">Size: 32 GB onboard + 32 GB SO-DIMM (64 GB total)</p>\r\n</li>\r\n<li data-start=\"897\" data-end=\"911\">\r\n<p data-start=\"899\" data-end=\"911\">Type: DDR5</p>\r\n</li>\r\n<li data-start=\"912\" data-end=\"935\">\r\n<p data-start=\"914\" data-end=\"935\">Frequency: 4800 MHz</p>\r\n</li>\r\n<li data-start=\"936\" data-end=\"961\">\r\n<p data-start=\"938\" data-end=\"961\">Slots: 1 (1 occupied)</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"963\" data-end=\"966\" />\r\n<h3 data-start=\"968\" data-end=\"988\"><strong data-start=\"972\" data-end=\"988\">Connectivity</strong></h3>\r\n<ul data-start=\"989\" data-end=\"1104\">\r\n<li data-start=\"989\" data-end=\"1007\">\r\n<p data-start=\"991\" data-end=\"1007\">Bluetooth: 5.2</p>\r\n</li>\r\n<li data-start=\"1008\" data-end=\"1049\">\r\n<p data-start=\"1010\" data-end=\"1049\">Ethernet: Yes (10/100/1000/2500 Mbps)</p>\r\n</li>\r\n<li data-start=\"1050\" data-end=\"1080\">\r\n<p data-start=\"1052\" data-end=\"1080\">Wi-Fi: Wi-Fi 6E (802.11ax)</p>\r\n</li>\r\n<li data-start=\"1081\" data-end=\"1104\">\r\n<p data-start=\"1083\" data-end=\"1104\">WWAN: Not supported</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1106\" data-end=\"1109\" />\r\n<h3 data-start=\"1111\" data-end=\"1134\"><strong data-start=\"1115\" data-end=\"1134\">Battery &amp; Power</strong></h3>\r\n<ul data-start=\"1135\" data-end=\"1228\">\r\n<li data-start=\"1135\" data-end=\"1169\">\r\n<p data-start=\"1137\" data-end=\"1169\">Battery: 90 WHr, 4-cell Li-ion</p>\r\n</li>\r\n<li data-start=\"1170\" data-end=\"1228\">\r\n<p data-start=\"1172\" data-end=\"1228\">Power Adapter: 330W (20V DC, 16.5A, 100~240V AC input)</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1230\" data-end=\"1233\" />\r\n<h3 data-start=\"1235\" data-end=\"1248\"><strong data-start=\"1239\" data-end=\"1248\">Ports</strong></h3>\r\n<ul data-start=\"1249\" data-end=\"1459\">\r\n<li data-start=\"1249\" data-end=\"1278\">\r\n<p data-start=\"1251\" data-end=\"1278\">1x 3.5mm combo audio jack</p>\r\n</li>\r\n<li data-start=\"1279\" data-end=\"1298\">\r\n<p data-start=\"1281\" data-end=\"1298\">1x HDMI 2.1 FRL</p>\r\n</li>\r\n<li data-start=\"1299\" data-end=\"1326\">\r\n<p data-start=\"1301\" data-end=\"1326\">2x USB 3.2 Gen 2 Type-A</p>\r\n</li>\r\n<li data-start=\"1327\" data-end=\"1385\">\r\n<p data-start=\"1329\" data-end=\"1385\">1x USB 3.2 Gen 2 Type-C (DisplayPort / Power / G-SYNC)</p>\r\n</li>\r\n<li data-start=\"1386\" data-end=\"1406\">\r\n<p data-start=\"1388\" data-end=\"1406\">1x 2.5G LAN port</p>\r\n</li>\r\n<li data-start=\"1407\" data-end=\"1459\">\r\n<p data-start=\"1409\" data-end=\"1459\">1x Thunderbolt&trade; 4 (DisplayPort / G-SYNC support)</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1461\" data-end=\"1464\" />\r\n<h3 data-start=\"1466\" data-end=\"1493\"><strong data-start=\"1470\" data-end=\"1493\">Additional Features</strong></h3>\r\n<ul data-start=\"1494\" data-end=\"1788\">\r\n<li data-start=\"1494\" data-end=\"1545\">\r\n<p data-start=\"1496\" data-end=\"1545\">Speakers: 2x2W dual-force woofer + 2x2W tweeter</p>\r\n</li>\r\n<li data-start=\"1546\" data-end=\"1615\">\r\n<p data-start=\"1548\" data-end=\"1615\">Audio Tech: Smart Amp Technology, Dolby Atmos, AI Noise-Canceling</p>\r\n</li>\r\n<li data-start=\"1616\" data-end=\"1643\">\r\n<p data-start=\"1618\" data-end=\"1643\">Memory Card Reader: Yes</p>\r\n</li>\r\n<li data-start=\"1644\" data-end=\"1682\">\r\n<p data-start=\"1646\" data-end=\"1682\">Webcam: 720p HD IR (Windows Hello)</p>\r\n</li>\r\n<li data-start=\"1683\" data-end=\"1704\">\r\n<p data-start=\"1685\" data-end=\"1704\">Keyboard: Backlit</p>\r\n</li>\r\n<li data-start=\"1705\" data-end=\"1722\">\r\n<p data-start=\"1707\" data-end=\"1722\">Touchpad: Yes</p>\r\n</li>\r\n<li data-start=\"1723\" data-end=\"1758\">\r\n<p data-start=\"1725\" data-end=\"1758\">Security: Kensington lock, BIOS</p>\r\n</li>\r\n<li data-start=\"1759\" data-end=\"1788\">\r\n<p data-start=\"1761\" data-end=\"1788\">VR Support: Not specified</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1790\" data-end=\"1793\" />\r\n<h3 data-start=\"1795\" data-end=\"1822\"><strong data-start=\"1799\" data-end=\"1822\">Design &amp; Dimensions</strong></h3>\r\n<p>&nbsp;</p>\r\n<ul data-start=\"1823\" data-end=\"1959\">\r\n<li data-start=\"1823\" data-end=\"1844\">\r\n<p data-start=\"1825\" data-end=\"1844\">Chassis: Standard</p>\r\n</li>\r\n<li data-start=\"1845\" data-end=\"1865\">\r\n<p data-start=\"1847\" data-end=\"1865\">Color: Off Black</p>\r\n</li>\r\n<li data-start=\"1866\" data-end=\"1940\">\r\n<p data-start=\"1868\" data-end=\"1940\">Dimensions: 39.9 x 29.4 x 2.31&ndash;3.08 cm (15.71\" x 11.57\" x 0.91\"&ndash;1.21\")</p>\r\n</li>\r\n<li data-start=\"1941\" data-end=\"1959\">\r\n<p data-start=\"1943\" data-end=\"1959\">Weight: 3.3 kg</p>\r\n</li>\r\n</ul>\r\n<p><span style=\"font-family: Roboto, Arial; font-size: 20px; text-align: justify; white-space-collapse: preserve-breaks; background-color: #ffffff;\">&nbsp;</span></p>', 0),
(90, 'Razer BlackWidow V3 Mini HyperSpeed (Green Switch) Phantom Ed.', 119.99, 'BEZDRÔTOVÁ MECHANICKÁ HERNÁ KLÁVESNICA RAZER BLACKWIDOW V3 MINI - Phantom Edition Kompaktná a praktická a dizajnovo zaujímavá - to je klávesnica Razer BlackWidow V3 Mini HyperSpeed Phantom Edition! Táto bezdrôtová mechanická herná klávesnica je vybavená najpokročilejšou bezdrôtovou technológiou na hranie hier s nízkou latenciou a hyperreaktívne vstupy - umožnené optimalizovaným dátovým protokolom, ultrarýchlou rádiovou frekvenciou a plynulým prepínaním frekvencií v najhlučnejšom, dátovo nasýtenom prostredí.', 'http://localhost/GameSpace/img/user/product_696a2fc5d8c13.jpg', '2026-01-16 12:32:05', '2026-01-16 12:38:29', 'Razer BlackWidow V3 mini', '2025-06-04', 'razer-blackwidow-v3-mini-hyperspeed-(green-switch)-phantom-ed.', '<h3 data-start=\"190\" data-end=\"208\"><strong data-start=\"194\" data-end=\"208\">O produkte</strong></h3>\r\n<p data-start=\"209\" data-end=\"395\">Hľad&aacute;te kl&aacute;vesnicu, ktor&aacute; je &scaron;t&yacute;lov&aacute;, minimalistick&aacute; a z&aacute;roveň plne funkčn&aacute;? <strong data-start=\"286\" data-end=\"305\">Phantom Edition</strong> kl&aacute;vesnica od Razer v&aacute;m prin&aacute;&scaron;a unik&aacute;tny &ldquo;fant&oacute;mov&yacute;&rdquo; dizajn vďaka <strong data-start=\"372\" data-end=\"392\">Phantom Key Caps</strong>.</p>\r\n<ul data-start=\"396\" data-end=\"653\">\r\n<li data-start=\"396\" data-end=\"462\">\r\n<p data-start=\"398\" data-end=\"462\">Popisy kl&aacute;ves s&uacute; viditeľn&eacute; len pri zapnut&iacute; <strong data-start=\"441\" data-end=\"459\">RGB osvetlenia</strong>.</p>\r\n</li>\r\n<li data-start=\"463\" data-end=\"577\">\r\n<p data-start=\"465\" data-end=\"577\">Bez zapnut&eacute;ho RGB je horn&aacute; strana kl&aacute;ves čist&aacute;, bez označen&iacute;, čo dod&aacute;va kl&aacute;vesnici tajomn&yacute; a elegantn&yacute; vzhľad.</p>\r\n</li>\r\n<li data-start=\"578\" data-end=\"653\">\r\n<p data-start=\"580\" data-end=\"653\">Funkcie kl&aacute;ves s&uacute; st&aacute;le viditeľn&eacute; z bočnej strany pre ľahk&uacute; orient&aacute;ciu.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"655\" data-end=\"658\" />\r\n<h3 data-start=\"660\" data-end=\"690\"><strong data-start=\"664\" data-end=\"690\">Kompaktn&aacute; a v&scaron;estrann&aacute;</strong></h3>\r\n<ul data-start=\"691\" data-end=\"946\">\r\n<li data-start=\"691\" data-end=\"780\">\r\n<p data-start=\"693\" data-end=\"780\">Bezdr&ocirc;tov&aacute; 65% mechanick&aacute; hern&aacute; kl&aacute;vesnica kombinuje <strong data-start=\"746\" data-end=\"761\">kompaktnosť</strong> a <strong data-start=\"764\" data-end=\"777\">funkčnosť</strong>.</p>\r\n</li>\r\n<li data-start=\"781\" data-end=\"861\">\r\n<p data-start=\"783\" data-end=\"861\">Elegantn&eacute; prevedenie vhodn&eacute; pre minimalistick&eacute; alebo men&scaron;ie pracovn&eacute; plochy.</p>\r\n</li>\r\n<li data-start=\"862\" data-end=\"946\">\r\n<p data-start=\"864\" data-end=\"946\">Perfektn&aacute; rovnov&aacute;ha medzi formou a funkciou pre hranie aj každodenn&eacute; použ&iacute;vanie.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"948\" data-end=\"951\" />\r\n<h3 data-start=\"953\" data-end=\"976\"><strong data-start=\"957\" data-end=\"976\">65% Form Factor</strong></h3>\r\n<ul data-start=\"977\" data-end=\"1173\">\r\n<li data-start=\"977\" data-end=\"1088\">\r\n<p data-start=\"979\" data-end=\"1088\">Obsahuje v&scaron;etky <strong data-start=\"995\" data-end=\"1017\">kl&aacute;vesy so &scaron;&iacute;pkami</strong>, ale postr&aacute;da numerick&uacute; kl&aacute;vesnicu, funkčn&yacute; riadok a dom&aacute;ci cluster.</p>\r\n</li>\r\n<li data-start=\"1089\" data-end=\"1173\">\r\n<p data-start=\"1091\" data-end=\"1173\">Ide&aacute;lne pre použ&iacute;vateľov s obmedzen&yacute;m priestorom, ktor&iacute; chc&uacute; zachovať funkčnosť.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1175\" data-end=\"1178\" />\r\n<h3 data-start=\"1180\" data-end=\"1221\"><strong data-start=\"1184\" data-end=\"1221\">Bezdr&ocirc;tov&aacute; technol&oacute;gia HyperSpeed</strong></h3>\r\n<ul data-start=\"1222\" data-end=\"1535\">\r\n<li data-start=\"1222\" data-end=\"1352\">\r\n<p data-start=\"1224\" data-end=\"1352\"><strong data-start=\"1224\" data-end=\"1242\">N&iacute;zka latencia</strong> a <strong data-start=\"1245\" data-end=\"1272\">hyperresponz&iacute;vne vstupy</strong> vďaka optimalizovan&eacute;mu d&aacute;tov&eacute;mu protokolu a ultrar&yacute;chlej r&aacute;diovej frekvencii.</p>\r\n</li>\r\n<li data-start=\"1353\" data-end=\"1457\">\r\n<p data-start=\"1355\" data-end=\"1457\">Automatick&eacute; prep&iacute;nanie frekvenci&iacute; zabezpečuje stabiln&eacute; spojenie aj v d&aacute;tovo nas&yacute;ten&yacute;ch prostrediach.</p>\r\n</li>\r\n<li data-start=\"1458\" data-end=\"1535\">\r\n<p data-start=\"1460\" data-end=\"1535\">Podpora viacer&yacute;ch zariaden&iacute;: pripojte my&scaron; a kl&aacute;vesnicu cez jedin&yacute; dongle.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1537\" data-end=\"1540\" />\r\n<h3 data-start=\"1542\" data-end=\"1562\"><strong data-start=\"1546\" data-end=\"1562\">Green Switch</strong></h3>\r\n<ul data-start=\"1563\" data-end=\"1740\">\r\n<li data-start=\"1563\" data-end=\"1655\">\r\n<p data-start=\"1565\" data-end=\"1655\">Klikav&eacute; a hmatov&eacute; prep&iacute;nače pre <strong data-start=\"1597\" data-end=\"1624\">uspokojiv&uacute; sp&auml;tn&uacute; v&auml;zbu</strong> pri každom stlačen&iacute; kl&aacute;vesy.</p>\r\n</li>\r\n<li data-start=\"1656\" data-end=\"1740\">\r\n<p data-start=\"1658\" data-end=\"1740\">Optimalizovan&eacute; aktivačn&eacute; a resetovacie body pre lep&scaron;iu presnosť a v&yacute;kon v hr&aacute;ch.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1742\" data-end=\"1745\" />\r\n<h3 data-start=\"1747\" data-end=\"1788\"><strong data-start=\"1751\" data-end=\"1788\">Razer Keycaps s bočn&yacute;mi potlačami</strong></h3>\r\n<ul data-start=\"1789\" data-end=\"1980\">\r\n<li data-start=\"1789\" data-end=\"1901\">\r\n<p data-start=\"1791\" data-end=\"1901\">Kl&aacute;vesy maj&uacute; <strong data-start=\"1804\" data-end=\"1842\">bočn&eacute; potlače sekund&aacute;rnych funkci&iacute;</strong> pre jednoduch&scaron;iu orient&aacute;ciu pri skriptovan&iacute; alebo hran&iacute;.</p>\r\n</li>\r\n<li data-start=\"1902\" data-end=\"1980\">\r\n<p data-start=\"1904\" data-end=\"1980\">Dve možnosti prep&iacute;načov umožňuj&uacute; prisp&ocirc;sobiť kl&aacute;vesnicu podľa preferenci&iacute;.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1982\" data-end=\"1985\" />\r\n<h3 data-start=\"1987\" data-end=\"2008\"><strong data-start=\"1991\" data-end=\"2008\">V&yacute;drž bat&eacute;rie</strong></h3>\r\n<ul data-start=\"2009\" data-end=\"2187\">\r\n<li data-start=\"2009\" data-end=\"2096\">\r\n<p data-start=\"2011\" data-end=\"2096\">Až <strong data-start=\"2014\" data-end=\"2037\">200 hod&iacute;n prev&aacute;dzky</strong> pri bezdr&ocirc;tovom režime Razer HyperSpeed alebo Bluetooth.</p>\r\n</li>\r\n<li data-start=\"2097\" data-end=\"2187\">\r\n<p data-start=\"2099\" data-end=\"2187\">Nab&iacute;janie z 0% na pln&uacute; kapacitu za menej než <strong data-start=\"2144\" data-end=\"2155\">5 hod&iacute;n</strong>, takže prestoje s&uacute; minim&aacute;lne.</p>\r\n</li>\r\n</ul>', 0),
(91, 'Logitech G515 TKL - herná klávesnica, Tactile, USB, čierna, CZ/SK', 64.9, 'Predurčená k víťazstvu Dostupná nízkoprofilová herná klávesnica s výškou iba 22 mm ponúka hráčom všetko, čo bezdrôtový variant, len v lacnejšej a drôtovej forme. Klávesnica disponuje technológiou KeyControl a PBT keycapmi. Tie sú odolné, robustné a celková konštrukcia je zmesou tvrdeného plastu a SPCC ocele. * Kompaktná herná klávesnicaKáblová mechanická herná klávesnica Logitech G515 TKL je tenká v prevedení tenkeyless. ', 'http://localhost/GameSpace/img/user/product_696a31a5d3057.jpg', '2026-01-16 12:40:05', '2026-01-16 12:40:48', 'Logitech G515 TKL ', '2025-06-04', 'logitech-g515-tkl---herná-klávesnica,-tactile,-usb,-čierna,-cz/sk', '<h3 data-start=\"163\" data-end=\"190\"><strong data-start=\"167\" data-end=\"190\">Kompaktn&aacute; a &scaron;t&yacute;lov&aacute;</strong></h3>\r\n<ul data-start=\"191\" data-end=\"322\">\r\n<li data-start=\"191\" data-end=\"322\">\r\n<p data-start=\"193\" data-end=\"322\"><strong data-start=\"193\" data-end=\"213\">Tenkeyless (TKL)</strong> prevedenie &ndash; tenk&aacute; a kompaktn&aacute; kl&aacute;vesnica ide&aacute;lna pre men&scaron;ie pracovn&eacute; plochy alebo minimalistick&eacute; zostavy.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"324\" data-end=\"327\" />\r\n<h3 data-start=\"329\" data-end=\"361\"><strong data-start=\"333\" data-end=\"361\">Plynul&eacute; a presn&eacute; p&iacute;sanie</strong></h3>\r\n<ul data-start=\"362\" data-end=\"541\">\r\n<li data-start=\"362\" data-end=\"435\">\r\n<p data-start=\"364\" data-end=\"435\"><strong data-start=\"364\" data-end=\"404\">N&iacute;zkoprofilov&eacute; mechanick&eacute; sp&iacute;nače GL</strong>, predmazan&eacute; pre hlad&scaron;&iacute; chod.</p>\r\n</li>\r\n<li data-start=\"436\" data-end=\"472\">\r\n<p data-start=\"438\" data-end=\"472\">R&yacute;chla reakcia a presn&eacute; p&iacute;sanie.</p>\r\n</li>\r\n<li data-start=\"473\" data-end=\"541\">\r\n<p data-start=\"475\" data-end=\"541\">Dostupn&eacute; vo <strong data-start=\"487\" data-end=\"505\">dvoch verzi&aacute;ch</strong>: dotykov&eacute; alebo line&aacute;rne sp&iacute;nače.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"543\" data-end=\"546\" />\r\n<h3 data-start=\"548\" data-end=\"587\"><strong data-start=\"552\" data-end=\"587\">Odoln&eacute; kl&aacute;vesy a pr&eacute;miov&yacute; pocit</strong></h3>\r\n<ul data-start=\"588\" data-end=\"759\">\r\n<li data-start=\"588\" data-end=\"648\">\r\n<p data-start=\"590\" data-end=\"648\">Krytky kl&aacute;ves z <strong data-start=\"606\" data-end=\"635\">dvojito vstrekovan&eacute;ho PBT</strong> materi&aacute;lu.</p>\r\n</li>\r\n<li data-start=\"649\" data-end=\"706\">\r\n<p data-start=\"651\" data-end=\"706\">Odolnosť voči opotrebovaniu aj pri intenz&iacute;vnom hran&iacute;.</p>\r\n</li>\r\n<li data-start=\"707\" data-end=\"759\">\r\n<p data-start=\"709\" data-end=\"759\">Elegantn&yacute; dizajn s pr&iacute;jemn&yacute;m pocitom pri p&iacute;san&iacute;.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"761\" data-end=\"764\" />\r\n<h3 data-start=\"766\" data-end=\"800\"><strong data-start=\"770\" data-end=\"800\">Podsvietenie LIGHTSYNC RGB</strong></h3>\r\n<ul data-start=\"801\" data-end=\"929\">\r\n<li data-start=\"801\" data-end=\"840\">\r\n<p data-start=\"803\" data-end=\"840\">Pr&iacute;stup k <strong data-start=\"813\" data-end=\"837\">16,8 mili&oacute;nom farieb</strong>.</p>\r\n</li>\r\n<li data-start=\"841\" data-end=\"929\">\r\n<p data-start=\"843\" data-end=\"929\">Prisp&ocirc;sobiteľn&eacute; mot&iacute;vy a synchroniz&aacute;cia s ďal&scaron;&iacute;m vybaven&iacute;m Logitech G cez <strong data-start=\"917\" data-end=\"926\">G HUB</strong>.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"931\" data-end=\"934\" />\r\n<h3 data-start=\"936\" data-end=\"973\"><strong data-start=\"940\" data-end=\"973\">Spoľahliv&eacute; k&aacute;blov&eacute; pripojenie</strong></h3>\r\n<ul data-start=\"974\" data-end=\"1085\">\r\n<li data-start=\"974\" data-end=\"1035\">\r\n<p data-start=\"976\" data-end=\"1035\">K&aacute;blov&eacute; spojenie pre <strong data-start=\"997\" data-end=\"1015\">n&iacute;zku latenciu</strong> a stabiln&yacute; v&yacute;kon.</p>\r\n</li>\r\n<li data-start=\"1036\" data-end=\"1085\">\r\n<p data-start=\"1038\" data-end=\"1085\">Bez preru&scaron;ovania hry alebo potreby nab&iacute;jania.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1087\" data-end=\"1090\" />\r\n<h3 data-start=\"1092\" data-end=\"1114\"><strong data-start=\"1096\" data-end=\"1114\">Tich&scaron;ie hranie</strong></h3>\r\n<ul data-start=\"1115\" data-end=\"1213\">\r\n<li data-start=\"1115\" data-end=\"1153\">\r\n<p data-start=\"1117\" data-end=\"1153\">Vrstven&aacute; kon&scaron;trukcia tlmiaca zvuk.</p>\r\n</li>\r\n<li data-start=\"1154\" data-end=\"1213\">\r\n<p data-start=\"1156\" data-end=\"1213\">Hladk&yacute; chod kl&aacute;ves a pohodln&eacute;, tich&eacute; hranie aj p&iacute;sanie.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1215\" data-end=\"1218\" />\r\n<h3 data-start=\"1220\" data-end=\"1251\"><strong data-start=\"1224\" data-end=\"1251\">Pokročil&eacute; prisp&ocirc;sobenie</strong></h3>\r\n<ul data-start=\"1252\" data-end=\"1405\">\r\n<li data-start=\"1252\" data-end=\"1338\">\r\n<p data-start=\"1254\" data-end=\"1338\">Technol&oacute;gia <strong data-start=\"1266\" data-end=\"1280\">Keycontrol</strong> umožňuje prisp&ocirc;sobiť každ&yacute; kl&aacute;ves podľa va&scaron;ich potrieb.</p>\r\n</li>\r\n<li data-start=\"1339\" data-end=\"1405\">\r\n<p data-start=\"1341\" data-end=\"1405\">Vytvorte si kl&aacute;vesnicu ako <strong data-start=\"1368\" data-end=\"1402\">osobn&eacute; hern&eacute; ovl&aacute;dacie centrum</strong>.</p>\r\n</li>\r\n</ul>', 0),
(92, 'Logitech G PRO X SUPERLIGHT 2 LIGHTSPEED - bezdrôtová herná myš - purpurová', 144.9, 'Vyvinula sa ikona Predstavujeme ďalšiu evolúciu ikony profesionálnych hier – teraz rýchlejšiu a presnejšiu. Víťazná 60 g herná myš bola navrhnutá v spolupráci s poprednými svetovými profesionálnymi hráčmi, aby prelomila akúkoľvek bariéru medzi vami a výhrou. * Hybridné spínače LightforceExkluzívna hybridná technológia opticko-mechanických prepínačov kombinuje rýchlosť a spoľahlivosť optických prepínačov s nízkou spotrebou energie a uspokojivým pocitom kliknutia tradičného galvanického (alebo mechanického) mikrospínača. ', 'http://localhost/GameSpace/img/user/product_696a3260d2d3b.jpg', '2026-01-16 12:43:12', '2026-01-16 12:43:12', 'Logitech G PRO X SUPERLIGHT 2 LIGHTSPEED', '2025-06-05', 'logitech-g-pro-x-superlight-2-lightspeed---bezdrôtová-herná-myš---purpurová', '<h3 data-start=\"158\" data-end=\"193\"><strong data-start=\"162\" data-end=\"193\">Hybridn&eacute; sp&iacute;nače Lightforce</strong></h3>\r\n<ul data-start=\"194\" data-end=\"410\">\r\n<li data-start=\"194\" data-end=\"339\">\r\n<p data-start=\"196\" data-end=\"339\">Exkluz&iacute;vna <strong data-start=\"207\" data-end=\"241\">opticko-mechanick&aacute; technol&oacute;gia</strong> sp&aacute;ja r&yacute;chlosť optick&yacute;ch prep&iacute;načov s uspokojiv&yacute;m klikom tradičn&yacute;ch mechanick&yacute;ch mikrosp&iacute;načov.</p>\r\n</li>\r\n<li data-start=\"340\" data-end=\"410\">\r\n<p data-start=\"342\" data-end=\"410\">Poskytuje profesion&aacute;lny v&yacute;kon bez kompromisu na <strong data-start=\"390\" data-end=\"407\">v&yacute;drž bat&eacute;rie</strong>.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"412\" data-end=\"415\" />\r\n<h3 data-start=\"417\" data-end=\"438\"><strong data-start=\"421\" data-end=\"438\">Sn&iacute;mač HERO 2</strong></h3>\r\n<ul data-start=\"439\" data-end=\"633\">\r\n<li data-start=\"439\" data-end=\"485\">\r\n<p data-start=\"441\" data-end=\"485\">Najpokročilej&scaron;&iacute; hern&yacute; sn&iacute;mač od Logitechu.</p>\r\n</li>\r\n<li data-start=\"486\" data-end=\"557\">\r\n<p data-start=\"488\" data-end=\"557\">Presnosť až <strong data-start=\"500\" data-end=\"514\">32 000 DPI</strong> a sledovanie r&yacute;chlost&iacute; cez <strong data-start=\"542\" data-end=\"554\">500+ IPS</strong>.</p>\r\n</li>\r\n<li data-start=\"558\" data-end=\"633\">\r\n<p data-start=\"560\" data-end=\"633\">Zabezpečuje maxim&aacute;lnu spoľahlivosť a presnosť pre profesion&aacute;lne hranie.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"635\" data-end=\"638\" />\r\n<h3 data-start=\"640\" data-end=\"680\"><strong data-start=\"644\" data-end=\"680\">Bezdr&ocirc;tov&yacute; LIGHTSPEED Superlight</strong></h3>\r\n<ul data-start=\"681\" data-end=\"828\">\r\n<li data-start=\"681\" data-end=\"739\">\r\n<p data-start=\"683\" data-end=\"739\"><strong data-start=\"683\" data-end=\"709\">Ultraľahk&aacute; kon&scaron;trukcia</strong> pre r&yacute;chle a presn&eacute; pohyby.</p>\r\n</li>\r\n<li data-start=\"740\" data-end=\"828\">\r\n<p data-start=\"742\" data-end=\"828\">Spoľahliv&yacute; bezdr&ocirc;tov&yacute; prenos s r&yacute;chlej&scaron;&iacute;m reportovan&iacute;m ako predch&aacute;dzaj&uacute;ca gener&aacute;cia.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"830\" data-end=\"833\" />\r\n<h3 data-start=\"835\" data-end=\"864\"><strong data-start=\"839\" data-end=\"864\">Pro-grade technol&oacute;gia</strong></h3>\r\n<ul data-start=\"865\" data-end=\"1062\">\r\n<li data-start=\"865\" data-end=\"929\">\r\n<p data-start=\"867\" data-end=\"929\">Najpopul&aacute;rnej&scaron;ia esportov&aacute; my&scaron;, navrhnut&aacute; pre profesion&aacute;lov.</p>\r\n</li>\r\n<li data-start=\"930\" data-end=\"1062\">\r\n<p data-start=\"932\" data-end=\"1062\">Funkcie: <strong data-start=\"941\" data-end=\"955\">2K polling</strong>, <strong data-start=\"957\" data-end=\"976\">USB-C nab&iacute;janie</strong>, <strong data-start=\"978\" data-end=\"1007\">95-hodinov&aacute; v&yacute;drž bat&eacute;rie</strong>, kompatibiln&aacute; s <strong data-start=\"1024\" data-end=\"1059\">bezdr&ocirc;tov&yacute;m nab&iacute;jan&iacute;m POWERPLAY</strong>.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1064\" data-end=\"1067\" />\r\n<h3 data-start=\"1069\" data-end=\"1094\"><strong data-start=\"1073\" data-end=\"1094\">Presn&aacute; kalibr&aacute;cia</strong></h3>\r\n<ul data-start=\"1095\" data-end=\"1294\">\r\n<li data-start=\"1095\" data-end=\"1144\">\r\n<p data-start=\"1097\" data-end=\"1144\">Možnosť nez&aacute;visl&eacute;ho nastavenia <strong data-start=\"1128\" data-end=\"1141\">osi X a Y</strong>.</p>\r\n</li>\r\n<li data-start=\"1145\" data-end=\"1208\">\r\n<p data-start=\"1147\" data-end=\"1208\">Nastaviteľn&aacute; tolerancia zdvihu pre optim&aacute;lny &uacute;chop a pohyb.</p>\r\n</li>\r\n<li data-start=\"1209\" data-end=\"1294\">\r\n<p data-start=\"1211\" data-end=\"1294\">Jednoduch&aacute; synchroniz&aacute;cia citlivosti s in&yacute;mi zariadeniami cez <strong data-start=\"1273\" data-end=\"1291\">Logitech G HUB</strong>.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1296\" data-end=\"1299\" />\r\n<h3 data-start=\"1301\" data-end=\"1321\"><strong data-start=\"1305\" data-end=\"1321\">PTFE nožičky</strong></h3>\r\n<ul data-start=\"1322\" data-end=\"1433\">\r\n<li data-start=\"1322\" data-end=\"1368\">\r\n<p data-start=\"1324\" data-end=\"1368\">Hladk&yacute;, presn&yacute; a bezprobl&eacute;mov&yacute; pohyb my&scaron;i.</p>\r\n</li>\r\n<li data-start=\"1369\" data-end=\"1433\">\r\n<p data-start=\"1371\" data-end=\"1433\">Nohy z PTFE zaručuj&uacute; <strong data-start=\"1392\" data-end=\"1411\">plynul&eacute; kĺzanie</strong> a presn&eacute; ovl&aacute;danie.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1435\" data-end=\"1438\" />\r\n<h3 data-start=\"1440\" data-end=\"1457\"><strong data-start=\"1444\" data-end=\"1457\">S&eacute;ria PRO</strong></h3>\r\n<p>&nbsp;</p>\r\n<ul data-start=\"1458\" data-end=\"1586\">\r\n<li data-start=\"1458\" data-end=\"1513\">\r\n<p data-start=\"1460\" data-end=\"1513\">Navrhnut&aacute; pre <strong data-start=\"1474\" data-end=\"1510\">profesion&aacute;lnych hr&aacute;čov e-&scaron;portov</strong>.</p>\r\n</li>\r\n<li data-start=\"1514\" data-end=\"1586\">\r\n<p data-start=\"1516\" data-end=\"1586\">Každ&yacute; k&uacute;sok optimalizovan&yacute; pre s&uacute;ťažn&eacute; hranie a maxim&aacute;lnu v&yacute;konnosť.</p>\r\n</li>\r\n</ul>', 0);
INSERT INTO `items` (`idItems`, `name`, `price`, `description`, `image`, `created_at`, `last_update`, `alt`, `release_date`, `slug`, `html_description`, `is_deleted`) VALUES
(93, 'SteelSeries Aerox 9 Wireless', 104, 'Spoznajte Aerox 9 Wireless Vďaka ultraľahkej Aerox 9 Wireless môžete vyhrávať v bojových arénach a raidovať dlhšie pre viac lootu. 18 programovateľných tlačidiel Arzenál príkazov na dosah ruky, optimálne umiestnený bočný panel s 12 tlačidlami a naše rolovacie koliesko s naklápaním a klikaním prinášajú vaše obľúbené schopnosti a makrá a dolaďujú vašu rotáciu k dokonalosti. Kľúčové vlastnosti * Bezdrôtové pripojenie Quantum 2.0', 'http://localhost/GameSpace/img/user/product_696a32da2ab50.jpg', '2026-01-16 12:45:14', '2026-01-16 12:45:14', 'SteelSeries Aerox 9 Wireless', '2025-06-11', 'steelseries-aerox-9-wireless', '<h3 data-start=\"180\" data-end=\"221\"><strong data-start=\"184\" data-end=\"221\">Bezdr&ocirc;tov&eacute; pripojenie Quantum 2.0</strong></h3>\r\n<ul data-start=\"222\" data-end=\"391\">\r\n<li data-start=\"222\" data-end=\"344\">\r\n<p data-start=\"224\" data-end=\"344\">Technol&oacute;gia <strong data-start=\"236\" data-end=\"251\">Quantum 2.0</strong> poskytuje <strong data-start=\"262\" data-end=\"292\">extr&eacute;mne r&yacute;chly prenos d&aacute;t</strong>, vysok&uacute; energetick&uacute; &uacute;činnosť a stabiln&eacute; spojenie.</p>\r\n</li>\r\n<li data-start=\"345\" data-end=\"391\">\r\n<p data-start=\"347\" data-end=\"391\">Vhodn&eacute; pre n&aacute;ročn&eacute; hranie bez oneskorenia.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"393\" data-end=\"396\" />\r\n<h3 data-start=\"398\" data-end=\"427\"><strong data-start=\"402\" data-end=\"427\">Ultraľahk&aacute; a pohodln&aacute;</strong></h3>\r\n<ul data-start=\"428\" data-end=\"568\">\r\n<li data-start=\"428\" data-end=\"494\">\r\n<p data-start=\"430\" data-end=\"494\">V&aacute;ha len <strong data-start=\"439\" data-end=\"447\">89 g</strong> &ndash; ide&aacute;lna pre dlh&eacute; MMO a MOBA hern&eacute; sedenia.</p>\r\n</li>\r\n<li data-start=\"495\" data-end=\"568\">\r\n<p data-start=\"497\" data-end=\"568\">Minimalizuje &uacute;navu z&aacute;p&auml;stia a paž&iacute;, z&aacute;roveň poskytuje pohodln&yacute; &uacute;chop.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"570\" data-end=\"573\" />\r\n<h3 data-start=\"575\" data-end=\"598\"><strong data-start=\"579\" data-end=\"598\">Honeycomb Shell</strong></h3>\r\n<ul data-start=\"599\" data-end=\"740\">\r\n<li data-start=\"599\" data-end=\"690\">\r\n<p data-start=\"601\" data-end=\"690\">Pl&aacute;stov&aacute; kon&scaron;trukcia znižuje hmotnosť až o <strong data-start=\"644\" data-end=\"652\">20 g</strong> pri zachovan&iacute; pevnosti a odolnosti.</p>\r\n</li>\r\n<li data-start=\"691\" data-end=\"740\">\r\n<p data-start=\"693\" data-end=\"740\">Odoln&aacute; pri intenz&iacute;vnych hern&yacute;ch stretnutiach.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"742\" data-end=\"745\" />\r\n<h3 data-start=\"747\" data-end=\"768\"><strong data-start=\"751\" data-end=\"768\">Ľahk&aacute; bat&eacute;ria</strong></h3>\r\n<ul data-start=\"769\" data-end=\"877\">\r\n<li data-start=\"769\" data-end=\"832\">\r\n<p data-start=\"771\" data-end=\"832\">V&aacute;ha len <strong data-start=\"780\" data-end=\"787\">6 g</strong> &ndash; o 14 g ľah&scaron;ia než u in&yacute;ch MMO/MOBA my&scaron;&iacute;.</p>\r\n</li>\r\n<li data-start=\"833\" data-end=\"877\">\r\n<p data-start=\"835\" data-end=\"877\">Poskytuje <strong data-start=\"845\" data-end=\"866\">&gt;180 hod&iacute;n v&yacute;drže</strong> bat&eacute;rie.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"879\" data-end=\"882\" />\r\n<h3 data-start=\"884\" data-end=\"924\"><strong data-start=\"888\" data-end=\"924\">Ultratenk&aacute; doska plo&scaron;n&yacute;ch spojov</strong></h3>\r\n<ul data-start=\"925\" data-end=\"1019\">\r\n<li data-start=\"925\" data-end=\"1019\">\r\n<p data-start=\"927\" data-end=\"1019\">Prepracovan&aacute; elektronika s <strong data-start=\"954\" data-end=\"976\">50 % ten&scaron;ou doskou</strong> pri zachovan&iacute; odolnosti a spoľahlivosti.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1021\" data-end=\"1024\" />\r\n<h3 data-start=\"1026\" data-end=\"1064\"><strong data-start=\"1030\" data-end=\"1064\">Brilantn&eacute; osvetlenie PrismSync</strong></h3>\r\n<ul data-start=\"1065\" data-end=\"1254\">\r\n<li data-start=\"1065\" data-end=\"1115\">\r\n<p data-start=\"1067\" data-end=\"1115\">Tri osvetlen&eacute; z&oacute;ny s <strong data-start=\"1088\" data-end=\"1112\">16,8 mili&oacute;nmi farieb</strong>.</p>\r\n</li>\r\n<li data-start=\"1116\" data-end=\"1169\">\r\n<p data-start=\"1118\" data-end=\"1169\">Synchroniz&aacute;cia s ostatn&yacute;mi produktmi SteelSeries.</p>\r\n</li>\r\n<li data-start=\"1170\" data-end=\"1254\">\r\n<p data-start=\"1172\" data-end=\"1254\">Podpora efektov od reakt&iacute;vneho osvetlenia po interakt&iacute;vne sveteln&eacute; predstavenia.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1256\" data-end=\"1259\" />\r\n<h3 data-start=\"1261\" data-end=\"1294\"><strong data-start=\"1265\" data-end=\"1294\">Vzduchov&yacute; senzor TrueMove</strong></h3>\r\n<ul data-start=\"1295\" data-end=\"1488\">\r\n<li data-start=\"1295\" data-end=\"1341\">\r\n<p data-start=\"1297\" data-end=\"1341\">Sledovanie 1:1 pre <strong data-start=\"1316\" data-end=\"1338\">maxim&aacute;lnu presnosť</strong>.</p>\r\n</li>\r\n<li data-start=\"1342\" data-end=\"1421\">\r\n<p data-start=\"1344\" data-end=\"1421\">Parametre: <strong data-start=\"1355\" data-end=\"1394\">18 000 CPI, 400 IPS, 40G zr&yacute;chlenie</strong> a sledovanie naklonenia.</p>\r\n</li>\r\n<li data-start=\"1422\" data-end=\"1488\">\r\n<p data-start=\"1424\" data-end=\"1488\">My&scaron; sa st&aacute;va predĺžen&iacute;m va&scaron;ej ruky pre dominantn&yacute; v&yacute;kon v hre.</p>\r\n</li>\r\n</ul>', 0),
(94, 'JBL Quantum 810 Black slúchadlá', 129, 'Zvuk predstavuje prežitie Je čas postúpiť na vyššiu úroveň so slúchadlami JBL Quantum 810 Wireless s Hi-Res certifikovaným zvukom JBL QuantumSOUND, vďaka ktorému sú aj tie najmenšie zvukové detaily krištáľovo čisté a zvukom JBL QuantumSURROUND, čo je najlepší priestorový zvuk pre hranie s technológiou DTS Headphone:X verzie 2.0. * Aktívne potlačenie hlukuSystém aktívneho potlačenia hluku JBL Quantum 810 Wireless, navrhnutý pre herné prostredie.', 'http://localhost/GameSpace/img/user/product_696a3367c5968.jpg', '2026-01-16 12:47:35', '2026-01-16 12:47:35', 'JBL Quantum 810', '2025-06-04', 'jbl-quantum-810-black-slúchadlá', '<h3 data-start=\"164\" data-end=\"193\"><strong data-start=\"168\" data-end=\"193\">Zvuk, ktor&yacute; rozhoduje</strong></h3>\r\n<ul data-start=\"194\" data-end=\"401\">\r\n<li data-start=\"194\" data-end=\"278\">\r\n<p data-start=\"196\" data-end=\"278\"><strong data-start=\"196\" data-end=\"242\">Hi-Res certifikovan&yacute; zvuk JBL QuantumSOUND</strong> prin&aacute;&scaron;a kri&scaron;t&aacute;ľovo čist&eacute; detaily.</p>\r\n</li>\r\n<li data-start=\"279\" data-end=\"401\">\r\n<p data-start=\"281\" data-end=\"401\"><strong data-start=\"281\" data-end=\"327\">JBL QuantumSURROUND + DTS Headphone:X v2.0</strong> poskytuje &scaron;pičkov&yacute; priestorov&yacute; 3D zvuk, ktor&yacute; v&aacute;s &uacute;plne vtiahne do hry.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"403\" data-end=\"406\" />\r\n<h3 data-start=\"408\" data-end=\"446\"><strong data-start=\"412\" data-end=\"446\">Akt&iacute;vne potlačenie hluku (ANC)</strong></h3>\r\n<ul data-start=\"447\" data-end=\"538\">\r\n<li data-start=\"447\" data-end=\"484\">\r\n<p data-start=\"449\" data-end=\"484\">Eliminujte ru&scaron;iv&eacute; zvuky z okolia.</p>\r\n</li>\r\n<li data-start=\"485\" data-end=\"538\">\r\n<p data-start=\"487\" data-end=\"538\">Plne sa s&uacute;streďte na svoju hru bez rozptyľovania.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"540\" data-end=\"543\" />\r\n<h3 data-start=\"545\" data-end=\"576\"><strong data-start=\"549\" data-end=\"576\">Du&aacute;lny priestorov&yacute; zvuk</strong></h3>\r\n<ul data-start=\"577\" data-end=\"711\">\r\n<li data-start=\"577\" data-end=\"618\">\r\n<p data-start=\"579\" data-end=\"618\">Viackan&aacute;lov&yacute; 3D zvuk v&scaron;ade okolo v&aacute;s.</p>\r\n</li>\r\n<li data-start=\"619\" data-end=\"711\">\r\n<p data-start=\"621\" data-end=\"711\">Umožňuje presne lokalizovať každ&yacute; zvuk &ndash; od nepriateľsk&yacute;ch krokov po vzdialen&eacute; expl&oacute;zie.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"713\" data-end=\"716\" />\r\n<h3 data-start=\"718\" data-end=\"761\"><strong data-start=\"722\" data-end=\"761\">Dlh&aacute; v&yacute;drž a nab&iacute;janie počas hrania</strong></h3>\r\n<ul data-start=\"762\" data-end=\"870\">\r\n<li data-start=\"762\" data-end=\"797\">\r\n<p data-start=\"764\" data-end=\"797\">Bat&eacute;ria vydrž&iacute; až <strong data-start=\"782\" data-end=\"794\">30 hod&iacute;n</strong>.</p>\r\n</li>\r\n<li data-start=\"798\" data-end=\"870\">\r\n<p data-start=\"800\" data-end=\"870\">Hrajte a nab&iacute;jajte s&uacute;časne &ndash; sl&uacute;chadl&aacute; v&aacute;s nikdy nenechaj&uacute; v &scaron;tichu.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"872\" data-end=\"875\" />\r\n<h3 data-start=\"877\" data-end=\"905\"><strong data-start=\"881\" data-end=\"905\">Presn&yacute; zvukov&yacute; v&yacute;kon</strong></h3>\r\n<ul data-start=\"906\" data-end=\"1056\">\r\n<li data-start=\"906\" data-end=\"983\">\r\n<p data-start=\"908\" data-end=\"983\">50 mm meniče s vysok&yacute;m rozl&iacute;&scaron;en&iacute;m zachytia <strong data-start=\"951\" data-end=\"980\">najmen&scaron;ie zvukov&eacute; detaily</strong>.</p>\r\n</li>\r\n<li data-start=\"984\" data-end=\"1056\">\r\n<p data-start=\"986\" data-end=\"1056\">Dokonal&aacute; presnosť pre hern&eacute; situ&aacute;cie, kde <strong data-start=\"1028\" data-end=\"1053\">zvuk znamen&aacute; prežitie</strong>.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1058\" data-end=\"1061\" />\r\n<h3 data-start=\"1063\" data-end=\"1092\"><strong data-start=\"1067\" data-end=\"1092\">Hern&yacute; chat a mikrof&oacute;n</strong></h3>\r\n<ul data-start=\"1093\" data-end=\"1284\">\r\n<li data-start=\"1093\" data-end=\"1192\">\r\n<p data-start=\"1095\" data-end=\"1192\"><strong data-start=\"1095\" data-end=\"1141\">Samostatn&yacute; ovl&aacute;dač s certifik&aacute;ciou Discord</strong> umožňuje nastaviť vyv&aacute;ženie medzi hrou a chatom.</p>\r\n</li>\r\n<li data-start=\"1193\" data-end=\"1284\">\r\n<p data-start=\"1195\" data-end=\"1284\"><strong data-start=\"1195\" data-end=\"1225\">Vykl&aacute;pac&iacute; smerov&yacute; mikrof&oacute;n</strong> s potlačen&iacute;m ozveny zabezpeč&iacute; jasn&uacute; komunik&aacute;ciu s t&iacute;mom.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1286\" data-end=\"1289\" />\r\n<h3 data-start=\"1291\" data-end=\"1323\"><strong data-start=\"1295\" data-end=\"1323\">Odoln&yacute; a pohodln&yacute; dizajn</strong></h3>\r\n<ul data-start=\"1324\" data-end=\"1470\">\r\n<li data-start=\"1324\" data-end=\"1422\">\r\n<p data-start=\"1326\" data-end=\"1422\">Ľahk&aacute;, odoln&aacute; čelenka a <strong data-start=\"1350\" data-end=\"1396\">kožou potiahnut&eacute; n&aacute;u&scaron;n&iacute;ky z pam&auml;ťovej peny</strong> pre maxim&aacute;lne pohodlie.</p>\r\n</li>\r\n<li data-start=\"1423\" data-end=\"1470\">\r\n<p data-start=\"1425\" data-end=\"1470\">Navrhnut&eacute; pre dlh&eacute; hern&eacute; sedenia bez &uacute;navy.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1472\" data-end=\"1475\" />\r\n<h3 data-start=\"1477\" data-end=\"1498\"><strong data-start=\"1481\" data-end=\"1498\">Kompatibilita</strong></h3>\r\n<ul data-start=\"1499\" data-end=\"1790\">\r\n<li data-start=\"1499\" data-end=\"1574\">\r\n<p data-start=\"1501\" data-end=\"1574\">Bezdr&ocirc;tovo (2,4 GHz) kompatibiln&eacute; s <strong data-start=\"1537\" data-end=\"1571\">PC, PS5, PS4 a Nintendo Switch</strong>.</p>\r\n</li>\r\n<li data-start=\"1575\" data-end=\"1649\">\r\n<p data-start=\"1577\" data-end=\"1649\">Bluetooth 5.2 pre pripojenie k mobilom, tabletom a ďal&scaron;&iacute;m zariadeniam.</p>\r\n</li>\r\n<li data-start=\"1650\" data-end=\"1736\">\r\n<p data-start=\"1652\" data-end=\"1736\">K dispoz&iacute;cii aj <strong data-start=\"1668\" data-end=\"1689\">3,5 mm audio jack</strong> pre PC, PlayStation, Xbox, Switch, Mac a VR.</p>\r\n</li>\r\n<li data-start=\"1737\" data-end=\"1790\">\r\n<p data-start=\"1739\" data-end=\"1790\">Funkcie <strong data-start=\"1747\" data-end=\"1768\">JBL QuantumENGINE</strong> dostupn&eacute; len na PC.</p>\r\n</li>\r\n</ul>', 0),
(95, 'Nintendo Switch 2', 461.95, 'Herná konzola Nintendo Switch 2 prichádza s prepracovanými Joy-Con ovládačmi,', 'http://localhost/GameSpace/img/user/product_696a355a29880.webp', '2026-01-16 12:55:54', '2026-01-16 12:55:54', 'Nintendo Switch 2', '2025-02-05', 'nintendo-switch-2', '<h3 data-start=\"144\" data-end=\"173\"><strong data-start=\"148\" data-end=\"173\">Revolučn&yacute; hern&yacute; v&yacute;kon</strong></h3>\r\n<ul data-start=\"174\" data-end=\"311\">\r\n<li data-start=\"174\" data-end=\"244\">\r\n<p data-start=\"176\" data-end=\"244\">Hybridn&aacute; konzola s e&scaron;te v&auml;č&scaron;&iacute;m v&yacute;konom a <strong data-start=\"217\" data-end=\"241\">ohromuj&uacute;cou grafikou</strong>.</p>\r\n</li>\r\n<li data-start=\"245\" data-end=\"311\">\r\n<p data-start=\"247\" data-end=\"311\">Elegantn&yacute; a kompaktn&yacute; dizajn, ktor&yacute; si m&ocirc;žete vziať kamkoľvek.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"313\" data-end=\"316\" />\r\n<h3 data-start=\"318\" data-end=\"352\"><strong data-start=\"322\" data-end=\"352\">Displej a vizu&aacute;lny z&aacute;žitok</strong></h3>\r\n<ul data-start=\"353\" data-end=\"561\">\r\n<li data-start=\"353\" data-end=\"419\">\r\n<p data-start=\"355\" data-end=\"419\">V&auml;č&scaron;&iacute; <strong data-start=\"361\" data-end=\"378\">1080p displej</strong> pre pohlcuj&uacute;ce hranie v handheld m&oacute;de.</p>\r\n</li>\r\n<li data-start=\"420\" data-end=\"477\">\r\n<p data-start=\"422\" data-end=\"477\">Podpora <strong data-start=\"430\" data-end=\"447\">4K rozl&iacute;&scaron;enia</strong> pri pripojen&iacute; k telev&iacute;zoru.</p>\r\n</li>\r\n<li data-start=\"478\" data-end=\"561\">\r\n<p data-start=\"480\" data-end=\"561\">Technol&oacute;gia <strong data-start=\"492\" data-end=\"517\">HDR, VRR a až 120 FPS</strong> pre živ&eacute; farby, ostrosť a plynul&eacute; hranie.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"563\" data-end=\"566\" />\r\n<h3 data-start=\"568\" data-end=\"601\"><strong data-start=\"572\" data-end=\"601\">&Uacute;ložisko a roz&scaron;&iacute;riteľnosť</strong></h3>\r\n<ul data-start=\"602\" data-end=\"720\">\r\n<li data-start=\"602\" data-end=\"661\">\r\n<p data-start=\"604\" data-end=\"661\"><strong data-start=\"604\" data-end=\"631\">256 GB intern&eacute; &uacute;ložisko</strong> pre hry, d&aacute;ta a multim&eacute;di&aacute;.</p>\r\n</li>\r\n<li data-start=\"662\" data-end=\"720\">\r\n<p data-start=\"664\" data-end=\"720\">Možnosť roz&scaron;&iacute;renia pomocou <strong data-start=\"691\" data-end=\"717\">microSD Express kariet</strong>.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"722\" data-end=\"725\" />\r\n<h3 data-start=\"727\" data-end=\"764\"><strong data-start=\"731\" data-end=\"764\">Inovat&iacute;vne ovl&aacute;dače Joy-Con 2</strong></h3>\r\n<ul data-start=\"765\" data-end=\"958\">\r\n<li data-start=\"765\" data-end=\"869\">\r\n<p data-start=\"767\" data-end=\"869\">Prepracovan&eacute; ovl&aacute;dače, ktor&eacute; umožňuj&uacute; <strong data-start=\"805\" data-end=\"828\">nov&eacute; sp&ocirc;soby hrania</strong>, vr&aacute;tane ovl&aacute;dania dvoch my&scaron;&iacute; s&uacute;časne.</p>\r\n</li>\r\n<li data-start=\"870\" data-end=\"958\">\r\n<p data-start=\"872\" data-end=\"958\">Povrchy ovl&aacute;dačov m&ocirc;žu sl&uacute;žiť ako <strong data-start=\"906\" data-end=\"926\">podložka pod my&scaron;</strong> pre e&scaron;te presnej&scaron;iu kontrolu.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"960\" data-end=\"963\" />\r\n<h3 data-start=\"965\" data-end=\"992\"><strong data-start=\"969\" data-end=\"992\">Nov&eacute; hern&eacute; možnosti</strong></h3>\r\n<p>&nbsp;</p>\r\n<ul data-start=\"993\" data-end=\"1087\">\r\n<li data-start=\"993\" data-end=\"1087\">\r\n<p data-start=\"995\" data-end=\"1087\">Konzola podporuje <strong data-start=\"1013\" data-end=\"1054\">nov&eacute; interakt&iacute;vne funkcie a ovl&aacute;danie</strong>, ktor&eacute; zvy&scaron;uj&uacute; z&aacute;žitok z hier.</p>\r\n</li>\r\n</ul>', 0),
(96, 'Xbox Wireless Controller Shock Blue', 60.9, 'Gamepad pre PC, Xbox Series X|S, Xbox One, Mobilný telefón a Tablet, kompatibilný so systémom Android, Windows 10, bezdrôtové pripojenie, 3.5 mm Jack (na ovládači), USB-C (na ovládači), AA batéria, vibrácie, analógové páčky, modrá farba, – pre PC, Xbox Series X|S, Xbox One, Mobilný telefón a Tablet, kompatibilný so systémom Android, Windows 10, bezdrôtové pripojenie, 3,5mm Jack (na ovládači), USB-C (na ovládači), AA batéria, vibrácie, analógové páčky, modrá farba', 'http://localhost/GameSpace/img/user/slideshow_696a3614c1ea4.jpg', '2026-01-16 12:58:15', '2026-01-16 12:59:00', 'Xbox Wireless Controller Shock Blue', '2024-02-07', 'xbox-wireless-controller-shock-blue', '<h3 data-start=\"157\" data-end=\"192\"><strong data-start=\"161\" data-end=\"192\">Vylep&scaron;en&yacute; dizajn a pohodlie</strong></h3>\r\n<ul data-start=\"193\" data-end=\"342\">\r\n<li data-start=\"193\" data-end=\"253\">\r\n<p data-start=\"195\" data-end=\"253\">Ergonomick&eacute; <strong data-start=\"207\" data-end=\"229\">zaoblenie ovl&aacute;dača</strong> pre lep&scaron;ie uchopenie.</p>\r\n</li>\r\n<li data-start=\"254\" data-end=\"342\">\r\n<p data-start=\"256\" data-end=\"342\"><strong data-start=\"256\" data-end=\"289\">Text&uacute;rovan&eacute; sp&uacute;&scaron;te a tlačidl&aacute;</strong> zaisťuj&uacute; ist&yacute; a pohodln&yacute; &uacute;chop aj pri dlhom hran&iacute;.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"344\" data-end=\"347\" />\r\n<h3 data-start=\"349\" data-end=\"373\"><strong data-start=\"353\" data-end=\"373\">Presn&eacute; ovl&aacute;danie</strong></h3>\r\n<ul data-start=\"374\" data-end=\"530\">\r\n<li data-start=\"374\" data-end=\"459\">\r\n<p data-start=\"376\" data-end=\"459\"><strong data-start=\"376\" data-end=\"404\">Hybridn&yacute; smerov&yacute; ovl&aacute;dač</strong> umožňuje r&yacute;chle a presn&eacute; pohyby vo v&scaron;etk&yacute;ch smeroch.</p>\r\n</li>\r\n<li data-start=\"460\" data-end=\"530\">\r\n<p data-start=\"462\" data-end=\"530\">Ide&aacute;lne pre akčn&eacute; a kompetit&iacute;vne hry, kde z&aacute;lež&iacute; na každom pohybe.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"532\" data-end=\"535\" />\r\n<h3 data-start=\"537\" data-end=\"559\"><strong data-start=\"541\" data-end=\"559\">Tlačidlo Share</strong></h3>\r\n<ul data-start=\"560\" data-end=\"661\">\r\n<li data-start=\"560\" data-end=\"661\">\r\n<p data-start=\"562\" data-end=\"661\">Dedikovan&eacute; tlačidlo pre <strong data-start=\"586\" data-end=\"627\">jednoduch&eacute; zdieľanie hern&yacute;ch momentov</strong> so spoluhr&aacute;čmi alebo fan&uacute;&scaron;ikmi.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"663\" data-end=\"666\" />\r\n<h3 data-start=\"668\" data-end=\"703\"><strong data-start=\"672\" data-end=\"703\">Kompatibilita a konektivita</strong></h3>\r\n<p>&nbsp;</p>\r\n<ul data-start=\"704\" data-end=\"902\">\r\n<li data-start=\"704\" data-end=\"810\">\r\n<p data-start=\"706\" data-end=\"810\">Podpora <strong data-start=\"714\" data-end=\"738\">Bluetooth LE a USB-C</strong> pre pripojenie k Xbox Series X|S, Xbox One, PC a Android zariadeniam.</p>\r\n</li>\r\n<li data-start=\"811\" data-end=\"902\">\r\n<p data-start=\"813\" data-end=\"902\">Možnosť nap&aacute;jania pomocou <strong data-start=\"839\" data-end=\"853\">AA bat&eacute;ri&iacute;</strong> alebo voliteľn&eacute;ho <strong data-start=\"872\" data-end=\"899\">dob&iacute;jacieho akumul&aacute;tora</strong>.</p>\r\n</li>\r\n</ul>', 0),
(97, 'PlayStation 5 DualSense Wireless Controller – White', 79.9, 'Gamepad pre PS5, bezdrôtové pripojenie, 3.5 mm Jack (na ovládači), USB-C (na ovládači), integrovaná batéria, vibrácie, podsvietenie, analógové páčky, reproduktor, mikrofón, haptická odozva, biela farba, – pre PS5, bezdrôtový, dotykový panel so svetelnou lištou po stranách, ergonomický dizajn, tlačidlo Create, vstavaný reproduktor a mikrofón, haptická odozva, adaptívne triggery. gyroskop a akcelerometer', 'http://localhost/GameSpace/img/user/product_696a3683c0bb0.webp', '2026-01-16 13:00:51', '2026-01-16 13:00:51', 'PlayStation 5 DualSense', '2025-06-09', 'playstation-5-dualsense-wireless-controller-–-white', '<h3 data-start=\"164\" data-end=\"195\"><strong data-start=\"168\" data-end=\"195\">Nov&aacute; gener&aacute;cia ovl&aacute;dača</strong></h3>\r\n<ul data-start=\"196\" data-end=\"429\">\r\n<li data-start=\"196\" data-end=\"284\">\r\n<p data-start=\"198\" data-end=\"284\">Navrhnut&yacute; pre <strong data-start=\"212\" data-end=\"229\">PlayStation 5</strong>, s modern&yacute;mi funkciami, ktor&eacute; zvy&scaron;uj&uacute; hern&yacute; z&aacute;žitok.</p>\r\n</li>\r\n<li data-start=\"285\" data-end=\"429\">\r\n<p data-start=\"287\" data-end=\"429\">Zachov&aacute;va tradičn&eacute; rozloženie tlačidiel, no prin&aacute;&scaron;a <strong data-start=\"339\" data-end=\"358\">haptick&uacute; odozvu</strong> a <strong data-start=\"361\" data-end=\"389\">adapt&iacute;vne triggery L2/R2</strong> pre realistickej&scaron;ie pocity pri hran&iacute;.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"431\" data-end=\"434\" />\r\n<h3 data-start=\"436\" data-end=\"480\"><strong data-start=\"440\" data-end=\"480\">Vstavan&eacute; zvukov&eacute; a komunikačn&eacute; prvky</strong></h3>\r\n<ul data-start=\"481\" data-end=\"639\">\r\n<li data-start=\"481\" data-end=\"546\">\r\n<p data-start=\"483\" data-end=\"546\">Integrovan&yacute; <strong data-start=\"495\" data-end=\"510\">reproduktor</strong> poskytuje zvuk priamo z ovl&aacute;dača.</p>\r\n</li>\r\n<li data-start=\"547\" data-end=\"639\">\r\n<p data-start=\"549\" data-end=\"639\"><strong data-start=\"549\" data-end=\"570\">Vstavan&yacute; mikrof&oacute;n</strong> umožňuje okamžit&uacute; komunik&aacute;ciu so spoluhr&aacute;čmi bez potreby headsetu.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"641\" data-end=\"644\" />\r\n<h3 data-start=\"646\" data-end=\"683\"><strong data-start=\"650\" data-end=\"683\">Intuit&iacute;vne pohybov&eacute; ovl&aacute;danie</strong></h3>\r\n<ul data-start=\"684\" data-end=\"767\">\r\n<li data-start=\"684\" data-end=\"767\">\r\n<p data-start=\"686\" data-end=\"767\"><strong data-start=\"686\" data-end=\"714\">Akcelerometer a gyroskop</strong> umožňuj&uacute; pohybov&eacute; ovl&aacute;danie v podporovan&yacute;ch hr&aacute;ch.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"769\" data-end=\"772\" />\r\n<h3 data-start=\"774\" data-end=\"802\"><strong data-start=\"778\" data-end=\"802\">Jednoduch&eacute; nab&iacute;janie</strong></h3>\r\n<p>&nbsp;</p>\r\n<ul data-start=\"803\" data-end=\"867\">\r\n<li data-start=\"803\" data-end=\"867\">\r\n<p data-start=\"805\" data-end=\"867\">Bat&eacute;ria sa nab&iacute;ja cez <strong data-start=\"827\" data-end=\"836\">USB-C</strong>, takže je r&yacute;chle a pohodln&eacute;.</p>\r\n</li>\r\n</ul>', 0),
(98, 'Nintendo Switch Pro Controller', 66.9, 'Gamepad pre Nintendo Switch, kompatibilný so systémom Android, Windows 10, bezdrôtové pripojenie, USB-C, vibrácie, analógové páčky, reproduktor, čierna farba, – pre Nintendo Switch, kompatibilný so systémom Android, Windows 10, bezdrôtové pripojenie, USB-C, vibrácie, analógové páčky, reproduktor, čierna farba', 'http://localhost/GameSpace/img/user/product_696a36f83a405.webp', '2026-01-16 13:02:48', '2026-01-16 13:02:48', 'Nintendo Switch Pro Controller', '2025-10-15', 'nintendo-switch-pro-controller', '<h3 data-start=\"145\" data-end=\"189\"><strong data-start=\"149\" data-end=\"189\">Pr&eacute;miov&yacute; ovl&aacute;dač pre pohodln&eacute; hranie</strong></h3>\r\n<ul data-start=\"190\" data-end=\"415\">\r\n<li data-start=\"190\" data-end=\"342\">\r\n<p data-start=\"192\" data-end=\"342\">Ovl&aacute;dač m&aacute; rovnak&eacute; tlačidl&aacute; ako Nintendo Switch v handheld m&oacute;de, ale <strong data-start=\"261\" data-end=\"281\">ergonomick&yacute; tvar</strong> zaisťuje lep&scaron;ie uchopenie a pohodlie než Joy-Con ovl&aacute;dače.</p>\r\n</li>\r\n<li data-start=\"343\" data-end=\"415\">\r\n<p data-start=\"345\" data-end=\"415\">Tradičn&aacute; <strong data-start=\"354\" data-end=\"380\">D-pad ovl&aacute;dacia plocha</strong> umožňuje presn&eacute; a r&yacute;chle pohyby.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"417\" data-end=\"420\" />\r\n<h3 data-start=\"422\" data-end=\"459\"><strong data-start=\"426\" data-end=\"459\">Vylep&scaron;en&eacute; ovl&aacute;danie a haptika</strong></h3>\r\n<ul data-start=\"460\" data-end=\"652\">\r\n<li data-start=\"460\" data-end=\"569\">\r\n<p data-start=\"462\" data-end=\"569\">Dvojica <strong data-start=\"470\" data-end=\"507\">line&aacute;rnych rezonančn&yacute;ch sp&uacute;&scaron;ťačov</strong> s HD vibr&aacute;ciami pre realistick&yacute; a pohlcuj&uacute;ci hern&yacute; z&aacute;žitok.</p>\r\n</li>\r\n<li data-start=\"570\" data-end=\"652\">\r\n<p data-start=\"572\" data-end=\"652\">Funkcia HD vibr&aacute;ci&iacute; dopĺňa vizu&aacute;lne a zvukov&eacute; efekty hry, č&iacute;m zvy&scaron;uje imerziu.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"654\" data-end=\"657\" />\r\n<h3 data-start=\"659\" data-end=\"686\"><strong data-start=\"663\" data-end=\"686\">Modern&aacute; konektivita</strong></h3>\r\n<ul data-start=\"687\" data-end=\"823\">\r\n<li data-start=\"687\" data-end=\"755\">\r\n<p data-start=\"689\" data-end=\"755\">USB-C k&aacute;bel umožňuje jednoduch&eacute; nab&iacute;janie a stabiln&eacute; pripojenie.</p>\r\n</li>\r\n<li data-start=\"756\" data-end=\"823\">\r\n<p data-start=\"758\" data-end=\"823\">Zabudovan&aacute; <strong data-start=\"769\" data-end=\"783\">NFC pl&ocirc;&scaron;ka</strong> pre využitie amiibo fig&uacute;rok a kariet.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"825\" data-end=\"828\" />\r\n<h3 data-start=\"830\" data-end=\"854\"><strong data-start=\"834\" data-end=\"854\">Pr&eacute;miov&aacute; kvalita</strong></h3>\r\n<p>&nbsp;</p>\r\n<ul data-start=\"855\" data-end=\"973\">\r\n<li data-start=\"855\" data-end=\"923\">\r\n<p data-start=\"857\" data-end=\"923\">Navrhnut&yacute; pre <strong data-start=\"871\" data-end=\"898\">dlhodob&eacute; hern&eacute; marat&oacute;ny</strong> s vysokou životnosťou.</p>\r\n</li>\r\n<li data-start=\"924\" data-end=\"973\">\r\n<p data-start=\"926\" data-end=\"973\">Optimalizovan&yacute; &scaron;peci&aacute;lne pre Nintendo Switch.</p>\r\n</li>\r\n</ul>', 0),
(99, 'GameSir Nova Lite Multiplatform Gaming Controller Space Purple', 32.9, 'Gamepad pre PC, Nintendo Switch, Mobilný telefón a Nintendo Switch 2, kompatibilný so systémom Android, iOS, Windows 10, bezdrôtové pripojenie, integrovaná batéria, vibrácie, analógové páčky, modrá farba,', 'http://localhost/GameSpace/img/user/slideshow_696a379c0148b.webp', '2026-01-16 13:04:55', '2026-01-16 13:05:32', 'GameSir Nova Lite ', '2025-01-07', 'gamesir-nova-lite-multiplatform-gaming-controller-space-purple', '<h3 data-start=\"166\" data-end=\"194\"><strong data-start=\"170\" data-end=\"194\">Hrajte bez obmedzen&iacute;</strong></h3>\r\n<ul data-start=\"195\" data-end=\"395\">\r\n<li data-start=\"195\" data-end=\"338\">\r\n<p data-start=\"197\" data-end=\"338\">Bezdr&ocirc;tov&eacute; pripojenie v&aacute;m umožn&iacute; &uacute;pln&uacute; voľnosť pohybu pri hran&iacute; na <strong data-start=\"264\" data-end=\"335\">PC, Nintendo Switch, Nintendo Switch 2 alebo mobiln&yacute;ch zariadeniach</strong>.</p>\r\n</li>\r\n<li data-start=\"339\" data-end=\"395\">\r\n<p data-start=\"341\" data-end=\"395\">Už žiadne obmedzenia k&aacute;blami &ndash; &uacute;pln&aacute; sloboda pohybu.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"397\" data-end=\"400\" />\r\n<h3 data-start=\"402\" data-end=\"448\"><strong data-start=\"406\" data-end=\"448\">Intuit&iacute;vne ovl&aacute;danie a plynul&eacute; reakcie</strong></h3>\r\n<ul data-start=\"449\" data-end=\"592\">\r\n<li data-start=\"449\" data-end=\"535\">\r\n<p data-start=\"451\" data-end=\"535\"><strong data-start=\"451\" data-end=\"470\">Anal&oacute;gov&eacute; p&aacute;čky</strong> pre presn&eacute; ovl&aacute;danie vozidiel, pohybov post&aacute;v a hern&yacute;ch akci&iacute;.</p>\r\n</li>\r\n<li data-start=\"536\" data-end=\"592\">\r\n<p data-start=\"538\" data-end=\"592\"><strong data-start=\"538\" data-end=\"550\">Vibr&aacute;cie</strong> pre realistick&uacute; sp&auml;tn&uacute; v&auml;zbu počas hry.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"594\" data-end=\"597\" />\r\n<h3 data-start=\"599\" data-end=\"634\"><strong data-start=\"603\" data-end=\"634\">Ergonomick&yacute; a odoln&yacute; dizajn</strong></h3>\r\n<ul data-start=\"635\" data-end=\"809\">\r\n<li data-start=\"635\" data-end=\"723\">\r\n<p data-start=\"637\" data-end=\"723\">Ovl&aacute;dač v&aacute;ži len <strong data-start=\"654\" data-end=\"663\">400 g</strong>, takže sa pohodlne drž&iacute; aj pri dlh&yacute;ch hern&yacute;ch marat&oacute;noch.</p>\r\n</li>\r\n<li data-start=\"724\" data-end=\"809\">\r\n<p data-start=\"726\" data-end=\"809\"><strong data-start=\"726\" data-end=\"744\">Odoln&eacute; sp&iacute;nače</strong> a pr&eacute;miov&eacute; spracovanie zaručuj&uacute; dlh&uacute; životnosť a spoľahlivosť.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"811\" data-end=\"814\" />\r\n<h3 data-start=\"816\" data-end=\"838\"><strong data-start=\"820\" data-end=\"838\">Modern&yacute; vzhľad</strong></h3>\r\n<p>&nbsp;</p>\r\n<ul data-start=\"839\" data-end=\"925\">\r\n<li data-start=\"839\" data-end=\"925\">\r\n<p data-start=\"841\" data-end=\"925\">Origin&aacute;lna <strong data-start=\"852\" data-end=\"874\">Space Purple farba</strong> a osobit&eacute; vyhotovenie pre &scaron;t&yacute;lov&yacute; hern&yacute; z&aacute;žitok.</p>\r\n</li>\r\n</ul>', 0),
(100, 'Sony PS4 Dualshock 4 V2 – Black', 79.9, 'Gamepad pre PS4, bezdrôtové pripojenie, 3.5 mm Jack (na ovládači), Micro USB (na ovládači), integrovaná batéria, vibrácie, podsvietenie, analógové páčky, reproduktor, čierna farba, – bezdrôtový, dotykový panel so svetelnou lištou, ergonomický dizajn, tlačidlo Share, vstavaný reproduktor, 3.5mm stereofónny konektor, gyroskop a akcelerometer', 'http://localhost/GameSpace/img/user/product_696a381672293.webp', '2026-01-16 13:07:34', '2026-01-16 15:42:54', 'Sony PS4 Dualshock 4 V2 – Black', '2025-06-04', 'sony-ps4-dualshock-4-v2-–-black', '<h3 data-start=\"148\" data-end=\"183\"><strong data-start=\"152\" data-end=\"183\">Ergonomick&yacute; a odoln&yacute; dizajn</strong></h3>\r\n<ul data-start=\"184\" data-end=\"365\">\r\n<li data-start=\"184\" data-end=\"281\">\r\n<p data-start=\"186\" data-end=\"281\">Pr&eacute;miov&eacute; materi&aacute;ly zaručuj&uacute; <strong data-start=\"214\" data-end=\"235\">dlhodob&uacute; odolnosť</strong> proti nečistot&aacute;m a intenz&iacute;vnemu použ&iacute;vaniu.</p>\r\n</li>\r\n<li data-start=\"282\" data-end=\"365\">\r\n<p data-start=\"284\" data-end=\"365\">Ergonomick&yacute; tvar p&aacute;čok a tlačidiel <strong data-start=\"319\" data-end=\"343\">skvele padne do ruky</strong> aj pri dlhom hran&iacute;.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"367\" data-end=\"370\" />\r\n<h3 data-start=\"372\" data-end=\"409\"><strong data-start=\"376\" data-end=\"409\">Intuit&iacute;vne a presn&eacute; ovl&aacute;danie</strong></h3>\r\n<ul data-start=\"410\" data-end=\"626\">\r\n<li data-start=\"410\" data-end=\"473\">\r\n<p data-start=\"412\" data-end=\"473\"><strong data-start=\"412\" data-end=\"440\">Gyroskop a akcelerometer</strong> presne sn&iacute;maj&uacute; pohyb ovl&aacute;dača.</p>\r\n</li>\r\n<li data-start=\"474\" data-end=\"552\">\r\n<p data-start=\"476\" data-end=\"552\"><strong data-start=\"476\" data-end=\"498\">Vylep&scaron;en&yacute; touchpad</strong> umožňuje intuit&iacute;vnu kontrolu a nov&eacute; sp&ocirc;soby hrania.</p>\r\n</li>\r\n<li data-start=\"553\" data-end=\"626\">\r\n<p data-start=\"555\" data-end=\"626\"><strong data-start=\"555\" data-end=\"570\">HD vibr&aacute;cie</strong> poskytuj&uacute; realistick&uacute; sp&auml;tn&uacute; v&auml;zbu pre &uacute;pln&uacute; imerziu.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"628\" data-end=\"631\" />\r\n<h3 data-start=\"633\" data-end=\"662\"><strong data-start=\"637\" data-end=\"662\">Multimedi&aacute;lne funkcie</strong></h3>\r\n<ul data-start=\"663\" data-end=\"873\">\r\n<li data-start=\"663\" data-end=\"729\">\r\n<p data-start=\"665\" data-end=\"729\"><strong data-start=\"665\" data-end=\"692\">Integrovan&yacute; reproduktor</strong> pre hern&eacute; zvuky priamo z ovl&aacute;dača.</p>\r\n</li>\r\n<li data-start=\"730\" data-end=\"804\">\r\n<p data-start=\"732\" data-end=\"804\"><strong data-start=\"732\" data-end=\"750\">Sveteln&aacute; li&scaron;ta</strong> pre vizu&aacute;lnu sp&auml;tn&uacute; v&auml;zbu a multiplayer orient&aacute;ciu.</p>\r\n</li>\r\n<li data-start=\"805\" data-end=\"873\">\r\n<p data-start=\"807\" data-end=\"873\"><strong data-start=\"807\" data-end=\"828\">3,5 mm audio jack</strong> pre pripojenie headsetu priamo k gamepadu.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"875\" data-end=\"878\" />\r\n<h3 data-start=\"880\" data-end=\"904\"><strong data-start=\"884\" data-end=\"904\">Zdieľanie obsahu</strong></h3>\r\n<ul data-start=\"905\" data-end=\"1018\">\r\n<li data-start=\"905\" data-end=\"1018\">\r\n<p data-start=\"907\" data-end=\"1018\">Dedikovan&eacute; tlačidlo <strong data-start=\"927\" data-end=\"936\">Share</strong> umožňuje robiť sn&iacute;mky, nahr&aacute;vať video a <strong data-start=\"977\" data-end=\"995\">r&yacute;chlo zdieľať</strong> z&aacute;žitky s priateľmi.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1020\" data-end=\"1023\" />\r\n<h3 data-start=\"1025\" data-end=\"1066\"><strong data-start=\"1029\" data-end=\"1066\">Bezdr&ocirc;tov&eacute; pripojenie a nab&iacute;janie</strong></h3>\r\n<p>&nbsp;</p>\r\n<ul data-start=\"1067\" data-end=\"1174\">\r\n<li data-start=\"1067\" data-end=\"1109\">\r\n<p data-start=\"1069\" data-end=\"1109\">Vstavan&aacute; bat&eacute;ria poskytuje dlh&uacute; v&yacute;drž.</p>\r\n</li>\r\n<li data-start=\"1110\" data-end=\"1174\">\r\n<p data-start=\"1112\" data-end=\"1174\">Nab&iacute;janie cez <strong data-start=\"1126\" data-end=\"1138\">microUSB</strong> možno realizovať aj počas hrania.</p>\r\n</li>\r\n</ul>', 1),
(101, 'Steam peňaženka – 20€', 20, 'Dobíjacia karta – Steam Wallet. Kupón, vďaka ktorému môžete nakúpiť akékoľvek z tisícov hier, originálnych herných prídavkov, kreatívneho softvéru atď. Pomocou virtuálnej Steam peňaženky získate univerzálny kredit pre svoj účet bez nutnosti zadávať platobnú kartu.\r\nZobraziť celý popis', 'http://localhost/GameSpace/img/user/product_696a3b4de2274.jpg', '2026-01-16 13:21:17', '2026-01-16 13:21:17', 'Steam peňaženka – 20€', '2025-10-15', 'steam-peňaženka-–-20€', '<p data-start=\"157\" data-end=\"353\">Dobite si svoju <strong data-start=\"173\" data-end=\"192\">Steam peňaženku</strong> jednoducho a bez nutnosti zad&aacute;vať platobn&uacute; kartu. S touto darčekovou kartou z&iacute;skate 20 &euro; na n&aacute;kup hier, DLC alebo in&eacute;ho digit&aacute;lneho obsahu na platforme Steam.</p>\r\n<p data-start=\"355\" data-end=\"609\">Steam je digit&aacute;lna distribučn&aacute; platforma spoločnosti <strong data-start=\"408\" data-end=\"417\">Valve</strong>, ktor&aacute; umožňuje n&aacute;kup, sťahovanie hier a softv&eacute;ru, ako aj pr&iacute;stup k multiplayerov&yacute;m a komunikačn&yacute;m funkci&aacute;m pre hr&aacute;čov. Aplik&aacute;cia je dostupn&aacute; na každom poč&iacute;tači a kompletne v českom jazyku.</p>\r\n<hr data-start=\"611\" data-end=\"614\" />\r\n<h3 data-start=\"616\" data-end=\"642\"><strong data-start=\"620\" data-end=\"642\">Kľ&uacute;čov&eacute; vlastnosti</strong></h3>\r\n<ul data-start=\"643\" data-end=\"806\">\r\n<li data-start=\"643\" data-end=\"682\">\r\n<p data-start=\"645\" data-end=\"682\">Dob&iacute;jacia karta s hodnotou <strong data-start=\"672\" data-end=\"680\">20 &euro;</strong></p>\r\n</li>\r\n<li data-start=\"683\" data-end=\"719\">\r\n<p data-start=\"685\" data-end=\"719\"><strong data-start=\"685\" data-end=\"717\">Bez nutnosti platobnej karty</strong></p>\r\n</li>\r\n<li data-start=\"720\" data-end=\"772\">\r\n<p data-start=\"722\" data-end=\"772\">Použiteľn&aacute; na v&scaron;etky produkty dostupn&eacute; na Steame</p>\r\n</li>\r\n<li data-start=\"773\" data-end=\"806\">\r\n<p data-start=\"775\" data-end=\"806\">Steam aplik&aacute;cia <strong data-start=\"791\" data-end=\"804\">v če&scaron;tine</strong></p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"808\" data-end=\"811\" />\r\n<h3 data-start=\"813\" data-end=\"837\"><strong data-start=\"817\" data-end=\"837\">Ako uplatniť k&oacute;d</strong></h3>\r\n<ol data-start=\"838\" data-end=\"1027\">\r\n<li data-start=\"838\" data-end=\"927\">\r\n<p data-start=\"841\" data-end=\"927\">Spustite Steam a kliknite vľavo hore na <strong data-start=\"881\" data-end=\"925\">&bdquo;Hry &rarr; Uplatniť k&oacute;d pre Steam peňaženku&ldquo;</strong></p>\r\n</li>\r\n<li data-start=\"928\" data-end=\"947\">\r\n<p data-start=\"931\" data-end=\"947\">Vložte v&aacute;&scaron; k&oacute;d</p>\r\n</li>\r\n<li data-start=\"948\" data-end=\"975\">\r\n<p data-start=\"951\" data-end=\"975\">Vyplňte potrebn&eacute; &uacute;daje</p>\r\n</li>\r\n<li data-start=\"976\" data-end=\"1027\">\r\n<p data-start=\"979\" data-end=\"1027\">Potvrďte a peňaženka je pripraven&aacute; na použitie</p>\r\n</li>\r\n</ol>', 0),
(102, 'RAZER Goliathus Mobile', 5.99, 'Len 1,5 mm tenká podložka Razer Goliathus Mobile sa ľahko nosí so sebou kdekoľvek. Môžete ju bez problémov zrolovať a hodiť do batohu bez toho, aby ste sa báli, že ostane pokrútená. Vysoko jemná mikrovláknová väzba je navrhnutá špeciálne pre prácu s optickými aj laserovými myšami, čím vám poskytuje optimálny povrch pre turnajové potreby. Teraz dokonca aj tie najpresnejšie pohyby myši, ktoré urobíte, budú presne prenesené na obrazovke.', 'http://localhost/GameSpace/img/user/product_696a5ab607d13.jpg', '2026-01-16 15:35:18', '2026-01-16 15:35:18', 'RAZER Goliathus Mobile', '2025-10-15', 'razer-goliathus-mobile', '<p>Len 1,5 mm tenk&aacute; podložka Razer Goliathus Mobile sa ľahko nos&iacute; so sebou kdekoľvek. M&ocirc;žete ju bez probl&eacute;mov zrolovať a hodiť do batohu bez toho, aby ste sa b&aacute;li, že ostane pokr&uacute;ten&aacute;.</p>\r\n<p>Vysoko jemn&aacute; mikrovl&aacute;knov&aacute; v&auml;zba je navrhnut&aacute; &scaron;peci&aacute;lne pre pr&aacute;cu s optick&yacute;mi aj laserov&yacute;mi my&scaron;ami, č&iacute;m v&aacute;m poskytuje optim&aacute;lny povrch pre turnajov&eacute; potreby. Teraz dokonca aj tie najpresnej&scaron;ie pohyby my&scaron;i, ktor&eacute; urob&iacute;te, bud&uacute; presne prenesen&eacute; na obrazovke.</p>\r\n<ul>\r\n<li style=\"list-style-type: none;\">Tkanina navrhnut&aacute; pre kompromis medzi r&yacute;chlymi a presn&yacute;mi pohybmi my&scaron;ou.</li>\r\n<li style=\"list-style-type: none;\">Maxim&aacute;lne presn&eacute; cielenie a pohyb.</li>\r\n<li style=\"list-style-type: none;\">Optimalizovan&eacute; pre v&scaron;etky nastavenia citlivosti my&scaron;i a typy sn&iacute;mačov.</li>\r\n<li style=\"list-style-type: none;\">Prenosn&eacute; prevedenie.</li>\r\n<li style=\"list-style-type: none;\">Pogumovan&aacute; z&aacute;kladňa pre bezpečn&yacute; &uacute;chyt aj na hladk&yacute;ch povrchoch.\r\n<p>&nbsp;</p>\r\n</li>\r\n<li style=\"list-style-type: none;\">Rozmery:&nbsp;215 x 270 x 1,5 mm.</li>\r\n<li style=\"list-style-type: none;\">V&aacute;ha:&nbsp;52 g.</li>\r\n</ul>', 0),
(103, 'SteelSeries QcK+ Large', 16.5, 'SteelSeries QcK+ je podložka snov pre každého hráča, ktorý preferuje látkové povrchy. Predtým, než bola v novembri 2004 uvedená na trh, prešla táto podložka pod myš rozsiahlym testovaním hernými odborníkmi, a vďaka ich spätnej väzbe bola QcK+ ďalej vyvíjaná, vďaka čomu vznikla dokonalá látková podložka pre každého hráča. ', 'http://localhost/GameSpace/img/user/product_696a5afc38e62.jpg', '2026-01-16 15:36:28', '2026-01-16 15:36:28', 'SteelSeries QcK+ Large', '2024-02-22', 'steelseries-qck+-large', '<p>SteelSeries QcK+&nbsp;je podložka snov pre každ&eacute;ho hr&aacute;ča, ktor&yacute; preferuje l&aacute;tkov&eacute; povrchy. Predt&yacute;m, než bola v novembri 2004 uveden&aacute; na trh, pre&scaron;la t&aacute;to podložka pod my&scaron; rozsiahlym testovan&iacute;m hern&yacute;mi odborn&iacute;kmi, a vďaka ich sp&auml;tnej v&auml;zbe bola&nbsp;QcK+&nbsp;ďalej vyv&iacute;jan&aacute;, vďaka čomu vznikla dokonal&aacute; l&aacute;tkov&aacute; podložka pre každ&eacute;ho hr&aacute;ča.</p>\r\n<p>Vďaka použitiu vysoko kvalitnej tkaniny, optimalizovanej text&uacute;ry, ktor&aacute; zaručuje hladk&yacute; pohyb a osobitne navrhnutej proti&scaron;mykovej gumenej z&aacute;kladni vynik&aacute; t&aacute;to podložka nad konkurenciou a je skvelou voľbou nielen pre hardcore hr&aacute;čov, ale aj pre grafick&yacute;ch dizajn&eacute;rov a in&yacute;ch, ktor&iacute; použ&iacute;vaj&uacute; my&scaron; počas dlh&yacute;ch časov&yacute;ch intervalov.</p>\r\n<p>Vzhľadom k tomu, že&nbsp;QcK+&nbsp;je super veľk&aacute; podložka pod my&scaron;, je ide&aacute;lna pre hr&aacute;čov, ktor&iacute; použ&iacute;vaj&uacute; n&iacute;zku citlivosť, alebo vysok&eacute; rozl&iacute;&scaron;enie, alebo pre dizajn&eacute;rov, ktor&iacute; použ&iacute;vaj&uacute; dva, alebo viac monitorov.&nbsp;SteelSeries QcK+&nbsp;je kompatibiln&aacute; so v&scaron;etk&yacute;mi typmi my&scaron;&iacute; a je ide&aacute;lna aj pre začiatočn&iacute;kov.</p>\r\n<p><br /><br /></p>\r\n<ul>\r\n<li style=\"list-style-type: none;\">Nov&aacute; proti&scaron;mykov&aacute; spodn&aacute; vrstva.</li>\r\n<li style=\"list-style-type: none;\">Super trv&aacute;cna l&aacute;tkov&aacute; podložka.</li>\r\n<li style=\"list-style-type: none;\">Ide&aacute;lna pre my&scaron;ky s nastavenou n&iacute;zkou sensitivitou.</li>\r\n<li style=\"list-style-type: none;\">Kompatibiln&aacute; so v&scaron;etk&yacute;mi my&scaron;kami.\r\n<p><br /><br /></p>\r\n</li>\r\n<li style=\"list-style-type: none;\">Materi&aacute;l: l&aacute;tka s gumenou z&aacute;kladňou</li>\r\n<li style=\"list-style-type: none;\">Povrchov&aacute; &uacute;prava: tepeln&aacute;</li>\r\n<li style=\"list-style-type: none;\">Rozmery: 450 x 400 x 2 mm</li>\r\n<li style=\"list-style-type: none;\">Veľkosť: XXL</li>\r\n<li style=\"list-style-type: none;\">Kĺzavosť: hladk&aacute;</li>\r\n<li style=\"list-style-type: none;\">Kompatibilita: v&scaron;etky sn&iacute;macie technol&oacute;gie</li>\r\n</ul>', 0),
(104, 'SteelSeries QcK Large, Lavender', 16.5, 'SteelSeries QcK+ je podložka snov pre každého hráča, ktorý preferuje látkové povrchy. Predtým, než bola v novembri 2004 uvedená na trh, prešla táto podložka pod myš rozsiahlym testovaním hernými odborníkmi, a vďaka ich spätnej väzbe bola QcK+ ďalej vyvíjaná, vďaka čomu vznikla dokonalá látková podložka pre každého hráča. ', 'http://localhost/GameSpace/img/user/product_696a5b4274611.jpg', '2026-01-16 15:37:38', '2026-01-16 15:37:38', 'SteelSeries QcK Large, Lavender', '2023-02-08', 'steelseries-qck-large,-lavender', '<p>SteelSeries QcK+&nbsp;je podložka snov pre každ&eacute;ho hr&aacute;ča, ktor&yacute; preferuje l&aacute;tkov&eacute; povrchy. Predt&yacute;m, než bola v novembri 2004 uveden&aacute; na trh, pre&scaron;la t&aacute;to podložka pod my&scaron; rozsiahlym testovan&iacute;m hern&yacute;mi odborn&iacute;kmi, a vďaka ich sp&auml;tnej v&auml;zbe bola&nbsp;QcK+&nbsp;ďalej vyv&iacute;jan&aacute;, vďaka čomu vznikla dokonal&aacute; l&aacute;tkov&aacute; podložka pre každ&eacute;ho hr&aacute;ča.</p>\r\n<p>Vďaka použitiu vysoko kvalitnej tkaniny, optimalizovanej text&uacute;ry, ktor&aacute; zaručuje hladk&yacute; pohyb a osobitne navrhnutej proti&scaron;mykovej gumenej z&aacute;kladni vynik&aacute; t&aacute;to podložka nad konkurenciou a je skvelou voľbou nielen pre hardcore hr&aacute;čov, ale aj pre grafick&yacute;ch dizajn&eacute;rov a in&yacute;ch, ktor&iacute; použ&iacute;vaj&uacute; my&scaron; počas dlh&yacute;ch časov&yacute;ch intervalov.</p>\r\n<p>Vzhľadom k tomu, že&nbsp;QcK+&nbsp;je super veľk&aacute; podložka pod my&scaron;, je ide&aacute;lna pre hr&aacute;čov, ktor&iacute; použ&iacute;vaj&uacute; n&iacute;zku citlivosť, alebo vysok&eacute; rozl&iacute;&scaron;enie, alebo pre dizajn&eacute;rov, ktor&iacute; použ&iacute;vaj&uacute; dva, alebo viac monitorov.&nbsp;SteelSeries QcK+&nbsp;je kompatibiln&aacute; so v&scaron;etk&yacute;mi typmi my&scaron;&iacute; a je ide&aacute;lna aj pre začiatočn&iacute;kov.</p>\r\n<p><br /><br /></p>\r\n<ul>\r\n<li style=\"list-style-type: none;\">Nov&aacute; proti&scaron;mykov&aacute; spodn&aacute; vrstva.</li>\r\n<li style=\"list-style-type: none;\">Super trv&aacute;cna l&aacute;tkov&aacute; podložka.</li>\r\n<li style=\"list-style-type: none;\">Ide&aacute;lna pre my&scaron;ky s nastavenou n&iacute;zkou sensitivitou.</li>\r\n<li style=\"list-style-type: none;\">Kompatibiln&aacute; so v&scaron;etk&yacute;mi my&scaron;kami.\r\n<p><br /><br /></p>\r\n</li>\r\n<li style=\"list-style-type: none;\">Materi&aacute;l: l&aacute;tka s gumenou z&aacute;kladňou</li>\r\n<li style=\"list-style-type: none;\">Povrchov&aacute; &uacute;prava: tepeln&aacute;</li>\r\n<li style=\"list-style-type: none;\">Rozmery: 450 x 400 x 2 mm</li>\r\n<li style=\"list-style-type: none;\">Veľkosť: XXL</li>\r\n<li style=\"list-style-type: none;\">Kĺzavosť: hladk&aacute;</li>\r\n<li style=\"list-style-type: none;\">Kompatibilita: v&scaron;etky sn&iacute;macie technol&oacute;gie</li>\r\n</ul>', 0),
(105, 'DEV1S Mouse Bungee', 19.9, 'Držiak kábla od myši – kábla DEV1S Mouse Bungee s ramenom a protišmykovým podstavcom, pohodlie pri hraní, koniec zamotaných káblov, atraktívny dizajn, flexibilné rameno, pevné pripevnenie kábla', 'http://localhost/GameSpace/img/user/slideshow_696a5bed05a2a.jpg', '2026-01-16 15:40:00', '2026-01-16 15:40:29', 'DEV1S Mouse Bungee', '2025-02-05', 'dev1s-mouse-bungee', '<p>Drž&aacute;k kabelu DEV1S Mouse Bungee spolehlivě zamez&iacute; zamot&aacute;n&iacute; kabelů. &Uacute;činně zabraňuje vytv&aacute;řen&iacute; uzlu a usnadn&iacute; tak pr&aacute;ci s my&scaron;&iacute;. Drž&aacute;k je opatřen&yacute; flexibiln&iacute;m ramenem a protiskluzov&yacute; podstavcem, kter&yacute; zajist&iacute; jeho stabilitu na stole.</p>\r\n<p>Vynik&aacute; tak&eacute; kompaktn&iacute;mi rozměry, d&iacute;ky nimž zab&iacute;r&aacute; minimum m&iacute;sta. Drž&aacute;k kabelu DEV1S Mouse Bungee pevně uchyt&iacute; kabel a zpř&iacute;jemn&iacute; tak pr&aacute;ci na poč&iacute;tači či hran&iacute; her.&nbsp; Kl&iacute;čov&eacute; vlastnosti drž&aacute;ku kabelu DEV1S Mouse Bungee Praktick&yacute; drž&aacute;k kabelu &Uacute;činně zabraňuje vytv&aacute;řen&iacute; uzlu Opatřen&yacute; flexibiln&iacute;m ramenem</p>\r\n<p>Drž&aacute;k kabelu DEV1S Mouse Bungee vynik&aacute; kompaktn&iacute;mi rozměry Protiskluzov&yacute; podstavec zajist&iacute; jeho stabilitu na stole Barevn&eacute; proveden&iacute;: stř&iacute;brno-oranžov&eacute;</p>', 0);
INSERT INTO `items` (`idItems`, `name`, `price`, `description`, `image`, `created_at`, `last_update`, `alt`, `release_date`, `slug`, `html_description`, `is_deleted`) VALUES
(106, 'Logitech Mouse Pad Studio Series - podložka pod myš - grafitová', 6.9, 'PRE JEMNÉ KĹZANIA Zoznámte sa s mäkkou, hladkou protišmykovou podložkou pre myš, ktorá pozdvihne váš pracovný priestor na novú úroveň. Podložka Logitech Mouse Pad je vyrobená z vysoko kvalitných materiálov a poskytuje klzný povrch a pohodlie, ktoré potrebujete pre svoju obľúbenú myš Logitech.', 'http://localhost/GameSpace/img/user/product_696a5c61d2d9e.jpg', '2026-01-16 15:42:25', '2026-01-16 15:42:25', 'Logitech Mouse Pad Studio Series - podložka pod myš - grafitová', '2025-06-11', 'logitech-mouse-pad-studio-series---podložka-pod-myš---grafitová', '<h2>PRE JEMN&Eacute; KĹZANIA</h2>\r\n<p>Zozn&aacute;mte sa s m&auml;kkou, hladkou proti&scaron;mykovou podložkou pre my&scaron;, ktor&aacute; pozdvihne v&aacute;&scaron; pracovn&yacute; priestor na nov&uacute; &uacute;roveň. Podložka Logitech Mouse Pad je vyroben&aacute; z vysoko kvalitn&yacute;ch materi&aacute;lov a poskytuje klzn&yacute; povrch a pohodlie, ktor&eacute; potrebujete pre svoju obľ&uacute;ben&uacute; my&scaron; Logitech.</p>\r\n<h2>O produkte</h2>\r\n<p>Hladk&aacute; a tich&aacute;<br />Hladk&yacute; a pohodln&yacute; l&aacute;tkov&yacute; povrch disponuje materi&aacute;lom s jemnou v&auml;zbou na niž&scaron;ie trenie a ľahk&eacute; a tich&eacute; kĺzanie &ndash; či už ste v kancel&aacute;rii alebo doma.</p>\r\n<p>&nbsp;</p>\r\n<p>Odolnosť voči poliatiu<br />Podložka Logitech Mouse Pad je opatren&aacute; vrstvou odolnou proti poliatiu, ktor&aacute; odol&aacute;va pr&iacute;padn&yacute;m nehod&aacute;m - tekutiny možno ľahko utrieť vlhkou handričkou.</p>\r\n<p>&nbsp;</p>\r\n<p>Starostlivo vybran&eacute; materi&aacute;ly<br />Proti&scaron;mykov&aacute; z&aacute;kladňa obsahuje pr&iacute;rodn&uacute; gumu, zatiaľ čo m&auml;kk&aacute; a pohodln&aacute; povrchov&aacute; tkanina a vn&uacute;torn&aacute; vrstva s&uacute; vyroben&eacute; z recyklovan&eacute;ho polyesteru, čo umožňuje druhotn&eacute; využitie PET flia&scaron;.</p>\r\n<p>&nbsp;</p>\r\n<p>Žiadne ďal&scaron;ie posuny podložky<br />M&auml;kk&aacute; povrchov&aacute; tkanina zaisťuje pohodln&eacute; kĺzanie my&scaron;i, zatiaľ čo gumov&aacute;6Produkty obsahuj&uacute;ce pr&iacute;rodn&yacute; latex m&ocirc;žu u niektor&yacute;ch jedincov sp&ocirc;sobiť alergick&eacute; reakcie.proti&scaron;mykov&aacute; z&aacute;kladňa zabraňuje jej posunutiu na ľubovoľnom povrchu &ndash; podložka tak pevne drž&iacute; na stole bez ohľadu na čokoľvek.</p>\r\n<p>&nbsp;</p>\r\n<p>Z&iacute;skajte v&yacute;hodu nad protihr&aacute;čom<br />T&aacute;to podložka disponuje okrajmi s ploch&yacute;mi stehmi odoln&yacute;mi proti rozstrapkaniu, ktor&eacute; jej dod&aacute;vaj&uacute; na v&yacute;drži.</p>\r\n<h2>Kľ&uacute;čov&eacute; vlastnosti</h2>\r\n<ul>\r\n<li>M&auml;kk&aacute; povrchov&aacute; tkanina zaisťuje hladk&eacute; kĺzanie my&scaron;i</li>\r\n<li>Gumov&aacute; proti&scaron;mykov&aacute; z&aacute;kladňa z pr&iacute;rodn&eacute;ho kaučuku br&aacute;ni posunovaniu</li>\r\n<li>Opatren&aacute; vrstvou odolnou proti poliatiu</li>\r\n<li>Povrchov&aacute; tkanina je vyroben&aacute; z recyklovan&eacute;ho plastu</li>\r\n<li>Okraje s ploch&yacute;m stehom sa nestrapk&aacute;</li>\r\n</ul>', 0),
(107, 'Mass Effect - (Legendary Edition)', 26.59, 'Jedna osoba, to je všetko, čo stojí medzi ľudstvom a najväčšou hrozbou, ktorej kedy čelila. Znovu prežite legendu veliteľa Sheparda vo vysoko uznávanej trilógii Mass Effect s legendou Mass Effect Legendary Edition. Zahŕňa základný obsah pre jedného hráča a DLC z Mass Effect, Mass Effect 2 a Mass Effect 3, plus promo zbrane, brnenia a balíčky - všetko remasterované a optimalizované pre 4k Ultra HD.', 'http://localhost/GameSpace/img/user/product_696a5d272d4df.jpg', '2026-01-16 15:45:43', '2026-01-16 15:45:43', 'Mass Effect', '2025-06-04', 'mass-effect---(legendary-edition)', '<p data-start=\"188\" data-end=\"502\">Staňte sa legendou galaxie! <strong data-start=\"216\" data-end=\"249\">Mass Effect Legendary Edition</strong> sp&aacute;ja cel&uacute; tril&oacute;giu Mass Effect vr&aacute;tane viac ako 40 DLC, promo zbran&iacute;, brnen&iacute; a bal&iacute;čkov do jednej remastrovan&eacute; ed&iacute;cie optimalizovanej pre <strong data-start=\"389\" data-end=\"404\">4K Ultra HD</strong>. Zažite pr&iacute;beh veliteľa Sheparda a jeho pos&aacute;dky, kde každ&eacute; rozhodnutie ovplyvňuje osud galaxie.</p>\r\n<hr data-start=\"504\" data-end=\"507\" />\r\n<h3 data-start=\"509\" data-end=\"535\"><strong data-start=\"513\" data-end=\"535\">Kľ&uacute;čov&eacute; vlastnosti</strong></h3>\r\n<ul data-start=\"536\" data-end=\"1123\">\r\n<li data-start=\"536\" data-end=\"618\">\r\n<p data-start=\"538\" data-end=\"618\"><strong data-start=\"538\" data-end=\"572\">Kompletn&aacute; tril&oacute;gia Mass Effect</strong>: Mass Effect, Mass Effect 2 a Mass Effect 3</p>\r\n</li>\r\n<li data-start=\"619\" data-end=\"681\">\r\n<p data-start=\"621\" data-end=\"681\"><strong data-start=\"621\" data-end=\"640\">Viac ako 40 DLC</strong>: roz&scaron;&iacute;renia, zbrane, brnenia a bal&iacute;čky</p>\r\n</li>\r\n<li data-start=\"682\" data-end=\"761\">\r\n<p data-start=\"684\" data-end=\"761\"><strong data-start=\"684\" data-end=\"722\">&Uacute;plne remastrovan&eacute; pre 4K Ultra HD</strong>: vylep&scaron;en&eacute; vizu&aacute;ly, text&uacute;ry a modely</p>\r\n</li>\r\n<li data-start=\"762\" data-end=\"833\">\r\n<p data-start=\"764\" data-end=\"833\"><strong data-start=\"764\" data-end=\"804\">Kinematick&yacute; pr&iacute;beh pre jedn&eacute;ho hr&aacute;ča</strong>: viac ako 100 hod&iacute;n obsahu</p>\r\n</li>\r\n<li data-start=\"834\" data-end=\"941\">\r\n<p data-start=\"836\" data-end=\"941\"><strong data-start=\"836\" data-end=\"864\">Rozhodnutia s d&ocirc;sledkami</strong>: va&scaron;e voľby ovplyvňuj&uacute; každ&uacute; misiu, vzťah a v&yacute;sledok galaktick&yacute;ch udalost&iacute;</p>\r\n</li>\r\n<li data-start=\"942\" data-end=\"1026\">\r\n<p data-start=\"944\" data-end=\"1026\"><strong data-start=\"944\" data-end=\"968\">Vylep&scaron;en&aacute; hrateľnosť</strong>: lep&scaron;ie ovl&aacute;danie, kamerov&yacute; syst&eacute;m, mierenie a sk&uacute;manie</p>\r\n</li>\r\n<li data-start=\"1027\" data-end=\"1123\">\r\n<p data-start=\"1029\" data-end=\"1123\"><strong data-start=\"1029\" data-end=\"1065\">Modern&eacute; grafick&eacute; a UI vylep&scaron;enia</strong>: aktualizovan&eacute; použ&iacute;vateľsk&eacute; rozhranie a kvalita života</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1125\" data-end=\"1128\" />\r\n<h3 data-start=\"1130\" data-end=\"1148\"><strong data-start=\"1134\" data-end=\"1148\">Prečo hrať</strong></h3>\r\n<p data-start=\"1149\" data-end=\"1379\">Vytvorte si vlastn&eacute;ho veliteľa Sheparda, veďte pos&aacute;dku po celej galaxii a prežite legend&aacute;rnu s&aacute;gu vo vynikaj&uacute;cej kvalite. Objavujte plan&eacute;ty, bojujte v epick&yacute;ch bitk&aacute;ch a rozhodujte o osude ľudstva vo vesm&iacute;re plnom dobrodružstva.</p>', 0),
(108, 'Senua\'s Saga: Hellblade II', 49.99, 'Pokračovanie oceňovaného titulu Hellblade: Senua\'s Sacrifice! Senua sa vracia a vydáva sa na brutálnu cestu s odhodlaním zachrániť tých, ktorí sa stali obeťou hrôz tyranie. Bude sa musieť postaviť tvárou v tvár temnote, ako vo vnútri seba, tak aj navonok. ', 'http://localhost/GameSpace/img/user/product_696a5de05519a.jpg', '2026-01-16 15:48:48', '2026-01-16 15:48:59', 'Senua\'s Saga: Hellblade II', '2025-02-05', 'senua\'s-saga:-hellblade-ii', '<p data-start=\"163\" data-end=\"429\">Pokračovanie oceňovan&eacute;ho titulu <strong data-start=\"195\" data-end=\"227\">Hellblade: Senua&rsquo;s Sacrifice</strong> v&aacute;s znovu vtiahne do temn&eacute;ho sveta Senuy, keltskej bojovn&iacute;čky trpiacej psych&oacute;zou. Vyrazte na brut&aacute;lnu a emocion&aacute;lne intenz&iacute;vnu cestu, kde sa Senua postav&iacute; hr&ocirc;zam tyranie a vlastnej vn&uacute;tornej temnote.</p>\r\n<hr data-start=\"431\" data-end=\"434\" />\r\n<h3 data-start=\"436\" data-end=\"462\"><strong data-start=\"440\" data-end=\"462\">Kľ&uacute;čov&eacute; vlastnosti</strong></h3>\r\n<ul data-start=\"463\" data-end=\"1040\">\r\n<li data-start=\"463\" data-end=\"562\">\r\n<p data-start=\"465\" data-end=\"562\"><strong data-start=\"465\" data-end=\"489\">Pokračovanie pr&iacute;behu</strong>: Prežite Senuinu neľ&uacute;tostn&uacute; cestu na vikingskom Islande v 10. storoč&iacute;.</p>\r\n</li>\r\n<li data-start=\"563\" data-end=\"681\">\r\n<p data-start=\"565\" data-end=\"681\"><strong data-start=\"565\" data-end=\"588\">Filmov&eacute; spracovanie</strong>: Dychtiv&yacute; pr&iacute;beh, ohromuj&uacute;ce grafick&eacute; detaily a podmaniv&yacute; zvuk v&aacute;s vtiahnu priamo do deja.</p>\r\n</li>\r\n<li data-start=\"682\" data-end=\"795\">\r\n<p data-start=\"684\" data-end=\"795\"><strong data-start=\"684\" data-end=\"705\">Perspekt&iacute;va Senuy</strong>: Vn&iacute;majte svet očami bojovn&iacute;čky trpiacej psych&oacute;zou a zažite unik&aacute;tnu emocion&aacute;lnu hĺbku.</p>\r\n</li>\r\n<li data-start=\"796\" data-end=\"916\">\r\n<p data-start=\"798\" data-end=\"916\"><strong data-start=\"798\" data-end=\"825\">Island za čias vikingov</strong>: Presk&uacute;majte dramatick&yacute; a nebezpečn&yacute; svet sopečn&eacute;ho ostrova, pln&eacute;ho v&yacute;ziev a tajomstiev.</p>\r\n</li>\r\n<li data-start=\"917\" data-end=\"1040\">\r\n<p data-start=\"919\" data-end=\"1040\"><strong data-start=\"919\" data-end=\"938\">Neľ&uacute;tostn&eacute; boje</strong>: S&uacute;boje pln&eacute; bolesti a adrenal&iacute;nu, ktor&eacute; v&aacute;s postavia na hranicu pr&iacute;četnosti a testuj&uacute; va&scaron;u odvahu.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1042\" data-end=\"1045\" />\r\n<h3 data-start=\"1047\" data-end=\"1065\"><strong data-start=\"1051\" data-end=\"1065\">Prečo hrať</strong></h3>\r\n<p>&nbsp;</p>\r\n<p data-start=\"1066\" data-end=\"1286\">Hellblade II pon&uacute;ka jedinečn&uacute; kombin&aacute;ciu intenz&iacute;vneho pr&iacute;behu, filmov&eacute;ho spracovania a psychologickej hĺbky. Vžite sa do kože Senuy a prežite temn&yacute;, emocion&aacute;lne nabit&yacute; svet, kde každ&eacute; rozhodnutie a každ&yacute; boj maj&uacute; v&aacute;hu.</p>', 1),
(109, 'Halo Infinite ', 25.5, 'Legendárna séria Halo sa vracia s doposiaľ najrozsiahlejším príbehom Master Chief. Kampaň Keď je všetka nádej stratená a osud ľudstva visí na vlásku, hlavný veliteľ je pripravený čeliť najneľútostnejšiemu nepriateľovi, s akým sa kedy stretol. Začnite odznova a vkročte do brnenia najväčšieho hrdinu ľudstva, aby ste prežili epické dobrodružstvo a nakoniec preskúmali veľkosť samotného kruhu Halo.', 'http://localhost/GameSpace/img/user/slideshow_696a5eb744999.jpg', '2026-01-16 15:51:07', '2026-01-16 15:52:23', 'Halo Infinite ', '2025-05-07', 'halo-infinite-', '<p>Legend&aacute;rna s&eacute;ria Halo sa vracia s doposiaľ najrozsiahlej&scaron;&iacute;m pr&iacute;behom Master Chief.<br /><br />Kampaň</p>\r\n<p>Keď je v&scaron;etka n&aacute;dej straten&aacute; a osud ľudstva vis&iacute; na vl&aacute;sku, hlavn&yacute; veliteľ je pripraven&yacute; čeliť najneľ&uacute;tostnej&scaron;iemu nepriateľovi, s ak&yacute;m sa kedy stretol. Začnite odznova a vkročte do brnenia najv&auml;č&scaron;ieho hrdinu ľudstva, aby ste prežili epick&eacute; dobrodružstvo a nakoniec presk&uacute;mali veľkosť samotn&eacute;ho kruhu Halo.<br /><br />Multiplayer: Halo oslavuje multiplayer, vracia sa, je premyslen&yacute; a pon&uacute;ka bezplatn&eacute; hranie. Hern&eacute; režimy pre viacer&yacute;ch hr&aacute;čov:</p>\r\n<ul>\r\n<li style=\"list-style-type: none;\">Arena: Spravodliv&eacute; &scaron;tarty, vybavenie na mape a t&iacute;my pre 4 hr&aacute;čov pon&uacute;kaj&uacute; vyv&aacute;žen&yacute; z&aacute;žitok z ar&eacute;ny.</li>\r\n<li style=\"list-style-type: none;\">Veľk&aacute; t&iacute;mov&aacute; bitka: Vytvorte nekonečn&eacute; bojov&eacute; možnosti zmie&scaron;an&iacute;m a spojen&iacute;m bohatej palety zbran&iacute; a vybavenia, aby ste zažili chaos veľk&eacute;ho t&iacute;mu, ktor&yacute; zahŕňa cel&eacute; spektrum pieskoviska Halo.<br /><br />Sparťansk&eacute; prisp&ocirc;sobenie:\r\n<p>Vytvorte multiplayerov&yacute; Spartan, ktor&yacute; je v&aacute;&scaron; vlastn&yacute;, s rozsiahlym nov&yacute;m syst&eacute;mom prisp&ocirc;sobenia.<br /><br />Cross-Generation Gaming:</p>\r\n<p>Halo Infinite poskytuje &uacute;žasn&yacute; z&aacute;žitok z konzoly ako aj z poč&iacute;tača. A na konzole Xbox Series X a na podporovan&yacute;ch poč&iacute;tačoch si m&ocirc;žete užiť vylep&scaron;en&eacute; funkcie, ako je rozl&iacute;&scaron;enie až 4 kB pri 60 sn&iacute;mkach za sekundu v kampani, a v&yacute;razne skr&aacute;tiť dobu nač&iacute;tania, č&iacute;m sa vytvor&iacute; plynul&eacute; hranie.</p>\r\n</li>\r\n</ul>', 0);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `items_has_category`
--

CREATE TABLE `items_has_category` (
  `Items_idItems` int(11) NOT NULL,
  `Category_idCategory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `items_has_category`
--

INSERT INTO `items_has_category` (`Items_idItems`, `Category_idCategory`) VALUES
(1, 1),
(2, 1),
(2, 27),
(3, 1),
(4, 1),
(5, 1),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 3),
(17, 3),
(18, 3),
(19, 4),
(19, 45),
(20, 4),
(20, 45),
(21, 4),
(21, 45),
(23, 5),
(23, 49),
(24, 5),
(24, 52),
(25, 1),
(25, 22),
(25, 23),
(26, 1),
(26, 22),
(26, 23),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(30, 23),
(31, 1),
(31, 22),
(31, 23),
(31, 34),
(32, 1),
(32, 22),
(32, 23),
(32, 30),
(33, 1),
(33, 22),
(34, 1),
(34, 22),
(34, 29),
(35, 1),
(35, 22),
(35, 30),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(44, 26),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(59, 1),
(59, 22),
(59, 23),
(61, 1),
(63, 1),
(75, 1),
(75, 22),
(75, 23),
(82, 2),
(82, 35),
(83, 2),
(83, 35),
(84, 2),
(84, 35),
(85, 2),
(85, 38),
(86, 2),
(86, 38),
(87, 2),
(87, 38),
(88, 2),
(88, 38),
(89, 2),
(89, 35),
(90, 3),
(90, 40),
(91, 3),
(91, 40),
(92, 3),
(92, 41),
(93, 3),
(93, 41),
(94, 3),
(94, 42),
(95, 4),
(95, 45),
(96, 4),
(96, 48),
(97, 4),
(97, 48),
(98, 4),
(98, 48),
(99, 4),
(99, 48),
(100, 4),
(100, 48),
(101, 5),
(101, 52),
(102, 5),
(102, 51),
(103, 5),
(103, 51),
(104, 5),
(104, 51),
(105, 5),
(105, 50),
(106, 5),
(106, 51),
(107, 1),
(107, 22),
(107, 23),
(107, 34),
(108, 1),
(108, 22),
(108, 29),
(109, 1),
(109, 22),
(109, 31),
(109, 34);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `most_anticipated`
--

CREATE TABLE `most_anticipated` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `anticipated_rank` int(11) NOT NULL,
  `state` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `most_anticipated`
--

INSERT INTO `most_anticipated` (`id`, `item_id`, `anticipated_rank`, `state`) VALUES
(1, 3, 1, 'V predaji'),
(2, 4, 2, 'V predaji'),
(3, 1, 3, 'V predaji'),
(4, 2, 4, 'V predaji'),
(5, 5, 5, 'V predaji');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `orderdetail`
--

CREATE TABLE `orderdetail` (
  `idOrderDetail` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `email` varchar(90) NOT NULL,
  `mobile_number` varchar(30) NOT NULL,
  `Address_idAddress` int(11) NOT NULL,
  `Payment_idPayment` int(11) NOT NULL,
  `Transport_idTransport` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `orderdetail`
--

INSERT INTO `orderdetail` (`idOrderDetail`, `name`, `last_name`, `email`, `mobile_number`, `Address_idAddress`, `Payment_idPayment`, `Transport_idTransport`) VALUES
(1, 'fff', 'asd', 'as', '123', 1, 7, 1),
(2, 'aasd', 'asfaas', 'asd@asda.sk', '55295296529', 2, 2, 2),
(3, 'asd', 'asf', 'asd', 'asf', 3, 2, 2),
(4, 'asf', 'asf', 'asf', 'asfasf', 4, 1, 3),
(5, 'asfasf', 'asfafs', 'adsasd', 'asf', 5, 7, 2),
(6, 'asf', 'asf', 'asf', 'asfas', 6, 5, 3),
(7, 'asf', 'asf', 'asf', 'asf', 7, 6, 2),
(9, 'asf', 'asf', 'asf', 'asf', 9, 1, 3),
(10, 'asf', 'asf', 'asf', 'asf', 10, 7, 2),
(11, 'Al', 'Af', 'assfas', '+432242424', 11, 4, 2),
(12, 'Adam', 'Šima', 'email@email.sk', '+421904329 027', 12, 6, 2),
(13, 'Adam', 'Šima', 'admin@outlook.sk', '0904 245 367', 13, 1, 4),
(14, 'Al', 'AAs', 'adam.sima@student.ukf.sk', '0904319555', 14, 4, 1),
(15, 'Al', 'Šima', 'adamsima77@gmail.com', '123456', 15, 3, 2),
(16, 'AAsf', 'Šima', 'admin@outlook.sk', '123456', 17, 6, 1),
(17, 'Ada', 'Ada', 'admin@outlook.sk', '+421329027', 18, 6, 1),
(18, 'Al', 'AD', 'admin@outlook.sk', '+421329027', 19, 5, 4),
(19, 'Al', 'Af', 'admin@outlook.sk', '+421329027', 20, 2, 1),
(20, 'User', 'Af', 'adamsima77@gmail.com', '0904329027', 21, 4, 1),
(21, 'User', 'Šima', 'admin@outlook.sk', '+421329027', 22, 4, 3),
(22, 'User', 'User', 'admin@outlook.sk', '0904 245 367', 23, 8, 1),
(23, 'Adam', 'Šima', 'admin@outlook.sk', '+421329027', 24, 6, 3),
(30, 'User', 'User', 'admin@outlook.sk', '+421329027', 31, 8, 1),
(31, 'User', 'User', 'admin@outlook.sk', '+421329027', 32, 8, 1),
(32, 'User', 'User', 'admin@outlook.sk', '+421329027', 33, 7, 2),
(33, 'User', 'User', 'admin@outlook.sk', '+421329027', 34, 1, 2),
(34, 'User', 'User', 'admin@outlook.sk', '+421329027', 35, 4, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `orders`
--

CREATE TABLE `orders` (
  `idOrders` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `OrderDetail_idOrderDetail` int(11) NOT NULL,
  `Users_idUsers` int(11) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `total_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `orders`
--

INSERT INTO `orders` (`idOrders`, `creation_date`, `last_update`, `OrderDetail_idOrderDetail`, `Users_idUsers`, `status`, `total_price`) VALUES
(4, '2025-12-16 13:44:42', '2026-01-13 17:16:12', 4, 4, 'Doručené', 149.97),
(5, '2025-12-16 13:49:13', '2025-12-19 09:37:44', 5, 4, 'V príprave', 26.95),
(6, '2025-12-16 13:53:49', '2025-12-19 09:37:44', 6, 4, 'V príprave', 26.95),
(7, '2025-12-16 13:55:44', '2025-12-19 09:37:44', 7, 4, 'V príprave', 49.99),
(9, '2025-12-16 14:04:08', '2025-12-19 09:37:44', 9, 4, 'V príprave', 239.96),
(10, '2025-12-16 14:08:27', '2025-12-19 09:37:44', 10, 4, 'V príprave', 269.5),
(11, '2025-12-16 15:00:34', '2025-12-19 09:37:44', 11, 4, 'V príprave', 59.99),
(12, '2025-12-19 15:40:57', '2025-12-19 15:40:57', 12, NULL, 'V príprave', 49.99),
(13, '2025-12-21 12:40:31', '2025-12-21 12:40:31', 13, 4, 'V príprave', 299.94),
(14, '2025-12-25 15:20:14', '2025-12-25 15:20:14', 14, NULL, 'V príprave', 49.99),
(15, '2025-12-27 13:14:18', '2026-01-14 08:40:44', 15, NULL, 'Doručené', 109.98),
(16, '2025-12-27 14:47:03', '2025-12-27 14:47:03', 16, 4, 'V príprave', 109.98),
(17, '2026-01-10 10:16:44', '2026-01-10 10:16:44', 17, NULL, 'V príprave', 49.99),
(18, '2026-01-10 12:11:58', '2026-01-10 12:11:58', 18, NULL, 'V príprave', 59.99),
(19, '2026-01-10 17:29:12', '2026-01-10 17:29:12', 19, NULL, 'V príprave', 69.99),
(20, '2026-01-11 12:58:33', '2026-01-11 12:58:33', 20, 4, 'V príprave', 59.99),
(21, '2026-01-13 14:56:19', '2026-01-13 14:56:19', 21, 4, 'V príprave', 59.99),
(22, '2026-01-14 08:38:58', '2026-01-14 08:40:35', 22, 4, 'Doručené', 104.97),
(23, '2026-01-15 12:52:59', '2026-01-15 12:52:59', 23, 4, 'V príprave', 76.94),
(30, '2026-01-15 17:15:35', '2026-01-15 17:15:35', 30, 4, 'V príprave', 279.96),
(31, '2026-01-15 17:16:52', '2026-01-15 17:45:39', 31, 4, 'Doručené', 279.96),
(32, '2026-01-15 17:43:37', '2026-01-15 17:45:31', 32, 4, 'Doručené', 169.97),
(33, '2026-01-16 16:20:07', '2026-01-16 16:20:07', 33, 4, 'V príprave', 78.68),
(34, '2026-01-16 17:24:04', '2026-01-16 17:24:04', 34, 4, 'V príprave', 1928.67);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `orders_has_items`
--

CREATE TABLE `orders_has_items` (
  `Orders_idOrders` int(11) NOT NULL,
  `Items_idItems` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `orders_has_items`
--

INSERT INTO `orders_has_items` (`Orders_idOrders`, `Items_idItems`, `quantity`, `platform_id`) VALUES
(4, 3, 3, 0),
(5, 2, 1, 0),
(6, 2, 1, 0),
(7, 3, 1, 0),
(9, 1, 4, 0),
(10, 2, 10, 0),
(11, 1, 1, 0),
(12, 3, 1, 0),
(13, 3, 6, 0),
(14, 75, 1, 0),
(15, 1, 1, 0),
(15, 75, 1, 0),
(16, 1, 1, 0),
(16, 75, 1, 0),
(17, 75, 1, 0),
(18, 1, 1, 0),
(19, 28, 1, 0),
(20, 1, 1, 0),
(21, 1, 1, 0),
(22, 5, 1, 0),
(22, 25, 1, 0),
(22, 75, 1, 0),
(23, 2, 1, 0),
(23, 3, 1, 0),
(30, 45, 1, 2),
(30, 45, 3, 3),
(31, 45, 1, 2),
(31, 45, 2, 3),
(31, 50, 1, 1),
(32, 45, 1, 2),
(32, 75, 2, 3),
(33, 107, 1, 1),
(33, 107, 1, 3),
(33, 109, 1, 3),
(34, 83, 1, 5),
(34, 105, 1, 5),
(34, 107, 1, 1),
(34, 107, 2, 3);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `payment`
--

CREATE TABLE `payment` (
  `idPayment` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `payment`
--

INSERT INTO `payment` (`idPayment`, `name`, `created_at`, `last_update`) VALUES
(1, 'Dobierka', '2025-12-15 15:32:30', '2025-12-15 15:32:30'),
(2, 'Platba kartou', '2025-12-15 15:32:30', '2025-12-15 15:32:30'),
(3, 'Bankový prevod', '2025-12-15 15:32:30', '2025-12-15 15:32:30'),
(4, 'Online bankový prevod', '2025-12-15 15:32:30', '2025-12-15 15:32:30'),
(5, 'Apple Pay', '2025-12-15 15:32:30', '2025-12-15 15:32:30'),
(6, 'Google Pay', '2025-12-15 15:32:30', '2025-12-15 15:32:30'),
(7, 'PayPal', '2025-12-15 15:32:30', '2025-12-15 15:32:30'),
(8, 'Hotovosť', '2025-12-15 15:32:30', '2025-12-15 15:32:30');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `platform`
--

CREATE TABLE `platform` (
  `platform_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `platform`
--

INSERT INTO `platform` (`platform_id`, `name`) VALUES
(1, 'PC'),
(2, 'PS5'),
(3, 'Xbox Series X'),
(4, 'Nintendo'),
(5, 'Platform Independent');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `platform_has_items`
--

CREATE TABLE `platform_has_items` (
  `platform_id` int(11) NOT NULL,
  `idItems` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `platform_has_items`
--

INSERT INTO `platform_has_items` (`platform_id`, `idItems`, `stock`) VALUES
(1, 3, 12),
(1, 25, 0),
(1, 26, 12),
(1, 27, 10),
(1, 28, 9),
(1, 29, 15),
(1, 30, 10),
(1, 31, 14),
(1, 32, 8),
(1, 33, 9),
(1, 38, 7),
(1, 39, 6),
(1, 40, 10),
(1, 41, 9),
(1, 42, 6),
(1, 43, 8),
(1, 44, 10),
(1, 45, 14),
(1, 46, 11),
(1, 47, 8),
(1, 48, 7),
(1, 49, 9),
(1, 50, 9),
(1, 59, 15),
(1, 61, 7),
(1, 63, 9),
(1, 75, 10),
(1, 107, 8),
(1, 108, 10),
(2, 3, 15),
(2, 4, 15),
(2, 25, 15),
(2, 27, 15),
(2, 28, 15),
(2, 29, 15),
(2, 30, 15),
(2, 32, 15),
(2, 33, 15),
(2, 34, 15),
(2, 35, 15),
(2, 36, 15),
(2, 37, 15),
(2, 38, 15),
(2, 39, 15),
(2, 40, 15),
(2, 41, 15),
(2, 42, 15),
(2, 43, 15),
(2, 45, 15),
(2, 46, 15),
(2, 47, 15),
(2, 48, 15),
(2, 49, 15),
(2, 50, 15),
(2, 59, 15),
(2, 61, 15),
(2, 63, 15),
(2, 75, 15),
(2, 107, 15),
(2, 108, 15),
(3, 3, 15),
(3, 25, 15),
(3, 26, 15),
(3, 27, 15),
(3, 28, 15),
(3, 29, 15),
(3, 30, 15),
(3, 31, 15),
(3, 32, 15),
(3, 33, 15),
(3, 40, 15),
(3, 41, 15),
(3, 42, 15),
(3, 43, 15),
(3, 44, 15),
(3, 45, 15),
(3, 46, 15),
(3, 47, 15),
(3, 48, 15),
(3, 49, 15),
(3, 50, 15),
(3, 59, 15),
(3, 61, 15),
(3, 63, 15),
(3, 75, 15),
(3, 107, 12),
(3, 108, 15),
(3, 109, 14),
(4, 1, 10),
(4, 2, 0),
(4, 5, 15),
(4, 25, 0),
(4, 59, 0),
(5, 19, 10),
(5, 20, 10),
(5, 21, 10),
(5, 23, 10),
(5, 24, 10),
(5, 82, 10),
(5, 83, 9),
(5, 84, 10),
(5, 85, 10),
(5, 86, 10),
(5, 87, 10),
(5, 88, 10),
(5, 89, 10),
(5, 90, 10),
(5, 91, 10),
(5, 92, 10),
(5, 93, 10),
(5, 94, 10),
(5, 95, 10),
(5, 96, 10),
(5, 97, 10),
(5, 98, 10),
(5, 99, 10),
(5, 100, 10),
(5, 101, 10),
(5, 102, 10),
(5, 103, 10),
(5, 104, 10),
(5, 105, 9),
(5, 106, 10);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `reviews`
--

CREATE TABLE `reviews` (
  `reviews_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `reviews`
--

INSERT INTO `reviews` (`reviews_id`, `description`, `rating`, `user_id`, `item_id`) VALUES
(32, 'sfaasffas', 4, 4, 1),
(38, 'safasfasfasfggg', 5, 4, 75);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `role`
--

CREATE TABLE `role` (
  `idrole` int(11) NOT NULL,
  `name` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `role`
--

INSERT INTO `role` (`idrole`, `name`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `slideshow`
--

CREATE TABLE `slideshow` (
  `idSlideshow` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `alt` varchar(120) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `slideshow`
--

INSERT INTO `slideshow` (`idSlideshow`, `img`, `alt`, `created_at`, `last_update`, `link`) VALUES
(1, 'http://localhost/GameSpace/img/user/god_of_war.jpg', 'God Of War', '2025-12-07 11:33:50', '2025-12-21 12:07:01', '/hry/god-of-war'),
(2, 'http://localhost/GameSpace/img/user/expedition_33.jpg', 'Expedition 33', '2025-12-07 11:34:27', '2025-12-21 12:06:19', '/hry/expedition-33'),
(3, 'http://localhost/GameSpace/img/user/cyberpunk2077_1.jpg', 'Cyberpunk 2077', '2025-12-21 12:15:45', '2025-12-21 12:15:45', '/hry/cyberpunk-2077'),
(6, 'http://localhost/GameSpace/img/user/slideshow_6966543312608.jpg', 'starfield', '2026-01-13 13:37:23', '2026-01-15 13:31:10', '/hry/starfield'),
(10, 'http://localhost/GameSpace/img/user/696a7ba6c0722.jpg', 'Elden Ring', '2026-01-16 17:55:50', '2026-01-16 17:56:51', '/hry/elden-ring');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `transport`
--

CREATE TABLE `transport` (
  `idTransport` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `transport`
--

INSERT INTO `transport` (`idTransport`, `name`, `created_at`, `last_update`) VALUES
(1, 'Slovenská pošta', '2025-12-15 15:33:16', '2025-12-15 15:33:16'),
(2, 'Packeta', '2025-12-15 15:33:16', '2025-12-15 15:33:16'),
(3, 'DPD', '2025-12-15 15:33:16', '2025-12-15 15:33:16'),
(4, 'GLS', '2025-12-15 15:33:16', '2025-12-15 15:33:16'),
(5, 'DHL', '2025-12-15 15:33:16', '2025-12-15 15:33:16'),
(6, 'UPS', '2025-12-15 15:33:16', '2025-12-15 15:33:16'),
(7, 'Osobný odber', '2025-12-15 15:33:16', '2025-12-15 15:33:16');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `users`
--

CREATE TABLE `users` (
  `idUsers` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `last_name` varchar(120) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile_number` varchar(30) DEFAULT NULL,
  `role_idrole` int(11) NOT NULL,
  `Address_idAddress` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `users`
--

INSERT INTO `users` (`idUsers`, `name`, `last_name`, `email`, `password`, `mobile_number`, `role_idrole`, `Address_idAddress`, `created_at`, `last_update`, `is_deleted`) VALUES
(3, 'Adam', 'Šima', 'adamsima@gmail.com', '$2y$10$/jyrZXJeaBXImPE1YeHd/eVjpxWWvRkel30dFUsGgQWRjTo81Z.vq', NULL, 2, NULL, '2025-12-13 16:30:41', '2025-12-13 16:30:41', 0),
(4, 'User', 'User', 'user@user.sk', '$2y$10$anDZQb3aYY/3D3tDgbks6uoVlsuE8xzi0uEw2KRoAOjg1uq7IPy/2', '+421329020', 2, 16, '2025-12-13 16:32:34', '2026-01-15 17:20:59', 0),
(5, 'Aadasd', 'Asdasd', 'fff@fff.sk', '$2y$10$IWMpHgYsjM.KZUjbda2Hn.WUb5OHYDCaPzoMHlM9tmMWRuHKuEE4q', NULL, 1, NULL, '2025-12-13 20:07:33', '2025-12-13 20:07:33', 0),
(6, 'User1@User.sk', 'User', 'user1@user.sk', '$2y$10$KrW5C0uvvo0DvP48S0INiO8FFuigxlDcGjMgN8gHFp0nIwQh2U0P.', NULL, 1, NULL, '2026-01-11 13:05:15', '2026-01-11 13:05:15', 0);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `accordion`
--
ALTER TABLE `accordion`
  ADD PRIMARY KEY (`idAccordion`);

--
-- Indexy pre tabuľku `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`idAddress`);

--
-- Indexy pre tabuľku `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCategory`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `fk_category_parent` (`parent_id`);

--
-- Indexy pre tabuľku `footer`
--
ALTER TABLE `footer`
  ADD PRIMARY KEY (`idFooter`);

--
-- Indexy pre tabuľku `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`idItems`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexy pre tabuľku `items_has_category`
--
ALTER TABLE `items_has_category`
  ADD PRIMARY KEY (`Items_idItems`,`Category_idCategory`),
  ADD KEY `fk_items_has_category_category` (`Category_idCategory`);

--
-- Indexy pre tabuľku `most_anticipated`
--
ALTER TABLE `most_anticipated`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexy pre tabuľku `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`idOrderDetail`),
  ADD KEY `fk_OrderDetail_Address_idx` (`Address_idAddress`),
  ADD KEY `fk_OrderDetail_Payment_idx` (`Payment_idPayment`),
  ADD KEY `fk_OrderDetail_Transport_idx` (`Transport_idTransport`);

--
-- Indexy pre tabuľku `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`idOrders`),
  ADD KEY `fk_Orders_OrderDetail_idx` (`OrderDetail_idOrderDetail`),
  ADD KEY `fk_Orders_Users_idx` (`Users_idUsers`);

--
-- Indexy pre tabuľku `orders_has_items`
--
ALTER TABLE `orders_has_items`
  ADD PRIMARY KEY (`Orders_idOrders`,`Items_idItems`,`platform_id`),
  ADD KEY `fk_Orders_has_Items_Items_idx` (`Items_idItems`),
  ADD KEY `fk_Orders_has_Items_Orders_idx` (`Orders_idOrders`),
  ADD KEY `fk_platform` (`platform_id`);

--
-- Indexy pre tabuľku `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`idPayment`);

--
-- Indexy pre tabuľku `platform`
--
ALTER TABLE `platform`
  ADD PRIMARY KEY (`platform_id`);

--
-- Indexy pre tabuľku `platform_has_items`
--
ALTER TABLE `platform_has_items`
  ADD PRIMARY KEY (`platform_id`,`idItems`),
  ADD KEY `idItems` (`idItems`);

--
-- Indexy pre tabuľku `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`reviews_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexy pre tabuľku `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`idrole`);

--
-- Indexy pre tabuľku `slideshow`
--
ALTER TABLE `slideshow`
  ADD PRIMARY KEY (`idSlideshow`);

--
-- Indexy pre tabuľku `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`idTransport`);

--
-- Indexy pre tabuľku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUsers`),
  ADD KEY `fk_Users_role_idx` (`role_idrole`),
  ADD KEY `fk_Users_Address_idx` (`Address_idAddress`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `accordion`
--
ALTER TABLE `accordion`
  MODIFY `idAccordion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pre tabuľku `address`
--
ALTER TABLE `address`
  MODIFY `idAddress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pre tabuľku `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pre tabuľku `footer`
--
ALTER TABLE `footer`
  MODIFY `idFooter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pre tabuľku `items`
--
ALTER TABLE `items`
  MODIFY `idItems` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT pre tabuľku `most_anticipated`
--
ALTER TABLE `most_anticipated`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `idOrderDetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pre tabuľku `orders`
--
ALTER TABLE `orders`
  MODIFY `idOrders` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pre tabuľku `payment`
--
ALTER TABLE `payment`
  MODIFY `idPayment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pre tabuľku `platform`
--
ALTER TABLE `platform`
  MODIFY `platform_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `reviews`
--
ALTER TABLE `reviews`
  MODIFY `reviews_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pre tabuľku `role`
--
ALTER TABLE `role`
  MODIFY `idrole` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pre tabuľku `slideshow`
--
ALTER TABLE `slideshow`
  MODIFY `idSlideshow` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pre tabuľku `transport`
--
ALTER TABLE `transport`
  MODIFY `idTransport` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pre tabuľku `users`
--
ALTER TABLE `users`
  MODIFY `idUsers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `fk_category_parent` FOREIGN KEY (`parent_id`) REFERENCES `category` (`idCategory`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Obmedzenie pre tabuľku `items_has_category`
--
ALTER TABLE `items_has_category`
  ADD CONSTRAINT `fk_items_has_category_category` FOREIGN KEY (`Category_idCategory`) REFERENCES `category` (`idCategory`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_items_has_category_items` FOREIGN KEY (`Items_idItems`) REFERENCES `items` (`idItems`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Obmedzenie pre tabuľku `most_anticipated`
--
ALTER TABLE `most_anticipated`
  ADD CONSTRAINT `most_anticipated_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`idItems`);

--
-- Obmedzenie pre tabuľku `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `fk_OrderDetail_Address` FOREIGN KEY (`Address_idAddress`) REFERENCES `address` (`idAddress`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_OrderDetail_Payment` FOREIGN KEY (`Payment_idPayment`) REFERENCES `payment` (`idPayment`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_OrderDetail_Transport` FOREIGN KEY (`Transport_idTransport`) REFERENCES `transport` (`idTransport`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Obmedzenie pre tabuľku `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_Orders_OrderDetail` FOREIGN KEY (`OrderDetail_idOrderDetail`) REFERENCES `orderdetail` (`idOrderDetail`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Orders_Users` FOREIGN KEY (`Users_idUsers`) REFERENCES `users` (`idUsers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Obmedzenie pre tabuľku `platform_has_items`
--
ALTER TABLE `platform_has_items`
  ADD CONSTRAINT `platform_has_items_ibfk_1` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`platform_id`),
  ADD CONSTRAINT `platform_has_items_ibfk_2` FOREIGN KEY (`idItems`) REFERENCES `items` (`idItems`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
