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

 LOCK TABLES `Flight` WRITE;
 /*!40000 ALTER TABLE `Flight` DISABLE KEYS */;
 INSERT INTO `Flight` VALUES 
 ('124256','125', '2022-08-13', 'Domestic'),
 ('126525','185', '2022-08-13', 'International'),
 ('124325','176', '2022-08-13', 'International'),
 ('174325','140', '2022-08-13', 'Domestic'),
 ('124329','140', '2022-08-13', 'Domestic');
 
 /*!40000 ALTER TABLE `Flight` ENABLE KEYS */;
 UNLOCK TABLES;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
`username` varchar(50) NOT NULL DEFAULT '',
`password` varchar(50) NOT NULL DEFAULT '',
`phone` varchar(50) DEFAULT NULL,
`dob` datetime DEFAULT NULL,
`name` varchar(50) NOT NULL DEFAULT '',
`email` varchar(100) DEFAULT NULL,
PRIMARY KEY (`username`, `name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
 /*!40000 ALTER TABLE `users` DISABLE KEYS */;
 INSERT INTO `users` VALUES 
('Ammm','', NULL,NULL,'John Doe',NULL),
('345678','', NULL,NULL,'Bob Johnson',NULL),
('789012','', NULL,NULL,'Jane Smith',NULL),
('1234326','', NULL,NULL,'Leo Messi',NULL),
('191642326','', NULL,NULL,'',NULL),
('213590253','', NULL,NULL,'',NULL),
('321642321','', NULL,NULL,'',NULL),
('321642326','', NULL,NULL,'',NULL),
('432432424','', NULL,NULL,'Leo Messi',NULL),
('712385909','', NULL,NULL,'',NULL),
('721895063','', NULL,NULL,'',NULL),
 ('user123',  'password',	'321642321' , '2022-08-13', 'Justine Emilia','uriowpjl751@yhn.com'),
 ('user124',  'passworda',	'213590253' , '2022-08-13', 'Brigitte Mafalda','jfdksalbdv4321798@yhn.com'),
 ('user126',  'passwordb',	'721895063' , '2022-08-13', 'Hortensia Matilde','dhasjklg12352@yhn.com'),
 ('user127', 'passwordc',	'712385909' , '2022-08-13', 'Eseoghene Helene','fdsakl12334@yhn.com');
 /*!40000 ALTER TABLE `users` ENABLE KEYS */;
 UNLOCK TABLES;

DROP TABLE IF EXISTS `AirlineCompany`;
CREATE TABLE `AirlineCompany` (
`AirlineID` char(2) DEFAULT '!!',
PRIMARY KEY (`AirlineID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `AirlineCompany` WRITE;
 /*!40000 ALTER TABLE `AirlineCompany` DISABLE KEYS */;
 INSERT INTO `AirlineCompany` VALUES 
 ('GW'),
 ('HQ'),
 ('UA'),
 ('PA');
 /*!40000 ALTER TABLE `AirlineCompany` ENABLE KEYS */;
 UNLOCK TABLES;

DROP TABLE IF EXISTS `AssociatedWith`;
CREATE TABLE `AssociatedWith` (
`AirlineID` char(2) DEFAULT '!!',
`FlightNumber` int NOT NULL DEFAULT 0,
FOREIGN KEY (`AirlineID`) REFERENCES `AirlineCompany`(`AirlineID`),
FOREIGN KEY (`FlightNumber`) REFERENCES `Flight`(`FlightNumber`),
PRIMARY KEY (`AirlineID`, `FlightNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `AssociatedWith` WRITE;
 /*!40000 ALTER TABLE `AssociatedWith` DISABLE KEYS */;
 INSERT INTO `AssociatedWith` VALUES 
 ('GW','124256'),
 ('HQ','126525'),
 ('UA','124325'),
 ('PA','174325'),
 ('PA','124329');
 /*!40000 ALTER TABLE `AssociatedWith` ENABLE KEYS */;
 UNLOCK TABLES;

DROP TABLE IF EXISTS `Airport`;
CREATE TABLE `Airport` (
`AirportID` varchar(100) NOT NULL DEFAULT '',
`City` varchar(50) NOT NULL DEFAULT '',
PRIMARY KEY (`AirportID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Airport` WRITE;
 /*!40000 ALTER TABLE `Airport` DISABLE KEYS */;
INSERT INTO `Airport` (`AirportID`, `City`) VALUES ('Greenland Waypoint', 'CityA'),
 ('Holland International', 'CityB'),
 ('Utah State', 'CityC'),
 ('Phoenix Sky Harbor', 'CityD'),
 ('Newark Liberty','CityE'),
 ('La Guardia','CityN');
 /*!40000 ALTER TABLE `Airport` ENABLE KEYS */;
 UNLOCK TABLES;

DROP TABLE IF EXISTS `Ticket`;
CREATE TABLE `Ticket` (
`username` varchar(50) DEFAULT '',
`TicketNumber` int NOT NULL DEFAULT 0,
`FlightNumber`int NOT NULL DEFAULT 0,
`FlightDuration` datetime DEFAULT NULL,
`PurchaseDate` date DEFAULT NULL,
`DepartureLocation` varchar(50) NOT NULL DEFAULT '',
`PassengerName` varchar(50) NOT NULL DEFAULT '',
`Destination` varchar(50) NOT NULL DEFAULT '',
`TotalPrice` int NOT NULL DEFAULT 0,
`Class` varchar(20) NOT NULL DEFAULT '',
PRIMARY KEY (`username`, `FlightNumber`, `TicketNumber`),
FOREIGN KEY(`FlightNumber`) REFERENCES `Flight`(`FlightNumber`),
FOREIGN KEY (`username`, `PassengerName`) REFERENCES `users`(`username`, `name`),
INDEX idx_TicketNumber(`TicketNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Ticket` WRITE;
 /*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
 INSERT INTO `Ticket` VALUES 
('Ammm',	1,			'124256','2023-01-01 12:00:00','2023-01-01','CityA','John Doe','CityB',500,'Economy'),
('345678',	3,			'126525', '2023-03-01 10:45:00','2023-03-01','CityE','Bob Johnson','CityF',900,'First Class'),
('789012',	2,			'124325', '2023-02-01 14:30:00','2023-02-01','CityC','Jane Smith','CityD',750,'Business'),
('1234326',	1344,		'124256','2023-01-01 12:00:00','2023-01-01','CityA','Leo Messi','CityB',100,'Economy'),
('191642326',5666, 		'124325', NULL,'2022-08-13','','','',150,''),
('213590253',71893, 	'124325', NULL,'2022-08-13','','','',0,''),
('321642321',56317, 	'124325', NULL,'2022-08-13','','','',0,''),
('321642326',5050, 		'124325', NULL,'2022-08-13','','','',300,''),
('432432424',4323424, 	'124329','2023-03-01 10:45:00','2023-08-01','CityE','Leo Messi','CityN',1000,'First Class'),
('712385909',65327, 	'124325',NULL,'2022-08-13','','','',0,''),
('721895063',62978, 	'124325',NULL,'2022-08-13','','','',0,'');
 /*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
 UNLOCK TABLES;

DROP TABLE IF EXISTS `Sells`;
CREATE TABLE `Sells` (
`AirportID` varchar(50) NOT NULL DEFAULT '',
`FlightNumber` int NOT NULL DEFAULT 0,
FOREIGN KEY(`FlightNumber`) REFERENCES `Flight`(`FlightNumber`),
FOREIGN KEY (`AirportID`) REFERENCES `Airport`(`AirportID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Sells` WRITE;
 /*!40000 ALTER TABLE `Sells` DISABLE KEYS */;
 INSERT INTO `Sells` VALUES 
 ('Greenland Waypoint', '124256'),
 ('Holland International', '126525'),
 ('Utah State', '124325'),
 ('Phoenix Sky Harbor', '174325'),
 ('Newark Liberty', '124329'),
 ('La Guardia', '124329');
 
 /*!40000 ALTER TABLE `Sells` ENABLE KEYS */;
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
FOREIGN KEY(`FlightNumber`) REFERENCES `Sells`(`FlightNumber`),
FOREIGN KEY(`TicketNumber`) REFERENCES `Ticket`(`FlightNumber`),
FOREIGN KEY(`AirlineID`) REFERENCES `AirlineCompany`(`AirlineID`),
PRIMARY KEY (`TicketNumber`, `FlightNumber`, `AirlineID`, `AirportID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Reserves`;
CREATE TABLE `Reserves` (
`TicketNumber` int NOT NULL DEFAULT 0,
`FlightNumber` int NOT NULL DEFAULT 0,
FOREIGN KEY(`FlightNumber`) REFERENCES `Flight`(`FlightNumber`),
FOREIGN KEY(`TicketNumber`) REFERENCES `Ticket`(`TicketNumber`),
PRIMARY KEY (`FlightNumber`, `TicketNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `Waitlist`;
CREATE TABLE Waitlist (
    FlightNumber INT NOT NULL,
    username VARCHAR(50) NOT NULL,
	FOREIGN KEY(`FlightNumber`) REFERENCES `Flight`(`FlightNumber`),
    FOREIGN KEY(`username`) REFERENCES `users`(`username`),
    PRIMARY KEY (FlightNumber, username)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO Waitlist (FlightNumber, username) VALUES
(124256, 'Ammm'),
(124256, 'user123'),
(126525, 'user124');

CREATE TABLE Questions (
    QuestionID INT AUTO_INCREMENT KEY,
    Question VARCHAR(255) NOT NULL,
    Answer VARCHAR(255)
);
INSERT INTO Questions (QuestionID, Question, Answer) VALUES
(1, 'What is a plane?', 'Plane is a flying brick'),
(2, 'What is airport?', NULL),
(3, 'Does reservation cost anything?', NULL);

CREATE TABLE Representative (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL
);
INSERT INTO Representative (username, password) VALUES
('rep1', 'reppass');

CREATE TABLE `admin` (
  `adminuser` varchar(30) NOT NULL,
  `adminpass` varchar(30) NOT NULL,
  PRIMARY KEY (`adminuser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `admin` (`adminuser`, `adminpass`) VALUES ('admin', 'admin');