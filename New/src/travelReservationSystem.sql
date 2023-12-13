DROP DATABASE IF EXISTS `TravelReservationSystem`;
-- Note that the preset values need to exist here before submitting.
CREATE DATABASE IF NOT EXISTS `TravelReservationSystem`;
USE `TravelReservationSystem`;

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
-- ('124256','125', '2022-08-13', 'Domestic'),
-- ('126525','185', '2022-08-13', 'International'),
-- ('124325','176', '2022-08-13', 'International'),
-- ('174325','140', '2022-08-13', 'Domestic');
-- /*!40000 ALTER TABLE `Flight` ENABLE KEYS */;
-- UNLOCK TABLES;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
`username` varchar(50) NOT NULL DEFAULT '',
`password` varchar(50) NOT NULL DEFAULT '',
`phone` varchar(50) DEFAULT NULL,
`dob` datetime DEFAULT NULL,
`name` varchar(50) DEFAULT NULL,
`email` varchar(100) DEFAULT NULL,
PRIMARY KEY (`username`)
-- Index idx_AccountNumber(`us`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- LOCK TABLES `users` WRITE;
-- /*!40000 ALTER TABLE `users` DISABLE KEYS */;
-- INSERT INTO `users` VALUES 
-- ('user123',  'password',	321642321 , '2022-08-13', 'Justine Emilia','uriowpjl751@yhn.com',),
-- ('user124',  'passworda',	213590253 , '2022-08-13', 'Brigitte Mafalda','jfdksalbdv4321798@yhn.com',),
-- ('user126',  'passwordb',	721895063 , '2022-08-13', 'Hortensia Matilde','dhasjklg12352@yhn.com',),
-- ('user127', 'passwordc',	712385909 , '2022-08-13', 'Eseoghene Helene','fdsakl12334@yhn.com',);
-- /*!40000 ALTER TABLE `users` ENABLE KEYS */;
-- UNLOCK TABLES;

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
-- ('GW','124256'),
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

 LOCK TABLES `Airport` WRITE;
 /*!40000 ALTER TABLE `Airport` DISABLE KEYS */;
 INSERT INTO `Airport` VALUES 
 ('Greenland Waypoint'),
 ('Holland International'),
 ('Utah State'),
 ('Phoenix Sky Harbor');
 /*!40000 ALTER TABLE `Airport` ENABLE KEYS */;
 UNLOCK TABLES;

DROP TABLE IF EXISTS `Ticket`;
CREATE TABLE `Ticket` (
`username` varchar(50) DEFAULT "",
`TicketNumber` int NOT NULL DEFAULT 0,
`FlightNumber`int NOT NULL 0;
`FlightDuration` datetime DEFAULT NULL,
`PurchaseDate` date DEFAULT NULL,
`DepartureLocation` varchar(50) NOT NULL DEFAULT '',
`PassengerName` varchar(50) NOT NULL DEFAULT '',
`Destination` varchar(50) NOT NULL DEFAULT '',
`TotalPrice` int NOT NULL DEFAULT 0,
`Class` varchar(20) NOT NULL DEFAULT '',
PRIMARY KEY (`username`, `ticketNumber`),
FOREIGN KEY (`username`, `PassengerName`) REFERENCES `users`(`username`, `name`),
INDEX idx_ticketNumber(`ticketNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

 LOCK TABLES `Ticket` WRITE;
 /*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
 INSERT INTO `Ticket` VALUES 
 ('user123', 56317, '124256',, '2022-08-13', 'First', ),
 ('user124', 71893, '126525',, '2022-08-13', 'Business', ),
 ('user126', 62978, '124325',, '2022-08-13', 'Economy', ),
 ('user127', 65327, '174325',, '2022-08-13', 'Economy', );
 /*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
 UNLOCK TABLES;

DROP TABLE IF EXISTS `Sells`;
CREATE TABLE `Sells` (
`AirportID` varchar(50) NOT NULL DEFAULT '',
`TicketNumber` int NOT NULL DEFAULT 0,
FOREIGN KEY(`TicketNumber`) REFERENCES `Ticket`(`TicketNumber`),
FOREIGN KEY (`AirportID`) REFERENCES `Airport`(`AirportID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

 LOCK TABLES `Airport` WRITE;
 /*!40000 ALTER TABLE `Airport` DISABLE KEYS */;
 INSERT INTO `Airport` VALUES 
 ('Greenland Waypoint', 56317),
 ('Holland International', 71893),
 ('Utah State', 62978),
 ('Phoenix Sky Harbor', 65327);
 /*!40000 ALTER TABLE `Airport` ENABLE KEYS */;
 UNLOCK TABLES;

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