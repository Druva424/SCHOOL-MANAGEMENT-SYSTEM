-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 24, 2023 at 06:42 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sch_management_cs138`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `HIGHESTMARKS` (IN `class` INT, IN `subj` VARCHAR(20))   BEGIN
select fname, mname , classno , sec , marks , subject from student natural join report where (marks,subject,classno) in (select MAX(marks),subject,classno from student natural join report where classno=class and subject=subj);
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `getyears` (`data` DATE) RETURNS INT(11) DETERMINISTIC BEGIN
DECLARE currentDate DATE;
Select current_date()into currentDate;
RETURN (YEAR(currentDate)-YEAR(data));
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `pass` (`marks` INT) RETURNS VARCHAR(10) CHARSET utf8mb4 DETERMINISTIC BEGIN
DECLARE remark VARCHAR(10);
    IF marks>40 THEN SET remark = 'Pass';
   
    ELSE SET remark = 'Fail!!!';
    END IF;
    RETURN remark;
  END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `remark_grade` (`marks` INT) RETURNS VARCHAR(1) CHARSET utf8mb4 DETERMINISTIC BEGIN
DECLARE grade VARCHAR(1);
    IF marks>=90 THEN SET grade = 'A+';
    ELSEIF marks >=80 AND marks<90 THEN SET grade = 'A';
    ELSEIF marks >=70 AND  marks<80 THEN SET grade='B';
    ELSEIF marks >=60 AND marks<70 THEN SET grade = 'C';
    ELSEIF marks >=50 AND  marks<60 THEN SET grade='D';
    ELSEIF marks >=40 AND  marks<50 THEN SET grade='E';
    ELSE SET grade = 'F';
    END IF;
    RETURN grade;
  END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_no` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_no`, `name`, `password`) VALUES
('ajad420', 'arjun', '12598238'),
('ajad421', 'karan', '12598234'),
('ajad422', 'Druva', '12598222'),
('ajad423', 'kaushal', '125www'),
('ajad425', 'Lalu', '1259wdwd234');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `classno` int(11) NOT NULL,
  `section` varchar(1) NOT NULL CHECK (`section` in ('A','B','C','a','b','c')),
  `class_teacher` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`classno`, `section`, `class_teacher`) VALUES
(10, 'B', 'emp105'),
(8, 'A', 'emp206'),
(8, 'B', 'emp306'),
(8, 'C', 'emp406'),
(10, 'C', 'emp505'),
(9, 'A', 'emp506'),
(10, 'A', 'emp605'),
(9, 'B', 'emp606'),
(9, 'C', 'emp706');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dno` int(11) NOT NULL,
  `subject` varchar(20) NOT NULL,
  `chair_tid` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dno`, `subject`, `chair_tid`) VALUES
(1, 'Math', 'emp105'),
(2, 'English', 'emp205'),
(3, 'History', 'emp305'),
(4, 'Geography', 'emp405'),
(5, 'Science', 'emp505'),
(6, 'Computer', 'emp605'),
(7, 'PT', 'emp705');

-- --------------------------------------------------------

--
-- Table structure for table `extraactivities`
--

CREATE TABLE `extraactivities` (
  `sid` varchar(20) NOT NULL,
  `event` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `place` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `extraactivities`
--

INSERT INTO `extraactivities` (`sid`, `event`, `category`, `place`) VALUES
('stu10', 'Debate', 'environment', 2),
('stu11', 'Debate', 'Politics', 3),
('stu13', 'Sportsmeet', 'Football', 1),
('stu15', 'Sportsmeet', 'Cricket', 1),
('stu19', 'Talentshow', 'Dancing', 1),
('stu19', 'Talentshow', 'Singing', 2),
('stu22', 'Sportsmeet', 'boxing', 3),
('stu22', 'Talentshow', 'Dancing', 3),
('stu25', 'Debate', 'Politics', 1),
('stu25', 'Talentshow', 'Dancing', 2),
('stu27', 'Debate', 'environment', 2),
('stu27', 'Debate', 'Politics', 3),
('stu5', 'Sportsmeet', 'sprint', 1),
('stu9', 'Debate', 'environment', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `transid` varchar(20) NOT NULL,
  `date` date DEFAULT NULL,
  `sid` varchar(20) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`transid`, `date`, `sid`, `category`, `status`) VALUES
('BRB1057', '2022-05-14', 'stu5', 'merit', 'Bothsem'),
('BRB1470', '2022-03-03', 'stu11', 'merit', 'Bothsem'),
('BRB1655', '2022-10-12', 'stu7', 'merit', 'Bothsem'),
('BRB2145', '2022-04-07', 'stu2', 'donation', 'Bothsem'),
('BRB2698', '2022-07-07', 'stu6', 'donation', 'onesem'),
('BRB3106', '2022-08-15', 'stu24', 'donation', 'onesem'),
('BRB3267', '2022-04-28', 'stu21', 'donation', 'onesem'),
('BRB3272', '2022-05-10', 'stu4', 'donation', 'Bothsem'),
('BRB3341', '2022-03-05', 'stu15', 'donation', 'Bothsem'),
('BRB3770', '2022-03-28', 'stu25', 'donation', 'onesem'),
('BRB3912', '2022-06-26', 'stu27', 'donation', 'onesem'),
('BRB4052', '2022-12-15', 'stu13', 'donation', 'onesem'),
('BRB4783', '2022-09-05', 'stu26', 'merit', 'onesem'),
('BRB5834', '2022-06-12', 'stu3', 'merit', 'onesem'),
('BRB6148', '2022-03-25', 'stu22', 'donation', 'Bothsem'),
('BRB6242', '2022-03-18', 'stu10', 'donation', 'onesem'),
('BRB7220', '2022-09-11', 'stu12', 'merit', 'onesem'),
('BRB7313', '2022-06-02', 'stu17', 'donation', 'onesem'),
('BRB7397', '2022-06-26', 'stu8', 'donation', 'Bothsem'),
('BRB7724', '2022-08-28', 'stu18', 'donation', 'onesem'),
('BRB8057', '2022-12-09', 'stu9', 'donation', 'onesem'),
('BRB8875', '2022-01-16', 'stu1', 'merit', 'onesem'),
('BRB8948', '2022-05-16', 'stu16', 'merit', 'Bothsem'),
('BRB9042', '2022-11-28', 'stu14', 'donation', 'onesem'),
('BRB9125', '2022-03-17', 'stu19', 'merit', 'onesem'),
('BRB9648', '2022-07-14', 'stu23', 'donation', 'Bothsem'),
('BRB9947', '2022-09-07', 'stu20', 'merit', 'onesem');

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `sid` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `pno` varchar(20) DEFAULT NULL,
  `income` int(11) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `occupation` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`sid`, `name`, `age`, `pno`, `income`, `city`, `occupation`) VALUES
('stu10', 'Yash', 36, '8926685903', 323162, 'Delhi', 'Real estate'),
('stu11', 'Mohammed', 51, '8586895605', 193892, 'Mangalore', 'Actor'),
('stu12', 'Ashith', 36, '8464829699', 166397, 'Mumbai', 'Engineer'),
('stu13', 'Abel', 32, '8665914861', 206483, 'Delhi', 'Doctor'),
('stu14', 'John', 37, '8881668895', 425708, 'Mangalore', 'Actor'),
('stu15', 'rashid', 37, '8354714477', 441338, 'Delhi', 'Teacher'),
('stu16', 'NM', 43, '8385393793', 207925, 'Mumbai', 'Real estate'),
('stu17', 'Amitha', 45, '8341576036', 206366, 'Mumbai', 'Doctor'),
('stu19', 'Carlos', 35, '8338672934', 363779, 'Chennai', 'Politician'),
('stu2', 'John', 48, '7791385280', 129741, 'Mumbai', 'Teacher'),
('stu20', 'Isaac', 32, '7994151852', 488712, 'Chennai', 'Doctor'),
('stu21', 'Atif', 41, '8680914680', 442830, 'Mangalore', 'Actor'),
('stu22', 'Emma', 47, '7578139174', 218532, 'Chennai', 'Actor'),
('stu22', 'Wilson', 39, '7638370509', 378344, 'Chennai', 'Doctor'),
('stu23', 'Lucifer', 51, '8236442216', 462475, 'Mumbai', 'Actor'),
('stu23', 'Mily', 35, '8299234034', 464202, 'Chennai', 'Real estate'),
('stu25', 'Arjun', 50, '8036763589', 259847, 'Delhi', 'Doctor'),
('stu26', 'Karan', 33, '8371430965', 459235, 'Chennai', 'Politician'),
('stu27', 'Queen', 42, '7993869962', 368022, 'Bangalore', 'Teacher'),
('stu4', 'harpreeth', 43, '8892409533', 182919, 'Bangalore', 'Teacher'),
('stu5', 'Karl', 51, '7670105178', 418168, 'Bangalore', 'Doctor'),
('stu6', 'Islam', 49, '7972816239', 457323, 'Delhi', 'Doctor'),
('stu7', 'Hari', 45, '8546026976', 135301, 'Chennai', 'Real estate'),
('stu8', 'Tyson', 42, '8691992790', 269945, 'Mangalore', 'Doctor'),
('stu9', 'MD', 47, '7882556439', 158805, 'Bangalore', 'Politician');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `sid` varchar(20) NOT NULL,
  `subject` varchar(20) NOT NULL,
  `marks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`sid`, `subject`, `marks`) VALUES
