CREATE DATABASE  IF NOT EXISTS `dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dev`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dev
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `COLABORADOR`
--

DROP TABLE IF EXISTS `COLABORADOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COLABORADOR` (
  `IDCOLABORADOR` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) NOT NULL,
  `APELLIDO` varchar(45) NOT NULL,
  `DIRECCION` varchar(45) NOT NULL,
  `EDAD` varchar(45) NOT NULL,
  `PROFESION` varchar(45) NOT NULL,
  `ESTADOCIVIL` varchar(45) NOT NULL,
  `active` tinyint(1) DEFAULT (true),
  `created_at` timestamp NULL DEFAULT (now()),
  `updated_at` timestamp NULL DEFAULT (now()),
  PRIMARY KEY (`IDCOLABORADOR`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `COLABORADOR_VIEW`
--

DROP TABLE IF EXISTS `COLABORADOR_VIEW`;
/*!50001 DROP VIEW IF EXISTS `COLABORADOR_VIEW`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `COLABORADOR_VIEW` AS SELECT 
 1 AS `NOMBRE`,
 1 AS `APELLIDO`,
 1 AS `DIRECCION`,
 1 AS `EDAD`,
 1 AS `PROFESION`,
 1 AS `ESTADOCIVIL`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'dev'
--
/*!50003 DROP PROCEDURE IF EXISTS `insert_into_collaborators` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `insert_into_collaborators`(

    IN n_NOMBRE      varchar(45),
    IN n_APELLIDO    varchar(45),
    IN n_DIRECCION   varchar(45),
    IN n_EDAD        varchar(45),
    IN n_PROFESION   varchar(45),
    IN n_ESTADOCIVIL varchar(45)

)
BEGIN
declare n_id int;
start transaction;
        
        select IDCOLABORADOR into n_id from dev.COLABORADOR  where NOMBRE = n_NOMBRE and APELLIDO = n_APELLIDO;
        
        IF n_id is not NULL
		THEN 
			update dev.COLABORADOR 
            set 
		        DIRECCION   = n_DIRECCION,
                EDAD        = n_EDAD,
                PROFESION   = n_PROFESION ,
                ESTADOCIVIL = n_ESTADOCIVIL,
                
                updated_at = now() 
			where 1=1 and IDCOLABORADOR = n_id and not (

                DIRECCION  <=> n_DIRECCION   and
                EDAD       <=> n_EDAD        and
                PROFESION  <=> n_PROFESION   and
                ESTADOCIVIL<=> n_ESTADOCIVIL 
            );
        ELSE 
			insert INTO dev.COLABORADOR (
                NOMBRE,
                APELLIDO,
                DIRECCION,
                EDAD, 
                PROFESION,
                ESTADOCIVIL
            ) 
            values (
                n_NOMBRE,
                n_APELLIDO,
                n_DIRECCION,
                n_EDAD,
                n_PROFESION,
                n_ESTADOCIVIL
            );
        END IF;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `COLABORADOR_VIEW`
--

/*!50001 DROP VIEW IF EXISTS `COLABORADOR_VIEW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `COLABORADOR_VIEW` AS select `COLABORADOR`.`NOMBRE` AS `NOMBRE`,`COLABORADOR`.`APELLIDO` AS `APELLIDO`,`COLABORADOR`.`DIRECCION` AS `DIRECCION`,`COLABORADOR`.`EDAD` AS `EDAD`,`COLABORADOR`.`PROFESION` AS `PROFESION`,`COLABORADOR`.`ESTADOCIVIL` AS `ESTADOCIVIL` from `COLABORADOR` where (`COLABORADOR`.`active` = true) order by `COLABORADOR`.`NOMBRE`,`COLABORADOR`.`APELLIDO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-13 18:20:23
