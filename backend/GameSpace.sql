-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Št 15.Jan 2026, 19:00
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
(33, 'Malé Vozokany', '95182', 'Hlavná ulica 30/10', '2026-01-15 17:43:37', '2026-01-15 17:43:37');

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
(34, 'Sci-fi', 1, 'sci-fi');

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
(8, 'OfficeMate 15\"', 899.5, 'Reliable notebook for office tasks with 16GB RAM and 256GB SSD.', 'officemate_15.jpg', '2025-12-11 09:09:12', '2026-01-10 17:23:06', 'OfficeMate 15\" laptop', '2025-03-05', 'officemate-15', '', 0),
(9, 'CompactBook 13\"', 749.99, 'Ultra-portable 13-inch notebook with long battery life.', 'compactbook_13.jpg', '2025-12-11 09:09:12', '2026-01-10 17:23:06', 'CompactBook 13\" laptop', '2025-01-22', 'compactbook-13', '', 0),
(10, 'PowerStation 15\"', 1599.99, 'Powerful 15-inch PC laptop with 32GB RAM and 1TB SSD.', 'powerstation_15.jpg', '2025-12-11 09:09:12', '2026-01-10 17:23:06', 'PowerStation 15\" laptop', '2025-04-01', 'powerstation-15', '', 0),
(11, 'Notebook X1', 1199, 'Slim notebook with touchscreen and 16GB RAM.', 'notebook_x1.jpg', '2025-12-11 09:09:12', '2026-01-10 17:23:06', 'Notebook X1 touchscreen laptop', '2025-02-28', 'notebook-x1', '', 0),
(12, 'Gaming Mini 15\"', 1999.99, 'Compact gaming notebook with RTX 4070 and 16GB RAM.', 'gaming_mini_15.jpg', '2025-12-11 09:09:12', '2026-01-10 17:23:06', 'Gaming Mini 15\" laptop', '2025-03-12', 'gaming-mini-15', '', 0),
(13, 'EcoBook 14\"', 679.5, 'Eco-friendly notebook with energy-efficient processor.', 'ecobook_14.jpg', '2025-12-11 09:09:12', '2026-01-10 17:23:06', 'EcoBook 14\" laptop', '2025-04-05', 'ecobook-14', '', 0),
(14, 'ProStation 16\"', 1899.99, 'Professional workstation laptop with 64GB RAM.', 'prostation_16.jpg', '2025-12-11 09:09:12', '2026-01-10 17:23:06', 'ProStation 16\" laptop', '2025-01-30', 'prostation-16', '', 0),
(15, 'TravelBook 13\"', 799.99, 'Light and portable notebook ideal for travel.', 'travelbook_13.jpg', '2025-12-11 09:09:12', '2026-01-10 17:23:06', 'TravelBook 13\" laptop', '2025-02-20', 'travelbook-13', '', 0),
(16, 'Gaming Mouse X200', 49.99, 'High-precision gaming mouse with RGB lighting.', 'http://localhost/GameSpace/img/user/x200.webp', '2025-12-11 09:33:33', '2026-01-13 14:50:06', 'Gaming Mouse X200', '2025-05-10', 'gaming-mouse-x200', '', 0),
(17, 'Mechanical Keyboard K75', 89.99, 'Mechanical keyboard with customizable RGB keys.', 'http://localhost/GameSpace/img/user/k75.webp', '2025-12-11 09:33:33', '2026-01-13 14:52:37', 'Mechanical Keyboard K75', '2025-06-01', 'mechanical-keyboard-k75', '', 0),
(18, 'Wireless Headset H7', 79.99, 'Wireless headset with surround sound.', 'http://localhost/GameSpace/img/user/h7.jpg', '2025-12-11 09:33:33', '2026-01-13 14:51:19', 'Wireless Headset H7', '2025-07-15', 'wireless-headset-h7', '', 0),
(19, 'PlayStation 5', 499.99, 'Next-gen PlayStation console with ultra-fast SSD and 4K gaming.', 'playstation_5.jpg', '2025-12-11 09:35:48', '2026-01-10 17:23:06', 'PlayStation 5 console', '2020-11-12', 'playstation-5', '', 0),
(20, 'Xbox Series X', 499.99, 'Powerful next-gen Xbox console with ray tracing and 4K gaming.', 'xbox_series_x.jpg', '2025-12-11 09:35:48', '2026-01-10 17:23:06', 'Xbox Series X console', '2020-11-10', 'xbox-series-x', '', 0),
(21, 'Nintendo Switch OLED', 349.99, 'Portable Nintendo Switch console with OLED display and enhanced audio.', 'nintendo_switch_oled.jpg', '2025-12-11 09:35:48', '2026-01-10 17:23:06', 'Nintendo Switch OLED', '2021-10-08', 'nintendo-switch-oled', '', 0),
(23, 'PlayStation Plus Premium', 14.99, 'Monthly subscription with access to classic games and cloud streaming.', 'ps_plus_premium.jpg', '2025-12-11 09:36:32', '2026-01-10 17:23:06', 'PlayStation Plus Premium', '2021-07-15', 'playstation-plus-premium', '', 0),
(24, 'Steam Gift Card 50€', 50, 'Gift card redeemable on Steam for games and content.', 'steam_gift_card_50.jpg', '2025-12-11 09:36:32', '2026-01-10 17:23:06', 'Steam Gift Card 50€', '2022-01-10', 'steam-gift-card-50', '', 0),
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
(75, 'Clair Obscur: Expedition 33', 49.99, '„Rok čo rok nás vymazáva.“ Veďte členov Expedície 33 na ich ceste za zničením Paintress, aby už nikdy nemohla maľovať smrť. Preskúmajte svet zázrakov inšpirovaný Belle Époque France a bojujte s jedinečnými nepriateľmi v tomto ťahovom RPG s mechanikou v reálnom čase. Raz do roka sa Paintress zobudí a namaľuje na svoj monolit.a', 'http://localhost/GameSpace/img/user/slideshow_6968ecdc0d53c.jpg', '2025-12-21 11:54:56', '2026-01-15 17:36:09', 'expedition-33', '2025-04-25', 'clair-obscur:-expedition-33', '<p><strong>Expedition 33</strong> je atmosf&eacute;rick&aacute; pr&iacute;behov&aacute; hra, ktor&aacute; sp&aacute;ja hlbok&yacute; narat&iacute;v, umeleck&yacute; vizu&aacute;lny &scaron;t&yacute;l a modern&yacute; ťahov&yacute; s&uacute;bojov&yacute; syst&eacute;m. Hr&aacute;č sa ocit&aacute; v temnom, no fascinuj&uacute;com svete, kde každ&yacute; rok z&aacute;hadn&aacute; entita zn&aacute;ma ako Maliarka vymaže zo sveta ľud&iacute;, ktor&iacute; dosiahnu určit&yacute; vek. Tento rok padla voľba na č&iacute;slo 33.</p>\r\n<p>Ako člen poslednej exped&iacute;cie m&aacute;te jedin&uacute; &uacute;lohu &ndash; zastaviť tento ne&uacute;prosn&yacute; cyklus a čeliť osudu, ktor&yacute; sa zd&aacute; byť vopred nap&iacute;san&yacute;. Každ&yacute; krok vpred je sprev&aacute;dzan&yacute; ot&aacute;zkami o živote, smrti, obete a n&aacute;deji. Pr&iacute;beh je rozpr&aacute;van&yacute; emocion&aacute;lne, s d&ocirc;razom na postavy, ich vn&uacute;torn&eacute; konflikty a vzťahy.</p>\r\n<h2>Jedinečn&yacute; svet a atmosf&eacute;ra</h2>\r\n<p>Hern&yacute; svet Expedition 33 je in&scaron;pirovan&yacute; umeleck&yacute;mi smermi ako surrealizmus a belle &eacute;poque, č&iacute;m vytv&aacute;ra nezameniteľn&uacute; atmosf&eacute;ru pln&uacute; kontrastov. Kr&aacute;sa a rozklad tu existuj&uacute; bok po boku a každ&yacute; nov&yacute; regi&oacute;n rozpr&aacute;va vlastn&yacute; pr&iacute;beh bez potreby slov.</p>\r\n<p>Prostredia s&uacute; bohat&eacute; na detaily a podporuj&uacute; pocit melanch&oacute;lie, ktor&yacute; sa nesie celou hrou. Hudobn&yacute; sprievod podčiarkuje em&oacute;cie a umocňuje dramatick&eacute; momenty pr&iacute;behu.</p>\r\n<h2>S&uacute;bojov&yacute; syst&eacute;m</h2>\r\n<p>Hra využ&iacute;va modern&yacute; ťahov&yacute; s&uacute;bojov&yacute; syst&eacute;m obohaten&yacute; o prvky v re&aacute;lnom čase. Spr&aacute;vne načasovanie &uacute;tokov, obrany a &scaron;peci&aacute;lnych schopnost&iacute; m&aacute; z&aacute;sadn&yacute; vplyv na priebeh boja. Každ&aacute; postava m&aacute; vlastn&eacute; schopnosti a &scaron;t&yacute;l boja, čo umožňuje strategick&eacute; kombin&aacute;cie a r&ocirc;zne hern&eacute; pr&iacute;stupy.</p>\r\n<ul>\r\n<li>Taktick&eacute; ťahov&eacute; s&uacute;boje s dynamick&yacute;mi prvkami</li>\r\n<li>Unik&aacute;tne schopnosti jednotliv&yacute;ch členov exped&iacute;cie</li>\r\n<li>Postupn&eacute; odhaľovanie siln&yacute;ch aj slab&yacute;ch str&aacute;nok nepriateľov</li>\r\n</ul>\r\n<h2>Postavy a pr&iacute;beh</h2>\r\n<p>Členovia Expedition 33 nie s&uacute; len bojovn&iacute;ci, ale ľudia s vlastn&yacute;mi obavami, spomienkami a motiv&aacute;ciami. Počas hry sa ich pr&iacute;behy prehlbuj&uacute; prostredn&iacute;ctvom dial&oacute;gov a kľ&uacute;čov&yacute;ch rozhodnut&iacute;.</p>\r\n<p>Hr&aacute;čove voľby m&ocirc;žu ovplyvniť nielen vzťahy medzi postavami, ale aj samotn&yacute; v&yacute;voj pr&iacute;behu. Mor&aacute;lne dilemy často nemaj&uacute; jednoznačne spr&aacute;vne rie&scaron;enie a n&uacute;tia zamyslieť sa nad n&aacute;sledkami vlastn&yacute;ch činov.</p>\r\n<h2>Hlavn&eacute; prvky hry</h2>\r\n<ul>\r\n<li><span style=\"background-color: #ffffff; color: #000000;\">Siln&yacute; pr&iacute;behov&yacute; z&aacute;žitok zameran&yacute; na em&oacute;cie a atmosf&eacute;ru</span></li>\r\n<li><span style=\"background-color: #ffffff; color: #000000;\">Origin&aacute;lny umeleck&yacute; &scaron;t&yacute;l a jedinečn&yacute; svet</span></li>\r\n<li><span style=\"background-color: #ffffff; color: #000000;\">Prepracovan&yacute; s&uacute;bojov&yacute; syst&eacute;m s taktickou hĺbkou</span></li>\r\n<li><span style=\"background-color: #ffffff; color: #000000;\">Zapam&auml;tateľn&eacute; postavy a dospel&eacute; t&eacute;my</span></li>\r\n<li><span style=\"background-color: #ffffff; color: #000000;\">D&ocirc;raz na rozhodnutia a ich n&aacute;sledky</span></li>\r\n</ul>\r\n<h2>Z&aacute;ver</h2>\r\n<p>Expedition 33 je hra, ktor&aacute; sa neboj&iacute; kl&aacute;sť ťažk&eacute; ot&aacute;zky a rozpr&aacute;vať pr&iacute;beh o pominuteľnosti života a sile ľudskej v&ocirc;le. Je určen&aacute; hr&aacute;čom, ktor&iacute; hľadaj&uacute; viac než len akciu &ndash; chc&uacute; hlbok&yacute; z&aacute;žitok, ktor&yacute; v nich zanech&aacute; stopu e&scaron;te dlho po dohran&iacute;.</p>', 0);

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
(20, 4),
(21, 4),
(23, 5),
(24, 5),
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
(75, 23);

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
(32, 'User', 'User', 'admin@outlook.sk', '+421329027', 33, 7, 2);

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
(32, '2026-01-15 17:43:37', '2026-01-15 17:45:31', 32, 4, 'Doručené', 169.97);

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
(32, 75, 2, 3);

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
(4, 'Nintendo');

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
(1, 59, 0),
(1, 61, 7),
(1, 63, 9),
(1, 75, 10),
(2, 3, 6),
(2, 4, 10),
(2, 25, 0),
(2, 27, 7),
(2, 28, 6),
(2, 29, 8),
(2, 30, 6),
(2, 32, 6),
(2, 33, 7),
(2, 34, 8),
(2, 35, 7),
(2, 36, 9),
(2, 37, 8),
(2, 38, 6),
(2, 39, 5),
(2, 40, 7),
(2, 41, 6),
(2, 42, 5),
(2, 43, 6),
(2, 45, 6),
(2, 46, 7),
(2, 47, 6),
(2, 48, 5),
(2, 49, 7),
(2, 50, 7),
(2, 59, 0),
(2, 61, 6),
(2, 63, 7),
(2, 75, 10),
(3, 3, 5),
(3, 25, 0),
(3, 26, 6),
(3, 27, 6),
(3, 28, 5),
(3, 29, 7),
(3, 30, 5),
(3, 31, 12),
(3, 32, 5),
(3, 33, 6),
(3, 40, 8),
(3, 41, 7),
(3, 42, 7),
(3, 43, 7),
(3, 44, 12),
(3, 45, 3),
(3, 46, 8),
(3, 47, 7),
(3, 48, 6),
(3, 49, 8),
(3, 50, 8),
(3, 59, 0),
(3, 61, 6),
(3, 63, 8),
(3, 75, 8),
(4, 1, 10),
(4, 2, 0),
(4, 5, 15),
(4, 21, 18),
(4, 25, 0),
(4, 59, 0);

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
(6, 'http://localhost/GameSpace/img/user/slideshow_6966543312608.jpg', 'starfield', '2026-01-13 13:37:23', '2026-01-15 13:31:10', '/hry/starfield');

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
  MODIFY `idAddress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pre tabuľku `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pre tabuľku `footer`
