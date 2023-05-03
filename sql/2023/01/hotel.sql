-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-05-2023 a las 05:07:13
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
-- Estructura de tabla para la tabla `gasto`
--

CREATE TABLE `gasto` (
  `id` int(6) NOT NULL,
  `concepto` varchar(70) NOT NULL,
  `importe` int(7) NOT NULL,
  `fecha_gasto` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gasto`
--

INSERT INTO `gasto` (`id`, `concepto`, `importe`, `fecha_gasto`) VALUES
(1, 'hola', 100, '2023-04-29');

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
  `fecha_registro` date NOT NULL,
  `folio_c` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `reservacion_id`, `monto`, `fecha_registro`, `folio_c`) VALUES
(1, 69, 100, '2023-04-23', 0),
(2, 69, 100, '2023-04-23', 0),
(3, 68, -100, '2023-04-23', 0),
(4, 68, 500, '2023-04-23', 0),
(5, 69, 100, '2023-04-26', 0),
(6, 69, 50, '2023-04-26', 0),
(7, 64, 1000, '2023-04-26', 0),
(8, 63, 900, '2023-04-26', 0),
(9, 62, 900, '2023-04-26', 0),
(10, 59, 801, '2023-04-26', 0),
(11, 59, 799, '2023-04-26', 0),
(12, 69, 250, '2023-04-26', 0),
(13, 52, 350, '2023-04-26', 0);

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
  `no_noches` int(2) NOT NULL,
  `total` float NOT NULL,
  `temporada` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reservaciones`
--

INSERT INTO `reservaciones` (`idReservaciones`, `nombre`, `fecha_deps`, `num_telefono`, `email`, `lugar_residencia`, `fecha_llegada`, `fecha_salida`, `habitacion_id`, `no_personas`, `deposito`, `fecha_reservacion`, `tipo_pago`, `no_folio`, `no_noches`, `total`, `temporada`) VALUES
(46, 'finiono', '2023-03-09', 2147483647, 'rudolfg@hotmail.com', 'el centro', '2023-03-09', '2023-03-09', 1, 1, 41, '2023-04-02', 'Efectivo', 10, 1, 600, ''),
(47, 'rudolf wolf wolf', '2023-03-09', 2147483647, 'rudolfg@hotmail.com', 'La concha', '2023-03-09', '2023-03-10', 1, 1, 0, '2023-03-09', 'Tarjeta', 11, 1, 700, ''),
(48, 'rudolf wolf wolf', '2023-03-08', 2147483647, 'rudolfg@hotmail.com', 'La Capital del mundo ', '2023-03-09', '2023-03-09', 2, 12, 0, '2023-03-09', 'Credito', 12, 1, 700, ''),
(50, 'rodomis', '2023-03-10', 2147483647, 'rudolfg@hotmail.com', 'la huerta', '2023-03-09', '2023-03-11', 4, 1, 0, '2023-03-09', 'Credito', 14, 2, 1400, ''),
(51, 'lalomis', '2023-03-09', 2147483647, 'rudolfg@hotmail.com', 'la huerta', '2023-03-09', '2023-03-10', 5, -52, 0, '2023-03-09', 'Tarjeta', 15, 1, 600, ''),
(52, 'rudolf wolf wolf', '2023-03-15', 2147483647, 'rudolfg@hotmail.com', 'Jaluco ', '2023-03-15', '2023-03-16', 6, 1, 0, '2023-03-15', 'Transferencia', 16, 1, 700, ''),
(53, 'rudolf wolf wolf', '2023-03-27', 2147483647, 'rudolfg@hotmail.com', 'la huerta', '2023-03-27', '2023-03-28', 7, 1, 0, '2023-03-27', 'Credito', 17, 1, 700, ''),
(54, 'Omar Perez', '2023-03-29', 2147483647, 'rudolfg@hotmail.com', 'el centro', '2023-03-28', '2023-03-31', 9, 4, 0, '2023-03-27', 'Cortesia', 18, 3, 1950, ''),
(55, 'Omar Perez', '2023-03-29', 2147483647, 'eduardo@wasp.mx', 'Jaluco ', '2023-03-29', '2023-03-30', 10, 3, 0, '2023-03-27', 'Credito', 19, 1, 650, ''),
(56, 'laloquera', '2023-03-29', 2147483647, 'eduardo@wasp.mx', 'La concha', '2023-03-29', '2023-03-30', 11, 1, 0, '2023-03-27', 'Cortesia', 20, 1, 800, ''),
(57, 'lalomis', '2023-03-29', 2147483647, 'rudolfg@hotmail.com', 'el centro', '2023-03-29', '2023-03-30', 12, 1, 0, '2023-03-27', 'Tarjeta', 21, 1, 800, ''),
(58, 'lalomis', '2023-03-29', 2147483647, 'rudolfg@hotmail.com', 'el centro', '2023-03-29', '2023-03-30', 12, 1, 0, '2023-03-27', 'Tarjeta', 21, 1, 800, ''),
(59, 'rudolf wolf wolf', '2023-03-30', 2147483647, 'rudolfg@hotmail.com', 'el centro', '2023-03-29', '2023-03-31', 13, 1, 0, '2023-03-27', 'Cortesia', 22, 2, 1600, ''),
(60, 'rudolf wolf wolf', '2023-03-29', 2147483647, 'rudolfg@hotmail.com', 'el centro', '2023-03-29', '2023-03-31', 14, 1, 0, '2023-03-27', 'Cortesia', 23, 2, 1200, ''),
(61, 'Omar Perez', '2023-04-03', 2147483647, 'rudolfg@hotmail.com', 'La Capital del mundo ', '2023-04-03', '2023-04-04', 15, 1, 0, '2023-04-01', 'Tarjeta', 24, 1, 600, ''),
(62, 'rudolf wolf wolf', '2023-04-03', 2147483647, 'rudolfg@hotmail.com', 'La concha', '2023-04-03', '2023-04-05', 16, 1, 0, '2023-04-01', 'Credito', 25, 2, 1800, ''),
(63, 'elbolifolfo', '2023-04-01', 2147483647, 'rudolfg@hotmail.com', 'La Capital del mundo ', '2023-04-01', '2023-04-02', 17, 1, 0, '2023-04-01', 'Tarjeta', 26, 1, 900, ''),
(64, 'la vara cuetera', '2023-04-02', 2147483647, 'rudolfg@hotmail.com', 'el centro en frente del alondra', '2023-04-02', '2023-04-03', 18, 2, 0, '2023-04-01', 'Transferencia', 27, 1, 1100, ''),
(65, 'Omar Perez', '2023-04-01', 2147483647, 'rudolfg@hotmail.com', 'el centro', '2023-04-01', '2023-04-02', 1, 1, 0, '2023-04-01', 'Cortesia', 28, 1, 700, ''),
(66, 'rodomis', '2023-04-02', 2147483647, 'rudolfg@hotmail.com', 'la huerta', '2023-04-02', '2023-04-03', 1, 1, 12, '2023-04-02', 'Tarjeta', 29, 1, 700, 'baja'),
(67, 'Omar', '2023-04-20', 2147483647, 'rudolfg@hotmail.com', 'la huerta', '2023-04-20', '2023-04-21', 1, 1, 0, '2023-04-19', 'Transferencia', 30, 1, 700, 'alta'),
(68, 'rudolf wolf wolf', '2023-04-22', 2147483647, 'rudolfg@hotmail.com', 'La concha', '2023-04-22', '2023-04-23', 3, 4, 0, '2023-04-19', 'Credito', 31, 1, 700, 'alta'),
(69, 'Omar', '2023-04-23', 2147483647, 'rudolfg@hotmail.com', 'la huerta', '2023-04-22', '2023-04-23', 1, 1, 0, '2023-04-22', 'Transferencia', 32, 1, 600, 'baja');

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
(4, 'carlos', 'rodriguez', 'ramos', '3154215897', 'rudolfg@hotmail.com', 'la huertona', 'vespertino', '1234', 'usuario'),
(8, 'Eddy', 'ambrosio', 'antrax', '3151001212', 'rudolfg@hotmail.com', 'la huertona', 'vespertino', '1234', 'usuario'),
(10, 'JoseLuis', 'Gonzalez', 'Ortiz', '3151135700', 'rudolfg@hotmail.com', 'la huertona', 'nocturno', '1234', 'administrador');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `gasto`
--
ALTER TABLE `gasto`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de la tabla `gasto`
--
ALTER TABLE `gasto`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `idReservaciones` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `tipohabitaciones`
--
ALTER TABLE `tipohabitaciones`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
