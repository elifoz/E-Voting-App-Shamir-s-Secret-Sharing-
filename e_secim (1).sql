-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 07 Oca 2019, 17:04:14
-- Sunucu sürümü: 10.1.33-MariaDB
-- PHP Sürümü: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `e_secim`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `aday`
--

CREATE TABLE `aday` (
  `aday_id` int(50) NOT NULL,
  `aday_ad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `aday_soyad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `aday_parti` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `aday`
--


-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oy`
--

CREATE TABLE `oy` (
  `oy_id` int(50) NOT NULL,
  `parti_id` int(50) NOT NULL,
  `aday_id` int(50) NOT NULL,
  `secmen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `parti`
--

CREATE TABLE `parti` (
  `parti_id` int(50) NOT NULL,
  `parti_ad` varchar(50) NOT NULL,
  `parti_amblem` blob NOT NULL,
  `parti_bilgi` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `secmen`
--

CREATE TABLE `secmen` (
  `secmen_id` int(11) NOT NULL,
  `tc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `ad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `soyad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `dogum_tarih` date NOT NULL,
  `telefon` int(15) NOT NULL,
  `adres` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `toplam_oy` tinyint(100) NOT NULL,
  `secim_tur` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `oy_verilen_parti` int(30) NOT NULL,
  `kullanim_durumu` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `secmen`
--


-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sonuc`
--

CREATE TABLE `sonuc` (
  `cc_id` int(11) NOT NULL,
  `cc1` int(11) NOT NULL,
  `cc2` int(11) NOT NULL,
  `cc3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Tablo döküm verisi `sonuc`
--


--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `aday`
--
ALTER TABLE `aday`
  ADD PRIMARY KEY (`aday_id`);

--
-- Tablo için indeksler `oy`
--
ALTER TABLE `oy`
  ADD PRIMARY KEY (`oy_id`),
  ADD KEY `parti_id` (`parti_id`),
  ADD KEY `aday_id` (`aday_id`),
  ADD KEY `secmen_id` (`secmen_id`);

--
-- Tablo için indeksler `parti`
--
ALTER TABLE `parti`
  ADD PRIMARY KEY (`parti_id`);

--
-- Tablo için indeksler `secmen`
--
ALTER TABLE `secmen`
  ADD PRIMARY KEY (`secmen_id`),
  ADD UNIQUE KEY `tc` (`tc`);

--
-- Tablo için indeksler `sonuc`
--
ALTER TABLE `sonuc`
  ADD UNIQUE KEY `cc_id` (`cc_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `aday`
--
ALTER TABLE `aday`
  MODIFY `aday_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `oy`
--
ALTER TABLE `oy`
  MODIFY `oy_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `parti`
--
ALTER TABLE `parti`
  MODIFY `parti_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `secmen`
--
ALTER TABLE `secmen`
  MODIFY `secmen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Tablo için AUTO_INCREMENT değeri `sonuc`
--
ALTER TABLE `sonuc`
  MODIFY `cc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `oy`
--
ALTER TABLE `oy`
  ADD CONSTRAINT `oy_ibfk_1` FOREIGN KEY (`parti_id`) REFERENCES `parti` (`parti_id`),
  ADD CONSTRAINT `oy_ibfk_3` FOREIGN KEY (`aday_id`) REFERENCES `aday` (`aday_id`),
  ADD CONSTRAINT `oy_ibfk_4` FOREIGN KEY (`secmen_id`) REFERENCES `secmen` (`secmen_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
