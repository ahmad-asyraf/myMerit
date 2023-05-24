-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2023 at 07:52 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mymerit`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `acID` int(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `club` varchar(255) NOT NULL,
  `des` varchar(255) NOT NULL,
  `datestart` varchar(255) NOT NULL,
  `dateend` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `activitymerit` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `image` longblob DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`acID`, `name`, `club`, `des`, `datestart`, `dateend`, `platform`, `place`, `activitymerit`, `total`, `image`) VALUES
(19, 'PENDAFTARAN PROGRAM NEON CHALLENGING RUN', 'Kelab Mahasiswa Teknologi Komputer', 'Assalamualaikum dan Salam SejahteraSukacita dimaklumkan bahawa, sempena berlangsungnya UMT Mathematics Open Day 2023 pada 8 - 10 Jun 2023, Kelab Mahasiswa Matematik sesi 22/23 akan  mengadakan Program Neon Challenging Run.', '2023-05-13', '2023-05-17', 'Physics', 'Padang', '5', '50', ''),
(21, 'TIKTOK RAMADHAN', 'Kelab Frisbee', 'Sukacita dimaklumkan bahawa Kelab Sahabat Masjid UMT (SAHAM) akan menganjurkan *Pertandingan menghasilkan video Tiktok Bertemakan  suasana di bulan Ramadhan* .Oleh itu, kami sangat berbesar hati dan mengalu alukan penyertaan anda semua.', '2023-05-14', '2023-05-31', 'Physics', 'BG2', '5', '50', ''),
(22, 'VIDEO CONTEST', 'Kelab Mahasiswa Teknologi Komputer', '*Marine Science Club* are here to inform you that we are organizing a *Video Contest*. All UMT students are encouraged to take part and share with us what do you know about SDG 14 and it\'s relationship with blue economy.', '2023-04-07', '2023-04-07', 'Physical', 'BG2', '5', '50', ''),
(23, '*PROGRAM TADARUS, KHATAM AL-QURAN & IFTAR*', 'Layar Opera', 'Kelab Mahasiswa Teknologi Komputer (COMTECH) akan mengadakan Program Tadarus, Khatam Al-Quran & Iftar', '2023-03-31', '2023-03-31', 'Online', 'BG2', '5', '50', ''),
(24, 'PERTANDINGAN POSTER DAN SAJAK BERTEMAKAN WETLANDS', 'Layar Opera', 'Assalamualaikum dan salam sejahtera, kami dari Kelab Biodiversiti, Universiti Malaysia Terengganu ingin menjemput semua mahasiswa/mahasiswi untuk bersama-sama menyertai program Pertandingan Poster dan Sajak bertemakan Wetlands ', '2023-03-30', '2023-03-30', 'Physical', 'haha', '5', '50', ''),
(25, 'Majlis RAMAH MESRA & IFTAR PERDANA Bersama Mentor & Mentee Sains Komputer', 'Kelab Mahasiswa Teknologi Komputer', 'Kelab COMTECH akan menganjurkan majlis Majlis RAMAH MESRA & IFTAR PERDANA Bersama Mentor & Mentee Sains Komputer', '2023-04-13', '2023-04-19', 'Physical', 'Trek, Komplek Sukan UMT', '5', '50', ''),
(29, 'Gotong-royong Perdana', 'Kelab Frisbee', 'Gotong-royong perdana bersama pelajar-pelajar UMT', '2023-05-13', '2023-05-15', 'Physical', 'FTKKI', '12', '10', '');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `clubID` int(255) NOT NULL,
  `club` varchar(255) NOT NULL,
  `des` varchar(255) NOT NULL,
  `faculty` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`clubID`, `club`, `des`, `faculty`, `email`) VALUES
(3, 'Layar Opera', 'Terbuka untuk semua pelajar', 'FTKKI', 'opera@fkki.com'),
(10, 'Kelab Mahasiswa Teknologi Komputer', 'Terbuka untuk semua pelajar', 'FTKKI', 'comtech@mail.com'),
(12, 'Kelab Frisbee', 'Lempar Frisbee', 'FTKKI', 'frisbee@ftkki.com'),
(13, 'Debat', 'Debat', 'FTKKI', 'debat@ftkki.com');

-- --------------------------------------------------------

--
-- Table structure for table `pending`
--

CREATE TABLE `pending` (
  `pdgID` int(15) NOT NULL,
  `pdgName` varchar(255) NOT NULL,
  `pdgDes` varchar(255) NOT NULL,
  `pdgFaculty` varchar(255) NOT NULL,
  `pdgEmail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pending`
--

INSERT INTO `pending` (`pdgID`, `pdgName`, `pdgDes`, `pdgFaculty`, `pdgEmail`) VALUES
(1, 'a', '', '', ''),
(2, 'cs', 'sdcdc', 'adasdasd', 'syalfarianz@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `registerID` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `matric` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `club` varchar(255) DEFAULT '',
  `phone` varchar(15) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `faculty` varchar(255) DEFAULT '',
  `course` varchar(255) DEFAULT '',
  `image` longblob DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`registerID`, `fullname`, `matric`, `username`, `password`, `position`, `email`, `club`, `phone`, `address`, `faculty`, `course`, `image`) VALUES
(1, 'Admin', 'admin', 'admin', 'admin', 'admin', 'admin@mail.com', '', '', '', '', '', ''),
(2, 'Syasya', 'syasya', 'syasya', 'password', 'student', 'syasya@mail.com', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentID` int(15) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `matric` varchar(15) NOT NULL,
  `phone` int(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `faculty` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `image` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentID`, `fullname`, `email`, `matric`, `phone`, `address`, `faculty`, `course`, `image`) VALUES
(1, 'syasya', 's@gmail.com', 'S59116', 1136530910, 'umt', 'ftkki', 'im', '');

-- --------------------------------------------------------

--
-- Table structure for table `studentactivity`
--

CREATE TABLE `studentactivity` (
  `acID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`acID`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`clubID`);

--
-- Indexes for table `pending`
--
ALTER TABLE `pending`
  ADD PRIMARY KEY (`pdgID`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`registerID`),
  ADD UNIQUE KEY `matric` (`matric`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `acID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `clubID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pending`
--
ALTER TABLE `pending`
  MODIFY `pdgID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `registerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
