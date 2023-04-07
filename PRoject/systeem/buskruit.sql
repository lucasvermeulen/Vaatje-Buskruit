-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2023 at 12:52 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buskruit`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikelgroep`
--

CREATE TABLE `artikelgroep` (
  `id` int(11) UNSIGNED NOT NULL,
  `artikelgroep_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `artikelgroep`
--

INSERT INTO `artikelgroep` (`id`, `artikelgroep_id`) VALUES
(1, 'Aardappels, groente en fruit'),
(2, 'Kaas,vleeswaren'),
(3, 'Broodbeleg'),
(4, 'Frisdrank'),
(5, 'Koffie'),
(6, 'Chips'),
(7, 'Koek');

-- --------------------------------------------------------

--
-- Table structure for table `bestelling`
--

CREATE TABLE `bestelling` (
  `id` int(11) NOT NULL,
  `gebruiker_id` int(11) NOT NULL,
  `datum` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bestelling`
--

INSERT INTO `bestelling` (`id`, `gebruiker_id`, `datum`) VALUES
(1, 0, '2023-04-04'),
(2, 1, '2023-04-04'),
(10, 1, '2023-04-04'),
(11, 1, '2023-04-04'),
(12, 1, '2023-04-04'),
(13, 1, '2023-04-04'),
(14, 1, '2023-04-04'),
(15, 1, '2023-04-04'),
(16, 1, '2023-04-04'),
(17, 1, '2023-04-04'),
(18, 1, '2023-04-04'),
(19, 1, '2023-04-04'),
(20, 1, '2023-04-04'),
(21, 1, '2023-04-04'),
(22, 1, '2023-04-04'),
(23, 1, '2023-04-04'),
(24, 1, '2023-04-04'),
(25, 1, '2023-04-04'),
(26, 1, '2023-04-04'),
(27, 1, '2023-04-04'),
(28, 1, '2023-04-04'),
(29, 1, '2023-04-04'),
(30, 1, '2023-04-04'),
(31, 1, '2023-04-04'),
(32, 1, '2023-04-04'),
(33, 1, '2023-04-04'),
(34, 1, '2023-04-05'),
(35, 1, '2023-04-05'),
(36, 1, '2023-04-05'),
(37, 1, '2023-04-05'),
(38, 1, '2023-04-05'),
(39, 1, '2023-04-05'),
(40, 1, '2023-04-05'),
(41, 1, '2023-04-05'),
(42, 1, '2023-04-05'),
(43, 1, '2023-04-05'),
(44, 1, '2023-04-05'),
(45, 1, '2023-04-05'),
(46, 1, '2023-04-05'),
(47, 1, '2023-04-05'),
(48, 1, '2023-04-05'),
(49, 1, '2023-04-05'),
(50, 1, '2023-04-05'),
(51, 1, '2023-04-05'),
(52, 1, '2023-04-05'),
(53, 1, '2023-04-05'),
(54, 1, '2023-04-05'),
(55, 1, '2023-04-05'),
(56, 1, '2023-04-05'),
(57, 1, '2023-04-05'),
(58, 1, '2023-04-05'),
(59, 1, '2023-04-05'),
(60, 1, '2023-04-05'),
(61, 1, '2023-04-05'),
(62, 1, '2023-04-05'),
(63, 1, '2023-04-05'),
(64, 1, '2023-04-05'),
(65, 1, '2023-04-05'),
(66, 1, '2023-04-05'),
(67, 1, '2023-04-05'),
(68, 1, '2023-04-05'),
(69, 1, '2023-04-05'),
(70, 1, '2023-04-05'),
(71, 1, '2023-04-05'),
(72, 1, '2023-04-05'),
(73, 1, '2023-04-05'),
(74, 1, '2023-04-05'),
(75, 1, '2023-04-05'),
(76, 1, '2023-04-05'),
(77, 1, '2023-04-05'),
(78, 1, '2023-04-05'),
(79, 1, '2023-04-05'),
(80, 1, '2023-04-05'),
(81, 1, '2023-04-05'),
(82, 1, '2023-04-05'),
(83, 1, '2023-04-05'),
(84, 1, '2023-04-05'),
(85, 1, '2023-04-05'),
(86, 1, '2023-04-05'),
(87, 1, '2023-04-05'),
(88, 1, '2023-04-05'),
(89, 1, '2023-04-05'),
(90, 1, '2023-04-05'),
(91, 1, '2023-04-05'),
(92, 1, '2023-04-05'),
(93, 1, '2023-04-05'),
(94, 1, '2023-04-05'),
(95, 1, '2023-04-05'),
(96, 1, '2023-04-05'),
(97, 1, '2023-04-05'),
(98, 1, '2023-04-05'),
(99, 1, '2023-04-05'),
(100, 1, '2023-04-05'),
(101, 1, '2023-04-05'),
(102, 1, '2023-04-05'),
(103, 1, '2023-04-05'),
(104, 1, '2023-04-05'),
(105, 1, '2023-04-05'),
(106, 1, '2023-04-05'),
(107, 1, '2023-04-05'),
(108, 1, '2023-04-05'),
(109, 1, '2023-04-05'),
(110, 1, '2023-04-05'),
(111, 1, '2023-04-05'),
(112, 1, '2023-04-05'),
(113, 1, '2023-04-05'),
(114, 1, '2023-04-05'),
(115, 1, '2023-04-05'),
(116, 1, '2023-04-05'),
(117, 1, '2023-04-05'),
(118, 1, '2023-04-05'),
(119, 1, '2023-04-05'),
(120, 1, '2023-04-05'),
(121, 1, '2023-04-05'),
(122, 1, '2023-04-05'),
(123, 1, '2023-04-05'),
(124, 1, '2023-04-05'),
(125, 1, '2023-04-05'),
(126, 1, '2023-04-05'),
(127, 1, '2023-04-05'),
(128, 1, '2023-04-05'),
(129, 1, '2023-04-05'),
(130, 1, '2023-04-05'),
(131, 1, '2023-04-05'),
(132, 1, '2023-04-05'),
(133, 1, '2023-04-05'),
(134, 1, '2023-04-05'),
(135, 1, '2023-04-05'),
(136, 1, '2023-04-05'),
(137, 1, '2023-04-05'),
(138, 1, '2023-04-05'),
(139, 1, '2023-04-05'),
(140, 1, '2023-04-05'),
(141, 1, '2023-04-05'),
(142, 1, '2023-04-05'),
(143, 1, '2023-04-05'),
(144, 1, '2023-04-05'),
(145, 1, '2023-04-05'),
(146, 1, '2023-04-05'),
(147, 1, '2023-04-05'),
(148, 1, '2023-04-06'),
(149, 1, '2023-04-06'),
(150, 1, '2023-04-06'),
(151, 1, '2023-04-06'),
(152, 1, '2023-04-06'),
(153, 1, '2023-04-06'),
(154, 1, '2023-04-06'),
(155, 1, '2023-04-06'),
(156, 1, '2023-04-06'),
(157, 1, '2023-04-06'),
(158, 1, '2023-04-06'),
(159, 1, '2023-04-06'),
(160, 1, '2023-04-06'),
(161, 1, '2023-04-06'),
(162, 1, '2023-04-06'),
(163, 1, '2023-04-06'),
(164, 1, '2023-04-06'),
(165, 1, '2023-04-06'),
(166, 1, '2023-04-06'),
(167, 1, '2023-04-06'),
(168, 1, '2023-04-06'),
(169, 1, '2023-04-06'),
(170, 1, '2023-04-06'),
(171, 1, '2023-04-06'),
(172, 1, '2023-04-06'),
(173, 1, '2023-04-06'),
(174, 1, '2023-04-06'),
(175, 1, '2023-04-06'),
(176, 1, '2023-04-07'),
(177, 1, '2023-04-07'),
(178, 1, '2023-04-07'),
(179, 1, '2023-04-07'),
(180, 1, '2023-04-07'),
(181, 1, '2023-04-07'),
(182, 1, '2023-04-07'),
(183, 1, '2023-04-07'),
(184, 1, '2023-04-07'),
(185, 1, '2023-04-07'),
(186, 1, '2023-04-07');

-- --------------------------------------------------------

--
-- Table structure for table `bestelling_regel`
--

CREATE TABLE `bestelling_regel` (
  `id` int(11) NOT NULL,
  `bestelling_id` int(11) NOT NULL,
  `artikelnummer` int(11) NOT NULL,
  `aantal` int(11) NOT NULL,
  `prijs` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bestelling_regel`
--

INSERT INTO `bestelling_regel` (`id`, `bestelling_id`, `artikelnummer`, `aantal`, `prijs`) VALUES
(1, 21, 123457, 1, '3.00'),
(2, 21, 123458, 1, '1.00'),
(3, 21, 123459, 1, '1.00'),
(6, 22, 123458, 1, '0.89'),
(7, 23, 123458, 1, '0.89'),
(8, 24, 123458, 1, '0.89'),
(9, 24, 123459, 1, '0.59'),
(10, 24, 123469, 1, '0.99'),
(11, 25, 123458, 1, '0.89'),
(12, 25, 123459, 1, '0.59'),
(13, 25, 123457, 1, '2.99'),
(16, 26, 123468, 1, '1.09'),
(17, 27, 123457, 1, '2.99'),
(18, 27, 123458, 2, '0.89'),
(19, 27, 123459, 3, '0.59'),
(20, 28, 123458, 2, '0.89'),
(21, 28, 123457, 1, '2.99'),
(22, 29, 123457, 1, '2.99'),
(23, 29, 123459, 5, '0.59'),
(24, 30, 123457, 1, '2.99'),
(25, 30, 123459, 2, '0.59'),
(26, 31, 123459, 1, '0.59'),
(27, 32, 123457, 3, '2.99'),
(28, 33, 123457, 2, '2.99'),
(29, 34, 123457, 3, '2.99'),
(30, 35, 123457, 1, '2.99'),
(31, 35, 123459, 2, '0.59'),
(32, 36, 123457, 1, '2.99'),
(33, 36, 123459, 1, '0.59'),
(34, 37, 123458, 1, '0.89'),
(35, 38, 123458, 1, '0.89'),
(36, 39, 123457, 1, '2.99'),
(37, 40, 123459, 1, '0.59'),
(38, 41, 123457, 1, '2.99'),
(39, 42, 123458, 1, '0.89'),
(40, 43, 123458, 1, '0.89'),
(41, 44, 123458, 1, '0.89'),
(42, 45, 123457, 1, '2.99'),
(43, 46, 123457, 1, '2.99'),
(44, 47, 123458, 1, '0.89'),
(45, 48, 123458, 1, '0.89'),
(46, 49, 123458, 1, '0.89'),
(47, 50, 123458, 1, '0.89'),
(48, 51, 123458, 1, '0.89'),
(49, 52, 123457, 1, '2.99'),
(50, 53, 123458, 1, '0.89'),
(51, 54, 123458, 1, '0.89'),
(52, 55, 123459, 1, '0.59'),
(53, 56, 123457, 1, '2.99'),
(54, 57, 123458, 1, '0.89'),
(55, 58, 123458, 1, '0.89'),
(56, 59, 123457, 1, '2.99'),
(57, 60, 123458, 1, '0.89'),
(58, 61, 123458, 1, '0.89'),
(59, 62, 123458, 1, '0.89'),
(60, 63, 123457, 3, '2.99'),
(61, 64, 123458, 3, '0.89'),
(62, 65, 123458, 1, '0.89'),
(63, 65, 123457, 1, '2.99'),
(64, 66, 123457, 1, '2.99'),
(65, 68, 123458, 1, '0.89'),
(66, 69, 123458, 1, '0.89'),
(67, 70, 123458, 1, '0.89'),
(68, 72, 123458, 1, '0.89'),
(69, 73, 123458, 1, '0.89'),
(70, 74, 123457, 1, '2.99'),
(71, 74, 123458, 1, '0.89'),
(72, 75, 123458, 1, '0.89'),
(73, 76, 123458, 1, '0.89'),
(74, 77, 123457, 1, '2.99'),
(75, 77, 123459, 1, '0.59'),
(76, 77, 123467, 1, '2.69'),
(77, 78, 123457, 1, '2.99'),
(78, 78, 123458, 1, '0.89'),
(79, 79, 123457, 1, '2.99'),
(80, 79, 123458, 1, '0.89'),
(81, 80, 123458, 1, '0.89'),
(82, 80, 123457, 1, '2.99'),
(83, 81, 123458, 1, '0.89'),
(84, 82, 123457, 1, '2.99'),
(85, 83, 123457, 1, '2.99'),
(86, 84, 123458, 1, '0.89'),
(87, 96, 123458, 1, '0.89'),
(88, 96, 123457, 2, '2.99'),
(89, 96, 123469, 3, '0.99'),
(90, 97, 123458, 1, '0.89'),
(91, 97, 123459, 3, '0.59'),
(92, 97, 123457, 1, '2.99'),
(93, 98, 123458, 1, '0.89'),
(94, 98, 33, 1, '0.00'),
(95, 98, 3, 1, '0.00'),
(96, 99, 2, 1, '0.00'),
(97, 99, 123457, 1, '2.99'),
(98, 100, 3, 1, '0.00'),
(99, 100, 33, 1, '0.00'),
(100, 100, 2, 1, '0.00'),
(101, 100, 32, 1, '0.00'),
(102, 100, 123458, 1, '0.89'),
(103, 102, 123458, 1, '0.89'),
(104, 103, 123458, 1, '0.89'),
(105, 103, 123459, 1, '0.59'),
(106, 103, 3, 1, '0.00'),
(107, 104, 123458, 1, '0.89'),
(108, 104, 123459, 1, '0.59'),
(109, 104, 256, 1, '0.00'),
(110, 104, 3, 1, '0.00'),
(111, 104, 56, 1, '0.00'),
(112, 106, 123458, 1, '0.89'),
(113, 106, 123457, 1, '2.99'),
(114, 106, 123459, 1, '0.59'),
(115, 107, 123458, 1, '0.89'),
(116, 109, 123458, 1, '0.89'),
(117, 109, 123457, 1, '2.99'),
(118, 110, 123458, 1, '0.89'),
(119, 111, 123458, 1, '0.89'),
(120, 111, 123457, 5, '2.99'),
(121, 111, 123469, 1, '0.99'),
(122, 112, 123458, 1, '0.89'),
(123, 112, 123459, 1, '0.59'),
(124, 113, 123458, 1, '0.89'),
(125, 113, 123459, 1, '0.59'),
(126, 114, 123458, 1, '0.89'),
(127, 114, 123459, 1, '0.59'),
(128, 115, 123458, 1, '0.89'),
(129, 115, 123459, 1, '0.59'),
(130, 116, 123458, 1, '0.89'),
(131, 116, 123459, 1, '0.59'),
(132, 117, 123458, 1, '0.89'),
(133, 117, 123459, 1, '0.59'),
(134, 118, 123458, 1, '0.89'),
(135, 118, 123457, 1, '2.99'),
(136, 119, 123457, 1, '2.99'),
(137, 119, 123459, 1, '0.59'),
(138, 120, 123458, 1, '0.89'),
(139, 120, 123457, 1, '2.99'),
(140, 121, 123458, 1, '0.89'),
(141, 121, 123459, 1, '0.59'),
(142, 126, 123458, 1, '0.89'),
(143, 126, 123457, 1, '2.99'),
(144, 126, 123459, 1, '0.59'),
(145, 127, 123458, 1, '0.89'),
(146, 127, 123457, 1, '2.99'),
(147, 128, 123457, 1, '2.99'),
(148, 128, 123459, 1, '0.59'),
(149, 130, 123458, 1, '0.89'),
(150, 131, 123457, 1, '2.99'),
(151, 132, 123458, 1, '0.89'),
(152, 133, 123458, 1, '0.89'),
(153, 135, 123458, 1, '0.89'),
(154, 136, 123458, 1, '0.89'),
(155, 144, 123458, 1, '0.89'),
(156, 146, 123458, 1, '0.89'),
(157, 148, 123458, 1, '0.89'),
(158, 150, 123458, 1, '0.89'),
(159, 153, 123457, 3, '2.99'),
(160, 153, 123458, 1, '0.89'),
(161, 153, 123459, 2, '0.59'),
(162, 154, 123457, 1, '2.99'),
(163, 154, 123459, 3, '0.59'),
(164, 154, 123468, 1, '1.09'),
(169, 157, 123457, 1, '2.99'),
(170, 158, 123457, 1, '2.99'),
(171, 159, 123457, 1, '2.99'),
(172, 160, 123458, 1, '0.89'),
(173, 161, 123458, 1, '0.89'),
(174, 161, 123459, 1, '0.59'),
(175, 162, 123458, 1, '0.89'),
(176, 162, 123457, 1, '2.99'),
(177, 163, 123458, 1, '0.89'),
(178, 164, 123458, 1, '0.89'),
(179, 165, 123458, 1, '0.89'),
(180, 166, 123457, 1, '2.99'),
(181, 167, 123457, 1, '2.99'),
(182, 168, 123458, 1, '0.89'),
(183, 169, 123457, 1, '2.99'),
(184, 172, 123457, 2, '2.94'),
(185, 172, 123459, 1, '0.59'),
(186, 173, 123458, 1, '0.89'),
(188, 180, 123457, 14, '2.94'),
(189, 181, 123458, 1, '0.89'),
(190, 182, 123457, 13, '2.94'),
(191, 184, 123458, 1, '0.89'),
(192, 185, 123458, 1, '0.89'),
(193, 185, 123457, 1, '2.94');

-- --------------------------------------------------------

--
-- Table structure for table `dienst`
--

CREATE TABLE `dienst` (
  `id` int(11) NOT NULL,
  `dienst_naam` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `dienst`
--

INSERT INTO `dienst` (`id`, `dienst_naam`) VALUES
(1, 'kassa'),
(2, 'magazijn');

-- --------------------------------------------------------

--
-- Table structure for table `gebruiker`
--

CREATE TABLE `gebruiker` (
  `id` int(11) NOT NULL,
  `inlognaam` varchar(25) DEFAULT NULL,
  `wachtwoord` varchar(45) DEFAULT NULL,
  `dienst` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `gebruiker`
--

INSERT INTO `gebruiker` (`id`, `inlognaam`, `wachtwoord`, `dienst`) VALUES
(1, 'lucas', '1234', '1'),
(2, 'peter', '4321', '2');

-- --------------------------------------------------------

--
-- Table structure for table `leverancier`
--

CREATE TABLE `leverancier` (
  `id` int(11) NOT NULL,
  `leverancier_naam` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `leverancier`
--

INSERT INTO `leverancier` (`id`, `leverancier_naam`) VALUES
(1, 'Boer Harms'),
(2, 'De Zaanse Hoeve'),
(3, 'Meester & Zn.'),
(4, 'CalvÃ©'),
(5, 'Rinse'),
(6, 'Nutella'),
(7, 'De Ruijter'),
(8, 'Venz'),
(9, 'Coca-Cola'),
(10, 'Fanta'),
(11, 'Douwe Egberts'),
(12, 'Friesche vlag'),
(13, 'Perla'),
(14, 'Lay\'s'),
(15, 'Cheetos'),
(16, 'Peijnenburg');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `artikelnummer` int(6) NOT NULL,
  `omschrijving` varchar(100) NOT NULL,
  `leverancier` varchar(30) NOT NULL,
  `artikelgroep` varchar(25) NOT NULL,
  `eenheid` varchar(25) NOT NULL,
  `prijs` decimal(10,2) NOT NULL,
  `aantal` int(5) NOT NULL,
  `besteleenheid` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`artikelnummer`, `omschrijving`, `leverancier`, `artikelgroep`, `eenheid`, `prijs`, `aantal`, `besteleenheid`) VALUES
(123457, 'Bloemkool', '1', '1', 'stuk', '2.94', 0, 0),
(123458, 'Aubergine', '1', '1', 'stuk', '0.89', 233, 0),
(123459, 'Salade ui', '1', '1', 'bosje', '0.59', 19, 0),
(123460, 'Snoepgroente tomaat', '1', '1', '500g', '2.99', 75, 0),
(123461, 'Kruimige aardappel', '1', '1', '1kg', '1.09', 25, 0),
(123462, 'Kruimige aardappel', '1', '7', '5kg', '2.75', 25, 0),
(123463, 'Kaas geraspt mid 45+', '2', '2', '200g', '1.79', 45, 0),
(123464, 'Kaas Pittig 45+ geraspt', '2', '2', '200g', '1.89', 45, 0),
(123465, 'Kaas Jong 48+', '2', '2', '400g', '2.89', 45, 0),
(123466, 'Kipfilet', '3', '2', '150g', '1.69', 40, 0),
(123467, 'Gerookte spekreepjes', '3', '2', '300g', '2.69', 39, 0),
(123468, 'Gerookte schouderham', '3', '2', '150g', '1.09', 39, 0),
(123469, 'Boterhamworst', '3', '2', '150g', '0.99', 41, 0),
(123470, 'Pindakaas', '4', '3', '350g', '2.68', 65, 0),
(123472, 'Hazelnootpasta', '6', '5', '630g', '499.00', 65, 0),
(123473, 'Vruchtenhagel', '7', '3', '400g', '1.35', 65, 0),
(123474, 'Chocoladehagel puur', '7', '3', '390g', '2.49', 56, 0),
(123475, 'Hagelslag melk', '8', '3', '400g', '1.69', 57, 0),
(123476, 'Rimboe kroko vlokken puur/vanille', '8', '3', '200g', '1.99', 35, 0),
(123477, 'Vlokken puur', '7', '3', '300g', '1.99', 55, 0),
(123478, 'Cola Zero sugar', '9', '4', '1l', '1.85', 100, 0),
(123479, 'Cola Regular', '9', '4', '1l', '1.85', 150, 0),
(123480, 'Fanta Orange', '10', '4', '1,5l', '2.95', 125, 0),
(123481, 'Aroma rood filter koffie', '11', '5', '250g', '3.29', 250, 0),
(123482, 'Aroma rood filter koffie', '11', '5', '500g', '6.15', 125, 0),
(123483, 'Koffiemelk Halvamel', '12', '5', '455ml', '1.25', 122, 0),
(123484, 'Senseo Classic Koffiepads', '11', '5', '36st', '3.69', 100, 0),
(123485, 'Opschuimmelk voor cappucino', '12', '5', '1l', '1.35', 50, 0),
(123486, 'Huisblends Aroma snelfiltermaling', '13', '5', '250g', '2.89', 75, 0),
(123487, 'Chips Naturel', '14', '6', '225g', '1.49', 75, 0),
(123488, 'Chips Paprika', '14', '6', '225g', '1.49', 85, 0),
(123489, 'Superchips paprika', '14', '6', '200g', '1.59', 10, 0),
(123490, 'Nibb-it sticks', '15', '6', '110g', '1.35', 5, 0),
(123491, 'Ontbijtkoek naturel gesneden', '16', '7', '485g', '1.75', 15, 0),
(123492, 'Broccoli', '1', '1', '100g', '2.00', 5, 0),
(123495, 'Kaas', '5', '4', 'stuk', '2.00', 40, 0),
(123498, 'Kaas', '2', '1', '10gram', '2.00', 70, 0),
(123553, '', '', '2', '', '0.00', 0, 0),
(123554, '', '', '', '', '0.00', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikelgroep`
--
ALTER TABLE `artikelgroep`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bestelling`
--
ALTER TABLE `bestelling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bestelling_regel`
--
ALTER TABLE `bestelling_regel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dienst`
--
ALTER TABLE `dienst`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gebruiker`
--
ALTER TABLE `gebruiker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leverancier`
--
ALTER TABLE `leverancier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`artikelnummer`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikelgroep`
--
ALTER TABLE `artikelgroep`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bestelling`
--
ALTER TABLE `bestelling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `bestelling_regel`
--
ALTER TABLE `bestelling_regel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `dienst`
--
ALTER TABLE `dienst`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gebruiker`
--
ALTER TABLE `gebruiker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `leverancier`
--
ALTER TABLE `leverancier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `artikelnummer` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123555;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
