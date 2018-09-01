-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: course
-- ------------------------------------------------------
-- Server version	5.7.20-log

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

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(200) NOT NULL,
  `classNum` int(11) NOT NULL,
  `teaId` int(11) NOT NULL,
  `classChooseNum` int(11) NOT NULL,
  PRIMARY KEY (`classId`),
  KEY `fk_co_tea` (`teaId`),
  CONSTRAINT `fk_co_tea` FOREIGN KEY (`teaId`) REFERENCES `teacher` (`teaId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1019 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1017,'Java课程设计',12,2018100001,14),(1018,'C++程序设计',12,2018100001,0);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_choose`
--

DROP TABLE IF EXISTS `course_choose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_choose` (
  `chooseId` int(11) NOT NULL AUTO_INCREMENT,
  `stuId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`chooseId`),
  UNIQUE KEY `UNIQUE` (`stuId`,`classId`),
  KEY `fk_choose_co` (`classId`),
  CONSTRAINT `fk_choose_co` FOREIGN KEY (`classId`) REFERENCES `course` (`classId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_choose_stu` FOREIGN KEY (`stuId`) REFERENCES `student` (`stuId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_choose`
--

LOCK TABLES `course_choose` WRITE;
/*!40000 ALTER TABLE `course_choose` DISABLE KEYS */;
INSERT INTO `course_choose` VALUES (35,2018000001,1018,89),(36,2018000001,1017,0);
/*!40000 ALTER TABLE `course_choose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_limit`
--

DROP TABLE IF EXISTS `course_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_limit` (
  `limitId` int(11) NOT NULL AUTO_INCREMENT,
  `classId` int(11) NOT NULL,
  `insId` int(11) NOT NULL,
  PRIMARY KEY (`limitId`),
  KEY `fk_li_co` (`classId`),
  KEY `fk_li_ins` (`insId`),
  CONSTRAINT `fk_li_co` FOREIGN KEY (`classId`) REFERENCES `course` (`classId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_li_ins` FOREIGN KEY (`insId`) REFERENCES `institution` (`insId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1093 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_limit`
--

LOCK TABLES `course_limit` WRITE;
/*!40000 ALTER TABLE `course_limit` DISABLE KEYS */;
INSERT INTO `course_limit` VALUES (1078,1017,1001),(1079,1017,1004),(1092,1018,1004);
/*!40000 ALTER TABLE `course_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institution` (
  `insId` int(11) NOT NULL AUTO_INCREMENT,
  `insName` varchar(200) NOT NULL,
  PRIMARY KEY (`insId`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
INSERT INTO `institution` VALUES (1001,'计算机学院'),(1002,'机械学院'),(1003,'管理学院'),(1004,'经济学院');
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `stuId` int(11) NOT NULL,
  `stuName` varchar(200) NOT NULL,
  `stuPass` varchar(200) NOT NULL,
  `insId` int(11) DEFAULT NULL,
  `insName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`stuId`),
  KEY `fk_stu_ins` (`insId`),
  CONSTRAINT `fk_stu_ins` FOREIGN KEY (`insId`) REFERENCES `institution` (`insId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (2018000001,'张三','2018000001',1004,'经济学院'),(2018000002,'李四','2018000002',1001,'计算机学院'),(2018000003,'王五','2018000003',1004,'经济学院'),(2018000004,'赵六','2018000004',1004,'经济学院'),(2018000005,'孙七','2018000005',1004,'管理学院'),(2018000006,'周八','2018000006',1001,'计算机学院'),(2018000007,'吴九','2018000007',1004,'管理学院'),(2018000008,'郑十','2018000008',1001,'计算机学院'),(2018000009,'刘备','2018000009',1004,'管理学院'),(2018000010,'关羽','2018000010',1002,'机械学院'),(2018000011,'张飞','2018000011',1002,'医学院');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `teaId` int(11) NOT NULL,
  `teaName` varchar(200) NOT NULL,
  `teaPass` varchar(200) NOT NULL,
  PRIMARY KEY (`teaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (2018100001,'张老师','2018100001'),(2018100002,'李老师','2018100002'),(2018100003,'王老师','2018100003'),(2018100004,'陈老师','2018100004');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-01 14:57:17
