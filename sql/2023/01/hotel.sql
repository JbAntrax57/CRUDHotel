-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-02-2023 a las 04:39:48
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `id` int(10) NOT NULL,
  `concepto` varchar(65) NOT NULL,
  `importe` double NOT NULL,
  `fecha_gasto` date NOT NULL,
  `idusuario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

CREATE TABLE `habitaciones` (
  `id` int(10) NOT NULL,
  `tipo_id` int(10) NOT NULL,
  `nom_habitacion` varchar(20) NOT NULL,
  `planta` tinyint(1) NOT NULL,
  `disponible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`id`, `tipo_id`, `nom_habitacion`, `planta`, `disponible`) VALUES
(1, 1, 'Habitacion 1', 0, 1),
(2, 1, 'Habitacion 2', 0, 1),
(3, 1, 'Habitacion 3', 0, 1),
(4, 1, 'Habitacion 4', 0, 1),
(5, 1, 'Habitacion 5', 0, 1),
(6, 1, 'Habitacion 6', 0, 1),
(7, 1, 'Habitacion 8', 0, 1),
(8, 1, 'Habitacion 9', 0, 1),
(9, 1, 'Habitacion 10', 0, 1),
(10, 1, 'Habitacion 11', 0, 1),
(11, 2, 'Habitacion 7', 1, 1),
(12, 2, 'Habitacion 17', 1, 1),
(13, 2, 'Habitacion 18', 1, 1),
(14, 3, 'Habitacion 13', 1, 1),
(15, 3, 'Habitacion 14', 1, 1),
(16, 4, 'Habitacion 15', 1, 1),
(17, 4, 'Habitacion 16', 1, 1),
(18, 2, 'Bungalow 19', 0, 1),
(19, 1, 'Bungalow 20', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` int(10) NOT NULL,
  `reservacion_id` int(10) NOT NULL,
  `monto` double NOT NULL,
  `idusuario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(6) NOT NULL,
  `reservacion_id` int(10) NOT NULL,
  `monto` float NOT NULL,
  `fecha_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preciohabitacion`
--

CREATE TABLE `preciohabitacion` (
  `id` int(11) NOT NULL,
  `tipo_id` int(10) NOT NULL,
  `habitacion_id` int(10) NOT NULL,
  `tem_alta` double NOT NULL,
  `tem_baja` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `preciohabitacion`
--

INSERT INTO `preciohabitacion` (`id`, `tipo_id`, `habitacion_id`, `tem_alta`, `tem_baja`) VALUES
(1, 1, 1, 700, 600),
(2, 1, 2, 700, 600),
(3, 1, 3, 700, 600),
(4, 1, 4, 700, 600),
(5, 1, 5, 700, 600),
(6, 1, 6, 700, 600),
(7, 1, 7, 700, 600),
(8, 1, 8, 700, 600),
(9, 1, 9, 650, 550),
(10, 1, 10, 650, 550),
(11, 2, 11, 800, 700),
(12, 2, 12, 800, 700),
(13, 2, 13, 800, 700),
(14, 3, 14, 600, 500),
(15, 3, 15, 600, 500),
(16, 4, 16, 900, 800),
(17, 4, 17, 900, 800),
(18, 2, 18, 1100, 1000),
(19, 1, 19, 1000, 900);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recepcion`
--

CREATE TABLE `recepcion` (
  `id_cortecaja` int(10) NOT NULL,
  `folio_cortecaja` int(6) NOT NULL,
  `total_recibir` double NOT NULL,
  `total_entregar` double NOT NULL,
  `id_ingresos` int(10) NOT NULL,
  `id_gastos` int(10) NOT NULL,
  `fecha_caja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones`
--

CREATE TABLE `reservaciones` (
  `idReservaciones` int(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha_deps` date NOT NULL,
  `num_telefono` int(10) NOT NULL,
  `email` varchar(25) NOT NULL,
  `lugar_residencia` varchar(45) NOT NULL,
  `fecha_llegada` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `habitacion_id` int(2) NOT NULL,
  `no_personas` int(2) NOT NULL,
  `deposito` int(6) NOT NULL,
  `fecha_reservacion` date NOT NULL,
  `tipo_pago` text NOT NULL,
  `no_folio` int(6) NOT NULL,
  `no_noches` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reservaciones`
--

INSERT INTO `reservaciones` (`idReservaciones`, `nombre`, `fecha_deps`, `num_telefono`, `email`, `lugar_residencia`, `fecha_llegada`, `fecha_salida`, `habitacion_id`, `no_personas`, `deposito`, `fecha_reservacion`, `tipo_pago`, `no_folio`, `no_noches`) VALUES
(17, 'rodomis', '2023-01-16', 111111111, 'admin@hotmail.com', ' barra', '2023-01-16', '2023-01-17', 1, 2, 100, '2023-01-25', 'Efectivo', 1, 15),
(21, 'rudolf wolf wolf', '2023-01-18', 2147483647, 'rudolfg@hotmail.com', 'la huertona', '2023-01-19', '2023-01-21', 1, 2, 500, '2023-01-18', 'Credito', 3, 0),
(25, 'rudolf ', '2023-01-26', 2147483647, 'eduardo@wasp.mx', 'la huertona', '2023-01-26', '2023-01-25', 1, 3, 100, '2023-01-25', 'Efectivo', 5, 0),
(30, 'rudolf wolf wolf', '2023-02-18', 2147483647, 'eduardo@wasp.mx', 'la huertona', '2023-02-25', '2023-02-28', 1, 2, 450, '2023-02-18', 'Credito', 6, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipohabitaciones`
--

CREATE TABLE `tipohabitaciones` (
  `id` int(10) NOT NULL,
  `tipo_habitacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipohabitaciones`
--

INSERT INTO `tipohabitaciones` (`id`, `tipo_habitacion`) VALUES
(1, '2 Mat'),
(2, '2 Mat 1 Ind'),
(3, '1 Mat'),
(4, '3 Mat');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido_pat` varchar(45) NOT NULL,
  `apellido_mat` varchar(45) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `email` varchar(35) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `password` varchar(6) NOT NULL,
  `rol` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `apellido_pat`, `apellido_mat`, `telefono`, `email`, `direccion`, `turno`, `password`, `rol`) VALUES
(4, 'teddy', 'morales', 'Jaramillo', '3154215897', 'rudolfg@hotmail.com', 'la huertona', 'nocturno', '1234', 'usuario'),
(8, 'laloquera', 'perez', 'morales', '3151001212', 'rudolfg@hotmail.com', 'la huertona', 'vespertino', '1234', 'administrador'),
(9, 'rodomis', 'morales', 'dias', '3151135700', 'eduardo@wasp.mx', 'la huertona', 'matutino', '4567', 'usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_id` (`tipo_id`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservacion_id` (`reservacion_id`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservacion_id` (`reservacion_id`);

--
-- Indices de la tabla `preciohabitacion`
--
ALTER TABLE `preciohabitacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_id` (`tipo_id`),
  ADD KEY `habitacion_id` (`habitacion_id`);

--
-- Indices de la tabla `recepcion`
--
ALTER TABLE `recepcion`
  ADD PRIMARY KEY (`id_cortecaja`),
  ADD KEY `id_gastos` (`id_gastos`),
  ADD KEY `id_ingresos` (`id_ingresos`);

--
-- Indices de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD PRIMARY KEY (`idReservaciones`),
  ADD KEY `habitacion_id` (`habitacion_id`);

--
-- Indices de la tabla `tipohabitaciones`
--
ALTER TABLE `tipohabitaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `preciohabitacion`
--
ALTER TABLE `preciohabitacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `recepcion`
--
ALTER TABLE `recepcion`
  MODIFY `id_cortecaja` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `idReservaciones` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `tipohabitaciones`
--
ALTER TABLE `tipohabitaciones`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gastos_ibfk_2` FOREIGN KEY (`id`) REFERENCES `recepcion` (`id_gastos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD CONSTRAINT `habitaciones_ibfk_2` FOREIGN KEY (`tipo_id`) REFERENCES `tipohabitaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `ingresos_ibfk_1` FOREIGN KEY (`id`) REFERENCES `recepcion` (`id_ingresos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ingresos_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ingresos_ibfk_3` FOREIGN KEY (`reservacion_id`) REFERENCES `reservaciones` (`idReservaciones`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`reservacion_id`) REFERENCES `reservaciones` (`idReservaciones`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `preciohabitacion`
--
ALTER TABLE `preciohabitacion`
  ADD CONSTRAINT `preciohabitacion_ibfk_1` FOREIGN KEY (`tipo_id`) REFERENCES `tipohabitaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `preciohabitacion_ibfk_2` FOREIGN KEY (`habitacion_id`) REFERENCES `habitaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD CONSTRAINT `reservaciones_ibfk_1` FOREIGN KEY (`habitacion_id`) REFERENCES `habitaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