('stu1', 'Computer', 49),
('stu1', 'English', 100),
('stu1', 'Geography', 88),
('stu1', 'History', 92),
('stu1', 'Math', 49),
('stu1', 'PT', 80),
('stu1', 'Science', 31),
('stu10', 'Computer', 86),
('stu10', 'English', 64),
('stu10', 'Geography', 81),
('stu10', 'History', 98),
('stu10', 'Math', 62),
('stu10', 'PT', 69),
('stu10', 'Science', 86),
('stu11', 'Computer', 63),
('stu11', 'English', 44),
('stu11', 'Geography', 86),
('stu11', 'History', 75),
('stu11', 'Math', 57),
('stu11', 'PT', 77),
('stu11', 'Science', 45),
('stu12', 'Computer', 86),
('stu12', 'English', 100),
('stu12', 'Geography', 88),
('stu12', 'History', 40),
('stu12', 'Math', 27),
('stu12', 'PT', 31),
('stu12', 'Science', 71),
('stu13', 'Computer', 92),
('stu13', 'English', 72),
('stu13', 'Geography', 71),
('stu13', 'History', 66),
('stu13', 'Math', 85),
('stu13', 'PT', 27),
('stu13', 'Science', 61),
('stu14', 'Computer', 71),
('stu14', 'English', 92),
('stu14', 'Geography', 71),
('stu14', 'History', 99),
('stu14', 'Math', 76),
('stu14', 'PT', 26),
('stu14', 'Science', 27),
('stu15', 'Computer', 27),
('stu15', 'English', 68),
('stu15', 'Geography', 74),
('stu15', 'History', 43),
('stu15', 'Math', 37),
('stu15', 'PT', 68),
('stu15', 'Science', 67),
('stu16', 'Computer', 30),
('stu16', 'English', 53),
('stu16', 'Geography', 88),
('stu16', 'History', 61),
('stu16', 'Math', 69),
('stu16', 'PT', 56),
('stu16', 'Science', 38),
('stu17', 'Computer', 32),
('stu17', 'English', 69),
('stu17', 'Geography', 65),
('stu17', 'History', 65),
('stu17', 'Math', 86),
('stu17', 'PT', 44),
('stu17', 'Science', 76),
('stu18', 'Computer', 80),
('stu18', 'English', 70),
('stu18', 'Geography', 52),
('stu18', 'History', 26),
('stu18', 'Math', 38),
('stu18', 'PT', 81),
('stu18', 'Science', 89),
('stu19', 'Computer', 97),
('stu19', 'English', 38),
('stu19', 'Geography', 44),
('stu19', 'History', 28),
('stu19', 'Math', 98),
('stu19', 'PT', 81),
('stu19', 'Science', 72),
('stu2', 'Computer', 57),
('stu2', 'English', 56),
('stu2', 'Geography', 85),
('stu2', 'History', 88),
('stu2', 'Math', 87),
('stu2', 'PT', 29),
('stu2', 'Science', 33),
('stu20', 'Computer', 95),
('stu20', 'English', 80),
('stu20', 'Geography', 98),
('stu20', 'History', 69),
('stu20', 'Math', 76),
('stu20', 'PT', 86),
('stu20', 'Science', 69),
('stu21', 'Computer', 94),
('stu21', 'English', 97),
('stu21', 'Geography', 74),
('stu21', 'History', 28),
('stu21', 'Math', 88),
('stu21', 'PT', 79),
('stu21', 'Science', 88),
('stu22', 'Computer', 32),
('stu22', 'English', 94),
('stu22', 'Geography', 87),
('stu22', 'History', 34),
('stu22', 'Math', 78),
('stu22', 'PT', 64),
('stu22', 'Science', 94),
('stu23', 'Computer', 95),
('stu23', 'English', 76),
('stu23', 'Geography', 46),
('stu23', 'History', 29),
('stu23', 'Math', 83),
('stu23', 'PT', 99),
('stu23', 'Science', 80),
('stu24', 'Computer', 97),
('stu24', 'English', 52),
('stu24', 'Geography', 80),
('stu24', 'History', 42),
('stu24', 'Math', 32),
('stu24', 'PT', 37),
('stu24', 'Science', 27),
('stu25', 'Computer', 63),
('stu25', 'English', 63),
('stu25', 'Geography', 74),
('stu25', 'History', 76),
('stu25', 'Math', 62),
('stu25', 'PT', 49),
('stu25', 'Science', 50),
('stu26', 'Computer', 84),
('stu26', 'English', 54),
('stu26', 'Geography', 42),
('stu26', 'History', 34),
('stu26', 'Math', 46),
('stu26', 'PT', 44),
('stu26', 'Science', 92),
('stu27', 'Computer', 34),
('stu27', 'English', 59),
('stu27', 'Geography', 82),
('stu27', 'History', 50),
('stu27', 'Math', 55),
('stu27', 'PT', 83),
('stu27', 'Science', 89),
('stu3', 'Computer', 71),
('stu3', 'English', 62),
('stu3', 'Geography', 74),
('stu3', 'History', 79),
('stu3', 'Math', 99),
('stu3', 'PT', 35),
('stu3', 'Science', 67),
('stu4', 'Computer', 38),
('stu4', 'English', 31),
('stu4', 'Geography', 93),
('stu4', 'History', 60),
('stu4', 'Math', 60),
('stu4', 'PT', 60),
('stu4', 'Science', 37),
('stu5', 'Computer', 94),
('stu5', 'English', 27),
('stu5', 'Geography', 89),
('stu5', 'History', 93),
('stu5', 'Math', 44),
('stu5', 'PT', 65),
('stu5', 'Science', 41),
('stu6', 'Computer', 56),
('stu6', 'English', 45),
('stu6', 'Geography', 33),
('stu6', 'History', 52),
('stu6', 'Math', 46),
('stu6', 'PT', 87),
('stu6', 'Science', 49),
('stu7', 'Computer', 79),
('stu7', 'English', 98),
('stu7', 'Geography', 57),
('stu7', 'History', 32),
('stu7', 'Math', 81),
('stu7', 'PT', 73),
('stu7', 'Science', 93),
('stu8', 'Computer', 71),
('stu8', 'English', 79),
('stu8', 'Geography', 31),
('stu8', 'History', 71),
('stu8', 'Math', 54),
('stu8', 'PT', 96),
('stu8', 'Science', 63),
('stu9', 'Computer', 57),
('stu9', 'English', 82),
('stu9', 'Geography', 60),
('stu9', 'History', 64),
('stu9', 'Math', 56),
('stu9', 'PT', 96),
('stu9', 'Science', 31);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `sid` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `mname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `religion` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `leadersid` varchar(20) DEFAULT NULL,
  `classno` int(11) DEFAULT NULL,
  `sec` varchar(1) NOT NULL CHECK (`sec` in ('A','B','C','a','b','c')),
  `admin_no` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sid`, `fname`, `mname`, `lname`, `religion`, `dob`, `leadersid`, `classno`, `sec`, `admin_no`) VALUES