--
ALTER TABLE `footer`
  MODIFY `idFooter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pre tabuľku `items`
--
ALTER TABLE `items`
  MODIFY `idItems` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT pre tabuľku `most_anticipated`
--
ALTER TABLE `most_anticipated`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `idOrderDetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pre tabuľku `orders`
--
ALTER TABLE `orders`
  MODIFY `idOrders` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pre tabuľku `payment`
--
ALTER TABLE `payment`
  MODIFY `idPayment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pre tabuľku `platform`
--
ALTER TABLE `platform`
  MODIFY `platform_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pre tabuľku `reviews`
--
ALTER TABLE `reviews`
  MODIFY `reviews_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pre tabuľku `role`
--
ALTER TABLE `role`
  MODIFY `idrole` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pre tabuľku `slideshow`
--
ALTER TABLE `slideshow`
  MODIFY `idSlideshow` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- Obmedzenie pre tabuľku `orders_has_items`
--
ALTER TABLE `orders_has_items`
  ADD CONSTRAINT `fk_Orders_has_Items_Items` FOREIGN KEY (`Items_idItems`) REFERENCES `items` (`idItems`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Orders_has_Items_Orders` FOREIGN KEY (`Orders_idOrders`) REFERENCES `orders` (`idOrders`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_platform` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`platform_id`);

--
-- Obmedzenie pre tabuľku `platform_has_items`
--
ALTER TABLE `platform_has_items`
  ADD CONSTRAINT `platform_has_items_ibfk_1` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`platform_id`),
  ADD CONSTRAINT `platform_has_items_ibfk_2` FOREIGN KEY (`idItems`) REFERENCES `items` (`idItems`);

--
-- Obmedzenie pre tabuľku `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`idUsers`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`idItems`);

--
-- Obmedzenie pre tabuľku `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_Users_Address` FOREIGN KEY (`Address_idAddress`) REFERENCES `address` (`idAddress`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Users_role` FOREIGN KEY (`role_idrole`) REFERENCES `role` (`idrole`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_address` FOREIGN KEY (`Address_idAddress`) REFERENCES `address` (`idAddress`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
