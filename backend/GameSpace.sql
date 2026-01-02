-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Pi 02.Jan 2026, 18:48
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
(1, 'First', 'adssadasdasdasdasds', '2025-12-07 12:23:40', '2025-12-07 12:23:40'),
(2, 'Second', 'asdasdasdsadasdsadsafasf', '2025-12-07 12:23:40', '2025-12-07 12:23:40');

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
(16, 'asd', '12345', 'asf', '2025-12-27 14:27:50', '2025-12-27 14:27:56'),
(17, 'Male', '95182', 'Velke', '2025-12-27 14:47:03', '2025-12-27 14:47:03');

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
(6, 'PC Hry', 1, 'pc-hry'),
(7, 'Xbox Hry', 1, 'xbox-hry'),
(8, 'Nintendo Hry', 1, 'nintendo-hry'),
(9, 'Playstation Hry', 1, 'playstation-hry');

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
  `available` varchar(255) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `html_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `items`
--

INSERT INTO `items` (`idItems`, `name`, `price`, `description`, `image`, `created_at`, `last_update`, `available`, `alt`, `release_date`, `slug`, `stock`, `html_description`) VALUES
(1, 'The Legend of Zelda: Breath of the Wild', 59.99, 'Open-world action-adventure game set in Hyrule.', 'http://localhost/GameSpace/img/user/zelda.jpg', '2025-12-09 07:16:09', '2025-12-27 14:47:03', 'Na sklade', 'The Legend of Zelda: Breath of the Wild cover', '2017-03-03', 'the-legend-of-zelda-breath-of-the-wild', 3, ''),
(2, 'Minecraft', 26.95, 'Sandbox game about placing blocks and going on adventures.', 'http://localhost/GameSpace/img/user/minecraft.jpg', '2025-12-09 07:16:09', '2025-12-16 14:08:27', 'Nie je na sklade', 'Minecraft cover', '2011-11-18', 'minecraft', 0, ''),
(3, 'Cyberpunk 2077', 49.99, 'Futuristic open-world RPG in a dystopian city.', 'http://localhost/GameSpace/img/user/cyberpunk2077.jpg', '2025-12-09 07:16:09', '2025-12-21 12:40:31', 'Na sklade', 'Cyberpunk 2077 cover', '2020-12-10', 'cyberpunk-2077', 3, ''),
(4, 'God of War', 39.99, 'Action-adventure game following Kratos and his son.', 'http://localhost/GameSpace/img/user/god_of_war.jpg', '2025-12-09 07:16:09', '2025-12-15 09:50:12', 'Nie je na sklade', 'God of War cover', '2018-04-20', 'god-of-war', 10, ''),
(5, 'Among Us', 4.99, 'Multiplayer social deduction game set on a spaceship.', 'http://localhost/GameSpace/img/user/among_us.jpg', '2025-12-09 07:16:09', '2025-12-15 09:50:12', 'Na sklade', 'Among Us cover', '2018-06-15', 'among-us', 10, ''),
(6, 'UltraBook Pro 14\"', 1299.99, 'Lightweight 14-inch ultrabook with 16GB RAM and 512GB SSD.', 'ultrabook_pro_14.jpg', '2025-12-11 09:09:12', '2025-12-15 09:50:12', 'Na sklade', 'UltraBook Pro 14\" laptop', '2025-01-15', 'ultrabook-pro-14', 10, ''),
(7, 'Gaming Beast 17\"', 2199, 'High-end gaming laptop with RTX 4080 and 32GB RAM.', 'gaming_beast_17.jpg', '2025-12-11 09:09:12', '2025-12-15 09:50:12', 'Na sklade', 'Gaming Beast 17\" laptop', '2025-02-10', 'gaming-beast-17', 10, ''),
(8, 'OfficeMate 15\"', 899.5, 'Reliable notebook for office tasks with 16GB RAM and 256GB SSD.', 'officemate_15.jpg', '2025-12-11 09:09:12', '2025-12-15 09:50:12', 'Na sklade', 'OfficeMate 15\" laptop', '2025-03-05', 'officemate-15', 10, ''),
(9, 'CompactBook 13\"', 749.99, 'Ultra-portable 13-inch notebook with long battery life.', 'compactbook_13.jpg', '2025-12-11 09:09:12', '2025-12-15 09:50:12', 'Na sklade', 'CompactBook 13\" laptop', '2025-01-22', 'compactbook-13', 10, ''),
(10, 'PowerStation 15\"', 1599.99, 'Powerful 15-inch PC laptop with 32GB RAM and 1TB SSD.', 'powerstation_15.jpg', '2025-12-11 09:09:12', '2025-12-15 09:50:12', 'Na sklade', 'PowerStation 15\" laptop', '2025-04-01', 'powerstation-15', 10, ''),
(11, 'Notebook X1', 1199, 'Slim notebook with touchscreen and 16GB RAM.', 'notebook_x1.jpg', '2025-12-11 09:09:12', '2025-12-15 09:50:12', 'Na sklade', 'Notebook X1 touchscreen laptop', '2025-02-28', 'notebook-x1', 10, ''),
(12, 'Gaming Mini 15\"', 1999.99, 'Compact gaming notebook with RTX 4070 and 16GB RAM.', 'gaming_mini_15.jpg', '2025-12-11 09:09:12', '2025-12-15 09:50:12', 'Na sklade', 'Gaming Mini 15\" laptop', '2025-03-12', 'gaming-mini-15', 10, ''),
(13, 'EcoBook 14\"', 679.5, 'Eco-friendly notebook with energy-efficient processor.', 'ecobook_14.jpg', '2025-12-11 09:09:12', '2025-12-15 09:50:12', 'Na sklade', 'EcoBook 14\" laptop', '2025-04-05', 'ecobook-14', 10, ''),
(14, 'ProStation 16\"', 1899.99, 'Professional workstation laptop with 64GB RAM.', 'prostation_16.jpg', '2025-12-11 09:09:12', '2025-12-15 09:50:12', 'Na sklade', 'ProStation 16\" laptop', '2025-01-30', 'prostation-16', 10, ''),
(15, 'TravelBook 13\"', 799.99, 'Light and portable notebook ideal for travel.', 'travelbook_13.jpg', '2025-12-11 09:09:12', '2025-12-15 09:50:12', 'Na sklade', 'TravelBook 13\" laptop', '2025-02-20', 'travelbook-13', 10, ''),
(16, 'Gaming Mouse X200', 49.99, 'High-precision gaming mouse with RGB lighting.', 'gaming_mouse_x200.jpg', '2025-12-11 09:33:33', '2025-12-15 09:50:12', 'Na sklade', 'Gaming Mouse X200', '2025-05-10', 'gaming-mouse-x200', 10, ''),
(17, 'Mechanical Keyboard K75', 89.99, 'Mechanical keyboard with customizable RGB keys.', 'mechanical_keyboard_k75.jpg', '2025-12-11 09:33:33', '2025-12-15 09:50:12', 'Na sklade', 'Mechanical Keyboard K75', '2025-06-01', 'mechanical-keyboard-k75', 10, ''),
(18, 'Wireless Headset H7', 79.99, 'Wireless headset with surround sound.', 'wireless_headset_h7.jpg', '2025-12-11 09:33:33', '2025-12-15 09:50:12', 'Na sklade', 'Wireless Headset H7', '2025-07-15', 'wireless-headset-h7', 10, ''),
(19, 'PlayStation 5', 499.99, 'Next-gen PlayStation console with ultra-fast SSD and 4K gaming.', 'playstation_5.jpg', '2025-12-11 09:35:48', '2025-12-15 09:50:12', 'Na sklade', 'PlayStation 5 console', '2020-11-12', 'playstation-5', 10, ''),
(20, 'Xbox Series X', 499.99, 'Powerful next-gen Xbox console with ray tracing and 4K gaming.', 'xbox_series_x.jpg', '2025-12-11 09:35:48', '2025-12-15 09:50:12', 'Na sklade', 'Xbox Series X console', '2020-11-10', 'xbox-series-x', 10, ''),
(21, 'Nintendo Switch OLED', 349.99, 'Portable Nintendo Switch console with OLED display and enhanced audio.', 'nintendo_switch_oled.jpg', '2025-12-11 09:35:48', '2025-12-15 09:50:12', 'Na sklade', 'Nintendo Switch OLED', '2021-10-08', 'nintendo-switch-oled', 10, ''),
(22, 'Xbox Game Pass Ultimate', 12.99, 'Monthly subscription giving access to over 100 games on Xbox and PC.', 'xbox_game_pass.jpg', '2025-12-11 09:36:32', '2025-12-15 09:50:12', 'Na sklade', 'Xbox Game Pass Ultimate', '2021-06-01', 'xbox-game-pass-ultimate', 10, ''),
(23, 'PlayStation Plus Premium', 14.99, 'Monthly subscription with access to classic games and cloud streaming.', 'ps_plus_premium.jpg', '2025-12-11 09:36:32', '2025-12-15 09:50:12', 'Na sklade', 'PlayStation Plus Premium', '2021-07-15', 'playstation-plus-premium', 10, ''),
(24, 'Steam Gift Card 50€', 50, 'Gift card redeemable on Steam for games and content.', 'steam_gift_card_50.jpg', '2025-12-11 09:36:32', '2025-12-15 09:50:12', 'Na sklade', 'Steam Gift Card 50€', '2022-01-10', 'steam-gift-card-50', 10, ''),
(25, 'Red Dead Redemption 2', 49.99, 'Epic Western action-adventure game by Rockstar Games.', 'rdr2.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Red Dead Redemption 2 cover', '2018-10-26', 'red-dead-redemption-2', 10, ''),
(26, 'The Witcher 3: Wild Hunt', 29.99, 'Open-world RPG following Geralt of Rivia.', 'witcher3.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'The Witcher 3 cover', '2015-05-19', 'the-witcher-3', 10, ''),
(27, 'Elden Ring', 59.99, 'Open-world action RPG by FromSoftware and George R. R. Martin.', 'elden_ring.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Elden Ring cover', '2022-02-25', 'elden-ring', 10, ''),
(28, 'Hogwarts Legacy', 69.99, 'Open-world RPG set in the Harry Potter universe.', 'hogwarts_legacy.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Hogwarts Legacy cover', '2023-02-10', 'hogwarts-legacy', 10, ''),
(29, 'Grand Theft Auto V', 19.99, 'Action-adventure game set in Los Santos.', 'gta_v.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'GTA V cover', '2013-09-17', 'grand-theft-auto-v', 10, ''),
(30, 'Baldur\'s Gate 3', 69.99, 'Top-tier CRPG based on D&D rules.', 'bg3.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Baldur\'s Gate 3 cover', '2023-08-03', 'baldurs-gate-3', 10, ''),
(31, 'Starfield', 69.99, 'Space open-world RPG by Bethesda.', 'starfield.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Starfield cover', '2023-09-06', 'starfield', 10, ''),
(32, 'Assassin\'s Creed Valhalla', 39.99, 'Viking adventure in Assassin\'s Creed franchise.', 'ac_valhalla.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Assassin\'s Creed Valhalla cover', '2020-11-10', 'assassins-creed-valhalla', 10, ''),
(33, 'Far Cry 6', 49.99, 'Open-world shooter set on Yara.', 'far_cry_6.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Far Cry 6 cover', '2021-10-07', 'far-cry-6', 10, ''),
(34, 'The Last of Us Part I', 69.99, 'Remake of the iconic survival adventure.', 'tlou_part1.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'The Last of Us Part I cover', '2022-09-02', 'the-last-of-us-part-1', 10, ''),
(35, 'The Last of Us Part II', 39.99, 'Emotional action-adventure set in a post-apocalypse.', 'tlou_part2.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'The Last of Us Part II cover', '2020-06-19', 'the-last-of-us-part-2', 10, ''),
(36, 'Ghost of Tsushima', 49.99, 'Samurai open-world game set in feudal Japan.', 'ghost_of_tsushima.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Ghost of Tsushima cover', '2020-07-17', 'ghost-of-tsushima', 10, ''),
(37, 'Horizon Forbidden West', 59.99, 'Sci-fi open-world adventure with Aloy.', 'hfw.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Horizon Forbidden West cover', '2022-02-18', 'horizon-forbidden-west', 10, ''),
(38, 'Spider-Man Remastered', 49.99, 'Superhero action game by Insomniac.', 'spiderman_remastered.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Spider-Man Remastered cover', '2020-11-12', 'spider-man-remastered', 10, ''),
(39, 'Spider-Man: Miles Morales', 39.99, 'Standalone spin-off starring Miles.', 'miles_morales.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Spider-Man Miles Morales cover', '2020-11-12', 'spider-man-miles-morales', 10, ''),
(40, 'Call of Duty: Modern Warfare II', 69.99, 'FPS reboot sequel from Infinity Ward.', 'mw2_2022.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'MW2 2022 cover', '2022-10-28', 'cod-modern-warfare-2', 10, ''),
(41, 'Call of Duty: Black Ops Cold War', 49.99, 'Cold War-era shooter in CoD series.', 'cold_war.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Cold War cover', '2020-11-13', 'cod-black-ops-cold-war', 10, ''),
(42, 'Battlefield 2042', 29.99, 'Large-scale modern warfare shooter.', 'bf2042.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Battlefield 2042 cover', '2021-11-19', 'battlefield-2042', 10, ''),
(43, 'Doom Eternal', 29.99, 'Fast-paced demon-slaying FPS.', 'doom_eternal.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Doom Eternal cover', '2020-03-20', 'doom-eternal', 10, ''),
(44, 'Forza Horizon 5', 59.99, 'Open-world racing in Mexico.', 'fh5.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Forza Horizon 5 cover', '2021-11-09', 'forza-horizon-5', 10, ''),
(45, 'FIFA 24', 69.99, 'Latest football simulation entry.', 'fifa24.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'FIFA 24 cover', '2023-09-29', 'fifa-24', 10, ''),
(46, 'NBA 2K24', 59.99, 'Basketball simulation by 2K Sports.', 'nba2k24.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'NBA 2K24 cover', '2023-09-08', 'nba-2k24', 10, ''),
(47, 'Mortal Kombat 1', 59.99, 'Reboot of the iconic fighting game.', 'mk1.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Mortal Kombat 1 cover', '2023-09-19', 'mortal-kombat-1', 10, ''),
(48, 'Tekken 8', 69.99, 'Latest entry in Tekken fighting franchise.', 'tekken8.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Tekken 8 cover', '2024-01-26', 'tekken-8', 10, ''),
(49, 'Street Fighter 6', 59.99, 'Capcom’s newest fighting game.', 'sf6.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Street Fighter 6 cover', '2023-06-02', 'street-fighter-6', 10, ''),
(50, 'Diablo IV', 69.99, 'Dark action RPG by Blizzard.', 'diablo4.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Diablo IV cover', '2023-06-06', 'diablo-4', 10, ''),
(51, 'Overwatch 2', 0, 'Team-based online FPS, free-to-play.', 'overwatch2.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Overwatch 2 cover', '2022-10-04', 'overwatch-2', 10, ''),
(52, 'Apex Legends', 0, 'Free-to-play battle royale.', 'apex_legends.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Apex Legends cover', '2019-02-04', 'apex-legends', 10, ''),
(53, 'Fortnite', 0, 'Battle royale phenomenon.', 'fortnite.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Fortnite cover', '2017-07-21', 'fortnite', 10, ''),
(54, 'PUBG: Battlegrounds', 0, 'Popular battle royale shooter.', 'pubg.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'PUBG cover', '2017-12-20', 'pubg-battlegrounds', 10, ''),
(55, 'League of Legends', 0, 'MOBA played worldwide.', 'lol.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'League of Legends cover', '2009-10-27', 'league-of-legends', 10, ''),
(56, 'Counter-Strike 2', 0, 'Tactical FPS and successor to CS:GO.', 'cs2.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Counter-Strike 2 cover', '2023-09-27', 'counter-strike-2', 10, ''),
(57, 'Valorant', 0, 'Character-based tactical FPS.', 'valorant.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Valorant cover', '2020-06-02', 'valorant', 10, ''),
(58, 'Genshin Impact', 0, 'Anime open-world action RPG.', 'genshin.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Genshin Impact cover', '2020-09-28', 'genshin-impact', 10, ''),
(59, 'Star Wars Jedi: Survivor', 69.99, 'Action-adventure starring Cal Kestis.', 'sw_jedi_survivor.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Star Wars Jedi Survivor cover', '2023-04-28', 'star-wars-jedi-survivor', 10, ''),
(60, 'Star Wars Jedi: Fallen Order', 19.99, 'Action-adventure prequel to Survivor.', 'fallen_order.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Star Wars Jedi Fallen Order cover', '2019-11-15', 'star-wars-jedi-fallen-order', 10, ''),
(61, 'Dead Space Remake', 59.99, 'Horror sci-fi remake by EA Motive.', 'dead_space_remake.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Dead Space Remake cover', '2023-01-27', 'dead-space-remake', 10, ''),
(62, 'Resident Evil 4 Remake', 59.99, 'Remake of the classic 2005 game.', 're4_remake.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Resident Evil 4 Remake cover', '2023-03-24', 'resident-evil-4-remake', 10, ''),
(63, 'Resident Evil Village', 39.99, 'First-person survival horror.', 're_village.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Resident Evil Village cover', '2021-05-07', 'resident-evil-village', 10, ''),
(64, 'Cyberpunk 2077: Phantom Liberty', 29.99, 'Expansion for Cyberpunk 2077.', 'phantom_liberty.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Phantom Liberty cover', '2023-09-26', 'cyberpunk-2077-phantom-liberty', 10, ''),
(65, 'Death Stranding', 29.99, 'Open-world walking adventure by Kojima.', 'death_stranding.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Death Stranding cover', '2019-11-08', 'death-stranding', 10, ''),
(66, 'Deathloop', 39.99, 'Time-loop FPS with stylish design.', 'deathloop.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Deathloop cover', '2021-09-14', 'deathloop', 10, ''),
(67, 'Control', 29.99, 'Supernatural third-person adventure.', 'control.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Control cover', '2019-08-27', 'control', 10, ''),
(68, 'Alan Wake 2', 69.99, 'Survival horror sequel by Remedy.', 'alan_wake_2.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Alan Wake 2 cover', '2023-10-27', 'alan-wake-2', 10, ''),
(69, 'Alan Wake Remastered', 29.99, 'Enhanced version of the original game.', 'alan_wake_remastered.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Alan Wake Remastered cover', '2021-10-05', 'alan-wake-remastered', 10, ''),
(70, 'S.T.A.L.K.E.R. 2: Heart of Chornobyl', 69.99, 'Post-apocalyptic FPS survival game.', 'stalker2.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'S.T.A.L.K.E.R. 2 cover', '2024-09-05', 'stalker-2-heart-of-chornobyl', 10, ''),
(71, 'Metro Exodus', 19.99, 'Post-apocalyptic FPS with survival elements.', 'metro_exodus.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Metro Exodus cover', '2019-02-15', 'metro-exodus', 10, ''),
(72, 'Monster Hunter: World', 29.99, 'Action RPG about hunting massive beasts.', 'mhw.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Monster Hunter World cover', '2018-01-26', 'monster-hunter-world', 10, ''),
(73, 'Monster Hunter Rise', 39.99, 'Fast-paced monster hunting adventure.', 'mhrise.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Monster Hunter Rise cover', '2021-03-26', 'monster-hunter-rise', 10, ''),
(74, 'Dark Souls III', 29.99, 'Challenging dark fantasy action RPG.', 'dark_souls_3.jpg', '2025-12-12 14:19:10', '2025-12-15 09:50:12', 'Na sklade', 'Dark Souls III cover', '2016-03-24', 'dark-souls-3', 10, ''),
(75, 'Clair Obscur: Expedition 33', 49.99, '„Rok čo rok nás vymazáva.“ Veďte členov Expedície 33 na ich ceste za zničením Paintress, aby už nikdy nemohla maľovať smrť. Preskúmajte svet zázrakov inšpirovaný Belle Époque France a bojujte s jedinečnými nepriateľmi v tomto ťahovom RPG s mechanikou v reálnom čase. Raz do roka sa Paintress zobudí a namaľuje na svoj monolit.', 'http://localhost/GameSpace/img/user/expedition_33_1.jpg', '2025-12-21 11:54:56', '2025-12-27 14:47:03', 'Na sklade', 'expedition-33', '2025-04-25', 'expedition-33', 17, '<p>\r\n<strong>Expedition 33</strong> je atmosférická príbehová hra, ktorá spája hlboký naratív,\r\numelecký vizuálny štýl a moderný ťahový súbojový systém. Hráč sa ocitá v temnom,\r\nno fascinujúcom svete, kde každý rok záhadná entita známa ako Maliarka\r\nvymaže zo sveta ľudí, ktorí dosiahnu určitý vek. Tento rok padla voľba na číslo 33.\r\n</p>\r\n\r\n<p>\r\nAko člen poslednej expedície máte jedinú úlohu – zastaviť tento neúprosný cyklus\r\na čeliť osudu, ktorý sa zdá byť vopred napísaný. Každý krok vpred je sprevádzaný\r\notázkami o živote, smrti, obete a nádeji. Príbeh je rozprávaný emocionálne,\r\ns dôrazom na postavy, ich vnútorné konflikty a vzťahy.\r\n</p>\r\n\r\n<h2>Jedinečný svet a atmosféra</h2>\r\n\r\n<p>\r\nHerný svet Expedition 33 je inšpirovaný umeleckými smermi ako surrealizmus\r\na belle époque, čím vytvára nezameniteľnú atmosféru plnú kontrastov.\r\nKrása a rozklad tu existujú bok po boku a každý nový región rozpráva\r\nvlastný príbeh bez potreby slov.\r\n</p>\r\n\r\n<p>\r\nProstredia sú bohaté na detaily a podporujú pocit melanchólie,\r\nktorý sa nesie celou hrou. Hudobný sprievod podčiarkuje emócie\r\na umocňuje dramatické momenty príbehu.\r\n</p>\r\n\r\n<h2>Súbojový systém</h2>\r\n\r\n<p>\r\nHra využíva moderný ťahový súbojový systém obohatený o prvky v reálnom čase.\r\nSprávne načasovanie útokov, obrany a špeciálnych schopností má zásadný vplyv\r\nna priebeh boja. Každá postava má vlastné schopnosti a štýl boja,\r\nčo umožňuje strategické kombinácie a rôzne herné prístupy.\r\n</p>\r\n\r\n<ul>\r\n<li>Taktické ťahové súboje s dynamickými prvkami</li>\r\n<li>Unikátne schopnosti jednotlivých členov expedície</li>\r\n<li>Postupné odhaľovanie silných aj slabých stránok nepriateľov</li>\r\n</ul>\r\n\r\n<h2>Postavy a príbeh</h2>\r\n\r\n<p>\r\nČlenovia Expedition 33 nie sú len bojovníci, ale ľudia s vlastnými obavami,\r\nspomienkami a motiváciami. Počas hry sa ich príbehy prehlbujú\r\nprostredníctvom dialógov a kľúčových rozhodnutí.\r\n</p>\r\n\r\n<p>\r\nHráčove voľby môžu ovplyvniť nielen vzťahy medzi postavami,\r\nale aj samotný vývoj príbehu. Morálne dilemy často nemajú jednoznačne\r\nsprávne riešenie a nútia zamyslieť sa nad následkami vlastných činov.\r\n</p>\r\n\r\n<h2>Hlavné prvky hry</h2>\r\n\r\n<ul>\r\n<li>Silný príbehový zážitok zameraný na emócie a atmosféru</li>\r\n<li>Originálny umelecký štýl a jedinečný svet</li>\r\n<li>Prepracovaný súbojový systém s taktickou hĺbkou</li>\r\n<li>Zapamätateľné postavy a dospelé témy</li>\r\n<li>Dôraz na rozhodnutia a ich následky</li>\r\n</ul>\r\n\r\n<h2>Záver</h2>\r\n\r\n<p>\r\nExpedition 33 je hra, ktorá sa nebojí klásť ťažké otázky a rozprávať príbeh\r\no pominuteľnosti života a sile ľudskej vôle. Je určená hráčom,\r\nktorí hľadajú viac než len akciu – chcú hlboký zážitok,\r\nktorý v nich zanechá stopu ešte dlho po dohraní.\r\n</p>');

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
(3, 1),
(4, 1),
(5, 1),
(6, 2),
(7, 2),
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
(22, 5),
(23, 5),
(24, 5),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1);

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
(16, 'AAsf', 'Šima', 'admin@outlook.sk', '123456', 17, 6, 1);

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
(1, '2025-12-16 13:16:45', '2025-12-19 09:37:44', 1, 4, 'V príprave', 0),
(2, '2025-12-16 13:21:07', '2025-12-19 09:37:44', 2, 4, 'V príprave', 0),
(3, '2025-12-16 13:40:25', '2025-12-19 09:37:44', 3, 4, 'V príprave', 0),
(4, '2025-12-16 13:44:42', '2025-12-19 09:37:44', 4, 4, 'V príprave', 149.97),
(5, '2025-12-16 13:49:13', '2025-12-19 09:37:44', 5, 4, 'V príprave', 26.95),
(6, '2025-12-16 13:53:49', '2025-12-19 09:37:44', 6, 4, 'V príprave', 26.95),
(7, '2025-12-16 13:55:44', '2025-12-19 09:37:44', 7, 4, 'V príprave', 49.99),
(9, '2025-12-16 14:04:08', '2025-12-19 09:37:44', 9, 4, 'V príprave', 239.96),
(10, '2025-12-16 14:08:27', '2025-12-19 09:37:44', 10, 4, 'V príprave', 269.5),
(11, '2025-12-16 15:00:34', '2025-12-19 09:37:44', 11, 4, 'V príprave', 59.99),
(12, '2025-12-19 15:40:57', '2025-12-19 15:40:57', 12, NULL, 'V príprave', 49.99),
(13, '2025-12-21 12:40:31', '2025-12-21 12:40:31', 13, 4, 'V príprave', 299.94),
(14, '2025-12-25 15:20:14', '2025-12-25 15:20:14', 14, NULL, 'V príprave', 49.99),
(15, '2025-12-27 13:14:18', '2025-12-27 13:14:18', 15, NULL, 'V príprave', 109.98),
(16, '2025-12-27 14:47:03', '2025-12-27 14:47:03', 16, 4, 'V príprave', 109.98);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `orders_has_items`
--

CREATE TABLE `orders_has_items` (
  `Orders_idOrders` int(11) NOT NULL,
  `Items_idItems` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `orders_has_items`
--

INSERT INTO `orders_has_items` (`Orders_idOrders`, `Items_idItems`, `quantity`) VALUES
(4, 3, 3),
(5, 2, 1),
(6, 2, 1),
(7, 3, 1),
(9, 1, 4),
(10, 2, 10),
(11, 1, 1),
(12, 3, 1),
(13, 3, 6),
(14, 75, 1),
(15, 1, 1),
(15, 75, 1),
(16, 1, 1),
(16, 75, 1);

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
  `idItems` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `platform_has_items`
--

INSERT INTO `platform_has_items` (`platform_id`, `idItems`) VALUES
(1, 75);

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
(1, 'Hru Claire Obscur: Expedition 33 som si naozaj užil! Príbeh je veľmi emotívny a svet je nádherne spracovaný — akoby som prechádzal živou maľbou. Bojový systém je zábavný, keď si zvyknete načasovať útoky a úhyby, a postavy sú nezabudnuteľné. Spočiatku môže byť hra trochu pomalá a menu niekedy mätúce, ale celkovo ide o skvelé RPG. Určite odporúčam, ak máte radi príbehovo orientované hry.', 4, 4, 75),
(2, 'Hru Claire Obscur: Expedition 33 som si naozaj užil! Veľmi pútavý príbeh a nádherná grafika.', 5, 4, 75),
(3, 'Bojový systém je skvelý, aj keď spočiatku trochu zložitý. Odporúčam.', 4, 4, 75),
(4, 'Postavy sú veľmi zapamätateľné a príbeh emocionálne silný.', 5, 4, 75),
(5, 'Grafika a hudba sú úžasné, ale tempo hry je niekedy pomalé.', 4, 4, 75);

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
(3, 'http://localhost/GameSpace/img/user/cyberpunk2077_1.jpg', 'Cyberpunk 2077', '2025-12-21 12:15:45', '2025-12-21 12:15:45', '/hry/cyberpunk-2077');

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
(4, 'user', 'user', 'user@user.sk', '$2y$10$anDZQb3aYY/3D3tDgbks6uoVlsuE8xzi0uEw2KRoAOjg1uq7IPy/2', NULL, 1, 16, '2025-12-13 16:32:34', '2025-12-27 14:27:50', 0),
(5, 'Aadasd', 'Asdasd', 'fff@fff.sk', '$2y$10$IWMpHgYsjM.KZUjbda2Hn.WUb5OHYDCaPzoMHlM9tmMWRuHKuEE4q', NULL, 1, NULL, '2025-12-13 20:07:33', '2025-12-13 20:07:33', 0);

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
  ADD PRIMARY KEY (`Orders_idOrders`,`Items_idItems`),
  ADD KEY `fk_Orders_has_Items_Items_idx` (`Items_idItems`),
  ADD KEY `fk_Orders_has_Items_Orders_idx` (`Orders_idOrders`);

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
  MODIFY `idAccordion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pre tabuľku `address`
--
ALTER TABLE `address`
  MODIFY `idAddress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pre tabuľku `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pre tabuľku `footer`
--
ALTER TABLE `footer`
  MODIFY `idFooter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pre tabuľku `items`
--
ALTER TABLE `items`
  MODIFY `idItems` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT pre tabuľku `most_anticipated`
--
ALTER TABLE `most_anticipated`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `idOrderDetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pre tabuľku `orders`
--
ALTER TABLE `orders`
  MODIFY `idOrders` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `reviews_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pre tabuľku `role`
--
ALTER TABLE `role`
  MODIFY `idrole` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pre tabuľku `slideshow`
--
ALTER TABLE `slideshow`
  MODIFY `idSlideshow` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pre tabuľku `transport`
--
ALTER TABLE `transport`
  MODIFY `idTransport` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pre tabuľku `users`
--
ALTER TABLE `users`
  MODIFY `idUsers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  ADD CONSTRAINT `fk_Orders_has_Items_Orders` FOREIGN KEY (`Orders_idOrders`) REFERENCES `orders` (`idOrders`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
