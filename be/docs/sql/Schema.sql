CREATE DATABASE dev;
use dev;


CREATE TABLE `COLABORADOR` (
  `IDCOLABORADOR` int(11) PRIMARY KEY AUTO_INCREMENT,
  `NOMBRE` varchar(45) NOT NULL,
  `APELLIDO` varchar(45) NOT NULL,
  `DIRECCION` varchar(45) NOT NULL,
  `EDAD` varchar(45) NOT NULL,
  `PROFESION` varchar(45) NOT NULL,
  `ESTADOCIVIL` varchar(45) NOT NULL,
  `active` bool DEFAULT (TRUE),
  `created_at` timestamp DEFAULT (now()),
  `updated_at` timestamp DEFAULT (now())
);


