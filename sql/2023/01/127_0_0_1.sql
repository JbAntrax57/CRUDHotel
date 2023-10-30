-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2023 a las 04:15:28
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
-- Base de datos: `bdcrud`
--
CREATE DATABASE IF NOT EXISTS `bdcrud` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bdcrud`;

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
(3, 1, 'Habitacion 1', 0, 0);

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
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `signo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`codigo`, `nombre`, `edad`, `signo`) VALUES
(1, 'Roger GÃ³mez', 34, 'Leo'),
(2, 'Ruth Tarqui', 22, 'Piscis'),
(3, 'Antonio Torres', 5, 'Acuario');

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
  `no_folio` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reservaciones`
--

INSERT INTO `reservaciones` (`idReservaciones`, `nombre`, `fecha_deps`, `num_telefono`, `email`, `lugar_residencia`, `fecha_llegada`, `fecha_salida`, `habitacion_id`, `no_personas`, `deposito`, `fecha_reservacion`, `tipo_pago`, `no_folio`) VALUES
(17, 'admin', '2023-01-16', 111111111, 'admin@hotmail.com', ' barra', '2023-01-16', '2023-01-17', 3, 2, 100, '2023-01-16', 'efectivo', 1);

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
(1, '2 Matrimoniales');

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
  `password` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `apellido_pat`, `apellido_mat`, `telefono`, `email`, `direccion`, `turno`, `password`) VALUES
(2, 'admin', 'ad', 'min', '3150101253', 'admin@gmail.com', 'jaluco jalico', 'Matutino', '1234');

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
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`codigo`);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `preciohabitacion`
--
ALTER TABLE `preciohabitacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recepcion`
--
ALTER TABLE `recepcion`
  MODIFY `id_cortecaja` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `idReservaciones` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tipohabitaciones`
--
ALTER TABLE `tipohabitaciones`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Filtros para la tabla `preciohabitacion`
--
ALTER TABLE `preciohabitacion`
  ADD CONSTRAINT `preciohabitacion_ibfk_1` FOREIGN KEY (`tipo_id`) REFERENCES `tipohabitaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `preciohabitacion_ibfk_2` FOREIGN KEY (`habitacion_id`) REFERENCES `habitaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD CONSTRAINT `reservaciones_ibfk_3` FOREIGN KEY (`habitacion_id`) REFERENCES `habitaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `didise`
--
CREATE DATABASE IF NOT EXISTS `didise` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `didise`;
--
-- Base de datos: `didisee`
--
CREATE DATABASE IF NOT EXISTS `didisee` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `didisee`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_alumno`
--