('stu1', 'ASH', NULL, NULL, 'Hindu', '2009-11-01', NULL, 8, 'A', 'ajad420'),
('stu10', 'virat', NULL, 'Kholi', 'Hindu', '2008-11-01', NULL, 9, 'A', 'ajad420'),
('stu11', 'Shahrukh', NULL, 'Khan', 'Muslim', '2008-05-06', 'stu10', 9, 'A', 'ajad420'),
('stu12', 'Amrith', NULL, NULL, 'Hindu', '2008-04-20', 'stud10', 9, 'A', 'ajad420'),
('stu13', 'Bryan', NULL, 'Adams', 'Christian', '2008-10-05', NULL, 9, 'B', 'ajad421'),
('stu14', 'Michael', 'B', 'Jordan', 'Christian', '2008-07-24', 'stu13', 9, 'B', 'ajad422'),
('stu15', 'Salman', NULL, 'Khan', 'Muslim', '2008-12-20', 'stud13', 9, 'B', 'ajad423'),
('stu16', 'Narendra', NULL, 'Modi', 'Hindu', '2008-01-05', NULL, 9, 'C', 'ajad421'),
('stu17', 'Amith', NULL, 'Shah', 'Hindu', '2008-07-04', 'stu16', 8, 'C', 'ajad422'),
('stu18', 'Arun', NULL, NULL, NULL, '2008-12-13', 'stud16', 9, 'C', 'ajad423'),
('stu19', 'Chris', NULL, 'Gayle', NULL, '2007-11-01', NULL, 10, 'A', 'ajad420'),
('stu2', 'joseph', NULL, NULL, 'Christian', '2009-05-06', 'stu1', 8, 'A', 'ajad420'),
('stu20', 'Albert', NULL, 'Khan', 'Muslim', '2007-05-06', 'stu19', 10, 'A', 'ajad420'),
('stu21', 'Aslam', NULL, 'Khan', 'Athesit', '2007-04-20', 'stud19', 10, 'A', 'ajad420'),
('stu22', 'Chris', NULL, 'Adams', 'Christian', '2007-10-05', NULL, 10, 'B', 'ajad421'),
('stu23', 'Michael', 'B', 'Philip', 'Christian', '2007-07-24', 'stu22', 10, 'B', 'ajad422'),
('stu24', 'Feroz', NULL, 'Khan', 'Muslim', '2007-12-20', 'stud22', 10, 'B', 'ajad423'),
('stu25', 'Rahul', NULL, 'Gandhi', 'Hindu', '2007-01-05', NULL, 10, 'C', 'ajad421'),
('stu26', 'Sonia', NULL, 'Gandhi', 'Hindu', '2007-07-04', 'stu25', 10, 'C', 'ajad422'),
('stu27', 'King', 'Luther', 'John', 'Christian', '2007-12-13', 'stud25', 10, 'B', 'ajad423'),
('stu28', 'Andrew', '', 'Flintoff', 'Christian', '2012-11-15', NULL, 9, 'B', NULL),
('stu3', 'Assadi', NULL, NULL, 'Muslim', '2009-04-20', 'stud1', 8, 'A', 'ajad420'),
('stu32', 'Issac', '', 'Newton', 'Atheist', '2014-11-04', NULL, 9, 'A', NULL),
('stu4', 'Ashley', NULL, 'singh', 'Sikh', '2009-10-05', NULL, 8, 'B', 'ajad421'),
('stu5', 'Michael', NULL, 'Jackson', 'Christian', '2009-07-24', 'stu4', 8, 'B', 'ajad422'),
('stu6', 'Assadi', 'abdul', 'khader', 'Muslim', '2009-12-20', 'stud5', 8, 'B', 'ajad423'),
('stu7', 'Rohith', NULL, 'sharma', 'Hindu', '2009-01-05', 'stud8', 8, 'C', 'ajad421'),
('stu8', 'Michael', NULL, 'Smith', 'Christian', '2009-07-04', NULL, 8, 'C', 'ajad422'),
('stu9', 'MD', 'abdul', 'khader', 'Muslim', '2009-12-02', 'stud8', 8, 'C', 'ajad423');

