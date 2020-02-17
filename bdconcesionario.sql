-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Feb 17, 2020 at 02:48 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdconcesionario`
--

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `IdCliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL,
  `Cedula` varchar(30) NOT NULL,
  `Ciudad` varchar(30) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Telefono` varchar(30) DEFAULT NULL,
  `Celular` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdCliente`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`IdCliente`, `Nombre`, `Cedula`, `Ciudad`, `Direccion`, `Telefono`, `Celular`) VALUES
(1, 'Juan Perez Ma', '717764280', 'Barranquilla', 'Cra 80 No 20-410', '24655', '319785459'),
(2, 'Ramon', '65465', 'Rio', 'cc 90', NULL, NULL),
(5, 'Pepito Perez M', '454655', 'San Antonio Tachira', 'Calle 99No 50-8000', NULL, NULL),
(6, 'Pepito Junior', '79878', 'Cali', 'Cra 80 No 90', NULL, NULL),
(8, 'Adriana Buendia', '8765465', 'Palmira', 'Calle 30 No ', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
CREATE TABLE IF NOT EXISTS `vehiculo` (
  `IdVehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `Modelo` varchar(50) NOT NULL,
  `MARCA` varchar(50) NOT NULL,
  `Precio` decimal(10,0) NOT NULL,
  `Descripcion` varchar(600) NOT NULL,
  `Matricula` varchar(40) DEFAULT NULL,
  `Foto` blob,
  PRIMARY KEY (`IdVehiculo`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehiculo`
--

INSERT INTO `vehiculo` (`IdVehiculo`, `Modelo`, `MARCA`, `Precio`, `Descripcion`, `Matricula`, `Foto`) VALUES
(1, 'Sandero', 'Renault', '454645', 'Rines de Aluminio', 'HY67656', NULL),
(4, 'Vitara', 'Chevrolet', '9999', 'Azul', '90005', NULL),
(2, 'March', 'Nissan', '5569', 'Lujo', '7779', NULL),
(8, 'GL8555', 'Mercedes Benz', '99899', 'Exploradoras', 'MK8009', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `IdVenta` int(11) NOT NULL AUTO_INCREMENT,
  `IdCliente` int(11) NOT NULL,
  `IdVehiculo` int(11) NOT NULL,
  `Cantidad` smallint(6) DEFAULT NULL,
  `FechaVenta` date DEFAULT NULL,
  `NombreVendedor` varchar(100) DEFAULT NULL,
  `PrecioVentaUnitario` decimal(15,2) DEFAULT NULL,
  `Iva` decimal(15,2) DEFAULT NULL,
  `CiudadVenta` varchar(60) DEFAULT NULL,
  `Comentario` varchar(300) DEFAULT NULL,
  `PrecioVentaTotal` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdVenta`),
  KEY `Fk_IdCliente` (`IdCliente`),
  KEY `Fk_IdVehiculo` (`IdVehiculo`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ventas`
--

INSERT INTO `ventas` (`IdVenta`, `IdCliente`, `IdVehiculo`, `Cantidad`, `FechaVenta`, `NombreVendedor`, `PrecioVentaUnitario`, `Iva`, `CiudadVenta`, `Comentario`, `PrecioVentaTotal`) VALUES
(1, 1, 1, 5, '2020-02-05', 'Juan Tamariz', NULL, NULL, NULL, NULL, 0),
(2, 1, 1, 5, '2020-02-05', 'Juan Tamariz', '5.00', NULL, NULL, NULL, 0),
(3, 5, 4, NULL, '2020-02-20', 'Gabriela', NULL, NULL, NULL, NULL, NULL),
(5, 1, 2, NULL, '2020-02-21', 'Gabriela Bernal', NULL, NULL, NULL, NULL, 777),
(6, 1, 1, NULL, '2020-02-28', 'Juan tamariz', NULL, NULL, NULL, NULL, 9999),
(7, 2, 4, NULL, '2020-02-01', 'Sandra Murcia', NULL, NULL, NULL, NULL, 897987);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
