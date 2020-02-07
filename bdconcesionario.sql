-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 07, 2020 at 02:48 PM
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`IdCliente`, `Nombre`, `Cedula`, `Ciudad`, `Direccion`, `Telefono`, `Celular`) VALUES
(1, 'Juan Perez', '71776428', 'Medellin', 'Cra 80 No 20-410', '24655', '319785459');

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
  PRIMARY KEY (`IdVehiculo`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehiculo`
--

INSERT INTO `vehiculo` (`IdVehiculo`, `Modelo`, `MARCA`, `Precio`, `Descripcion`) VALUES
(1, 'Sandero', 'Renault', '14006', 'Nuevo'),
(4, 'Vitara', 'Chevrolet', '66666', 'Azul'),
(2, 'March', 'Nissan', '5564', 'Lujo');

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
  PRIMARY KEY (`IdVenta`),
  KEY `Fk_IdCliente` (`IdCliente`),
  KEY `Fk_IdVehiculo` (`IdVehiculo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
