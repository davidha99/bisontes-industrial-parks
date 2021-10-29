-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2021 a las 18:18:50
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bisontes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `clienteID` int(11) NOT NULL,
  `empresaNom` varchar(50) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `telefono` int(11) NOT NULL,
  `industria` varchar(40) NOT NULL,
  `dptoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunicar`
--

CREATE TABLE `comunicar` (
  `dptoID` int(11) NOT NULL,
  `naveID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `dptoID` int(11) NOT NULL,
  `nombreDpto` varchar(80) NOT NULL,
  `empleadoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `empleadoID` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `telefono` int(11) NOT NULL,
  `correo` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nave`
--

CREATE TABLE `nave` (
  `naveID` int(11) NOT NULL,
  `pagoRenta` float NOT NULL,
  `largo` float NOT NULL,
  `ancho` float NOT NULL,
  `costoRenta` float NOT NULL,
  `clienteID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`clienteID`),
  ADD KEY `dptoID` (`dptoID`);

--
-- Indices de la tabla `comunicar`
--
ALTER TABLE `comunicar`
  ADD PRIMARY KEY (`dptoID`,`naveID`),
  ADD KEY `naveID` (`naveID`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`dptoID`),
  ADD UNIQUE KEY `nombreDpto` (`nombreDpto`),
  ADD KEY `empleadoID` (`empleadoID`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`empleadoID`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `telefono` (`telefono`);

--
-- Indices de la tabla `nave`
--
ALTER TABLE `nave`
  ADD PRIMARY KEY (`naveID`),
  ADD KEY `clienteID` (`clienteID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `clienteID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `dptoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `empleadoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nave`
--
ALTER TABLE `nave`
  MODIFY `naveID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`dptoID`) REFERENCES `departamento` (`dptoID`);

--
-- Filtros para la tabla `comunicar`
--
ALTER TABLE `comunicar`
  ADD CONSTRAINT `comunicar_ibfk_1` FOREIGN KEY (`dptoID`) REFERENCES `departamento` (`dptoID`),
  ADD CONSTRAINT `comunicar_ibfk_2` FOREIGN KEY (`naveID`) REFERENCES `nave` (`naveID`);

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`empleadoID`) REFERENCES `empleado` (`empleadoID`);

--
-- Filtros para la tabla `nave`
--
ALTER TABLE `nave`
  ADD CONSTRAINT `nave_ibfk_1` FOREIGN KEY (`clienteID`) REFERENCES `cliente` (`clienteID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
