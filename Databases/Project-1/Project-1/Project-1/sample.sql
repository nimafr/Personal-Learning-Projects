-- Class: CSE 3330
-- Semester: Spring 2018
-- Student Name: your name (Last, First, NETID)
-- Student ID: your id
-- Assignment: project #1

-- Table structure for table `Airport`


DROP TABLE IF EXISTS `Airport`;

CREATE TABLE `Airport` (
`Code` char(3) NOT NULL DEFAULT '',
`City` varchar(50) DEFAULT NULL,
`State` char(2) DEFAULT NULL,
PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `Airport`

LOCK TABLES `Airport` WRITE;

INSERT INTO `Airport` VALUES('DFW','Dallas','TX'),
('BOS','BOSTON','MA');

UNLOCK TABLES;