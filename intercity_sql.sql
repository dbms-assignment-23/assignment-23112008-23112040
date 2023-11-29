-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: intercity
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agents` (
  `agent_id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  PRIMARY KEY (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents`
--

LOCK TABLES `agents` WRITE;
/*!40000 ALTER TABLE `agents` DISABLE KEYS */;
INSERT INTO `agents` VALUES ('a_101','Sahil Sharma',20,'Male',7890123456),('a_105','Aditya Yadav',35,'Male',7654321098),('a_108','Swati Patel',22,'Female',8765432109),('a_112','Sneha Yadav',37,'Female',4321098765),('a_118','Poonam Yadav',27,'Female',7654321098),('a_121','Parth Verma',22,'Male',4321098765),('a_132','Priyanka Verma',29,'Female',2109876543),('a_136','Priyanka Patel',32,'Female',7654321098),('a_143','Pranay Verma',33,'Male',9876543210),('a_152','Priya Patel',29,'Female',9876543210),('a_160','Prisha Yadav',27,'Female',1098765432),('a_166','Priyanshi Patel',24,'Female',4321098765),('a_173','Prateek Tiwari',31,'Male',6543210987),('a_178','Pooja Verma',28,'Female',1098765432),('a_187','Ananya Kapoor',22,'Female',9876543210);
/*!40000 ALTER TABLE `agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arrives_on`
--

DROP TABLE IF EXISTS `arrives_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arrives_on` (
  `train_no` int NOT NULL,
  `station_code` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `arrival_time` time DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `actual_arrival_time` time DEFAULT NULL,
  `actual_departure_time` time NOT NULL,
  PRIMARY KEY (`train_no`,`station_code`,`date`,`actual_departure_time`),
  KEY `station_code` (`station_code`),
  CONSTRAINT `arrives_on_ibfk_1` FOREIGN KEY (`train_no`) REFERENCES `trains` (`train_no`),
  CONSTRAINT `arrives_on_ibfk_2` FOREIGN KEY (`station_code`) REFERENCES `stations` (`station_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrives_on`
--

LOCK TABLES `arrives_on` WRITE;
/*!40000 ALTER TABLE `arrives_on` DISABLE KEYS */;
INSERT INTO `arrives_on` VALUES (101,'MAO','2023-09-01','14:00:00','16:00:00','14:30:00','16:10:00'),(101,'SNSI','2023-09-02','12:20:00','15:00:00','13:00:00','14:00:00'),(101,'SNSI','2023-09-09','12:20:00','15:00:00','13:00:00','15:10:00'),(102,'GNC','2023-09-08','15:40:00','17:00:00','16:30:00','17:00:00'),(102,'GNC','2023-09-12','13:40:00','17:00:00','14:10:00','17:10:00'),(104,'INDB','2023-10-10','14:00:00','15:00:00','14:30:00','15:00:00'),(104,'INDB','2023-10-17','14:00:00','15:00:00','14:30:00','15:00:00'),(104,'INDB','2023-10-24','14:00:00','15:00:00','14:30:00','15:00:00');
/*!40000 ALTER TABLE `arrives_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `coach_id` varchar(20) NOT NULL,
  `mileage` int DEFAULT NULL,
  `last_maintenance_date` date DEFAULT NULL,
  `total_maintenances` int DEFAULT NULL,
  PRIMARY KEY (`coach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES ('WX301',4800,'2023-01-20',3),('WX302',5200,NULL,0),('WX303',4500,'2023-05-15',2),('WX304',5100,NULL,0),('WX305',4900,'2023-04-10',1),('WX306',4800,NULL,0),('WX307',5300,'2023-06-28',4),('WX308',0,NULL,0),('WX309',5000,'2023-02-12',2),('WX310',4800,'2023-03-05',1),('WX311',5400,NULL,0),('WX312',4700,'2023-01-18',3),('WX313',5200,NULL,0),('WX314',4900,'2023-05-10',2),('WX315',0,NULL,0),('WX316',5000,'2023-04-25',1),('WX317',5500,'2023-05-20',5),('WX318',4800,'2023-03-15',2),('WX319',5100,NULL,0),('WX320',5300,'2023-06-20',4),('WX321',0,NULL,0),('WX322',4900,'2023-01-30',1),('WX323',4800,'2023-02-28',2),('WX324',5300,NULL,0),('WX325',5500,'2023-07-05',3),('WX326',5200,NULL,0),('WX327',5000,'2023-05-02',2),('WX328',4700,'2023-04-15',1),('WX329',4800,NULL,0),('WX330',5100,'2023-06-10',3),('WX331',5400,NULL,0),('WX332',0,NULL,0),('WX333',4800,'2023-03-10',2),('WX334',5200,NULL,0),('WX335',5500,'2023-07-13',5),('WX336',4800,'2023-04-20',2),('WX337',5000,'2023-01-25',1),('WX338',4900,'2023-02-15',3),('WX339',5300,NULL,0),('WX340',4800,'2023-05-30',2),('WX341',5100,NULL,0),('WX342',4500,'2023-03-20',1),('WX343',4800,NULL,0),('WX344',5300,'2023-06-10',4),('WX345',4700,'2023-04-28',2),('WX346',5200,NULL,0),('WX347',5000,'2023-02-05',1),('WX348',5400,NULL,0),('WX349',4900,'2023-05-18',2),('WX350',0,NULL,0),('WX351',4800,'2023-04-02',3),('WX352',5100,NULL,0),('WX353',5500,'2023-07-08',4),('WX354',4800,'2023-03-25',2),('WX355',5300,NULL,0),('WX356',5500,'2023-05-05',5),('WX357',5200,NULL,0),('WX358',5000,'2023-02-20',2),('WX359',4900,'2023-04-05',1),('WX360',0,NULL,0),('WX361',5100,'2023-06-15',3),('WX362',5400,NULL,0),('WX363',4700,'2023-03-01',2),('WX364',4800,'2023-01-10',1),('WX365',5300,NULL,0),('WX366',4700,'2023-02-10',4),('WX367',5200,NULL,0),('WX368',4500,'2023-06-25',2),('WX369',4800,NULL,0),('WX370',5000,'2023-04-12',1),('WX371',5300,'2023-07-01',3),('WX372',4800,'2023-02-15',2),('WX373',5200,NULL,0),('WX374',4900,'2023-05-20',1),('WX375',0,NULL,0),('WX376',5000,'2023-04-05',2),('WX377',5500,'2023-01-30',5),('WX378',4800,'2023-03-20',2),('WX379',5100,NULL,0),('WX380',5300,'2023-06-28',4),('WX381',0,NULL,0),('WX382',4900,'2023-01-12',1),('WX383',4800,'2023-03-05',2),('WX384',5100,NULL,0),('WX385',5400,'2023-07-10',3),('WX386',5200,NULL,0),('WX387',4700,'2023-04-18',2),('WX388',4800,NULL,0),('WX389',5300,'2023-02-23',1),('WX390',5500,'2023-05-30',5),('WX391',5000,'2023-06-05',2),('WX392',4800,NULL,0),('WX393',5200,'2023-04-28',1),('WX394',4800,'2023-03-15',2),('WX395',5400,NULL,0),('WX396',4700,'2023-02-05',3),('WX397',5100,'2023-01-20',1),('WX398',4800,NULL,0),('WX399',5300,'2023-05-10',4),('WX400',4800,'2023-03-28',2);
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consists_of`
--

DROP TABLE IF EXISTS `consists_of`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consists_of` (
  `route_id` varchar(20) NOT NULL,
  `station_code` varchar(10) NOT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`route_id`,`station_code`),
  KEY `station_code` (`station_code`),
  CONSTRAINT `consists_of_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`),
  CONSTRAINT `consists_of_ibfk_2` FOREIGN KEY (`station_code`) REFERENCES `stations` (`station_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consists_of`
--

LOCK TABLES `consists_of` WRITE;
/*!40000 ALTER TABLE `consists_of` DISABLE KEYS */;
INSERT INTO `consists_of` VALUES ('R001','ADI',3),('R001','BRC',2),('R001','CSMT',1),('R001','GNC',4),('R002','CTPRN',2),('R002','NDLS',1),('R002','SML',3),('R003','BZA',3),('R003','SC',1),('R003','VSKP',4),('R003','WL',2),('R004','CSMT',1),('R004','NK',3),('R004','SNSI',4),('R004','TNA',2),('R005','CSMT',1),('R005','DD',3),('R005','PUNE',2),('R005','SUR',4),('R006','BPL',1),('R006','NDLS',3),('R006','NZM',2),('R007','AII',4),('R007','JP',3),('R007','KOTA',2),('R007','LNL',1),('R008','DWR',1),('R008','SBC',6),('R008','TK',4),('R008','TTR',3),('R008','UBL',2),('R008','YPR',5),('R009','BPL',1),('R009','INDB',3),('R009','UJN',2),('R010','CSMT',1),('R010','MAO',3),('R010','RN',2),('R011','ADI',2),('R011','BRC',3),('R011','CSMT',4),('R011','GNC',1),('R012','CTPRN',2),('R012','NDLS',3),('R012','SML',1),('R013','BZA',2),('R013','SC',4),('R013','VSKP',1),('R013','WL',3),('R014','CSMT',4),('R014','NK',2),('R014','SNSI',1),('R014','TNA',3),('R015','CSMT',4),('R015','DD',2),('R015','PUNE',3),('R015','SUR',1),('R016','BPL',3),('R016','NDLS',1),('R016','NZM',2),('R017','AII',1),('R017','JP',2),('R017','KOTA',3),('R017','LNL',4),('R018','DWR',6),('R018','SBC',1),('R018','TK',3),('R018','TTR',4),('R018','UBL',5),('R018','YPR',2),('R019','BPL',3),('R019','INDB',1),('R019','UJN',2),('R020','CSMT',3),('R020','MAO',1),('R020','RN',2);
/*!40000 ALTER TABLE `consists_of` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone` bigint DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('C001','Aarav Gupta',25,'Male',9876543210),('C002','Aisha Singh',32,'Female',8765432109),('C003','Arjun Patel',45,'Male',7654321098),('C004','Avni Sharma',28,'Female',6543210987),('C005','Aryan Kumar',19,'Male',5432109876),('C006','Anaya Verma',38,'Female',4321098765),('C007','Avinash Reddy',50,'Male',3210987654),('C008','Bhavya Kapoor',22,'Female',2109876543),('C009','Chirag Joshi',60,'Male',1098765432),('C010','Deepika Malhotra',29,'Female',9876543210),('C011','Dhruv Singhania',18,'Male',8765432109),('C012','Diya Gupta',35,'Female',7654321098),('C013','Eshaan Tiwari',42,'Male',6543210987),('C014','Fatima Khan',26,'Female',5432109876),('C015','Gaurav Verma',48,'Male',4321098765),('C016','Gayatri Patel',20,'Female',3210987654),('C017','Hrithik Singh',55,'Male',2109876543),('C018','Ishita Mehra',23,'Female',1098765432),('C019','Jai Sharma',68,'Male',9876543210),('C020','Jiya Yadav',30,'Female',8765432109),('C021','Kabir Kapoor',27,'Male',7654321098),('C022','Khushi Gupta',36,'Female',6543210987),('C023','Lakshay Malhotra',47,'Male',5432109876),('C024','Mahi Tiwari',21,'Female',4321098765),('C025','Manav Verma',58,'Male',3210987654),('C026','Meera Patel',19,'Female',2109876543),('C027','Mohit Sharma',44,'Male',1098765432),('C028','Naina Yadav',31,'Female',9876543210),('C029','Neel Kapoor',65,'Male',8765432109),('C030','Nikita Singh',24,'Female',7654321098),('C031','Parth Verma',33,'Male',6543210987),('C032','Pihu Sharma',49,'Female',5432109876),('C033','Raghav Gupta',29,'Male',4321098765),('C034','Riya Kapoor',40,'Female',3210987654),('C035','Rohan Tiwari',18,'Male',2109876543),('C036','Saisha Mehra',54,'Female',1098765432),('C037','Samar Reddy',26,'Male',9876543210),('C038','Sanya Yadav',37,'Female',8765432109),('C039','Shiv Verma',22,'Male',7654321098),('C040','Sneha Patel',60,'Female',6543210987),('C041','Soham Sharma',32,'Male',5432109876),('C042','Swara Kapoor',28,'Female',4321098765),('C043','Tanish Verma',45,'Male',3210987654),('C044','Tara Gupta',19,'Female',2109876543),('C045','Udayan Patel',56,'Male',1098765432),('C046','Umang Mehra',34,'Female',9876543210),('C047','Vaishnavi Singh',25,'Female',8765432109),('C048','Veer Yadav',50,'Male',7654321098),('C049','Vidhi Tiwari',23,'Female',6543210987),('C050','Yuvan Sharma',39,'Male',5432109876),('C051','Zara Kapoor',30,'Female',4321098765),('C052','Aarav Mehra',48,'Male',3210987654),('C053','Anvi Patel',20,'Female',2109876543),('C054','Aryan Verma',57,'Male',1098765432),('C055','Ishita Yadav',29,'Female',9876543210),('C056','Kabir Tiwari',38,'Male',8765432109),('C057','Kaira Gupta',26,'Female',7654321098),('C058','Krish Verma',55,'Male',6543210987),('C059','Kriti Sharma',42,'Female',5432109876),('C060','Arjun Yadav',17,'Male',4321098765),('C061','Isha Kapoor',31,'Female',3210987654),('C062','Kunal Patel',46,'Male',2109876543),('C063','Lavanya Verma',21,'Female',1098765432),('C064','Manan Mehra',59,'Male',9876543210),('C065','Nandini Gupta',33,'Female',8765432109),('C066','Nishant Yadav',44,'Male',7654321098),('C067','Prisha Tiwari',28,'Female',6543210987),('C068','Reyansh Sharma',54,'Male',5432109876),('C069','Saanvi Kapoor',24,'Female',4321098765),('C070','Sahil Patel',36,'Male',3210987654),('C071','Saloni Verma',49,'Female',2109876543),('C072','Shaurya Yadav',19,'Male',1098765432),('C073','Shipra Tiwari',60,'Female',9876543210),('C074','Siddhant Mehra',35,'Male',8765432109),('C075','Simran Gupta',27,'Female',7654321098),('C076','Varun Yadav',45,'Male',6543210987),('C077','Vanya Kapoor',22,'Female',5432109876),('C078','Veer Verma',53,'Male',4321098765),('C079','Yashika Sharma',37,'Female',3210987654),('C080','Yuvraj Patel',23,'Male',2109876543),('C081','Aisha Yadav',15,'Female',1098765432),('C082','Arnav Tiwari',14,'Male',9876543210),('C083','Avni Gupta',16,'Female',8765432109),('C084','Advait Kapoor',12,'Male',7654321098),('C085','Aanya Patel',13,'Female',6543210987),('C086','Arush Sharma',11,'Male',5432109876),('C087','Aaradhya Verma',10,'Female',4321098765),('C088','Aryan Yadav',17,'Male',3210987654),('C089','Anaya Tiwari',14,'Female',2109876543),('C090','Aaryan Kapoor',16,'Male',1098765432),('C091','Aisha Yadav',15,'Female',9876543210),('C092','Arnav Tiwari',14,'Male',8765432109),('C093','Avni Gupta',16,'Female',7654321098),('C094','Advait Kapoor',12,'Male',6543210987),('C095','Aanya Patel',13,'Female',5432109876),('C096','Arush Sharma',11,'Male',4321098765),('C097','Aaradhya Verma',10,'Female',3210987654),('C098','Aryan Yadav',17,'Male',2109876543),('C099','Anaya Tiwari',14,'Female',1098765432),('C100','Aaryan Kapoor',16,'Male',9876543210),('C101','Sahil Sharma',20,'Male',7890123456),('C102','Shreya Patel',28,'Female',8901234567),('C103','Rahul Verma',32,'Male',9012345678),('C104','Priya Kapoor',25,'Female',6543210987),('C105','Aditya Yadav',35,'Male',7654321098),('C106','Akanksha Tiwari',26,'Female',8765432109),('C107','Vikas Sharma',30,'Male',9876543210),('C108','Swati Patel',22,'Female',8765432109),('C109','Sourav Verma',28,'Male',7654321098),('C110','Shivani Kapoor',33,'Female',6543210987),('C111','Siddharth Tiwari',29,'Male',5432109876),('C112','Sneha Yadav',37,'Female',4321098765),('C113','Satyam Kapoor',40,'Male',3210987654),('C114','Sakshi Patel',28,'Female',2109876543),('C115','Rohit Verma',24,'Male',1098765432),('C116','Riya Sharma',26,'Female',9876543210),('C117','Rajat Kapoor',31,'Male',8765432109),('C118','Poonam Yadav',27,'Female',7654321098),('C119','Pranav Tiwari',38,'Male',6543210987),('C120','Priyanka Sharma',30,'Female',5432109876),('C121','Parth Verma',22,'Male',4321098765),('C122','Priya Yadav',28,'Female',3210987654),('C123','Prateek Kapoor',35,'Male',2109876543),('C124','Pooja Patel',29,'Female',1098765432),('C125','Pankaj Sharma',33,'Male',9876543210),('C126','Priyanshi Tiwari',26,'Female',8765432109),('C127','Prabhat Verma',40,'Male',7654321098),('C128','Priyam Patel',28,'Female',6543210987),('C129','Pramod Yadav',34,'Male',5432109876),('C130','Prisha Kapoor',27,'Female',4321098765),('C131','Pulkit Tiwari',31,'Male',3210987654),('C132','Priyanka Verma',29,'Female',2109876543),('C133','Paras Sharma',36,'Male',1098765432),('C134','Pooja Kapoor',23,'Female',9876543210),('C135','Piyush Yadav',25,'Male',8765432109),('C136','Priyanka Patel',32,'Female',7654321098),('C137','Punit Verma',27,'Male',6543210987),('C138','Payal Tiwari',29,'Female',5432109876),('C139','Pankaj Kapoor',35,'Male',4321098765),('C140','Priyanka Yadav',28,'Female',3210987654),('C141','Prateek Tiwari',31,'Male',2109876543),('C142','Pallavi Sharma',29,'Female',1098765432),('C143','Pranay Verma',33,'Male',9876543210),('C144','Pooja Yadav',26,'Female',8765432109),('C145','Parth Kapoor',30,'Male',7654321098),('C146','Priyanshi Patel',24,'Female',6543210987),('C147','Pramod Verma',36,'Male',5432109876),('C148','Prisha Tiwari',28,'Female',4321098765),('C149','Pulkit Yadav',32,'Male',3210987654),('C150','Pragya Kapoor',27,'Female',2109876543),('C151','Priyansh Sharma',34,'Male',1098765432),('C152','Priya Patel',29,'Female',9876543210),('C153','Paras Yadav',35,'Male',8765432109),('C154','Pooja Tiwari',28,'Female',7654321098),('C155','Pranav Kapoor',30,'Male',6543210987),('C156','Priyanka Yadav',26,'Female',5432109876),('C157','Prateek Sharma',31,'Male',4321098765),('C158','Poonam Patel',29,'Female',3210987654),('C159','Pramod Tiwari',33,'Male',2109876543),('C160','Prisha Yadav',27,'Female',1098765432),('C161','Pulkit Kapoor',34,'Male',9876543210),('C162','Priyanka Tiwari',28,'Female',8765432109),('C163','Prabhat Yadav',32,'Male',7654321098),('C164','Priya Sharma',29,'Female',6543210987),('C165','Pawan Verma',37,'Male',5432109876),('C166','Priyanshi Patel',24,'Female',4321098765),('C167','Pratik Kapoor',30,'Male',3210987654),('C168','Pooja Yadav',28,'Female',2109876543),('C169','Puneet Sharma',33,'Male',1098765432),('C170','Priyanka Patel',29,'Female',9876543210),('C171','Parth Yadav',35,'Male',8765432109),('C172','Priya Kapoor',28,'Female',7654321098),('C173','Prateek Tiwari',31,'Male',6543210987),('C174','Parul Sharma',26,'Female',5432109876),('C175','Pankaj Patel',32,'Male',4321098765),('C176','Priyanshi Yadav',29,'Female',3210987654),('C177','Pranav Kapoor',36,'Male',2109876543),('C178','Pooja Verma',28,'Female',1098765432),('C179','Pradeep Yadav',33,'Male',9876543210),('C180','Pragya Tiwari',27,'Female',8765432109),('C181','Aditi Kapoor',25,'Female',7890123456),('C182','Ajay Verma',32,'Male',8901234567),('C183','Anika Yadav',28,'Female',9012345678),('C184','Abhinav Sharma',40,'Male',6543210987),('C185','Aishwarya Patel',35,'Female',7654321098),('C186','Amit Tiwari',38,'Male',8765432109),('C187','Ananya Kapoor',22,'Female',9876543210),('C188','Arjun Yadav',27,'Male',8765432109),('C189','Amrita Sharma',30,'Female',7654321098),('C190','Alok Patel',33,'Male',6543210987),('C191','Anjali Verma',29,'Female',5432109876),('C192','Amit Kapoor',42,'Male',4321098765),('C193','Asha Tiwari',36,'Female',3210987654),('C194','Abhishek Yadav',45,'Male',2109876543),('C195','Anjali Kapoor',31,'Female',1098765432),('C196','Aryan Verma',28,'Male',9876543210),('C197','Amruta Yadav',26,'Female',8765432109),('C198','Anand Tiwari',48,'Male',7654321098),('C199','Anushka Patel',39,'Female',6543210987),('C200','Arnav Sharma',34,'Male',5432109876);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `driver_id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  PRIMARY KEY (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES ('D001','Ketan Vibhuti',35,'Pune','male',9812131416),('D002','Amit Kumar',40,'Delhi','male',9876543210),('D003','Deepika Patel',28,'Mumbai','female',8765432109),('D004','Rajesh Singh',45,'Bengaluru','male',9123456780),('D005','Priya Sharma',32,'Chennai','female',8234567891),('D006','Ankit Verma',38,'Hyderabad','male',7345678901),('D007','Neha Gupta',30,'Kolkata','female',6456789012),('D008','Rahul Reddy',48,'Jaipur','male',5567890123),('D009','Divya Mehra',42,'Ahmedabad','female',4678901234),('D010','Sunil Singh',50,'Lucknow','male',3789012345),('D011','Anita Yadav',32,'Chandigarh','female',7890123456),('D012','Vijay Shah',45,'Patna','male',8901234567),('D013','Shalini Kapoor',38,'Kochi','female',9012345678),('D014','Santosh Verma',40,'Indore','male',6543210987),('D015','Preeti Sharma',28,'Kanpur','female',7654321098),('D016','Alok Tiwari',36,'Surat','male',8765432109),('D017','Mohini Gupta',42,'Coimbatore','female',9876543210),('D018','Sunil Patel',47,'Varanasi','male',8765432109),('D019','Meena Singh',35,'Nagpur','female',7654321098),('D020','Ravi Sharma',39,'Pune','male',6543210987),('D021','Nisha Kapoor',31,'Mumbai','female',5432109876),('D022','Suresh Verma',43,'Hyderabad','male',4321098765),('D023','Anita Yadav',37,'Bengaluru','female',3210987654),('D024','Ajay Tiwari',44,'Delhi','male',2109876543),('D025','Kavita Mehra',49,'Kolkata','female',1098765432),('D026','Vikas Patel',33,'Lucknow','male',2345678901),('D027','Priya Sharma',41,'Ahmedabad','female',3456789012),('D028','Sanjay Verma',30,'Jaipur','male',4567890123),('D029','Meera Singh',46,'Chennai','female',5678901234),('D030','Rajat Kapoor',29,'Pune','male',6789012345),('D031','Anita Yadav',39,'Delhi','female',7890123456),('D032','Sunil Tiwari',48,'Mumbai','male',8901234567),('D033','Priyanka Sharma',34,'Bengaluru','female',9012345678),('D034','Vikram Patel',37,'Chennai','male',6543210987),('D035','Anjali Verma',42,'Hyderabad','female',7654321098),('D036','Deepak Singh',36,'Kolkata','male',8765432109),('D037','Savita Kapoor',40,'Jaipur','female',9876543210),('D038','Sunil Yadav',45,'Ahmedabad','male',8765432109),('D039','Anita Sharma',29,'Lucknow','female',7654321098),('D040','Ashok Tiwari',38,'Varanasi','male',6543210987),('D041','Meena Verma',33,'Patna','female',5432109876),('D042','Sunil Kapoor',47,'Kochi','male',4321098765),('D043','Vikram Patel',35,'Indore','male',3210987654),('D044','Amit Yadav',43,'Kanpur','male',2109876543),('D045','Deepika Sharma',39,'Surat','female',1098765432),('D046','Santosh Kapoor',44,'Coimbatore','male',2345678901),('D047','Kavita Yadav',36,'Varanasi','female',3456789012),('D048','Alok Tiwari',42,'Nagpur','male',4567890123),('D049','Rajat Sharma',31,'Pune','male',5678901234),('D050','Meera Patel',40,'Mumbai','female',6789012345),('D051','Anjali Yadav',35,'Hyderabad','female',7890123456),('D052','Sunil Sharma',49,'Bengaluru','male',8901234567),('D053','Deepika Kapoor',32,'Delhi','female',9012345678),('D054','Santosh Yadav',37,'Kolkata','male',8765432109),('D055','Anita Patel',45,'Lucknow','female',9876543210),('D056','Vijay Verma',28,'Ahmedabad','male',8765432109),('D057','Priya Kapoor',43,'Jaipur','female',7654321098),('D058','Rajat Patel',39,'Varanasi','male',6543210987),('D059','Anita Yadav',41,'Patna','female',5432109876),('D060','Sunil Kapoor',33,'Kochi','male',4321098765),('D061','Meena Verma',47,'Indore','female',3210987654),('D062','Rajat Sharma',30,'Kanpur','male',2109876543),('D063','Anita Patel',42,'Surat','female',1098765432),('D064','Sunil Tiwari',48,'Coimbatore','male',2345678901),('D065','Deepika Yadav',34,'Varanasi','female',3456789012),('D066','Savita Kapoor',40,'Nagpur','female',4567890123),('D067','Kavita Sharma',45,'Pune','female',5678901234),('D068','Vijay Kapoor',29,'Mumbai','male',6789012345),('D069','Anita Verma',37,'Hyderabad','female',7890123456),('D070','Rajesh Patel',42,'Bengaluru','male',8901234567),('D071','Sunil Sharma',39,'Delhi','male',9012345678),('D072','Deepika Yadav',36,'Mumbai','female',8765432109),('D073','Santosh Kapoor',48,'Bengaluru','male',8765432109),('D074','Rajat Verma',32,'Chennai','male',7654321098),('D075','Anjali Yadav',39,'Hyderabad','female',6543210987),('D076','Ashok Kapoor',43,'Kolkata','male',5432109876),('D077','Meena Sharma',30,'Jaipur','female',4321098765),('D078','Sunil Yadav',45,'Ahmedabad','male',3210987654),('D079','Priya Kapoor',31,'Lucknow','female',2109876543),('D080','Rajat Patel',41,'Varanasi','male',1098765432),('D081','Deepika Yadav',48,'Patna','female',2345678901),('D082','Santosh Kapoor',35,'Kochi','male',3456789012),('D083','Rajat Verma',46,'Indore','male',4567890123),('D084','Anjali Yadav',33,'Kanpur','female',5678901234),('D085','Deepak Verma',40,'Surat','male',6789012345),('D086','Savita Sharma',29,'Coimbatore','female',7890123456),('D087','Sunil Yadav',37,'Varanasi','male',8901234567),('D088','Meena Kapoor',42,'Nagpur','female',9012345678),('D089','Rajat Sharma',44,'Pune','male',8765432109),('D090','Anita Patel',30,'Mumbai','female',8765432109),('D091','Sunil Kapoor',49,'Hyderabad','male',7654321098),('D092','Deepika Sharma',35,'Bengaluru','female',6543210987),('D093','Amit Kapoor',42,'Delhi','male',5432109876),('D094','Meena Verma',46,'Kolkata','female',4321098765),('D095','Sunil Yadav',38,'Lucknow','male',3210987654),('D096','Rajat Patel',47,'Varanasi','male',1098765432),('D097','Meera Patel',33,'Patna','female',2345678901),('D098','Anjali Yadav',40,'Kochi','female',3456789012),('D099','Santosh Kapoor',29,'Indore','male',4567890123),('D100','Kavita Yadav',36,'Kanpur','female',5678901234),('D101','Alok Tiwari',45,'Surat','male',6789012345),('D102','Rajat Sharma',32,'Coimbatore','male',7890123456),('D103','Anjali Yadav',38,'Varanasi','female',8901234567),('D104','Ashok Kapoor',44,'Nagpur','male',9012345678),('D105','Sunil Yadav',41,'Pune','male',8765432109),('D106','Priya Kapoor',29,'Mumbai','female',8765432109),('D107','Rajat Patel',43,'Hyderabad','male',7654321098),('D108','Deepika Yadav',39,'Bengaluru','female',6543210987),('D109','Santosh Kapoor',47,'Delhi','male',5432109876),('D110','Rajat Verma',30,'Kolkata','male',4321098765),('D111','Anjali Yadav',35,'Jaipur','female',3210987654),('D112','Deepak Verma',46,'Ahmedabad','male',2109876543),('D113','Savita Sharma',33,'Lucknow','female',1098765432),('D114','Sunil Yadav',38,'Varanasi','male',2345678901),('D115','Meena Kapoor',40,'Patna','female',3456789012),('D116','Rajat Sharma',44,'Kochi','female',4567890123),('D117','Anita Patel',29,'Indore','male',5678901234),('D118','Sunil Yadav',47,'Kanpur','male',6789012345),('D119','Meera Verma',30,'Surat','female',7890123456),('D120','Rajat Sharma',42,'Coimbatore','male',8901234567),('D121','Anita Yadav',36,'Varanasi','female',9012345678),('D122','Alok Tiwari',43,'Nagpur','male',8765432109),('D123','Rajat Sharma',34,'Pune','male',8765432109),('D124','Anita Patel',48,'Mumbai','female',7654321098),('D125','Sunil Yadav',31,'Hyderabad','male',6543210987),('D126','Deepika Kapoor',39,'Bengaluru','female',5432109876),('D127','Santosh Yadav',47,'Delhi','male',4321098765),('D128','Anita Verma',30,'Kolkata','female',3210987654),('D129','Rajesh Patel',42,'Jaipur','male',2109876543),('D130','Sunil Sharma',44,'Ahmedabad','male',1098765432),('D131','Deepika Yadav',31,'Lucknow','female',2345678901),('D132','Savita Kapoor',45,'Varanasi','male',3456789012),('D133','Rajat Verma',32,'Patna','male',4567890123),('D134','Anjali Yadav',40,'Kochi','female',5678901234),('D135','Vivek Sharma',28,'Indore','male',6789012345),('D136','Anita Verma',38,'Kanpur','female',7890123456),('D137','Santosh Yadav',47,'Surat','male',8901234567),('D138','Kavita Sharma',35,'Coimbatore','female',9012345678),('D139','Sunil Yadav',43,'Varanasi','male',8765432109),('D140','Meena Kapoor',39,'Nagpur','female',8765432109),('D141','Rajat Sharma',32,'Bengaluru','male',7654321098),('D142','Anita Yadav',39,'Delhi','female',6543210987),('D143','Sunil Patel',45,'Mumbai','male',8765432109),('D144','Meena Verma',31,'Lucknow','female',9876543210),('D145','Rajat Yadav',38,'Varanasi','male',8765432109),('D146','Anjali Sharma',42,'Kolkata','female',7654321098),('D147','Sunil Kapoor',47,'Jaipur','male',6543210987),('D148','Meera Yadav',35,'Ahmedabad','female',5432109876),('D149','Deepak Verma',40,'Hyderabad','male',4321098765),('D150','Savita Yadav',29,'Pune','female',3210987654);
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `made_of`
--

DROP TABLE IF EXISTS `made_of`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `made_of` (
  `train_no` int NOT NULL,
  `coach_id` varchar(20) NOT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`train_no`,`coach_id`,`position`),
  KEY `couch_id` (`coach_id`),
  CONSTRAINT `made_of_ibfk_1` FOREIGN KEY (`train_no`) REFERENCES `trains` (`train_no`),
  CONSTRAINT `made_of_ibfk_2` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`coach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `made_of`
--

LOCK TABLES `made_of` WRITE;
/*!40000 ALTER TABLE `made_of` DISABLE KEYS */;
INSERT INTO `made_of` VALUES (101,'WX301',1),(101,'WX301',2),(101,'WX303',3),(101,'WX304',4),(101,'WX305',5),(102,'WX306',1),(102,'WX307',2),(102,'WX308',3),(102,'WX309',4),(102,'WX310',5),(103,'WX311',1),(103,'WX312',2),(103,'WX313',3),(103,'WX314',4),(103,'WX315',5),(103,'WX316',6),(104,'WX317',1),(104,'WX318',2),(104,'WX319',3),(104,'WX320',4),(104,'WX321',5),(105,'WX322',1),(105,'WX323',2),(105,'WX324',3),(105,'WX325',4),(106,'WX326',1),(106,'WX327',2),(106,'WX328',3),(106,'WX329',4),(106,'WX330',5),(107,'WX331',1),(107,'WX332',2),(107,'WX333',3),(107,'WX334',4),(107,'WX335',5),(107,'WX336',6),(108,'WX337',1),(108,'WX338',2),(108,'WX339',3),(109,'WX340',1),(109,'WX341',2),(109,'WX342',3),(109,'WX343',4),(110,'WX344',1),(110,'WX345',2),(110,'WX346',3),(110,'WX347',4),(110,'WX348',5),(110,'WX349',6),(111,'WX350',1),(111,'WX351',2),(111,'WX352',3),(111,'WX353',4),(111,'WX354',5),(111,'WX355',6),(112,'WX356',1),(112,'WX357',2),(112,'WX358',3),(112,'WX359',4),(112,'WX360',5);
/*!40000 ALTER TABLE `made_of` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `route_id` varchar(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `distance` int DEFAULT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES ('R001','Mumbai Central-Gandhinagar',548),('R002','New Delhi-Himachal',412),('R003','Secunderabad-Visakhapatnam',500),('R004','Mumbai-Sainagar Shirdi',248),('R005','Mumbai-Solapur',400),('R006','Bhopal-Delhi',700),('R007','Lonavala-Ajmer',1062),('R008','Dharwad-Bengaluru',432),('R009','Bhopal-Indore',246),('R010','Mumbai-Goa',588),('R011','Gandhinagar-Mumbai Central',548),('R012','Himachal-New Delhi',412),('R013','Visakhapatnam-Secunderabad',500),('R014','Sainagar Shirdi-Mumbai',248),('R015','Solapur-Mumbai',400),('R016','Bhopal-Delhi',700),('R017','Ajmer-Lonavala',1062),('R018','Bengaluru-Dharwad',432),('R019','Indore-Bhopal',246),('R020','Goa-Mumbai',588);
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_for`
--

DROP TABLE IF EXISTS `scheduled_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduled_for` (
  `train_no` int NOT NULL,
  `route_id` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `departure_time` time NOT NULL,
  `driver_id` varchar(100) DEFAULT NULL,
  `co_driver_id` varchar(100) DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  PRIMARY KEY (`train_no`,`route_id`,`date`,`departure_time`),
  KEY `driver_id` (`driver_id`),
  KEY `co_driver_id` (`co_driver_id`),
  CONSTRAINT `scheduled_for_ibfk_1` FOREIGN KEY (`train_no`, `route_id`) REFERENCES `travels_on` (`train_no`, `route_id`),
  CONSTRAINT `scheduled_for_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`),
  CONSTRAINT `scheduled_for_ibfk_3` FOREIGN KEY (`co_driver_id`) REFERENCES `drivers` (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_for`
--

LOCK TABLES `scheduled_for` WRITE;
/*!40000 ALTER TABLE `scheduled_for` DISABLE KEYS */;
INSERT INTO `scheduled_for` VALUES (101,'R004','2023-09-02','07:00:00','d001','d002','12:20:00'),(101,'R004','2023-09-03','07:00:00','d037','d038','12:20:00'),(101,'R004','2023-09-06','07:00:00','d002','d001','12:20:00'),(101,'R004','2023-09-09','07:00:00','d101','d102','12:20:00'),(101,'R004','2023-09-10','07:00:00','d137','d138','12:20:00'),(101,'R004','2023-09-13','07:00:00','d102','d101','12:20:00'),(101,'R005','2023-09-05','08:00:00','d019','d018','14:35:00'),(101,'R005','2023-09-12','08:00:00','d119','d118','14:35:00'),(101,'R005','2023-10-10','08:00:00','d019','d018','14:35:00'),(101,'R010','2023-09-01','08:00:00','d001','d002','14:00:00'),(101,'R010','2023-09-04','08:00:00','d035','d036','14:00:00'),(101,'R010','2023-09-07','08:00:00','d001','d002','14:00:00'),(101,'R010','2023-09-08','08:00:00','d101','d102','14:00:00'),(101,'R010','2023-09-11','08:00:00','d135','d136','14:00:00'),(101,'R010','2023-09-14','08:00:00','d101','d102','14:00:00'),(101,'R014','2023-09-02','15:00:00','d001','d002','20:20:00'),(101,'R014','2023-09-03','15:00:00','d037','d038','20:20:00'),(101,'R014','2023-09-06','15:00:00','d001','d002','20:20:00'),(101,'R014','2023-09-09','15:00:00','d101','d102','20:20:00'),(101,'R014','2023-09-10','15:00:00','d137','d138','20:20:00'),(101,'R014','2023-09-13','15:00:00','d101','d102','20:20:00'),(101,'R015','2023-09-05','16:00:00','d007','d006','22:35:00'),(101,'R015','2023-09-12','16:00:00','d107','d106','22:35:00'),(101,'R015','2023-10-10','16:00:00','d007','d006','22:35:00'),(101,'R020','2023-09-01','16:00:00','d002','d001','22:00:00'),(101,'R020','2023-09-04','16:00:00','d036','d035','22:00:00'),(101,'R020','2023-09-07','16:00:00','d002','d001','22:00:00'),(101,'R020','2023-09-08','16:00:00','d102','d101','22:00:00'),(101,'R020','2023-09-11','16:00:00','d136','d135','22:00:00'),(101,'R020','2023-09-14','16:00:00','d102','d101','22:00:00'),(102,'R001','2023-09-01','10:00:00','d012','d013','13:40:00'),(102,'R001','2023-09-05','10:00:00','d012','d012','13:40:00'),(102,'R001','2023-09-06','10:00:00','d012','d013','13:40:00'),(102,'R001','2023-09-08','10:00:00','d112','d113','13:40:00'),(102,'R001','2023-09-12','10:00:00','d112','d113','13:40:00'),(102,'R001','2023-09-13','10:00:00','d112','d113','13:40:00'),(102,'R001','2023-10-10','10:00:00','d012','d012','13:40:00'),(102,'R011','2023-09-01','17:00:00','d013','d012','22:40:00'),(102,'R011','2023-09-05','17:00:00','d013','d012','22:40:00'),(102,'R011','2023-09-06','17:00:00','d013','d012','22:40:00'),(102,'R011','2023-09-08','17:00:00','d113','d112','22:40:00'),(102,'R011','2023-09-12','17:00:00','d113','d112','22:40:00'),(102,'R011','2023-09-13','17:00:00','d113','d112','22:40:00'),(102,'R011','2023-10-10','17:00:00','d013','d012','22:40:00'),(103,'R005','2023-09-01','08:00:00','d006','d007','14:35:00'),(103,'R005','2023-09-02','08:00:00','d006','d007','14:35:00'),(103,'R005','2023-09-03','08:00:00','d007','d006','14:35:00'),(103,'R005','2023-09-04','08:00:00','d047','d048','14:35:00'),(103,'R005','2023-09-07','08:00:00','d006','d007','14:35:00'),(103,'R005','2023-09-08','08:00:00','d106','d107','14:35:00'),(103,'R005','2023-09-09','08:00:00','d106','d107','14:35:00'),(103,'R005','2023-09-10','08:00:00','d107','d106','14:35:00'),(103,'R005','2023-09-11','08:00:00','d147','d148','14:35:00'),(103,'R005','2023-09-14','08:00:00','d106','d107','14:35:00'),(103,'R010','2023-09-05','08:00:00','d047','d048','14:00:00'),(103,'R010','2023-09-06','08:00:00','d001','d002','14:00:00'),(103,'R010','2023-09-12','08:00:00','d147','d148','14:00:00'),(103,'R010','2023-09-13','08:00:00','d101','d102','14:00:00'),(103,'R010','2023-10-10','08:00:00','d047','d048','14:00:00'),(103,'R015','2023-09-01','16:00:00','d018','d019','22:35:00'),(103,'R015','2023-09-02','16:00:00','d007','d006','22:35:00'),(103,'R015','2023-09-03','16:00:00','d006','d007','22:35:00'),(103,'R015','2023-09-04','16:00:00','d048','d047','22:35:00'),(103,'R015','2023-09-07','16:00:00','d018','d019','22:35:00'),(103,'R015','2023-09-08','16:00:00','d118','d119','22:35:00'),(103,'R015','2023-09-09','16:00:00','d107','d106','22:35:00'),(103,'R015','2023-09-10','16:00:00','d106','d107','22:35:00'),(103,'R015','2023-09-11','16:00:00','d148','d147','22:35:00'),(103,'R015','2023-09-14','16:00:00','d118','d119','22:35:00'),(103,'R020','2023-09-05','16:00:00','d048','d047','22:00:00'),(103,'R020','2023-09-06','16:00:00','d002','d001','22:00:00'),(103,'R020','2023-09-12','16:00:00','d148','d147','22:00:00'),(103,'R020','2023-09-13','16:00:00','d102','d101','22:00:00'),(103,'R020','2023-10-10','16:00:00','d048','d047','22:00:00'),(104,'R006','2023-09-01','05:00:00','d004','d005','12:45:00'),(104,'R006','2023-09-03','05:00:00','d016','d017','12:45:00'),(104,'R006','2023-09-04','05:00:00','d045','d046','12:45:00'),(104,'R006','2023-09-06','05:00:00','d016','d017','12:45:00'),(104,'R006','2023-09-08','05:00:00','d104','d105','12:45:00'),(104,'R006','2023-09-10','05:00:00','d116','d117','12:45:00'),(104,'R006','2023-09-11','05:00:00','d145','d146','12:45:00'),(104,'R006','2023-09-13','05:00:00','d116','d117','12:45:00'),(104,'R009','2023-09-02','10:00:00','d003','d015','13:00:00'),(104,'R009','2023-09-05','10:00:00','d003','d015','13:00:00'),(104,'R009','2023-09-07','10:00:00','d015','d003','13:00:00'),(104,'R009','2023-09-09','10:00:00','d103','d115','13:00:00'),(104,'R009','2023-09-12','10:00:00','d103','d115','13:00:00'),(104,'R009','2023-09-14','10:00:00','d115','d103','13:00:00'),(104,'R009','2023-10-10','10:00:00','d003','d015','13:00:00'),(104,'R009','2023-10-17','10:00:00','d003','d015','13:00:00'),(104,'R009','2023-10-24','10:00:00','d003','d015','13:00:00'),(104,'R016','2023-09-01','15:00:00','d016','d017','22:45:00'),(104,'R016','2023-09-03','15:00:00','d005','d004','22:45:00'),(104,'R016','2023-09-04','15:00:00','d046','d045','22:45:00'),(104,'R016','2023-09-06','15:00:00','d004','d005','22:45:00'),(104,'R016','2023-09-08','15:00:00','d116','d117','22:45:00'),(104,'R016','2023-09-10','15:00:00','d105','d104','22:45:00'),(104,'R016','2023-09-11','15:00:00','d146','d145','22:45:00'),(104,'R016','2023-09-13','15:00:00','d104','d105','22:45:00'),(104,'R019','2023-09-02','15:00:00','d003','d015','18:00:00'),(104,'R019','2023-09-05','15:00:00','d003','d015','18:00:00'),(104,'R019','2023-09-07','15:00:00','d015','d003','18:00:00'),(104,'R019','2023-09-09','15:00:00','d103','d115','18:00:00'),(104,'R019','2023-09-12','15:00:00','d103','d115','18:00:00'),(104,'R019','2023-09-14','15:00:00','d115','d103','18:00:00'),(104,'R019','2023-10-10','15:00:00','d003','d015','18:00:00'),(104,'R019','2023-10-17','15:00:00','d003','d015','18:00:00'),(104,'R019','2023-10-24','15:00:00','d003','d015','18:00:00'),(105,'R006','2023-09-05','05:00:00','d005','d004','12:45:00'),(105,'R006','2023-09-07','05:00:00','d051','d052','12:45:00'),(105,'R006','2023-09-12','05:00:00','d105','d104','12:45:00'),(105,'R006','2023-10-10','05:00:00','d005','d004','12:45:00'),(105,'R009','2023-09-01','10:00:00','d015','d003','13:00:00'),(105,'R009','2023-09-03','10:00:00','d003','d015','13:00:00'),(105,'R009','2023-09-04','10:00:00','d015','d003','13:00:00'),(105,'R009','2023-09-06','10:00:00','d016','d017','13:00:00'),(105,'R009','2023-09-08','10:00:00','d115','d103','13:00:00'),(105,'R009','2023-09-10','10:00:00','d103','d115','13:00:00'),(105,'R009','2023-09-11','10:00:00','d115','d103','13:00:00'),(105,'R009','2023-09-13','10:00:00','d116','d117','13:00:00'),(105,'R016','2023-09-05','15:00:00','d016','d017','22:45:00'),(105,'R016','2023-09-07','15:00:00','d052','d051','22:45:00'),(105,'R016','2023-09-12','15:00:00','d116','d117','22:45:00'),(105,'R016','2023-10-10','15:00:00','d016','d017','22:45:00'),(105,'R019','2023-09-01','15:00:00','d003','d014','18:00:00'),(105,'R019','2023-09-03','15:00:00','d003','d015','18:00:00'),(105,'R019','2023-09-04','15:00:00','d015','d003','18:00:00'),(105,'R019','2023-09-06','15:00:00','d017','d016','18:00:00'),(105,'R019','2023-09-08','15:00:00','d103','d114','18:00:00'),(105,'R019','2023-09-10','15:00:00','d103','d115','18:00:00'),(105,'R019','2023-09-11','15:00:00','d115','d103','18:00:00'),(105,'R019','2023-09-13','15:00:00','d117','d116','18:00:00'),(106,'R002','2023-09-01','08:00:00','d010','d011','14:10:00'),(106,'R002','2023-09-03','08:00:00','d022','d023','14:10:00'),(106,'R002','2023-09-05','08:00:00','d011','d010','14:10:00'),(106,'R002','2023-09-08','08:00:00','d110','d111','14:10:00'),(106,'R002','2023-09-10','08:00:00','d122','d123','14:10:00'),(106,'R002','2023-09-12','08:00:00','d111','d110','14:10:00'),(106,'R002','2023-10-10','08:00:00','d011','d010','14:10:00'),(106,'R012','2023-09-01','17:00:00','d022','d023','23:10:00'),(106,'R012','2023-09-03','17:00:00','d010','d011','23:10:00'),(106,'R012','2023-09-05','17:00:00','d023','d022','23:10:00'),(106,'R012','2023-09-08','17:00:00','d122','d123','23:10:00'),(106,'R012','2023-09-10','17:00:00','d110','d111','23:10:00'),(106,'R012','2023-09-12','17:00:00','d123','d122','23:10:00'),(106,'R012','2023-10-10','17:00:00','d023','d022','23:10:00'),(107,'R002','2023-09-04','08:00:00','d010','d011','14:10:00'),(107,'R002','2023-09-06','08:00:00','d049','d050','14:10:00'),(107,'R002','2023-09-11','08:00:00','d110','d111','14:10:00'),(107,'R002','2023-09-13','08:00:00','d149','d150','14:10:00'),(107,'R012','2023-09-04','17:00:00','d022','d023','23:10:00'),(107,'R012','2023-09-06','17:00:00','d050','d049','23:10:00'),(107,'R012','2023-09-11','17:00:00','d122','d123','23:10:00'),(107,'R012','2023-09-13','17:00:00','d150','d149','23:10:00'),(108,'R008','2023-09-02','09:00:00','d025','d026','14:00:00'),(108,'R008','2023-09-04','09:00:00','d043','d044','14:00:00'),(108,'R008','2023-09-09','09:00:00','d125','d126','14:00:00'),(108,'R008','2023-09-11','09:00:00','d143','d144','14:00:00'),(108,'R018','2023-09-02','15:00:00','d026','d025','20:00:00'),(108,'R018','2023-09-04','15:00:00','d044','d043','20:00:00'),(108,'R018','2023-09-09','15:00:00','d126','d125','20:00:00'),(108,'R018','2023-09-11','15:00:00','d144','d143','20:00:00'),(109,'R010','2023-09-02','08:00:00','d008','d024','14:00:00'),(109,'R010','2023-09-03','08:00:00','d035','d036','14:00:00'),(109,'R010','2023-09-09','08:00:00','d108','d124','14:00:00'),(109,'R010','2023-09-10','08:00:00','d135','d136','14:00:00'),(109,'R020','2023-09-02','16:00:00','d024','d008','22:00:00'),(109,'R020','2023-09-03','16:00:00','d036','d035','22:00:00'),(109,'R020','2023-09-09','16:00:00','d124','d108','22:00:00'),(109,'R020','2023-09-10','16:00:00','d136','d135','22:00:00'),(110,'R007','2023-09-02','04:00:00','d027','d028','14:45:00'),(110,'R007','2023-09-05','04:00:00','d031','d032','14:45:00'),(110,'R007','2023-09-09','04:00:00','d127','d128','14:45:00'),(110,'R007','2023-09-12','04:00:00','d131','d132','14:45:00'),(110,'R007','2023-10-10','04:00:00','d031','d032','14:45:00'),(110,'R017','2023-09-02','17:00:00','d031','d032','23:30:00'),(110,'R017','2023-09-05','17:00:00','d028','d027','23:30:00'),(110,'R017','2023-09-09','17:00:00','d131','d132','23:30:00'),(110,'R017','2023-09-12','17:00:00','d128','d127','23:30:00'),(110,'R017','2023-10-10','17:00:00','d028','d027','23:30:00'),(111,'R001','2023-09-02','10:00:00','d013','d012','13:40:00'),(111,'R001','2023-09-04','10:00:00','d012','d013','13:40:00'),(111,'R001','2023-09-07','10:00:00','d013','d012','13:40:00'),(111,'R001','2023-09-09','10:00:00','d113','d112','13:40:00'),(111,'R001','2023-09-11','10:00:00','d112','d113','13:40:00'),(111,'R001','2023-09-14','10:00:00','d113','d112','13:40:00'),(111,'R011','2023-09-02','17:00:00','d012','d013','22:40:00'),(111,'R011','2023-09-04','17:00:00','d013','d012','22:40:00'),(111,'R011','2023-09-07','17:00:00','d012','d013','22:40:00'),(111,'R011','2023-09-09','17:00:00','d112','d113','22:40:00'),(111,'R011','2023-09-11','17:00:00','d113','d112','22:40:00'),(111,'R011','2023-09-14','17:00:00','d112','d113','22:40:00'),(112,'R003','2023-09-03','05:00:00','d039','d040','13:30:00'),(112,'R003','2023-09-10','05:00:00','d139','d140','13:30:00'),(112,'R004','2023-09-01','07:00:00','d008','d009','12:20:00'),(112,'R004','2023-09-04','07:00:00','d038','d037','12:20:00'),(112,'R004','2023-09-07','07:00:00','d026','d025','12:20:00'),(112,'R004','2023-09-08','07:00:00','d108','d109','12:20:00'),(112,'R004','2023-09-11','07:00:00','d138','d137','12:20:00'),(112,'R004','2023-09-14','07:00:00','d126','d125','12:20:00'),(112,'R008','2023-09-06','09:00:00','d025','d026','14:00:00'),(112,'R008','2023-09-13','09:00:00','d125','d126','14:00:00'),(112,'R013','2023-09-03','16:00:00','d041','d042','23:30:00'),(112,'R013','2023-09-10','16:00:00','d141','d142','23:30:00'),(112,'R014','2023-09-01','15:00:00','d020','d021','20:20:00'),(112,'R014','2023-09-04','15:00:00','d038','d037','20:20:00'),(112,'R014','2023-09-07','15:00:00','d025','d026','20:20:00'),(112,'R014','2023-09-08','15:00:00','d120','d121','20:20:00'),(112,'R014','2023-09-11','15:00:00','d138','d137','20:20:00'),(112,'R014','2023-09-14','15:00:00','d125','d126','20:20:00'),(112,'R018','2023-09-06','15:00:00','d026','d025','20:00:00'),(112,'R018','2023-09-13','15:00:00','d126','d125','20:00:00');
/*!40000 ALTER TABLE `scheduled_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `station_code` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`station_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES ('ADI','Ahmedabad'),('AII','Ajmer'),('BPL','Bhopal'),('BRC','Vadodara'),('BZA','Vijayawada'),('CSMT','Mumbai Central'),('CTPRN','Chintapurni'),('DD','Daund'),('DWR','Dharwad'),('GNC','Gandhinagar'),('INDB','Indore'),('JP','Jaipur'),('KOTA','Kota'),('LNL','Lonavala'),('MAO','Madgaon'),('NDLS','New Delhi'),('NK','Nashik'),('NZM','Hazrat Nizamuddin'),('PUNE','Pune'),('RN','Ratnagiri'),('SBC','KSR Bengaluru City'),('SC','Secunderabad'),('SML','Shimla'),('SNSI','Sainagar Shirdi'),('SUR','Solapur'),('TK','Tumakuru'),('TNA','Thane'),('TTR','Tiptur'),('UBL','Hubblli'),('UJN','Ujjain'),('VSKP','Visakhapatnam'),('WL','Warangal'),('YPR','Yesvantpur');
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `ticket_no` varchar(20) NOT NULL,
  `train_no` int DEFAULT NULL,
  `start` varchar(10) DEFAULT NULL,
  `end` varchar(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `seat_no` int DEFAULT NULL,
  `passenger_id` varchar(10) DEFAULT NULL,
  `agent_id` varchar(10) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`ticket_no`),
  KEY `train_no` (`train_no`),
  KEY `start` (`start`),
  KEY `end` (`end`),
  KEY `passenger_id` (`passenger_id`),
  KEY `agent_id` (`agent_id`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`train_no`) REFERENCES `trains` (`train_no`),
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`start`) REFERENCES `stations` (`station_code`),
  CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`end`) REFERENCES `stations` (`station_code`),
  CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`passenger_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `tickets_ibfk_5` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES ('t_1',101,'CSMT','MAO','2023-09-01','08:00:00',15,'C101',NULL,'confirmed',400),('t_10',101,'CSMT','MAO','2023-09-01','08:00:00',18,'C110',NULL,'confirmed',400),('t_11',101,'CSMT','MAO','2023-09-01','08:00:00',14,'C111','a_101','confirmed',400),('t_12',105,'BPL','INDB','2023-09-01','10:00:00',9,'C112','a_105','confirmed',1000),('t_13',105,'BPL','INDB','2023-09-01','10:00:00',4,'C113','a_108','confirmed',1000),('t_14',105,'BPL','INDB','2023-09-01','10:00:00',0,'C114','a_108','waiting',300),('t_15',105,'BPL','INDB','2023-09-01','10:00:00',12,'C115','a_101','confirmed',1000),('t_16',105,'BPL','INDB','2023-09-01','10:00:00',0,'C116','a_101','waiting',300),('t_17',105,'BPL','INDB','2023-09-01','10:00:00',23,'C117','a_101','confirmed',1000),('t_18',105,'BPL','INDB','2023-09-01','10:00:00',0,'C118',NULL,'cancelled',300),('t_19',105,'BPL','INDB','2023-09-01','10:00:00',13,'C119','a_101','confirmed',1000),('t_2',101,'CSMT','MAO','2023-09-01','08:00:00',8,'C102',NULL,'confirmed',400),('t_20',105,'BPL','INDB','2023-09-01','10:00:00',20,'C120','a_101','confirmed',1000),('t_21',110,'LNL','AII','2023-10-02','04:00:00',0,'C122',NULL,'waiting',500),('t_22',110,'LNL','AII','2023-10-02','04:00:00',6,'C123','a_143','confirmed',800),('t_23',110,'LNL','AII','2023-10-02','04:00:00',11,'C124','a_143','confirmed',800),('t_24',110,'LNL','AII','2023-10-02','04:00:00',0,'C125','a_143','waiting',500),('t_25',110,'LNL','AII','2023-10-02','04:00:00',22,'C128','a_143','confirmed',800),('t_26',110,'LNL','AII','2023-10-02','04:00:00',0,'C129','a_143','waiting',500),('t_27',111,'CSMT','GNC','2023-10-02','10:00:00',16,'C130','a_143','confirmed',400),('t_28',111,'CSMT','GNC','2023-10-02','10:00:00',19,'C133','a_143','confirmed',400),('t_29',111,'CSMT','GNC','2023-10-02','10:00:00',0,'C134','a_143','waiting',300),('t_3',101,'CSMT','MAO','2023-09-01','08:00:00',0,'C103',NULL,'waiting',600),('t_30',111,'CSMT','GNC','2023-10-02','10:00:00',24,'C137','a_143','confirmed',400),('t_31',111,'CSMT','GNC','2023-10-02','10:00:00',0,'C138','a_143','waiting',300),('t_32',111,'CSMT','GNC','2023-10-02','10:00:00',14,'C139',NULL,'confirmed',400),('t_33',109,'CSMT','MAO','2023-10-03','08:00:00',21,'C140','a_143','confirmed',400),('t_34',109,'CSMT','MAO','2023-10-03','08:00:00',8,'C141',NULL,'confirmed',400),('t_35',109,'CSMT','MAO','2023-10-03','08:00:00',0,'C142','a_118','waiting',600),('t_36',109,'CSMT','MAO','2023-10-03','08:00:00',5,'C143',NULL,'confirmed',400),('t_37',109,'CSMT','MAO','2023-10-03','08:00:00',0,'C144','a_118','waiting',600),('t_38',109,'CSMT','MAO','2023-10-03','08:00:00',18,'C145','a_118','confirmed',400),('t_39',101,'CSMT','MAO','2023-10-03','08:00:00',15,'C101',NULL,'confirmed',500),('t_4',101,'CSMT','MAO','2023-09-01','08:00:00',21,'C104',NULL,'confirmed',400),('t_40',101,'CSMT','MAO','2023-11-01','10:00:00',25,'C101',NULL,'confirmed',500),('t_41',102,'CSMT','GNC','2023-11-01','10:00:00',25,'C101',NULL,'confirmed',500),('t_42',102,'CSMT','GNC','2023-11-01','10:00:00',25,'C111','a_118','confirmed',500),('t_43',101,'CSMT','MAO','2023-09-01','08:00:00',10,'C105',NULL,'cancelled',800),('t_44',102,'CSMT','GNC','2023-10-01','10:00:00',25,'C111','a_118','confirmed',500),('t_45',102,'CSMT','GNC','2023-11-01','11:00:00',25,'C111','a_118','confirmed',500),('t_46',108,'DWR','SBC','2023-10-02','08:00:00',0,'C144','a_118','waiting',600),('t_47',108,'DWR','SBC','2023-10-02','08:00:00',18,'C146','a_118','confirmed',400),('t_48',112,'DWR','SBC','2023-10-04','08:00:00',17,'C147','a_118','confirmed',400),('t_5',101,'CSMT','MAO','2023-09-01','08:00:00',10,'C105',NULL,'cancelled',700),('t_50',112,'DWR','SBC','2023-10-04','08:00:00',19,'C147',NULL,'confirmed',400),('t_51',101,'CSMT','MAO','2023-09-01','08:00:00',5,'C106',NULL,'confirmed',900),('t_52',101,'CSMT','MAO','2023-09-01','08:00:00',0,'C107',NULL,'waiting',1000),('t_53',101,'CSMT','MAO','2023-09-01','08:00:00',12,'C108',NULL,'confirmed',500),('t_54',101,'CSMT','MAO','2023-09-01','08:00:00',0,'C109',NULL,'waiting',600),('t_6',101,'CSMT','MAO','2023-09-01','08:00:00',5,'C106',NULL,'confirmed',400),('t_7',101,'CSMT','MAO','2023-09-01','08:00:00',0,'C107',NULL,'waiting',600),('t_8',101,'CSMT','MAO','2023-09-01','08:00:00',12,'C108',NULL,'confirmed',400),('t_9',101,'CSMT','MAO','2023-09-01','08:00:00',0,'C109',NULL,'waiting',600);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trains`
--

DROP TABLE IF EXISTS `trains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trains` (
  `train_no` int NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`train_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trains`
--

LOCK TABLES `trains` WRITE;
/*!40000 ALTER TABLE `trains` DISABLE KEYS */;
INSERT INTO `trains` VALUES (101,'Mumbai Express'),(102,'Shirdi Fast'),(103,'Delhi Superfast'),(104,'Bengaluru Express'),(105,'Ajmer Fast'),(106,'Mumbai-Bhopal Express'),(107,'Goa-Mumbai Superfast'),(108,'Lonavala-Ajmer Express'),(109,'Bengaluru-Dharwad Fast'),(110,'Indore-Bhopal Superfast'),(111,'Goa-Mumbai Express'),(112,'Mumbai-Indore Superfast');
/*!40000 ALTER TABLE `trains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travels_on`
--

DROP TABLE IF EXISTS `travels_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travels_on` (
  `train_no` int NOT NULL,
  `route_id` varchar(10) NOT NULL,
  PRIMARY KEY (`train_no`,`route_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `travels_on_ibfk_1` FOREIGN KEY (`train_no`) REFERENCES `trains` (`train_no`),
  CONSTRAINT `travels_on_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travels_on`
--

LOCK TABLES `travels_on` WRITE;
/*!40000 ALTER TABLE `travels_on` DISABLE KEYS */;
INSERT INTO `travels_on` VALUES (102,'R001'),(111,'R001'),(106,'R002'),(107,'R002'),(109,'R003'),(112,'R003'),(101,'R004'),(112,'R004'),(101,'R005'),(103,'R005'),(104,'R006'),(105,'R006'),(110,'R007'),(108,'R008'),(112,'R008'),(104,'R009'),(105,'R009'),(101,'R010'),(103,'R010'),(109,'R010'),(102,'R011'),(111,'R011'),(106,'R012'),(107,'R012'),(109,'R013'),(112,'R013'),(101,'R014'),(112,'R014'),(101,'R015'),(103,'R015'),(104,'R016'),(105,'R016'),(110,'R017'),(108,'R018'),(112,'R018'),(104,'R019'),(105,'R019'),(101,'R020'),(103,'R020'),(109,'R020');
/*!40000 ALTER TABLE `travels_on` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-29 23:14:26