--
-- Triggers `student`
--
DELIMITER $$
CREATE TRIGGER `classnotvalid2` BEFORE UPDATE ON `student` FOR EACH ROW BEGIN  
DECLARE message varchar(50);
DECLARE message2 varchar(50);
set message='Classes only till 10';
set message2='Cant demote class';
if(new.classno>10) 
then
signal sqlstate '45000'
set MESSAGE_TEXT=message ;
elseif(new.classno<old.classno)
then
signal sqlstate '45000'
set MESSAGE_TEXT=message2 ;
END IF;    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_achivements`
-- (See below for the actual view)
--
CREATE TABLE `student_achivements` (
`sid` varchar(20)
,`fname` varchar(20)
,`lname` varchar(20)
,`classno` int(11)
,`sec` varchar(1)
,`event` varchar(20)
,`category` varchar(20)
,`place` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_report_view`
-- (See below for the actual view)
--
CREATE TABLE `student_report_view` (
`sid` varchar(20)
,`fname` varchar(20)
,`lname` varchar(20)
,`classno` int(11)
,`sec` varchar(1)
,`subject` varchar(20)
,`marks` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `tid` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `mname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL CHECK (`age` > 18),
  `salary` int(11) NOT NULL,
  `years_of_experience` int(11) DEFAULT NULL,
  `hiredby` varchar(10) DEFAULT NULL,
  `dateofjoin` date DEFAULT NULL,
  `dno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`tid`, `fname`, `mname`, `lname`, `age`, `salary`, `years_of_experience`, `hiredby`, `dateofjoin`, `dno`) VALUES
