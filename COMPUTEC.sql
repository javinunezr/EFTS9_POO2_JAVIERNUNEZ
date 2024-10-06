-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 06-10-2024 a las 02:39:14
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `COMPUTEC`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clientes`
--

CREATE TABLE `Clientes` (
  `rut` varchar(10) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `comuna` varchar(50) NOT NULL,
  `correo_electronico` varchar(200) NOT NULL,
  `telefono` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Clientes`
--

INSERT INTO `Clientes` (`rut`, `nombre_completo`, `direccion`, `comuna`, `correo_electronico`, `telefono`) VALUES
('11223344-5', 'Carlos Ramírez Soto', 'Los Robles 4561', 'Concepción', 'carlos.ramirez@gmail.com', '956789012'),
('12345678-9', 'Juan Pérez González', 'Av. Siempre Viva 742', 'Santiago', 'juan.perez@gmail.com', '987654321'),
('55667788-2', 'Ana Martínez Rojas', 'Las Amapolas 789', 'Viña del Mar', 'ana.martinez@gmail.com', '923456789'),
('87654321-0', 'María López Torres', 'Calle Falsa 123', 'Valparaíso', 'maria.lopez@gmail.com', '912345678'),
('99887766-1', 'Luis Fernández Pino', 'El Bosque 321', 'La Serena', 'luis.fernandez@gmail.com', '934567890');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Desktops`
--

CREATE TABLE `Desktops` (
  `descripcion_modelo` varchar(100) NOT NULL,
  `cpu` varchar(50) DEFAULT NULL,
  `disco_duro_mb` int(11) DEFAULT NULL,
  `ram_gb` int(11) DEFAULT NULL,
  `precio_desktop` int(10) DEFAULT NULL,
  `potencia_fuente` int(11) DEFAULT NULL,
  `factor_forma` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Desktops`
--

INSERT INTO `Desktops` (`descripcion_modelo`, `cpu`, `disco_duro_mb`, `ram_gb`, `precio_desktop`, `potencia_fuente`, `factor_forma`) VALUES
('Acer Aspire TC', 'Acer Aspire TC', 1000000, 12, 650000, 300, 'Mini Tower'),
('ASUS ROG Strix G10DK', 'AMD Ryzen 5 3600X', 2000000, 16, 1100000, 500, 'ATX'),
('Dell OptiPlex 7080', 'Intel Core i7-10700', 1000000, 16, 800000, 500, 'Micro ATX'),
('HP EliteDesk 800 G6', 'Intel Core i5-10500', 512000, 8, 750000, 400, 'Mini Tower'),
('Lenovo Legion Tower 5', 'AMD Ryzen 7 3700X', 2000000, 16, 1200000, 650, 'ATX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Laptops`
--

CREATE TABLE `Laptops` (
  `descripcion_modelo` varchar(100) NOT NULL,
  `cpu` varchar(50) DEFAULT NULL,
  `disco_duro_mb` int(11) DEFAULT NULL,
  `ram_gb` int(11) DEFAULT NULL,
  `precio_laptop` int(10) DEFAULT NULL,
  `tamano_pantalla_pulgadas` decimal(4,1) DEFAULT NULL,
  `es_touch` varchar(2) DEFAULT NULL,
  `cantidad_puertos_usb` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Laptops`
--

INSERT INTO `Laptops` (`descripcion_modelo`, `cpu`, `disco_duro_mb`, `ram_gb`, `precio_laptop`, `tamano_pantalla_pulgadas`, `es_touch`, `cantidad_puertos_usb`) VALUES
('Apple MacBook Air', 'Apple MacBook Air', 256000, 8, 950000, 13.3, 'No', 3),
('ASUS ZenBook 14', 'AMD Ryzen 7 4700U', 512000, 16, 900000, 14.0, 'No', 2),
('HP Spectre x360', 'Intel Core i7-1165G7', 1000000, 16, 1200000, 13.3, 'Si', 3),
('Lenovo ThinkPad X1 Carbon', 'Intel Core i7-1165G7', 1000000, 16, 1300000, 14.0, 'No', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ventas`
--

CREATE TABLE `Ventas` (
  `rut_cliente` varchar(10) DEFAULT NULL,
  `modelo_adquirido` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Ventas`
--

INSERT INTO `Ventas` (`rut_cliente`, `modelo_adquirido`) VALUES
('11223344-5', 'Apple MacBook Air'),
('11223344-5', 'Dell XPS 13');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`rut`);

--
-- Indices de la tabla `Desktops`
--
ALTER TABLE `Desktops`
  ADD PRIMARY KEY (`descripcion_modelo`);

--
-- Indices de la tabla `Laptops`
--
ALTER TABLE `Laptops`
  ADD PRIMARY KEY (`descripcion_modelo`);

--
-- Indices de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD KEY `rut_cliente` (`rut_cliente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`rut_cliente`) REFERENCES `Clientes` (`rut`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
