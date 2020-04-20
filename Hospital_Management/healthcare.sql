-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2020 at 03:41 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountant`
--

CREATE TABLE `accountant` (
  `AID` int(15) NOT NULL,
  `Acode` varchar(15) NOT NULL,
  `AName` varchar(100) NOT NULL,
  `ANIC` varchar(15) NOT NULL,
  `PhoneNo` int(15) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Address` varchar(500) NOT NULL,
  `Password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accountant`
--

INSERT INTO `accountant` (`AID`, `Acode`, `AName`, `ANIC`, `PhoneNo`, `Email`, `Address`, `Password`) VALUES
(1, 'A001', 'Dilshan', '7894561V', 716324860, 'a@gmail.com', 'nnjlnlnlnjklnkklmnbbkb', 'qsdftg'),
(2, 'A002', 'Dilshandd', '7894561V', 7414555, 's@g.com', 'nnjlnlnlnjklnkklmnbbkb', 'asdr'),
(3, 'A003', 'Madu', '7894561V', 7414555, 'a@gmail.com', 'Maviththara,Sri Lanka', 'asdrft');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `DocID` int(15) NOT NULL,
  `DocLNo` varchar(10) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `NIC` varchar(15) NOT NULL,
  `PhoneNo` int(12) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `DocSpeacialist` varchar(500) NOT NULL,
  `WorkingXP` varchar(100) NOT NULL,
  `Password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`DocID`, `DocLNo`, `Name`, `NIC`, `PhoneNo`, `Email`, `Address`, `DocSpeacialist`, `WorkingXP`, `Password`) VALUES
(1, 'D001', 'Dilshan Madushanka', '971341254V', 716324860, 'a@gmail.com', 'Maviththara, Piliyandala', 'Anesthesiologists', '2 years', 'dilsahna'),
(2, 'D002', 'Dilshan Madushanka', '971341254V', 716324860, 'a@gmail.com', 'Mawiththara, Piliyandala', 'Anesthesiologists', '2 years', 'asddfg'),
(3, 'D003', 'Hasindu Madushanka', '761545454V', 7414555, 'madu@gmail.com', 'suwarapola, Piliyandala', 'Critical Care Medicine Specialists', '4 years', 'mhtres');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist`
--

CREATE TABLE `pharmacist` (
  `PID` int(15) NOT NULL,
  `Pcode` varchar(15) NOT NULL,
  `PName` varchar(100) NOT NULL,
  `PNIC` varchar(15) NOT NULL,
  `PhoneNo` varchar(15) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Address` varchar(500) NOT NULL,
  `Password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacist`
--

INSERT INTO `pharmacist` (`PID`, `Pcode`, `PName`, `PNIC`, `PhoneNo`, `Email`, `Address`, `Password`) VALUES
(1, 'P001', 'Dilshan', '047412562V', '0716324860', 'a@gmail.com', 'Piliyandala, Sri lanka', 'mhstye'),
(2, 'P002', 'Dilshan', '047412562V', '0716324860', 'a@gmail.com', 'nnjlnlnlnjklnkklmnbbkb', 'asdfg'),
(3, 'P003', 'Hansi', '047412562V', '0716324860', 'a@gmail.com', 'wwsdddee', 'asassww');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountant`
--
ALTER TABLE `accountant`
  ADD PRIMARY KEY (`AID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`DocID`);

--
-- Indexes for table `pharmacist`
--
ALTER TABLE `pharmacist`
  ADD PRIMARY KEY (`PID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountant`
--
ALTER TABLE `accountant`
  MODIFY `AID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `DocID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pharmacist`
--
ALTER TABLE `pharmacist`
  MODIFY `PID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
