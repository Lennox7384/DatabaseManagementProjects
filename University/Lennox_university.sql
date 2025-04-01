-- MySQL dump 10.13  Distrib 9.2.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: university
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_number` varchar(10) NOT NULL COMMENT 'Unique identifier for each course',
  `Course_name` varchar(100) NOT NULL COMMENT 'Name of the course',
  `Credit_hours` int NOT NULL COMMENT 'Number of credit hours for the course',
  `Department` varchar(50) NOT NULL COMMENT 'Department offering the course',
  PRIMARY KEY (`course_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Details of courses offered in the university';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('CS1310','Intro to computer science',4,'CS'),('CS3320','Data Structures',4,'CS'),('CS3380','Database',3,'CS'),('MATH2410','Discrete Mathematics',3,'MATH');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_report`
--

DROP TABLE IF EXISTS `grade_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade_report` (
  `student_number` varchar(20) NOT NULL COMMENT 'Student identifier, links to Student table',
  `section_identifier` int NOT NULL COMMENT 'Section identifier, links to Section table',
  `grade` varchar(10) NOT NULL COMMENT 'Grade received by the student for the section',
  KEY `fk_student` (`student_number`),
  KEY `fk_section` (`section_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Records of grades for students in specific course sections';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_report`
--

LOCK TABLES `grade_report` WRITE;
/*!40000 ALTER TABLE `grade_report` DISABLE KEYS */;
INSERT INTO `grade_report` VALUES ('17',112,'B'),('17',119,'C'),('8',85,'A'),('8',92,'A'),('8',102,'B'),('8',135,'A');
/*!40000 ALTER TABLE `grade_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prerequisite`
--

DROP TABLE IF EXISTS `prerequisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prerequisite` (
  `course_number` varchar(10) NOT NULL COMMENT 'Course that has the prerequisite',
  `prerequisite_number` varchar(10) NOT NULL COMMENT 'Course that is the prerequisite',
  PRIMARY KEY (`course_number`,`prerequisite_number`),
  KEY `fk_course_prerequisite` (`prerequisite_number`),
  CONSTRAINT `fk_course_main` FOREIGN KEY (`course_number`) REFERENCES `course` (`course_number`),
  CONSTRAINT `fk_course_prerequisite` FOREIGN KEY (`prerequisite_number`) REFERENCES `course` (`course_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Defines prerequisites for courses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prerequisite`
--

LOCK TABLES `prerequisite` WRITE;
/*!40000 ALTER TABLE `prerequisite` DISABLE KEYS */;
INSERT INTO `prerequisite` VALUES ('CS3320','CS1310'),('CS3380','CS3320'),('CS3380','MATH2410');
/*!40000 ALTER TABLE `prerequisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `section_identifier` int NOT NULL COMMENT 'Unique identifier for each section',
  `course_number` varchar(10) NOT NULL COMMENT 'Course identifier, links to the Course table',
  `semester` varchar(20) NOT NULL COMMENT 'The semester in which the section is offered (e.g., Fall, Spring)',
  `year` int NOT NULL COMMENT 'The year the section is offered',
  `instructor` varchar(100) NOT NULL COMMENT 'Name of the instructor for the section',
  PRIMARY KEY (`section_identifier`),
  KEY `fk_course` (`course_number`),
  CONSTRAINT `fk_course` FOREIGN KEY (`course_number`) REFERENCES `course` (`course_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Details of course sections offered in different semesters';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (85,'MATH2410','Fall',7,'King'),(92,'CS1310','Fall',7,'Anderson'),(102,'CS3320','Spring',8,'Knuth'),(112,'MATH2410','Fall',8,'Chang'),(118,'CS1310','Fall',8,'Anderson'),(135,'CS3380','Fall',8,'Stone');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_number` varchar(20) NOT NULL COMMENT 'unique identifier for each student',
  `Name` varchar(50) DEFAULT NULL COMMENT 'student name',
  `class` int DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL COMMENT 'student  major',
  PRIMARY KEY (`student_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='students in the university';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('17','Smith',1,'CS'),('8','Brown',2,'CS');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-24  1:05:39