CREATE TABLE `tb_alumno` (
  `id_alumno` int(11) NOT NULL,
  `alu_nombre` varchar(45) NOT NULL,
  `alu_nc` varchar(45) NOT NULL,
  `alu_seso` varchar(45) NOT NULL,
  `alu_estado_civil` varchar(45) NOT NULL,
  `alu_domicilio` varchar(45) NOT NULL,
  `alu_telefono` varchar(45) NOT NULL,
  `alu_carrera` varchar(45) NOT NULL,
  `alu_ingreso` varchar(30) NOT NULL,
  `alu_egreso` varchar(30) NOT NULL,
  `alu_titulado` varchar(45) NOT NULL,
  `alu_estado` varchar(45) NOT NULL,
  `alu_email` varchar(45) NOT NULL,
  `alu_semestre` varchar(45) NOT NULL,
  `fk_alum_encuesta` int(11) DEFAULT NULL,
  `alu_curp` varchar(30) NOT NULL,
  `alu_generacion` varchar(30) NOT NULL,
  `alu_edad` varchar(3) NOT NULL,
  `alu_promedio` varchar(3) NOT NULL,
  `alu_promedio_ba` varchar(3) NOT NULL,
  `alu_cp` varchar(30) NOT NULL,
  `alu_lugar` varchar(30) NOT NULL,
  `aula` varchar(30) NOT NULL,
  `encuesta` int(2) DEFAULT 0,
  `enviados` int(2) DEFAULT NULL,
  `fk_id_aplicacion` int(11) NOT NULL,
  `fk_alu_carrera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='tabla de los alumnos';

--
-- Volcado de datos para la tabla `tb_alumno`
--

INSERT INTO `tb_alumno` (`id_alumno`, `alu_nombre`, `alu_nc`, `alu_seso`, `alu_estado_civil`, `alu_domicilio`, `alu_telefono`, `alu_carrera`, `alu_ingreso`, `alu_egreso`, `alu_titulado`, `alu_estado`, `alu_email`, `alu_semestre`, `fk_alum_encuesta`, `alu_curp`, `alu_generacion`, `alu_edad`, `alu_promedio`, `alu_promedio_ba`, `alu_cp`, `alu_lugar`, `aula`, `encuesta`, `enviados`, `fk_id_aplicacion`, `fk_alu_carrera`) VALUES
(1, 'Rodolfo Andres Sanchez Bello', '161010081', 'Masculino', 'soltero', 'mar mediterraneo #32', '3151200119', '', '2023-01-11', '2023-01-19', 'si', '', 'andres_sanchees@hotmail.com', '', 1, '', '', '', '', '', '', '', '', 6, 14, 2, 3),
(2, 'Pedro Raul Morales Perez', '16101000', 'Masculino', 'soltero', 'calle mazatlan peko', '3153555337e', 'ISC', '2021-12-01', '2021-12-01', 'si', '', 'pedromorales_96@hotmail.com', '', 0, '', '', '', '', '', '', '', '', 1, 6, 2, 2),
(3, 'Ismael Ivan Angel Sanchez', '161010031', 'Masculino', 'soltero', 'av.pescadores', '3121099823', 'ISC', '2021-12-07', '2021-12-07', 'si', '', 'izwael_1997@hotmail.com', '', 0, '', '', '', '', '', '', '', '', 1, 224, 9, 1),
(130, 'rafael vargas medina', '123123', 'Masculino', 'casada', 'av jaluco #15', '123', 'ISC', '2022-04-22', '2022-04-22', 'si', '', 'bola_kidsilber@hotmail.com', '', 0, '', '', '', '', '', '', '', '', 0, 22, 2, 2),
(132, 'azucena osorio', '10101001', 'Masculino', 'casada', 'tecmm', '3139131292', 'sistemas', '2022-05-12', '2022-05-10', 'si', '', 'azucena.osorio@lahuerta.tecmm.edu.mx', '', 0, '', '', '', '', '', '', '', '', 0, 3, 8, 2),
(133, 'victor gomez', '1010100', 'hombre', 'soltero', 'tecmm', '321123321', 'sistemas', '2022-05-12', '2022-05-12', 'si', 'activo', 'victor.gomez@lahuerta.tecmm.edu.mx', '10', 0, '', '', '', '', '', '', '', '', 0, 1, 9, 1),
(137, 'kevin ismain lopez garcia ', '17101107', 'hombre', 'soltero', 'gdl guapo #19', '545554', 'ISC', '2022-09-05', '2022-09-20', 'no', 'activo', 'logakevin2@gmail.com', '11', 0, '', '', '', '', '', '', '', '', 0, 0, 9, 1),
(138, 'brian eduardo Guerrero', '17101025', 'hombre', 'soltero', 'av jaluco #15', '315151515', 'ISC', '2022-09-14', '2022-09-06', 'no', 'inactivo', 'brianeduardo1999@hotmail.com', '11', 0, '', '', '', '', '', '', '', '', 0, NULL, 9, 1),
(139, 'karla belen gonzalez', '65495463', 'hombre', 'soltera', 'calle chaparra', '3151005484', 'ISC', '2022-09-05', '2022-09-05', 'no', 'inactivo', 'kbelen.gonzalez@alumnos.udg.mx', '7', 0, '', '', '', '', '', '', '', '', 0, NULL, 9, 1),
(146, 'Jose luis Gonzales Ortiz', '01010101', 'hombre', 'casado', 'tec mm', '3151000000', 'ISC', '2023-03-07', '2023-03-06', 'no', 'activo', 'luishark@hotmail.com', '14', 0, '', '', '', '', '', '', '', '', 0, 0, 9, 1),
(147, 'Jose luis Gonzales Ortiz', '01010101', 'hombre', 'casado', 'tec mm', '3151000000', 'ISC', '2023-03-07', '2023-03-06', 'no', 'activo', 'luishark@hotmail.com', '14', 0, '', '', '', '', '', '', '', '', 0, 1, 9, 1),
(148, 'Jose luis Gonzales Ortiz', '01010101', 'hombre', 'casado', 'tec mm', '3151000000', 'ISC', '2023-03-07', '2023-03-06', 'no', 'inactivo', 'luishark@hotmail.com', '14', 0, '', '', '', '', '', '', '', '', 0, 0, 9, 1),
(149, 'Jose luis Gonzales Ortiz', '01010101', 'hombre', 'casado', 'tec mm', '3151000000', 'ISC', '2023-03-07', '2023-03-06', 'no', 'inactivo', 'luishark@hotmail.com', '14', 0, '', '', '', '', '', '', '', '', 0, 2, 9, 1),
(150, 'Eduardo Ambrosio Lopez Corona ', '18101054', 'honmbre', '', 'la concha', '31510101010', 'ISC', '2023-03-08', '2023-03-08', 'si', 'activo', 'hu18101054@lahuerta.tecmm.edu.mx', '9', 0, '', '', '', '', '', '', '', '', 0, 3, 9, 1),
(174, 'Zaida Lizbeth Vicencio Barajas', '201010080', 'Masculino', '', 'LC', '123', 'ARQ', '2023-03-01', '2023-03-25', 'si', '', 'liz.com', '', 0, '', '', '', '', '', '', '', '', 1, NULL, 2, 1),
(175, 'nueva liz', '090909', 'Femenino', '', 'LChhg', '3214151234', '', '2023-03-23', '2023-03-31', 'si', '', 'liz@hotmail.com', '', 0, '', '', '', '', '', '', '', '', 1, NULL, 2, 1),
(176, 'prueba', '90101055', 'Masculino', '', 'barra de navidad', '315120029', '', '2023-03-06', '2023-03-31', 'si', '', 'andres_sanchees@hotmail.com', '', 0, '', '', '', '', '', '', '', '', 0, 1, 2, 3),
(177, 'lesly Guadalupe bautista Aguilar ', '218316889', 'Femenino', '', 'jaluco ', '12312312132', '', '2015-08-15', '2023-05-15', 'si', '', 'leslybautista96@gmail.com', '', 0, '', '', '', '', '', '', '', '', 0, 1, 2, 3),
(204, 'alejandro', '2020', 'Masculino', '', 'gdl guapo #19', '314155535', '', '2023-05-22', '2023-06-02', 'si', '', 'andres_sanchees@hotmail.com', '', NULL, '', '', '', '', '', '', '', '', 0, NULL, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_aplicacion`
--

CREATE TABLE `tb_aplicacion` (
  `id_aplicacion` int(11) NOT NULL,
  `apli_fecha` date NOT NULL,
  `apli_generacion` varchar(50) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `apli_fecha_ini` date NOT NULL,
  `apli_fecha_fin` varchar(45) NOT NULL,
  `apli_sector` varchar(45) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_aplicacion`
--

INSERT INTO `tb_aplicacion` (`id_aplicacion`, `apli_fecha`, `apli_generacion`, `id_usuario`, `apli_fecha_ini`, `apli_fecha_fin`, `apli_sector`, `status`) VALUES
(2, '2021-12-02', '2000-2005', NULL, '2021-12-01', '2021-12-30', 'Empresa', 'activo'),
(3, '2021-12-02', '2015-2020', NULL, '2021-12-01', '2021-12-30', 'Empresa', 'activo'),
(4, '2021-12-29', '2010-2015', NULL, '2021-12-23', '2021-12-29', 'Alumno', 'activo'),
(7, '0000-00-00', '1', NULL, '2023-03-22', '2023-03-07', '', 'activo'),
(8, '0000-00-00', '12345', NULL, '2023-03-14', '2023-03-29', '', 'activo'),
(9, '0000-00-00', 'pekos', NULL, '2023-03-06', '2023-03-24', '', 'activo'),
(10, '0000-00-00', 'Los cangrejos 2', NULL, '2023-10-20', '2028-04-19', '', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_carrera`
--

CREATE TABLE `tb_carrera` (
  `id` int(11) NOT NULL,
  `Carrera` varchar(60) NOT NULL,
  `acronimo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_carrera`
--

INSERT INTO `tb_carrera` (`id`, `Carrera`, `acronimo`) VALUES
(1, 'Ingeniería en sistemas computacionales ', 'ISC'),
(2, 'Ingeniería en industrias alimentaria', 'IIA'),
(3, 'Arquitectura ', 'ARQ'),
(4, 'licenciatura en administracion', 'LA'),
(5, 'Ingeniería en gestión empresarial', 'IGE'),
(6, 'Ingeniería en administración', 'IA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_datos`
--

CREATE TABLE `tb_datos` (
  `id_datos` int(11) NOT NULL,
  `datos_nombre` varchar(45) NOT NULL,
  `datos_email` varchar(45) NOT NULL,
  `datos sexo` varchar(45) NOT NULL,
  `datos_puesto` varchar(45) NOT NULL,
  `datos_status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='esta es la tabla de datos';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_empresa`
--

CREATE TABLE `tb_empresa` (
  `id_empresa` int(11) NOT NULL,
  `id_alumno` int(11) DEFAULT NULL,
  `em_fecha_registro` date NOT NULL,
  `em_nombre` varchar(50) NOT NULL,
  `em_domicilio` varchar(45) NOT NULL,
  `em_ciudad` varchar(45) NOT NULL,
  `em_municipio` varchar(45) NOT NULL,
  `em_estado` varchar(45) NOT NULL,
  `em_numero` int(11) NOT NULL,
  `em_email` varchar(45) NOT NULL,
  `em_status` varchar(20) NOT NULL,
  `encuesta` int(3) NOT NULL,
  `enviados` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='tabla de los datos de la empresa';

--
-- Volcado de datos para la tabla `tb_empresa`
--

INSERT INTO `tb_empresa` (`id_empresa`, `id_alumno`, `em_fecha_registro`, `em_nombre`, `em_domicilio`, `em_ciudad`, `em_municipio`, `em_estado`, `em_numero`, `em_email`, `em_status`, `encuesta`, `enviados`) VALUES
(1, NULL, '2021-12-20', 'el pollo sa de cv2', 'mar negro #5002', 'guadalajaraaa', 'cihuatlan', 'Jalisco', 1234567890, 'andres_sanchees@hotmail.com', 'activo', 2, 3),
(2, NULL, '2023-03-17', 'Rodo sa de cv', 'erwgwrg', 'osc', 'jalsico', 'hebf', 23213, 'rodolfo@wasp.mx', 'activo', 3, 1),
(3, NULL, '2023-03-16', 'Rodolfo2', 'erwgwrg', 'osc', 'jalsico', 'hebf', 23213, 'rodolfo@wasp.mx', 'inactivo', 0, 0),
(4, NULL, '0000-00-00', 'Rodolfo3', 'mar guapo 15', 'guadalajara', 'cihuatlan', 'jalisco', 23213, 'rodolfo@wasp.mx', 'inactivo', 0, 0),
(7, NULL, '2021-12-30', 'bady relax sa de cv2', 'casa de bola2', 'jaluco2', 'jalisco2', 'cihuatlan2', 123123232, 'rodolfo@wasp.mx2', 'inactivo', 0, 0),
(8, NULL, '2023-03-01', 'sicar solutions sa de cv ', 'magisterio 23', 'gdl', 'autlan', 'jalisco', 123, 'sicar.com', 'inactivo', 1, 1),
(9, NULL, '2023-03-16', '2', '2', '2', '2', '2', 2, '2', 'activo', 0, 0),
(10, NULL, '2023-03-23', '42', '4', '4', '1', '4', 4, '4', 'activo', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_en_alu`
--

CREATE TABLE `tb_en_alu` (
  `id` int(11) NOT NULL,
  `id_alumno` int(11) DEFAULT NULL,
  `id_encuesta2` int(11) DEFAULT NULL,
  `p1` varchar(40) DEFAULT NULL,
  `p2` varchar(40) DEFAULT NULL,
  `p3` varchar(40) DEFAULT NULL,
  `p4` varchar(40) DEFAULT NULL,
  `p5` varchar(40) DEFAULT NULL,
  `p6` varchar(40) DEFAULT NULL,
  `p7` varchar(40) DEFAULT NULL,
  `p8` varchar(40) DEFAULT NULL,
  `p9` varchar(40) DEFAULT NULL,
  `p10` varchar(40) DEFAULT NULL,
  `p11` varchar(40) DEFAULT NULL,
  `p12` varchar(40) DEFAULT NULL,
  `p13` varchar(40) DEFAULT NULL,
  `p14` varchar(40) DEFAULT NULL,
  `p15` varchar(40) DEFAULT NULL,
  `p16` varchar(40) DEFAULT NULL,
  `p17` varchar(40) DEFAULT NULL,
  `p18` varchar(40) DEFAULT NULL,
  `p19` varchar(40) DEFAULT NULL,
  `p20` varchar(40) DEFAULT NULL,
  `p21` varchar(40) DEFAULT NULL,
  `p22` varchar(40) DEFAULT NULL,
  `p23` varchar(40) DEFAULT NULL,
  `p24` varchar(40) DEFAULT NULL,
  `p25` varchar(40) DEFAULT NULL,
  `p26` varchar(40) DEFAULT NULL,
  `p27` varchar(40) DEFAULT NULL,
  `p28` varchar(40) DEFAULT NULL,
  `p29` varchar(40) DEFAULT NULL,
  `p30` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_en_alu`
--

INSERT INTO `tb_en_alu` (`id`, `id_alumno`, `id_encuesta2`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `p10`, `p11`, `p12`, `p13`, `p14`, `p15`, `p16`, `p17`, `p18`, `p19`, `p20`, `p21`, `p22`, `p23`, `p24`, `p25`, `p26`, `p27`, `p28`, `p29`, `p30`) VALUES
(1, 1, NULL, '4', '4', '4', '4', '4', '4', '4', '', NULL, '4', '', '', '', '50', '50', '50', '50', '4', '', '50', '4', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', '', '50', '50', '50', '50', '', '', '50', NULL, '1', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_en_alu22`
--

CREATE TABLE `tb_en_alu22` (
  `id` int(6) NOT NULL,
  `p31` varchar(50) DEFAULT NULL,
  `p32` varchar(50) DEFAULT NULL,
  `p33` varchar(50) DEFAULT NULL,
  `p34` varchar(70) DEFAULT NULL,
  `p35` varchar(50) DEFAULT NULL,
  `p36` varchar(50) DEFAULT NULL,
  `p37` varchar(50) DEFAULT NULL,
  `p38` varchar(50) DEFAULT NULL,
  `p39` varchar(50) DEFAULT NULL,
  `p40` varchar(50) DEFAULT NULL,
  `p41` varchar(50) DEFAULT NULL,
  `p42` varchar(50) DEFAULT NULL,
  `p43` varchar(50) DEFAULT NULL,
  `p44` varchar(50) DEFAULT NULL,
  `p45` varchar(50) DEFAULT NULL,
  `p46` varchar(50) DEFAULT NULL,
  `p47` varchar(50) DEFAULT NULL,
  `p48` varchar(50) DEFAULT NULL,
  `p49` varchar(50) DEFAULT NULL,
  `p50` varchar(50) DEFAULT NULL,
  `p51` varchar(50) DEFAULT NULL,
  `p52` varchar(50) DEFAULT NULL,
  `p53` varchar(50) DEFAULT NULL,
  `p54` varchar(50) DEFAULT NULL,
  `p55` varchar(50) DEFAULT NULL,
  `p56` varchar(50) DEFAULT NULL,
  `p57` varchar(50) DEFAULT NULL,
  `p58` varchar(50) DEFAULT NULL,
  `p59` varchar(50) DEFAULT NULL,
  `p60` varchar(50) DEFAULT NULL,
  `p61` varchar(50) DEFAULT NULL,
  `p62` varchar(50) DEFAULT NULL,
  `p63` varchar(50) DEFAULT NULL,
  `p64` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_en_alu22`
--

INSERT INTO `tb_en_alu22` (`id`, `p31`, `p32`, `p33`, `p34`, `p35`, `p36`, `p37`, `p38`, `p39`, `p40`, `p41`, `p42`, `p43`, `p44`, `p45`, `p46`, `p47`, `p48`, `p49`, `p50`, `p51`, `p52`, `p53`, `p54`, `p55`, `p56`, `p57`, `p58`, `p59`, `p60`, `p61`, `p62`, `p63`, `p64`) VALUES
(1, '123', '1', NULL, 'kek@keko.com', '1', '1', '', '', '', '2', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '', 'no', '', 'no', '', 'no', '', 'no', '', 'no', 'hola', NULL),
(2, '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_en_empresa`
--

CREATE TABLE `tb_en_empresa` (
  `id_en_em` int(6) NOT NULL,
  `id_empresa` int(6) DEFAULT NULL,
  `encuesta` int(2) DEFAULT NULL,
  `p1` varchar(10) DEFAULT NULL,
  `p2` varchar(10) DEFAULT NULL,
  `p3` varchar(30) DEFAULT NULL,
  `p4` varchar(30) DEFAULT NULL,
  `p5` varchar(30) DEFAULT NULL,
  `p6` varchar(10) DEFAULT NULL,
  `p7` varchar(10) DEFAULT NULL,
  `p8` varchar(10) DEFAULT NULL,
  `p9` varchar(10) DEFAULT NULL,
  `p10` varchar(10) DEFAULT NULL,
  `p11` varchar(10) DEFAULT NULL,
  `p12` varchar(10) DEFAULT NULL,
  `p13` varchar(10) DEFAULT NULL,
  `p14` varchar(10) DEFAULT NULL,
  `p15` varchar(10) DEFAULT NULL,
  `p16` varchar(10) DEFAULT NULL,
  `p17` varchar(10) DEFAULT NULL,
  `p18` varchar(10) DEFAULT NULL,
  `p19` varchar(10) DEFAULT NULL,
  `p20` varchar(10) DEFAULT NULL,
  `p21` varchar(10) DEFAULT NULL,
  `p22` varchar(10) DEFAULT NULL,
  `p23` varchar(10) DEFAULT NULL,
  `p24` varchar(10) DEFAULT NULL,
  `p25` varchar(10) DEFAULT NULL,
  `p26` varchar(10) DEFAULT NULL,
  `p27` varchar(10) DEFAULT NULL,
  `p28` varchar(10) DEFAULT NULL,
  `p29` varchar(10) DEFAULT NULL,
  `p30` varchar(10) DEFAULT NULL,
  `p31` varchar(10) DEFAULT NULL,
  `p32` varchar(10) DEFAULT NULL,
  `p33` varchar(10) DEFAULT NULL,
  `p34` varchar(10) DEFAULT NULL,
  `p35` varchar(10) DEFAULT NULL,
  `p36` varchar(10) DEFAULT NULL,
  `p37` varchar(10) DEFAULT NULL,
  `p38` varchar(10) DEFAULT NULL,
  `p39` varchar(10) DEFAULT NULL,
  `p40` varchar(10) DEFAULT NULL,
  `p41` varchar(10) DEFAULT NULL,
  `p42` varchar(10) DEFAULT NULL,
  `p43` varchar(10) DEFAULT NULL,
  `p44` varchar(10) DEFAULT NULL,
  `p45` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_en_empresa`
--

INSERT INTO `tb_en_empresa` (`id_en_em`, `id_empresa`, `encuesta`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `p10`, `p11`, `p12`, `p13`, `p14`, `p15`, `p16`, `p17`, `p18`, `p19`, `p20`, `p21`, `p22`, `p23`, `p24`, `p25`, `p26`, `p27`, `p28`, `p29`, `p30`, `p31`, `p32`, `p33`, `p34`, `p35`, `p36`, `p37`, `p38`, `p39`, `p40`, `p41`, `p42`, `p43`, `p44`, `p45`) VALUES
(84, NULL, NULL, '1', '1', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(85, NULL, NULL, '1', '1', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(86, NULL, NULL, '1', '1', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(87, NULL, NULL, '1', '1', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(88, NULL, NULL, '1', '1', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(89, NULL, NULL, '1', '1', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(90, NULL, NULL, '1', '1', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(91, NULL, NULL, '1', '1', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(92, NULL, NULL, '1', '1', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(93, NULL, NULL, '1', '1', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(94, NULL, NULL, '1', '1', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(95, NULL, NULL, '1', '1', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(96, NULL, NULL, '1', '1', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(97, NULL, NULL, '1', '1', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(98, NULL, NULL, NULL, NULL, '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
(99, NULL, NULL, NULL, NULL, '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
(100, NULL, NULL, NULL, NULL, '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
(101, NULL, NULL, '1', '2', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(102, NULL, NULL, '1', '2', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(103, NULL, NULL, '1', '2', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(104, NULL, NULL, '1', '2', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(105, NULL, NULL, '1', '2', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(106, NULL, NULL, '1', '2', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(107, NULL, NULL, '1', '2', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(108, NULL, NULL, '1', '2', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(109, NULL, NULL, '1', '2', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa'),
(110, NULL, NULL, '1', '1', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', 'sistemas', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '1', 'hola', 'holaaaaaaaaaaaaaa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `id usuario` int(11) NOT NULL,
  `id datos` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `psw` varchar(45) NOT NULL,
  `priviliegio` varchar(45) NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='esta es la tabla de los usuarios';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(5, 'azucena', '$2y$10$z/TnJDJIyP7LrFJdxKlVbew1S1DdQqrHR1h4J73JE/Te08ytU66h.'),
(6, 'rodo', '$2y$10$8uzxq6lyWMrSSBQeNm7slugSXfaJijqIfnLSTjxaaCa/8Hw5t3sue'),
(7, 'andrea', '$2y$10$FilgIDTxAP6HMCs2nF9qM.fB9AZW/yTZqXQ4oMp.8OwkDRQyNVhM6'),
(8, 'ocho', '$2y$10$4SVd6h.wMMRcxGFJAKxwKOKujNuIQpCwNk9A/cubKcbcPnXAp5uVO'),
(9, 'pedro', '$2y$10$Lb7dcvAPRc/IUZBlD6l.0udVZe6SCm5uLXfq//vh0a0nZGrWhXYG2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(3) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `pass`) VALUES
(1, 'azucena', 'azucena', '123'),
(2, '', 'rodo', '$2y$10$UBXlyHgYsn8U7p2cbrx14.V32AWJu.Atzk5dNydz0tK'),
(3, '', 'roro', '$2y$10$r.wKPPoGyg2iarZH0OIU.uSzM4BoWiHiVZn3PSQ.Fpi'),
(4, '', 'kk', '$2y$10$HFR3wxnhbdKk0BHxLctUnusgp/Ro.3/nSlfLRj8ASpt'),
(5, '', 'pp', '$2y$10$JNKTtF1FArFKz/oBB8dYdOgKbQe8.mKkVMuZZ4Ern6/');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_alumno`
--
ALTER TABLE `tb_alumno`
  ADD PRIMARY KEY (`id_alumno`),
  ADD KEY `fk_alum_encuesta` (`fk_alum_encuesta`),
  ADD KEY `fk_id_aplicacion` (`fk_id_aplicacion`),
  ADD KEY `fk_id_aplicacion_2` (`fk_id_aplicacion`),
  ADD KEY `fk_alu_carrera` (`fk_alu_carrera`);

--
-- Indices de la tabla `tb_aplicacion`
--
ALTER TABLE `tb_aplicacion`
  ADD PRIMARY KEY (`id_aplicacion`),
  ADD KEY `id_usuariofk` (`id_usuario`);

--
-- Indices de la tabla `tb_carrera`
--
ALTER TABLE `tb_carrera`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_datos`
--
ALTER TABLE `tb_datos`
  ADD PRIMARY KEY (`id_datos`);

--
-- Indices de la tabla `tb_empresa`
--
ALTER TABLE `tb_empresa`
  ADD PRIMARY KEY (`id_empresa`),
  ADD KEY `id_alumnofk` (`id_alumno`);

--
-- Indices de la tabla `tb_en_alu`
--
ALTER TABLE `tb_en_alu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_encuesta2` (`id_encuesta2`),
  ADD KEY `id_alumno` (`id_alumno`);

--
-- Indices de la tabla `tb_en_alu22`
--
ALTER TABLE `tb_en_alu22`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_en_empresa`
--
ALTER TABLE `tb_en_empresa`
  ADD PRIMARY KEY (`id_en_em`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- Indices de la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id usuario`),
  ADD KEY `id_datosfk` (`id datos`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_alumno`
--
ALTER TABLE `tb_alumno`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT de la tabla `tb_aplicacion`
--
ALTER TABLE `tb_aplicacion`
  MODIFY `id_aplicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_carrera`
--
ALTER TABLE `tb_carrera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tb_datos`
--
ALTER TABLE `tb_datos`
  MODIFY `id_datos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_empresa`
--
ALTER TABLE `tb_empresa`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_en_alu`
--
ALTER TABLE `tb_en_alu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_en_alu22`
--
ALTER TABLE `tb_en_alu22`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_en_empresa`
--
ALTER TABLE `tb_en_empresa`
  MODIFY `id_en_em` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT de la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_aplicacion`
--
ALTER TABLE `tb_aplicacion`
  ADD CONSTRAINT `id_usuariofk` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de datos: `hjj`
--
CREATE DATABASE IF NOT EXISTS `hjj` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hjj`;

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
-- Estructura de tabla para la tabla `preciohabitacion`
--

CREATE TABLE `preciohabitacion` (
  `id` int(11) NOT NULL,
  `tipo_id` int(10) NOT NULL,
  `habitacion_id` int(10) NOT NULL,
  `tem_alta` double NOT NULL,
  `tem_baja` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `no_folio` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipohabitaciones`
--

CREATE TABLE `tipohabitaciones` (
  `id` int(10) NOT NULL,
  `tipo_habitacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `password` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `apellido_pat`, `apellido_mat`, `telefono`, `email`, `direccion`, `turno`, `password`) VALUES
(2, 'admin', 'ad', 'min', '3150101253', 'admin@gmail.com', 'jaluco jalico', 'Matutino', '1234');

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `preciohabitacion`
--
ALTER TABLE `preciohabitacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recepcion`
--
ALTER TABLE `recepcion`
  MODIFY `id_cortecaja` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `idReservaciones` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipohabitaciones`
--
ALTER TABLE `tipohabitaciones`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `habitaciones_ibfk_1` FOREIGN KEY (`id`) REFERENCES `preciohabitacion` (`habitacion_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `ingresos_ibfk_1` FOREIGN KEY (`id`) REFERENCES `recepcion` (`id_ingresos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ingresos_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `preciohabitacion`
--
ALTER TABLE `preciohabitacion`
  ADD CONSTRAINT `preciohabitacion_ibfk_1` FOREIGN KEY (`tipo_id`) REFERENCES `tipohabitaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD CONSTRAINT `reservaciones_ibfk_1` FOREIGN KEY (`habitacion_id`) REFERENCES `habitaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservaciones_ibfk_2` FOREIGN KEY (`idReservaciones`) REFERENCES `ingresos` (`reservacion_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tipohabitaciones`
--
ALTER TABLE `tipohabitaciones`
  ADD CONSTRAINT `tipohabitaciones_ibfk_1` FOREIGN KEY (`id`) REFERENCES `habitaciones` (`tipo_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `hotel`
--
CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hotel`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cortecaja`
--

CREATE TABLE `cortecaja` (
  `id` int(7) NOT NULL,
  `folio` int(6) NOT NULL,
  `total_caja` int(10) NOT NULL,
  `gasto_total` int(10) NOT NULL,
  `saldo_restante` int(10) NOT NULL,
  `saldo_contado` int(10) NOT NULL,
  `nombre_empleado` varchar(45) NOT NULL,
  `id_gasto` int(10) DEFAULT NULL,
  `fecha_corte` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cortecaja`
--

INSERT INTO `cortecaja` (`id`, `folio`, `total_caja`, `gasto_total`, `saldo_restante`, `saldo_contado`, `nombre_empleado`, `id_gasto`, `fecha_corte`) VALUES
(4, 0, 1400, 2700, -1300, 1500, '', NULL, '2023-06-17'),
(5, 1, 1400, 2700, -1300, 1200, '', NULL, '2023-06-17'),
(6, 1, 1400, 2700, -1300, 1200, '', NULL, '2023-06-17'),
(7, 1, 1400, 2700, -1300, 1200, '', NULL, '2023-06-17'),
(8, 2, 1400, 2700, -1300, 1200, '', NULL, '2023-06-17'),
(9, 2, 1400, 2700, -1300, 1200, '', NULL, '2023-06-17'),
(10, 3, 1400, 2700, -1300, 1200, '', NULL, '2023-06-17'),
(11, 4, 1400, 2700, -1300, 1200, '', NULL, '2023-06-17'),
(12, 5, 1400, 0, 1400, 4500, '', NULL, '2023-06-17'),
(13, 6, 0, 0, 0, 450, '', NULL, '2023-06-17'),
(14, 7, 800, 12000, -11200, 100, '', NULL, '2023-06-17'),
(15, 8, 700, 100, 600, 600, '', NULL, '2023-06-29'),
(16, 9, 0, 0, 0, 0, '', NULL, '2023-09-21'),
(17, 10, 1400, 400, 1000, 995, '', NULL, '2023-10-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gasto`
--

CREATE TABLE `gasto` (
  `id` int(6) NOT NULL,
  `concepto` varchar(70) NOT NULL,
  `importe` int(7) NOT NULL,
  `fecha_gasto` date NOT NULL,
  `gasto_aplicado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gasto`
--

INSERT INTO `gasto` (`id`, `concepto`, `importe`, `fecha_gasto`, `gasto_aplicado`) VALUES
(1, 'hola', 100, '2023-04-29', 1),
(2, 'productos de limpieza  4546542123___ qaew', 1500, '2023-06-01', 1),
(3, 'reparacion aire AC', 500, '2023-06-15', 1),
(4, 'piro vampiro', 500, '2023-06-17', 1),
(5, 'lubriguapos', 100, '2023-06-17', 1),
(6, 'tenis lacoste', 12000, '2023-06-17', 1),
(7, 'lavanderia', 100, '2023-06-29', 1),
(8, 'limpieza hab', 400, '2023-10-20', 1);

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
  `folio_c` int(6) NOT NULL,
  `pago_aplicado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `reservacion_id`, `monto`, `fecha_registro`, `folio_c`, `pago_aplicado`) VALUES
(1, 69, 100, '2023-04-23', 0, 1),
(2, 69, 100, '2023-04-23', 0, 1),
(3, 68, -100, '2023-04-23', 0, 1),
(4, 68, 500, '2023-04-23', 0, 1),
(5, 69, 100, '2023-04-26', 0, 1),
(6, 69, 50, '2023-04-26', 0, 1),
(7, 64, 1000, '2023-04-26', 0, 1),
(8, 63, 900, '2023-04-26', 0, 1),
(9, 62, 900, '2023-04-26', 0, 1),
(10, 59, 801, '2023-04-26', 0, 1),
(11, 59, 799, '2023-04-26', 0, 1),
(12, 69, 250, '2023-04-26', 0, 1),
(13, 52, 350, '2023-04-26', 0, 1),
(14, 50, 8222, '2023-05-03', 0, 1),
(15, 47, 800, '2023-05-03', 0, 1),
(16, 70, 800, '2023-05-03', 0, 1),
(17, 71, 700, '2023-05-03', 0, 1),
(18, 67, 701, '2023-05-03', 0, 1),
(19, 48, 500, '2023-05-03', 0, 1),
(20, 51, 599, '2023-05-03', 0, 1),
(21, 51, 1, '2023-05-03', 0, 1),
(22, 56, 400, '2023-05-31', 0, 1),
(23, 78, 700, '2023-05-31', 0, 1),
(24, 79, 800, '2023-06-16', 0, 1),
(25, 80, 700, '2023-06-28', 0, 1),
(26, 101, 1400, '2023-10-19', 0, 1);

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
(69, 'Omar', '2023-04-23', 2147483647, 'rudolfg@hotmail.com', 'la huerta', '2023-04-22', '2023-04-23', 1, 1, 0, '2023-04-22', 'Transferencia', 32, 1, 600, 'baja'),
(70, 'Agustin', '2023-05-04', 2147483647, 'profe@hotmail.com', 'La Huerta', '2023-05-04', '2023-05-05', 1, 2, 0, '2023-05-03', 'Credito', 33, 1, 700, 'alta'),
(71, 'Agustin', '2023-05-04', 2313255, 'asdfasdf@hola.com', 'La Huerta', '2023-05-04', '2023-05-05', 1, 1, 0, '2023-05-03', 'Efectivo', 34, 1, 600, 'baja'),
(72, 'pedro', '2023-05-04', 301225221, 'asdfasdf@hola.com', 'La Huerta', '2023-05-04', '2023-05-06', 1, 1, 0, '2023-05-03', 'Tarjeta', 35, 2, 1400, 'alta'),
(73, 'lalo', '2023-05-06', 2153455, 'asdfasdf@hola.com', 'LC', '2023-05-06', '2023-05-08', 1, 1, 0, '2023-05-03', 'Cortesia', 36, 2, 1200, 'baja'),
(74, 'lalo', '2023-05-06', 12545566, 'asdfasdf@hola.com', 'LC', '2023-05-06', '2023-05-08', 1, 1, 0, '2023-05-03', 'Cortesia', 37, 2, 1200, 'baja'),
(75, 'haola', '2023-05-06', 42252524, 'asdfasdf@hola.com', 'asba', '2023-05-06', '2023-05-08', 2, 2, 0, '2023-05-03', 'Transferencia', 38, 2, 1400, 'alta'),
(76, 'lao', '2023-05-03', 545185, 'asdfasdf@hola.com', 'LC', '2023-05-03', '2023-05-04', 9, 1, 0, '2023-05-03', 'Credito', 39, 1, 650, 'alta'),
(77, 'teddy', '2023-05-04', 545145, 'asdfasdf@hola.com', 'La Huerta', '2023-05-03', '2023-05-04', 3, 1, 0, '2023-05-03', 'Credito', 40, 1, 700, 'alta'),
(78, 'elcochino', '2023-05-31', 301225221, 'asdfasdf@hola.com', 'los barras', '2023-05-31', '2023-06-01', 1, 2, 0, '2023-05-31', 'Efectivo', 41, 1, 700, 'alta'),
(79, 'wolf', '2023-06-17', 2313255, 'asdfasdf@hola.com', 'barra', '2023-06-17', '2023-06-18', 11, 2, 0, '2023-06-16', 'Efectivo', 42, 1, 800, 'alta'),
(80, 'lalo', '2023-06-28', 23121288, 'asdfasdf@hola.com', 'LC', '2023-06-28', '2023-06-29', 1, 2, 0, '2023-06-29', 'Efectivo', 43, 1, 700, 'alta'),
(81, 'folfo', '2023-06-28', 2147483647, 'wolwolf@hot.com', 'los barras', '2023-06-28', '2023-06-29', 1, 2, 0, '2023-06-29', 'Cortesia', 44, 1, 700, 'alta'),
(82, 'akakd', '2023-07-01', 12545566, 'asdfasdf@hola.com', 'asba', '2023-07-01', '2023-07-04', 1, 6, 0, '2023-06-28', 'Credito', 45, 3, 2300, 'alta'),
(83, 'akakd', '2023-07-04', 12545566, 'asdfasdf@hola.com', 'asba', '2023-07-04', '2023-07-05', 1, 6, 0, '2023-06-29', 'Credito', 46, 1, 900, 'alta'),
(84, 'akakd', '2023-06-29', 12545566, 'asdfasdf@hola.com', 'asba', '2023-06-29', '2023-07-04', 1, 6, 0, '2023-06-29', 'Transferencia', 47, 5, 3700, 'alta'),
(85, 'akakd', '2023-06-29', 12545566, 'asdfasdf@hola.com', 'asba', '2023-06-29', '2023-07-02', 2, 6, 0, '2023-06-29', 'Credito', 48, 3, 2100, 'alta'),
(86, 'wolfino', '2023-08-10', 12545566, 'asdfasdf@hola.com', 'jalucon', '2023-08-09', '2023-08-10', 1, 6, 0, '2023-08-10', 'Efectivo', 49, 1, 900, 'alta'),
(87, 'rudolf', '2023-08-11', 12545566, 'asdfasdf@hola.com', 'los jalucos', '2023-08-11', '2023-08-13', 1, 5, 0, '2023-08-10', 'Efectivo', 50, 2, 1400, 'alta'),
(88, 'el pit', '2023-10-08', 31545, 'asdfasdf@hola.com', 'asba', '2023-10-08', '2023-10-09', 1, 2, 0, '2023-10-08', 'Efectivo', 51, 1, 700, 'alta'),
(89, 'el wolf', '2023-10-09', 23121288, 'asdfasdf@hola.com', 'los jalucos', '2023-10-09', '2023-10-10', 2, 2, 0, '2023-10-08', 'Tarjeta', 52, 1, 700, 'alta'),
(90, 'folfo', '2023-10-09', 12545566, 'asdfasdf@hola.com', 'asba', '2023-10-09', '2023-10-11', 2, 2, 0, '2023-10-08', 'Tarjeta', 53, 2, 1400, 'alta'),
(91, 'primo lalo', '2023-10-09', 12545566, 'asdfasdf@hola.com', 'LC', '2023-10-09', '2023-10-10', 3, 1, 0, '2023-10-08', 'Credito', 54, 1, 600, 'baja'),
(92, 'akakd', '2023-10-08', 12545566, 'asdfasdf@hola.com', 'asba', '2023-10-08', '2023-10-11', 3, 1, 0, '2023-10-08', 'Tarjeta', 55, 3, 2100, 'alta'),
(93, 'akakd', '2023-10-09', 12545566, 'asdfasdf@hola.com', 'asba', '2023-10-09', '2023-10-10', 4, 2, 0, '2023-10-08', 'Credito', 56, 1, 600, 'baja'),
(94, 'Agustin', '2023-10-11', 12545566, 'asdfasdf@hola.com', 'a', '2023-10-11', '2023-10-12', 4, 2, 0, '2023-10-08', 'Transferencia', 57, 1, 700, 'alta'),
(95, 'rodowolf', '2023-10-10', 12545566, 'asdfasdf@hola.com', 'a', '2023-10-10', '2023-10-11', 4, 2, 0, '2023-10-10', 'Tarjeta', 58, 1, 700, 'alta'),
(96, 'isac', '2023-10-10', 12545566, 'asdfasdf@hola.com', 'a', '2023-10-10', '2023-10-14', 5, 1, 0, '2023-10-09', 'Efectivo', 59, 4, 2800, 'alta'),
(97, 'rodo', '2023-10-19', 23121288, 'asdfasdf@hola.com', 'jaluco', '2023-10-19', '2023-10-20', 1, 2, 0, '2023-10-19', 'Cortesia', 60, 1, 700, 'alta'),
(99, 'bola', '2023-10-30', 12545566, 'asdfasdf@hola.com', 'a', '2023-10-30', '2023-10-31', 1, 1, 0, '2023-10-19', 'Credito', 62, 1, 700, 'alta'),
(100, 'bola', '2023-10-19', 12545566, 'asdfasdf@hola.com', 'a', '2023-10-19', '2023-10-20', 3, 1, 0, '2023-10-19', 'Efectivo', 63, 1, 700, 'alta'),
(101, 'rodowolf', '2023-10-27', 12545566, 'asdfasdf@hola.com', 'a', '2023-10-27', '2023-10-31', 3, 2, 0, '2023-10-19', 'Efectivo', 64, 4, 2800, 'alta'),
(102, 'wolf', '2023-10-30', 1451555, 'asdfasdf@hola.com', 'jaluco', '2023-10-30', '2023-10-31', 2, 2, 0, '2023-10-29', 'Credito', 65, 1, 700, 'alta'),
(103, 'perer', '2023-10-29', 12545566, 'asdfasdf@hola.com', 'barra', '2023-10-29', '2023-10-30', 2, 2, 0, '2023-10-29', 'Transferencia', 66, 1, 700, 'alta'),
(104, 'Lalo', '2023-11-01', 12545566, 'asdfasdf@hola.com', 'LC', '2023-11-01', '2023-11-02', 1, 1, 0, '2023-10-29', 'Credito', 67, 1, 700, 'alta'),
(105, 'Genis', '2023-11-04', 12545566, 'asdfasdf@hola.com', 'Los AUtlanes', '2023-11-04', '2023-12-09', 1, 2, 0, '2023-10-29', 'Credito', 68, 35, 24500, 'alta');

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
(10, 'JoseLuis', 'Gonzalez', 'Ortiz', '3151135700', 'rudolfg@hotmail.com', 'la huertona', 'nocturno', '1234', 'administrador');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cortecaja`
--
ALTER TABLE `cortecaja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_gasto` (`id_gasto`);

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
-- AUTO_INCREMENT de la tabla `cortecaja`
--
ALTER TABLE `cortecaja`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `gasto`
--
ALTER TABLE `gasto`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
  MODIFY `idReservaciones` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

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
-- Filtros para la tabla `cortecaja`
--
ALTER TABLE `cortecaja`
  ADD CONSTRAINT `cortecaja_ibfk_1` FOREIGN KEY (`id_gasto`) REFERENCES `gastos` (`id`);

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
--
-- Base de datos: `hotel jj`
--
CREATE DATABASE IF NOT EXISTS `hotel jj` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hotel jj`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `airport_list`
--
-- Error leyendo la estructura de la tabla hotel jj.airport_list: #1932 - Table &#039;hotel jj.airport_list&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla hotel jj.airport_list: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `hotel jj`.`airport_list`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `booked_flight`
--
-- Error leyendo la estructura de la tabla hotel jj.booked_flight: #1932 - Table &#039;hotel jj.booked_flight&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla hotel jj.booked_flight: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `hotel jj`.`booked_flight`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--
-- Error leyendo la estructura de la tabla hotel jj.habitaciones: #1932 - Table &#039;hotel jj.habitaciones&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla hotel jj.habitaciones: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `hotel jj`.`habitaciones`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio_habitacion`
--
-- Error leyendo la estructura de la tabla hotel jj.precio_habitacion: #1932 - Table &#039;hotel jj.precio_habitacion&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla hotel jj.precio_habitacion: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `hotel jj`.`precio_habitacion`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones`
--
-- Error leyendo la estructura de la tabla hotel jj.reservaciones: #1932 - Table &#039;hotel jj.reservaciones&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla hotel jj.reservaciones: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `hotel jj`.`reservaciones`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_settings`
--
-- Error leyendo la estructura de la tabla hotel jj.system_settings: #1932 - Table &#039;hotel jj.system_settings&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla hotel jj.system_settings: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `hotel jj`.`system_settings`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_habitaciones`
--
-- Error leyendo la estructura de la tabla hotel jj.tipo_habitaciones: #1932 - Table &#039;hotel jj.tipo_habitaciones&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla hotel jj.tipo_habitaciones: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `hotel jj`.`tipo_habitaciones`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--
-- Error leyendo la estructura de la tabla hotel jj.usuarios: #1932 - Table &#039;hotel jj.usuarios&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla hotel jj.usuarios: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `hotel jj`.`usuarios`&#039; en la linea 1
--
-- Base de datos: `hoteljj`
--
CREATE DATABASE IF NOT EXISTS `hoteljj` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hoteljj`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `airlines_list`
--

CREATE TABLE `airlines_list` (
  `id` int(30) NOT NULL,
  `airlines` text NOT NULL,
  `logo_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `airlines_list`
--

INSERT INTO `airlines_list` (`id`, `airlines`, `logo_path`) VALUES
(1, 'AirAsia', '1600999080_kisspng-flight-indonesia-airasia-airasia-japan-airline-tic-asia-5abad146966736.8321896415221927106161.jpg'),
(2, 'Philippine Airlines', '1600999200_Philippine-Airlines-Logo.jpg'),
(3, 'Cebu Pacific', '1600999200_43cada0008538e3c1a1f4675e5a7aabe.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `airport_list`
--

CREATE TABLE `airport_list` (
  `id` int(30) NOT NULL,
  `airport` text NOT NULL,
  `location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `airport_list`
--

INSERT INTO `airport_list` (`id`, `airport`, `location`) VALUES
(1, 'NAIA', 'Metro Manila'),
(2, 'Beijing Capital International Airport', 'Chaoyang-Shunyi, Beijing'),
(3, 'Los Angeles International Airport', 'Los Angeles, California'),
(4, 'Dubai International Airport', 'Garhoud, Dubai'),
(5, 'Mactan-Cebu Airport', 'Cebu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `booked_flight`
--

CREATE TABLE `booked_flight` (
  `id` int(30) NOT NULL,
  `flight_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `booked_flight`
--

INSERT INTO `booked_flight` (`id`, `flight_id`, `name`, `address`, `contact`) VALUES
(2, 3, 'James Smith', 'Sample Address', '+4545 6456'),
(3, 4, 'John Smith', 'Sample Address', '+18456-5455-55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flight_list`
--

CREATE TABLE `flight_list` (
  `id` int(30) NOT NULL,
  `airline_id` int(30) NOT NULL,
  `plane_no` text NOT NULL,
  `departure_airport_id` int(30) NOT NULL,
  `arrival_airport_id` int(30) NOT NULL,
  `departure_datetime` datetime NOT NULL,
  `arrival_datetime` datetime NOT NULL,
  `seats` int(10) NOT NULL DEFAULT 0,
  `price` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `flight_list`
--

INSERT INTO `flight_list` (`id`, `airline_id`, `plane_no`, `departure_airport_id`, `arrival_airport_id`, `departure_datetime`, `arrival_datetime`, `seats`, `price`, `date_created`) VALUES
(1, 1, 'GB623-14', 1, 3, '2020-10-07 04:00:00', '2020-10-21 10:00:00', 150, 7500, '2020-09-25 11:23:52'),
(2, 2, 'TIPS14-15', 1, 2, '2020-10-14 11:00:00', '2020-10-16 09:00:00', 100, 5000, '2020-09-25 11:46:12'),
(3, 3, 'CEB-1101', 5, 1, '2020-09-30 08:00:00', '2020-09-30 08:45:00', 100, 2500, '2020-09-25 11:57:31'),
(4, 3, 'CEB10023', 1, 5, '2020-10-07 01:00:00', '2020-10-07 01:45:00', 100, 2500, '2020-09-25 14:50:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Reservaciones ', 'info@sample.comm', '+6948 8542 623', '1600998360_travel-cover.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;b style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Lorem Ipsum&lt;/b&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&rsquo;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/span&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `doctor_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = doctor,3=patient'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `doctor_id`, `name`, `address`, `contact`, `username`, `password`, `type`) VALUES
(1, 0, 'Administrator', '', '', 'admin', 'admin123', 1),
(7, 0, 'George Wilson', 'Sample Only', '+18456-5455-55', 'gwilson@sample.com', 'd40242fb23c45206fadee4e2418f274f', 3),
(9, 2, 'DR.James Smith, M.D.', 'Sample Clinic Address', '+1456 554 55623', 'jsmith@sample.com', 'jsmith123', 2),
(10, 3, 'DR.Claire Blake, M.D.', 'Sample Only', '+5465 555 623', 'cblake@sample.com', 'blake123', 2),
(11, 0, 'Sample Only', 'Sample', '+5465 546 4556', 'sample@sample.com', '4e91b1cbe42b5c884de47d4c7fda0555', 3),
(15, 9, 'DR.Sample Doctor, M.D.', 'Sample Address', '+1235 456 623', 'sample2@sample.com', 'sample123', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `airlines_list`
--
ALTER TABLE `airlines_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `airport_list`
--
ALTER TABLE `airport_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `booked_flight`
--
ALTER TABLE `booked_flight`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `flight_list`
--
ALTER TABLE `flight_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `airlines_list`
--
ALTER TABLE `airlines_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `airport_list`
--
ALTER TABLE `airport_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `booked_flight`
--
ALTER TABLE `booked_flight`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `flight_list`
--
ALTER TABLE `flight_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__bookmark: #1932 - Table &#039;phpmyadmin.pma__bookmark&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__bookmark: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__bookmark`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__central_columns: #1932 - Table &#039;phpmyadmin.pma__central_columns&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__central_columns: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__central_columns`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__column_info: #1932 - Table &#039;phpmyadmin.pma__column_info&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__column_info: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__column_info`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__designer_settings: #1932 - Table &#039;phpmyadmin.pma__designer_settings&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__designer_settings: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__designer_settings`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__export_templates: #1932 - Table &#039;phpmyadmin.pma__export_templates&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__export_templates: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__export_templates`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__favorite: #1932 - Table &#039;phpmyadmin.pma__favorite&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__favorite: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__favorite`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__history: #1932 - Table &#039;phpmyadmin.pma__history&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__history: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__history`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__navigationhiding: #1932 - Table &#039;phpmyadmin.pma__navigationhiding&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__navigationhiding: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__navigationhiding`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__pdf_pages: #1932 - Table &#039;phpmyadmin.pma__pdf_pages&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__pdf_pages: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__pdf_pages`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__recent: #1932 - Table &#039;phpmyadmin.pma__recent&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__recent: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__recent`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__relation: #1932 - Table &#039;phpmyadmin.pma__relation&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__relation: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__relation`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__savedsearches: #1932 - Table &#039;phpmyadmin.pma__savedsearches&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__savedsearches: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__savedsearches`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__table_coords: #1932 - Table &#039;phpmyadmin.pma__table_coords&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__table_coords: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__table_coords`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__table_info: #1932 - Table &#039;phpmyadmin.pma__table_info&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__table_info: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__table_info`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__table_uiprefs: #1932 - Table &#039;phpmyadmin.pma__table_uiprefs&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__table_uiprefs: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__table_uiprefs`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__tracking: #1932 - Table &#039;phpmyadmin.pma__tracking&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__tracking: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__tracking`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__userconfig: #1932 - Table &#039;phpmyadmin.pma__userconfig&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__userconfig: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__userconfig`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__usergroups: #1932 - Table &#039;phpmyadmin.pma__usergroups&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__usergroups: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__usergroups`&#039; en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--
-- Error leyendo la estructura de la tabla phpmyadmin.pma__users: #1932 - Table &#039;phpmyadmin.pma__users&#039; doesn&#039;t exist in engine
-- Error leyendo datos de la tabla phpmyadmin.pma__users: #1064 - Algo está equivocado en su sintax cerca &#039;FROM `phpmyadmin`.`pma__users`&#039; en la linea 1
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
