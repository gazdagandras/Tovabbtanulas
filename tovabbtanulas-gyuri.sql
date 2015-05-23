-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Hoszt: 127.0.0.1
-- Létrehozás ideje: 2015. Máj 23. 10:32
-- Szerver verzió: 5.5.32
-- PHP verzió: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Adatbázis: `tovabbtanulas`
--
CREATE DATABASE IF NOT EXISTS `tovabbtanulas` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tovabbtanulas`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `altalanosiskolak`
--

CREATE TABLE IF NOT EXISTS `altalanosiskolak` (
  `AZ` int(11) NOT NULL AUTO_INCREMENT,
  `altalanos` varchar(30) NOT NULL,
  `cim` varchar(60) NOT NULL,
  PRIMARY KEY (`AZ`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- A tábla adatainak kiíratása `altalanosiskolak`
--

INSERT INTO `altalanosiskolak` (`AZ`, `altalanos`, `cim`) VALUES
(1, 'TopSuli', 'Toponár'),
(2, 'Ripl', 'Riplrnai u.1'),
(3, 'Csilagvár Általános Iskola', 'Kocka u.14'),
(4, 'Napsugár Általános Iskola', 'Gyönygvirág u.4'),
(5, 'Tóparti Általános Iskola', 'Strand út 23');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kozepiskolak`
--

CREATE TABLE IF NOT EXISTS `kozepiskolak` (
  `AZ` int(11) NOT NULL AUTO_INCREMENT,
  `kozepiskola` varchar(60) NOT NULL,
  `cim` varchar(60) NOT NULL,
  PRIMARY KEY (`AZ`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- A tábla adatainak kiíratása `kozepiskolak`
--

INSERT INTO `kozepiskolak` (`AZ`, `kozepiskola`, `cim`) VALUES
(1, 'Zengő Gimnnázium', 'Zenge u.13'),
(2, 'Dobogokő Szakközépiskola', 'Sziklás u.44'),
(3, 'Kékes Gimnázium', 'Havas út 51'),
(4, 'Baradla Gimnázium', 'Köves tér 3');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tanulok`
--

CREATE TABLE IF NOT EXISTS `tanulok` (
  `AZ` int(11) NOT NULL AUTO_INCREMENT,
  `nev` varchar(30) NOT NULL,
  `altAZ` int(11) NOT NULL,
  PRIMARY KEY (`AZ`),
  KEY `altAZ` (`altAZ`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- A tábla adatainak kiíratása `tanulok`
--

INSERT INTO `tanulok` (`AZ`, `nev`, `altAZ`) VALUES
(5, 'Alföldi Noémi', 1),
(6, 'Kis Virág', 2),
(7, 'Tóth Aladár', 2),
(8, 'Végső Albert', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tovabbtanulas`
--

CREATE TABLE IF NOT EXISTS `tovabbtanulas` (
  `tanuloAZ` int(11) NOT NULL,
  `kozepAZ` int(11) NOT NULL,
  KEY `tanuloAZ` (`tanuloAZ`),
  KEY `kozepAZ` (`kozepAZ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `tanulok`
--
ALTER TABLE `tanulok`
  ADD CONSTRAINT `tanulok_ibfk_1` FOREIGN KEY (`altAZ`) REFERENCES `altalanosiskolak` (`AZ`);

--
-- Megkötések a táblához `tovabbtanulas`
--
ALTER TABLE `tovabbtanulas`
  ADD CONSTRAINT `tovabbtanulas_ibfk_2` FOREIGN KEY (`kozepAZ`) REFERENCES `kozepiskolak` (`AZ`),
  ADD CONSTRAINT `tovabbtanulas_ibfk_1` FOREIGN KEY (`tanuloAZ`) REFERENCES `tanulok` (`AZ`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