('emp105', 'yash', 'amrith', 'raj', 45, 60000, 15, 'ajad420', '2014-10-02', 1),
('emp106', 'Arun', NULL, 'singh', 32, 25000, 5, 'ajad421', '2020-10-02', 1),
('emp107', 'Karthik', 'H', 'singh', 36, 30000, 10, 'ajad420', '2018-11-23', 1),
('emp205', 'Adam', 'M', 'Smith', 43, 45000, 10, 'ajad423', '2015-08-20', 2),
('emp206', 'Emily', NULL, 'Watson', 26, 20000, 3, 'ajad422', '2021-06-05', 2),
('emp207', 'George', 'Michael', 'Smith', 37, 27000, 6, 'ajad425', '2017-08-20', 2),
('emp305', 'Ashoka', NULL, NULL, 68, 48000, 30, 'ajad422', '2019-03-13', 3),
('emp306', 'Akbar', NULL, NULL, 24, 15000, 1, 'ajad423', '2021-04-10', 3),
('emp307', 'mick', NULL, 'shelly', 64, 35000, 30, 'ajad425', '2011-03-13', 3),
('emp405', 'india', NULL, NULL, 68, 28000, 30, 'ajad422', '2019-03-13', 4),
('emp406', 'us', NULL, NULL, 24, 15000, 1, 'ajad423', '2021-04-10', 4),
('emp407', 'russia', NULL, 'uklal', 64, 15200, 30, 'ajad425', '2011-03-13', 4),
('emp505', 'albert', NULL, 'Einstein', 63, 70700, 30, 'ajad422', '2010-03-13', 5),
('emp506', 'shiva', NULL, 'raman', 23, 15000, 1, 'ajad423', '2021-04-10', 5),
('emp507', 'mick', NULL, 'shelly', 55, 65000, 30, 'ajad425', '2011-03-13', 5),
('emp605', 'Elon', NULL, NULL, 63, 75000, 30, 'ajad422', '2019-03-13', 6),
('emp606', 'Linus', NULL, NULL, 22, 15000, 1, 'ajad423', '2021-04-10', 6),
('emp607', 'kelly', NULL, 'homes', 53, 65000, 30, 'ajad425', '2011-03-13', 6),
('emp705', 'virat', NULL, NULL, 30, 43000, 5, 'ajad422', '2019-03-13', 7),
('emp706', 'khabib', NULL, NULL, 24, 15000, 1, 'ajad423', '2021-04-10', 7),
('emp707', 'rohith', NULL, 'shelly', 34, 32000, 8, 'ajad425', '2017-03-13', 7);

