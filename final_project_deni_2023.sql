-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2023 at 08:04 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_project_deni_2023`
--

-- --------------------------------------------------------

--
-- Table structure for table `ispinformation`
--

CREATE TABLE `ispinformation` (
  `ISPInfoID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `ServicePackage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qualityinformation`
--

CREATE TABLE `qualityinformation` (
  `QualityInfoID` int(11) NOT NULL,
  `Bandwidth` float DEFAULT NULL,
  `SignalStrength` float DEFAULT NULL,
  `Delay` float DEFAULT NULL,
  `PacketLoss` float DEFAULT NULL,
  `Throughput` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `speedmeasurement`
--

CREATE TABLE `speedmeasurement` (
  `MeasurementID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `ISPInfoID` int(11) DEFAULT NULL,
  `SpeedUpload` float DEFAULT NULL,
  `SpeedDownload` float DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `QualityInfoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Fullname` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Profile` varchar(255) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ispinformation`
--
ALTER TABLE `ispinformation`
  ADD PRIMARY KEY (`ISPInfoID`);

--
-- Indexes for table `qualityinformation`
--
ALTER TABLE `qualityinformation`
  ADD PRIMARY KEY (`QualityInfoID`);

--
-- Indexes for table `speedmeasurement`
--
ALTER TABLE `speedmeasurement`
  ADD PRIMARY KEY (`MeasurementID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ISPInfoID` (`ISPInfoID`),
  ADD KEY `QualityInfoID` (`QualityInfoID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `speedmeasurement`
--
ALTER TABLE `speedmeasurement`
  ADD CONSTRAINT `speedmeasurement_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `speedmeasurement_ibfk_2` FOREIGN KEY (`ISPInfoID`) REFERENCES `ispinformation` (`ISPInfoID`),
  ADD CONSTRAINT `speedmeasurement_ibfk_3` FOREIGN KEY (`QualityInfoID`) REFERENCES `qualityinformation` (`QualityInfoID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
