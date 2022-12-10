-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 10 Gru 2022, 09:37
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `shop`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `address`
--

CREATE TABLE `address` (
  `id_address` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `city` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `street` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `zip_code` char(6) COLLATE utf8mb4_polish_ci NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `address`
--

INSERT INTO `address` (`id_address`, `id_user`, `city`, `street`, `zip_code`, `address_id`) VALUES
(1, 1, 'Warszawa', 'Anielewicza', '11-987', 2),
(2, 1, 'Kraków', 'Krakowska', '23-098', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `basket`
--

CREATE TABLE `basket` (
  `id_basket` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_add` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `basket`
--

INSERT INTO `basket` (`id_basket`, `id_product`, `id_user`, `date_add`) VALUES
(1, 1, 1, '2022-11-19 16:08:29'),
(2, 2, 2, '2022-11-19 16:08:47');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_polish_ci NOT NULL,
  `description` text COLLATE utf8mb4_polish_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `date_add` datetime NOT NULL DEFAULT current_timestamp(),
  `picture` varchar(30) COLLATE utf8mb4_polish_ci NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `price`, `date_add`, `picture`, `supplier_id`) VALUES
(1, 'Telewizor LG 1000V.', 'Najlepszy TV.', '3999.99', '2022-11-19 16:08:02', 'lg.jpeg', 1),
(2, 'Laptop Lenovo 3000P', 'Fajny laptop', '4900.00', '2022-11-19 16:08:44', 'laptop.png', 3),
(3, 'Telewizor LG 2000V.', 'Najlepszy TV 2.', '4999.99', '2022-11-20 15:17:13', 'lg2.jpeg', 1),
(4, 'Laptop HP 1000V', 'Fajny laptop 2', '5999.00', '2022-11-19 16:08:44', 'laptop.png', 2),
(5, 'Telewizor SONY 4000VA.', 'Najlepszy TV Sony.', '6999.99', '2022-11-20 16:08:02', 'lg4.jpeg', 2);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `productsupplier`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `productsupplier` (
`nazwa_towaru` varchar(150)
,`nazwa_dostawcy` varchar(100)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_polish_ci NOT NULL,
  `telephone` varchar(12) COLLATE utf8mb4_polish_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `name`, `telephone`, `email`) VALUES
(1, 'Dostawca1', '123654789', 'dostawca1@firma.pl'),
(2, 'Dostawca2', '123432123', 'dostawca2@firma.pl'),
(3, 'Dostawca3', '123456789', 'dostawca3@firma.pl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `type_address`
--

CREATE TABLE `type_address` (
  `address_id` int(11) NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `type_address`
--

INSERT INTO `type_address` (`address_id`, `type`) VALUES
(1, 'zamieszkania'),
(2, 'faktury'),
(3, 'dostawy'),
(4, 'typ 2'),
(5, 'typ 3');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `login` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL,
  `pass` varchar(40) COLLATE utf8mb4_polish_ci NOT NULL,
  `first_name` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL,
  `last_name` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_polish_ci NOT NULL,
  `date_mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id_user`, `login`, `pass`, `first_name`, `last_name`, `email`, `date_mod`) VALUES
(1, 'fkakol', '929091acb5f995a3477876f35467cee5f25eb4a5', 'Filips', 'Kakol', 'fkakol@wp.pl', '2022-12-04 13:45:43'),
(2, 'jnowak', '9ccbef383120409c1c209b777bcdecd53d3bfec2', 'Jan', 'Nowak', 'jnowak@jnowak.pl', NULL),
(3, 'anowak', 'gdsgfsdgs', 'Anna ', 'Nowak', 'asdf@dasdpl', NULL),
(4, 'znowak', 'dsfsfd', 'Zbyszek', 'Nowak', 'znowak@wp.pl', NULL);

--
-- Wyzwalacze `users`
--
DELIMITER $$
CREATE TRIGGER `data_modyfikacji` BEFORE UPDATE ON `users` FOR EACH ROW SET NEW.date_mod = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura widoku `productsupplier`
--
DROP TABLE IF EXISTS `productsupplier`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `productsupplier`  AS SELECT `products`.`name` AS `nazwa_towaru`, `supplier`.`name` AS `nazwa_dostawcy` FROM (`products` join `supplier` on(`products`.`supplier_id` = `supplier`.`supplier_id`))  ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id_address`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `address_id` (`address_id`);

--
-- Indeksy dla tabeli `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id_basket`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indeksy dla tabeli `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indeksy dla tabeli `type_address`
--
ALTER TABLE `type_address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `address`
--
ALTER TABLE `address`
  MODIFY `id_address` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `basket`
--
ALTER TABLE `basket`
  MODIFY `id_basket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `type_address`
--
ALTER TABLE `type_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `type_address` (`address_id`);

--
-- Ograniczenia dla tabeli `basket`
--
ALTER TABLE `basket`
  ADD CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `basket_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`product_id`);

--
-- Ograniczenia dla tabeli `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