--
-- Triggers `teacher`
--
DELIMITER $$
CREATE TRIGGER `newsalary` BEFORE UPDATE ON `teacher` FOR EACH ROW BEGIN  
DECLARE msg varchar(50);
set msg='Cant decrease the salary';
if(new.salary<old.salary) 
then
signal sqlstate '45000'
set MESSAGE_TEXT=msg ;
END IF;    
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `noteligible` BEFORE INSERT ON `teacher` FOR EACH ROW BEGIN  
DECLARE message varchar(50);
set message='AGAINST THE LAW UNDER 18';
if(new.age<18) 
then
signal sqlstate '45000'
set MESSAGE_TEXT=message ;
END IF;    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_pno`
--

CREATE TABLE `teacher_pno` (
  `tid` varchar(20) NOT NULL,
  `pno` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher_pno`
--

INSERT INTO `teacher_pno` (`tid`, `pno`) VALUES
('emp105', '7204605731'),
('emp105', '7204605741'),
('emp106', '7204605771'),
('emp107', '7204615771'),
('emp205', '7204605732'),
('emp205', '7204605742'),
('emp206', '7204605772'),
('emp207', '7204615772'),
('emp305', '7204605733'),
('emp305', '7204605743'),
('emp306', '7204605773'),
('emp307', '7204615773'),
('emp405', '7204605734'),
('emp405', '7204605744'),
('emp505', '7204605735'),
('emp505', '7204605745'),
('emp605', '7204605736'),
('emp605', '7204605746'),
('emp705', '7204605737'),
('emp705', '7204605747');

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `classno` int(11) NOT NULL,
  `section` varchar(1) NOT NULL,
  `tid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teaches`
