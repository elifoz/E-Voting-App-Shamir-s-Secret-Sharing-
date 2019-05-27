-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 27 May 2019, 17:18:04
-- Sunucu sürümü: 10.1.38-MariaDB
-- PHP Sürümü: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `e_voting`
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

INSERT INTO `aday` (`aday_id`, `aday_ad`, `aday_soyad`, `aday_parti`) VALUES
(1, 'Ahmet', 'Karadağ', 'A'),
(2, 'Yasemin', 'Yılmaz', 'B'),
(3, 'Taner', 'Özkan', 'C'),
(4, 'Nermin', 'Atlı', 'D');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gorevli`
--

CREATE TABLE `gorevli` (
  `gorevli_id` int(11) NOT NULL,
  `tc` varchar(150) COLLATE utf8mb4_turkish_ci NOT NULL,
  `ad` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `soyad` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `kod` varchar(150) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `gorevli`
--

INSERT INTO `gorevli` (`gorevli_id`, `tc`, `ad`, `soyad`, `kod`) VALUES
(18, '1e769e026bbea1169f4285966faf128aa7adcba92b4494985b0073a3eeb1119f', 'Derya', 'Arda', '8e66253111318b9841272f02bd38a5df45fac5f429442703805aa5ca7bd0e043'),
(19, 'e31c35a9cdfc2800912a15fded7779afe372fcb1fdd707822008e01c4d418bae', 'Altan', 'Mesut', '0f9c3d8cc8ccc81c123d9e7ee4e482fa8a535944648a69c0ad4cab95a432431d'),
(21, '59dae20689801a49fa737f5e4c3cb54485eb64b8f3f4c12404088296c8d66dfc', 'Tarık', 'Yerlikaya', 'd78d3edba613b16e3adefeea50122449bfe2cf2e881dddb403b6485908c040f9');

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
  `tc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ad` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `soyad` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `dogum_tarih` date NOT NULL,
  `telefon` int(15) NOT NULL,
  `adres` varchar(500) COLLATE utf8mb4_turkish_ci NOT NULL,
  `durum` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `secmen`
--

INSERT INTO `secmen` (`secmen_id`, `tc`, `ad`, `soyad`, `dogum_tarih`, `telefon`, `adres`, `durum`) VALUES
(24, '5b7f0511fbb6bb730e6f0ed6e9340688bc3e675e07878d7d183433083f64c0bd', 'Elif', 'Özceylan', '1997-06-01', 2147483647, 'Çanakkale', 1),
(26, '4afb19a467b8cd7dcec1497e76b5de7ff005db1c3058c09ff3f63d0d6f81324f', 'Akif', 'Sönmez', '1991-03-12', 2147483647, 'İstanbul', 0),
(27, '788324f173af2af1f364d3066b1bb0217ae0cb1d5735fa12e608894ade37c087', 'Eda', 'Öztürk', '1984-02-08', 2147483647, 'Ankara', 0),
(28, 'b840689b48c6e73cca64ca37b8fbacfb317eb850c845c1868065c9b351d478d3', 'ümran', 'Topçu', '1995-12-22', 2147483647, 'şanlıurfa', 0),
(29, 'a0bbab4e6c379ba1597712c949fcfbcd4b0ebc2d7e85910a4f3dda5fa79c7d3c', 'Sena nur', 'Kiraz', '1996-12-05', 2147483647, 'Erenköy/istanbul', 0),
(30, '74c6d693c3d71e10dae16e29014ba3df2a97b3b4d87f2e357b744ab6366f87ec', 'özlem', 'özdemir', '1995-07-20', 2147483647, 'Kartal/istanbul', 0),
(31, 'e7e4d713b24740af8447658404869aa15cfdb813ba3afd7358bdd2740177e201', 'Nurbanu ', 'Eken', '1997-06-18', 2147483647, 'çan/çanakkale', 0),
(32, 'd3f8f1103bd4fb641ae7832f5c79a987018a2f89cafe23350a593d7943af3671', 'Alper', 'Akmercan', '1992-01-05', 2147483647, 'Kırklareli', 0),
(33, 'e86874b38ae4e32bb47d2fc597de2d1cc657b49b0fbe0b21710e47a692cf6d6d', 'Kıvanç', 'Kasabalı', '1978-04-21', 2147483647, 'çankırı', 0),
(34, '6f374fa9e83fd26338ade6f8b53ad1daeee8b2a1446350bb6dc5778ba265b409', 'Ali', 'Güven', '1998-10-14', 2147483647, 'Edirne', 0),
(35, 'a14bc72654dca4521b3d9dba8918ffcad668a9c4c57db544a24092c6cc558f87', 'şehnur', 'Karhan', '1997-04-17', 2147483647, 'Ayvacık/çanakkale', 0),
(36, 'badecc9eaaaacb209f1c7ea2b72fbaa9b3f64460c7198b23536f7d075ea57b7d', 'Yasin taha', 'Arşın', '1975-05-31', 2147483647, 'Aydın', 0),
(37, 'df41f7d6aeeecb9c2bbb114c1ff48d39fc64d13ca4933c16131445688d99ec78', 'Onur', 'Bodur', '1950-02-14', 2147483647, 'Bursa', 0),
(38, 'af209b0390b53477c4951fb5179a46da0e1389aa5360e057e6d11c8f5186bd8c', 'Duygu', 'Döner', '1997-05-24', 2147483647, 'Eceabat/çanakkale', 0),
(39, '9eb546fbf8106308b23acdc407a3d499e17ebc3ca0042fc034e1ec8d79aedd62', 'Seher', 'özsarı', '1972-08-18', 2147483647, 'Biga/çanakkale', 0),
(40, '0710d6e41fd7ce7d26aa22a7fa73c065020682931e8c3ff9279b3abd20bed16f', 'Mehmet', 'Okur', '2000-06-14', 2147483647, 'Osmaniye', 0),
(41, 'e3370d7c85451c7fd2c33520d8ad99ad1ab32f76300afcaa06b90b1558188433', 'Ahmet can', 'Ergiyen', '1983-11-20', 2147483647, 'Edirne', 0),
(42, '302b1ffff14dc03963369cfcb3c4e3b98e6aa98b99a1ab95ea43fd2823574f5f', 'Mehmet', 'Erdin', '1986-11-19', 2147483647, 'Keşan', 0),
(43, '70937453a5ce5ab8b0d4af141775dd9ec43ae44c7963c3e15b4226022e3a2c6c', 'Kadriye', 'Gümeci', '1992-07-23', 2147483647, 'Babaeski', 0),
(44, 'f893dbdfb1bdc575bbe8acb8379097538fba8930571c07e07030b2f2ed41d6d1', 'Kübra', 'Yıldız', '1993-09-20', 2147483647, 'Adana', 0);

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

INSERT INTO `sonuc` (`cc_id`, `cc1`, `cc2`, `cc3`) VALUES
(1, 127785, 109480, 502162),
(2, 96234, 462952, 51537),
(3, 69178, 400572, 502641),
(4, 488554, 67757, 311560);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `aday`
--
ALTER TABLE `aday`
  ADD PRIMARY KEY (`aday_id`);

--
-- Tablo için indeksler `gorevli`
--
ALTER TABLE `gorevli`
  ADD PRIMARY KEY (`gorevli_id`),
  ADD UNIQUE KEY `tc` (`tc`);

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
-- Tablo için AUTO_INCREMENT değeri `gorevli`
--
ALTER TABLE `gorevli`
  MODIFY `gorevli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
  MODIFY `secmen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Tablo için AUTO_INCREMENT değeri `sonuc`
--
ALTER TABLE `sonuc`
  MODIFY `cc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
