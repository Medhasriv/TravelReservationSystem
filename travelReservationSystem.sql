CREATE DATABASE IF NOT EXISTS `TravelReservationSystem`;
USE `TravelReservationSystem`;

-- -----------------airlinecompany-------------------------------------
-- Server version 5.6.35-log
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `Flight`;
CREATE TABLE `Flight` (
`FlightNumber` int NOT NULL DEFAULT 0,
`NumberOfSeats` int NOT NULL DEFAULT 0,
`OperatingDays` date DEFAULT NULL,
`Domestic/International` varchar(13) DEFAULT NULL,
PRIMARY KEY (`FlightNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- LOCK TABLES `Flight` WRITE;
-- /*!40000 ALTER TABLE `Flight` DISABLE KEYS */;
-- INSERT INTO `Flight` VALUES 
-- ('12425','125', '2022-08-13', 'Domestic'),
-- ('126525','185', '2022-08-13', 'International'),
-- ('124325','176', '2022-08-13', 'International'),
-- ('174325','140', '2022-08-13', 'Domestic');
-- /*!40000 ALTER TABLE `Flight` ENABLE KEYS */;
-- UNLOCK TABLES;

DROP TABLE IF EXISTS `Customer`;
CREATE TABLE `Customer` (
`Email` varchar(100) NOT NULL,
`AccountNumber` int NOT NULL,
`DOB` datetime DEFAULT NULL,
`Phone` int NOT NULL DEFAULT 0,
`Name` varchar(50) DEFAULT '',
`Password` varchar(50) DEFAULT '',
PRIMARY KEY (`Email`, `AccountNumber`),
Index idx_AccountNumber(`AccountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES 
('uriowpjl751@yhn.com', 		321642321 , '2022-08-13' , 0, 'Justine Emilia', 'password'),
('jfdksalbdv4321798@yhn.com', 	213590253 , '2022-08-13' , 0, 'Brigitte Mafalda', 'passworda'),
('dhasjklg12352@yhn.com', 		721895063 , '2022-08-13' , 0, 'Hortensia Matilde', 'passwordb'),
('fdsakl12334@yhn.com',			712385909 , '2022-08-13' , 0, 'Eseoghene Helene', 'passwordc');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `AirlineCompany`;
CREATE TABLE `AirlineCompany` (
`AirlineID` char(2) DEFAULT '!!',
PRIMARY KEY (`AirlineID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- LOCK TABLES `AirlineCompany` WRITE;
-- /*!40000 ALTER TABLE `AirlineCompany` DISABLE KEYS */;
-- INSERT INTO `AirlineCompany` VALUES 
-- ('GW'),
-- ('HQ'),
-- ('UA'),
-- ('PA');
-- /*!40000 ALTER TABLE `AirlineCompany` ENABLE KEYS */;
-- UNLOCK TABLES;

DROP TABLE IF EXISTS `AssociatedWith`;
CREATE TABLE `AssociatedWith` (
`AirlineID` char(2) DEFAULT '!!',
`FlightNumber` int NOT NULL DEFAULT 0,
FOREIGN KEY (`AirlineID`) REFERENCES `AirlineCompany`(`AirlineID`),
FOREIGN KEY (`FlightNumber`) REFERENCES `Flight`(`FlightNumber`),
PRIMARY KEY (`AirlineID`, `FlightNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- LOCK TABLES `AssociatedWith` WRITE;
-- /*!40000 ALTER TABLE `AssociatedWith` DISABLE KEYS */;
-- INSERT INTO `AssociatedWith` VALUES 
-- ('GW','12425'),
-- ('HQ','126525'),
-- ('UA','124325'),
-- ('PA','174325');
-- /*!40000 ALTER TABLE `AssociatedWith` ENABLE KEYS */;
-- UNLOCK TABLES;

DROP TABLE IF EXISTS `Airport`;
CREATE TABLE `Airport` (
`AirportID` varchar(100) NOT NULL DEFAULT '',
PRIMARY KEY (`AirportID`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- LOCK TABLES `Airport` WRITE;
-- /*!40000 ALTER TABLE `Airport` DISABLE KEYS */;
-- INSERT INTO `Airport` VALUES 
-- ('Greenland Waypoint'),
-- ('Holland International'),
-- ('Utah State'),
-- ('Phoenix Sky Harbor');
-- /*!40000 ALTER TABLE `Airport` ENABLE KEYS */;
-- UNLOCK TABLES;

DROP TABLE IF EXISTS `Ticket`;
CREATE TABLE `Ticket` (
`AccountNumber` int DEFAULT 0,
`TicketNumber` int NOT NULL DEFAULT 0,
`FlightDuration` datetime DEFAULT NULL,
`PurchaseDate` date DEFAULT NULL,
`DepartureLocation` varchar(50) NOT NULL DEFAULT '',
`PassengerName` varchar(50) NOT NULL DEFAULT '',
`Destination` varchar(50) NOT NULL DEFAULT '',
`TotalPrice` int NOT NULL DEFAULT 0,
`Class` varchar(20) NOT NULL DEFAULT '',
PRIMARY KEY (`AccountNumber`, `ticketNumber`),
FOREIGN KEY (`AccountNumber`) REFERENCES `Customer`(`AccountNumber`),
INDEX idx_ticketNumber(`ticketNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- LOCK TABLES `Ticket` WRITE;
-- /*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
-- INSERT INTO `Ticket` VALUES 
-- (321642321, 56317, '', '2022-08-13', '', ),
-- (213590253, 71893, '', '2022-08-13', '', ),
-- (721895063, 62978, '', '2022-08-13', '', ),
-- (712385909, 65327, '', '2022-08-13', '', );
-- /*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
-- UNLOCK TABLES;

DROP TABLE IF EXISTS `Sells`;
CREATE TABLE `Sells` (
`AirportID` varchar(50) NOT NULL DEFAULT '',
`TicketNumber` int NOT NULL DEFAULT 0,
FOREIGN KEY(`TicketNumber`) REFERENCES `Ticket`(`TicketNumber`),
FOREIGN KEY (`AirportID`) REFERENCES `Airport`(`AirportID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- LOCK TABLES `Airport` WRITE;
-- /*!40000 ALTER TABLE `Airport` DISABLE KEYS */;
-- INSERT INTO `Airport` VALUES 
-- ('Greenland Waypoint', 56317),
-- ('Holland International', 71893),
-- ('Utah State', 62978),
-- ('Phoenix Sky Harbor', 65327);
-- /*!40000 ALTER TABLE `Airport` ENABLE KEYS */;
-- UNLOCK TABLES;

DROP TABLE IF EXISTS `Buy`;
CREATE TABLE `Buy` (
`TicketNumber` int NOT NULL DEFAULT 0,
`FlightNumber` int NOT NULL DEFAULT 0,
`AirlineID` varchar(2) NOT NULL DEFAULT '00',
`AirportID` varchar(50) NOT NULL DEFAULT '',
`BookingFee` float NOT NULL DEFAULT 0.00,
`ReservationPortfolio` int NOT NULL DEFAULT 0,
FOREIGN KEY(`AirportID`) REFERENCES `Airport`(`AirportID`),
FOREIGN KEY(`FlightNumber`) REFERENCES `Flight`(`FlightNumber`),
FOREIGN KEY(`TicketNumber`) REFERENCES `Ticket`(`TicketNumber`),
FOREIGN KEY(`AirlineID`) REFERENCES `AirlineCompany`(`AirlineID`),
PRIMARY KEY (`TicketNumber`, `FlightNumber`, `AirlineID`, `AirportID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Operates`;
CREATE TABLE `Operates` (
`AirportID` varchar(50) NOT NULL DEFAULT '',
`FlightNumber` int NOT NULL DEFAULT 0,
FOREIGN KEY(`AirportID`) REFERENCES `Airport`(`AirportID`),
FOREIGN KEY(`FlightNumber`) REFERENCES `Flight`(`FlightNumber`),
PRIMARY KEY (`AirportID`, `FlightNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Reserves`;
CREATE TABLE `Reserves` (
`TicketNumber` int NOT NULL DEFAULT 0,
`FlightNumber` int NOT NULL DEFAULT 0,
FOREIGN KEY(`FlightNumber`) REFERENCES `Flight`(`FlightNumber`),
FOREIGN KEY(`TicketNumber`) REFERENCES `Ticket`(`TicketNumber`),
PRIMARY KEY (`FlightNumber`, `TicketNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;