--

INSERT INTO `teaches` (`classno`, `section`, `tid`) VALUES
(8, 'A', 'emp107'),
(8, 'A', 'emp206'),
(8, 'A', 'emp305'),
(8, 'A', 'emp407'),
(8, 'A', 'emp505'),
(8, 'A', 'emp607'),
(8, 'A', 'emp707'),
(8, 'B', 'emp107'),
(8, 'B', 'emp207'),
(8, 'B', 'emp306'),
(8, 'B', 'emp405'),
(8, 'B', 'emp507'),
(8, 'B', 'emp607'),
(8, 'B', 'emp705'),
(8, 'C', 'emp107'),
(8, 'C', 'emp207'),
(8, 'C', 'emp305'),
(8, 'C', 'emp406'),
(8, 'C', 'emp505'),
(8, 'C', 'emp605'),
(8, 'C', 'emp706'),
(9, 'A', 'emp107'),
(9, 'A', 'emp206'),
(9, 'A', 'emp307'),
(9, 'A', 'emp407'),
(9, 'A', 'emp506'),
(9, 'A', 'emp607'),
(9, 'A', 'emp707'),
(9, 'B', 'emp107'),
(9, 'B', 'emp207'),
(9, 'B', 'emp306'),
(9, 'B', 'emp407'),
(9, 'B', 'emp507'),
(9, 'B', 'emp606'),
(9, 'B', 'emp707'),
(9, 'C', 'emp107'),
(9, 'C', 'emp207'),
(9, 'C', 'emp307'),
(9, 'C', 'emp406'),
(9, 'C', 'emp507'),
(9, 'C', 'emp706'),
(9, 'C', 'emp707'),
(10, 'A', 'emp106'),
(10, 'A', 'emp206'),
(10, 'A', 'emp306'),
(10, 'A', 'emp405'),
(10, 'A', 'emp507'),
(10, 'A', 'emp605'),
(10, 'A', 'emp705'),
(10, 'B', 'emp105'),
(10, 'B', 'emp207'),
(10, 'B', 'emp305'),
(10, 'B', 'emp406'),
(10, 'B', 'emp506'),
(10, 'B', 'emp607'),
(10, 'B', 'emp707'),
(10, 'C', 'emp107'),
(10, 'C', 'emp205'),
(10, 'C', 'emp307'),
(10, 'C', 'emp406'),
(10, 'C', 'emp505'),
(10, 'C', 'emp606'),
(10, 'C', 'emp706');

