-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Út 09.Dec 2025, 09:06
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
  `state` varchar(70) NOT NULL,
  `city` varchar(60) NOT NULL,
  `postal_code` varchar(15) NOT NULL,
  `street` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `category`
--

CREATE TABLE `category` (
  `idCategory` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `category`
--

INSERT INTO `category` (`idCategory`, `name`, `parent_id`) VALUES
(1, 'Hry', NULL),
(2, 'Notebooky a PC', NULL),
(3, 'Príslušenstvo', NULL),
(4, 'Konzoly', NULL),
(5, 'Doplnky', NULL),
(6, 'PC Hry', 1),
(7, 'Xbox Hry', 1),
(8, 'Nintendo Hry', 1),
(9, 'Playstation Hry', 1);

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
  `release_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `items`
--

INSERT INTO `items` (`idItems`, `name`, `price`, `description`, `image`, `created_at`, `last_update`, `available`, `alt`, `release_date`) VALUES
(1, 'The Legend of Zelda: Breath of the Wild', 59.99, 'Open-world action-adventure game set in Hyrule.', 'http://localhost/GameSpace/img/user/zelda.jpg', '2025-12-09 07:16:09', '2025-12-09 07:48:58', 'Na sklade', 'The Legend of Zelda: Breath of the Wild cover', '2017-03-03'),
(2, 'Minecraft', 26.95, 'Sandbox game about placing blocks and going on adventures.', 'http://localhost/GameSpace/img/user/minecraft.jpg', '2025-12-09 07:16:09', '2025-12-09 07:48:58', 'Na sklade', 'Minecraft cover', '2011-11-18'),
(3, 'Cyberpunk 2077', 49.99, 'Futuristic open-world RPG in a dystopian city.', 'http://localhost/GameSpace/img/user/cyberpunk2077.jpg', '2025-12-09 07:16:09', '2025-12-09 07:48:58', 'Na sklade', 'Cyberpunk 2077 cover', '2020-12-10'),
(4, 'God of War', 39.99, 'Action-adventure game following Kratos and his son.', 'http://localhost/GameSpace/img/user/god_of_war.jpg', '2025-12-09 07:16:09', '2025-12-09 07:48:58', 'Na sklade', 'God of War cover', '2018-04-20'),
(5, 'Among Us', 4.99, 'Multiplayer social deduction game set on a spaceship.', 'http://localhost/GameSpace/img/user/among_us.jpg', '2025-12-09 07:16:09', '2025-12-09 07:48:58', 'Na sklade', 'Among Us cover', '2018-06-15');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `items_has_category`
--

CREATE TABLE `items_has_category` (
  `Items_idItems` int(11) NOT NULL,
  `Category_idCategory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `orders_has_items`
--

CREATE TABLE `orders_has_items` (
  `Orders_idOrders` int(11) NOT NULL,
  `Items_idItems` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `role`
--

CREATE TABLE `role` (
  `idrole` int(11) NOT NULL,
  `name` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `slideshow`
--

CREATE TABLE `slideshow` (
  `idSlideshow` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `alt` varchar(120) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `slideshow`
--

INSERT INTO `slideshow` (`idSlideshow`, `img`, `alt`, `created_at`, `last_update`) VALUES
(1, 'http://localhost/GameSpace/img/user/god_of_war.jpg', 'God Of War', '2025-12-07 11:33:50', '2025-12-07 12:15:27'),
(2, 'http://localhost/GameSpace/img/user/expedition_33.jpg', 'Expedition 33', '2025-12-07 11:34:27', '2025-12-07 12:14:36');

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
  `Address_idAddress` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  ADD PRIMARY KEY (`idItems`);

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
  MODIFY `idAddress` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `idItems` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `most_anticipated`
--
ALTER TABLE `most_anticipated`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `idOrderDetail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `orders`
--
ALTER TABLE `orders`
  MODIFY `idOrders` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `payment`
--
ALTER TABLE `payment`
  MODIFY `idPayment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `role`
--
ALTER TABLE `role`
  MODIFY `idrole` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `slideshow`
--
ALTER TABLE `slideshow`
  MODIFY `idSlideshow` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pre tabuľku `transport`
--
ALTER TABLE `transport`
  MODIFY `idTransport` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `users`
--
ALTER TABLE `users`
  MODIFY `idUsers` int(11) NOT NULL AUTO_INCREMENT;

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
-- Obmedzenie pre tabuľku `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_Users_Address` FOREIGN KEY (`Address_idAddress`) REFERENCES `address` (`idAddress`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Users_role` FOREIGN KEY (`role_idrole`) REFERENCES `role` (`idrole`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