-- --------------------------------------------------------

--
-- Structure for view `student_achivements`
--
DROP TABLE IF EXISTS `student_achivements`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_achivements`  AS SELECT `student`.`sid` AS `sid`, `student`.`fname` AS `fname`, `student`.`lname` AS `lname`, `student`.`classno` AS `classno`, `student`.`sec` AS `sec`, `extraactivities`.`event` AS `event`, `extraactivities`.`category` AS `category`, `extraactivities`.`place` AS `place` FROM (`student` join `extraactivities` on(`student`.`sid` = `extraactivities`.`sid`))  ;

-- --------------------------------------------------------

--
-- Structure for view `student_report_view`
--
DROP TABLE IF EXISTS `student_report_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_report_view`  AS SELECT `student`.`sid` AS `sid`, `student`.`fname` AS `fname`, `student`.`lname` AS `lname`, `student`.`classno` AS `classno`, `student`.`sec` AS `sec`, `report`.`subject` AS `subject`, `report`.`marks` AS `marks` FROM (`student` join `report` on(`student`.`sid` = `report`.`sid`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_no`),
  ADD UNIQUE KEY `password` (`password`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`classno`,`section`),
  ADD KEY `class_teacher` (`class_teacher`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dno`),
  ADD KEY `FK_TempSales_SalesReason` (`chair_tid`);

--
-- Indexes for table `extraactivities`
--
ALTER TABLE `extraactivities`
  ADD PRIMARY KEY (`sid`,`event`,`category`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`transid`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`sid`,`name`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`sid`,`subject`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `classno` (`classno`,`sec`),
  ADD KEY `admin_no` (`admin_no`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `hiredby` (`hiredby`),
  ADD KEY `dno` (`dno`);

--
-- Indexes for table `teacher_pno`
--
ALTER TABLE `teacher_pno`
  ADD PRIMARY KEY (`tid`,`pno`),
  ADD UNIQUE KEY `pno` (`pno`);

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD PRIMARY KEY (`classno`,`section`,`tid`),
  ADD KEY `tid` (`tid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`class_teacher`) REFERENCES `teacher` (`tid`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `FK_TempSales_SalesReason` FOREIGN KEY (`chair_tid`) REFERENCES `teacher` (`tid`);

--
-- Constraints for table `extraactivities`
--
ALTER TABLE `extraactivities`
  ADD CONSTRAINT `extraactivities_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`);

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`);

--
-- Constraints for table `parent`
--
ALTER TABLE `parent`
  ADD CONSTRAINT `parent_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`classno`,`sec`) REFERENCES `class` (`classno`, `section`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`admin_no`) REFERENCES `admin` (`admin_no`);

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`hiredby`) REFERENCES `admin` (`admin_no`),
  ADD CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`);

--
-- Constraints for table `teacher_pno`
--
ALTER TABLE `teacher_pno`
  ADD CONSTRAINT `teacher_pno_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`);

--
-- Constraints for table `teaches`
--
ALTER TABLE `teaches`
  ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`classno`,`section`) REFERENCES `class` (`classno`, `section`),
  ADD CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
