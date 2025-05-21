-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-05-2025 a las 03:31:37
-- Versión del servidor: 10.11.10-MariaDB-log
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

USE safegar;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u557447082_safegardedb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ahuyentamiento`
--

CREATE TABLE `ahuyentamiento` (
  `id_ahuyentamiento` int(11) NOT NULL,
  `id_deteccion` int(11) NOT NULL,
  `tipo` enum('Sonido','Luz') NOT NULL,
  `intensidad` decimal(5,2) NOT NULL,
  `fecha_hora` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calidad_aire`
--

CREATE TABLE `calidad_aire` (
  `id_calidad` int(11) NOT NULL,
  `id_sensor` int(11) NOT NULL,
  `nivel` decimal(10,2) NOT NULL,
  `fecha_hora` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `categoria_id` bigint(20) UNSIGNED NOT NULL,
  `categoria_idServ` bigint(20) UNSIGNED NOT NULL,
  `categoria_nombre` mediumtext NOT NULL,
  `categoria_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`categoria_id`, `categoria_idServ`, `categoria_nombre`, `categoria_status`) VALUES
(1, 1, 'Pintura general', 1),
(2, 2, 'Limpieza básica y especializada', 1),
(3, 3, 'Clases particulares', 1),
(4, 4, 'Jardinería residencial', 1),
(5, 5, 'Servicios de plomería', 1),
(6, 6, 'Servicios eléctricos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conversacion`
--

CREATE TABLE `conversacion` (
  `conv_id` bigint(20) UNSIGNED NOT NULL,
  `conv_id_proc` bigint(20) UNSIGNED NOT NULL,
  `conv_idUs_P` bigint(20) UNSIGNED NOT NULL,
  `conv_idUs_S` bigint(20) UNSIGNED NOT NULL,
  `conv_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deteccion_movimiento`
--

CREATE TABLE `deteccion_movimiento` (
  `id_deteccion` int(11) NOT NULL,
  `id_sensor` int(11) NOT NULL,
  `fecha_hora` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidades`
--

CREATE TABLE `habilidades` (
  `Habilidad_id` bigint(20) UNSIGNED NOT NULL,
  `Habilidad_nombre` mediumtext NOT NULL,
  `Habilidad_Cont` longtext NOT NULL,
  `Habilidad_status` int(11) NOT NULL DEFAULT 1,
  `Habilidad_idUS` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habilidades`
--

INSERT INTO `habilidades` (`Habilidad_id`, `Habilidad_nombre`, `Habilidad_Cont`, `Habilidad_status`, `Habilidad_idUS`) VALUES
(1, 'Decoración de interiores', 'Tengo experiencia en decorar espacios interiores para hogares y oficinas.', 1, 6),
(2, 'Electricidad residencial', 'Instalaciones, reparaciones y mantenimiento eléctrico con 10 años de experiencia.', 1, 7),
(3, 'Clases de música', 'Imparto clases de guitarra y piano para niños y adultos.', 1, 8),
(4, 'Jardinería y paisajismo', 'Mantenimiento, poda, diseño de jardines y sistemas de riego.', 1, 9),
(5, 'Asistencia en el hogar', 'Apoyo en limpieza, organización del hogar y tareas básicas.', 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicion`
--

CREATE TABLE `medicion` (
  `id_medicion` int(11) NOT NULL,
  `id_sensor` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `fecha_hora` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sensor`
--

CREATE TABLE `sensor` (
  `id_sensor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` enum('Temperatura','Humedad','HumedadSuelo','Movimiento') NOT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

-- Crear la tabla usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    acepta_politica BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ahuyentamiento`
--
ALTER TABLE `ahuyentamiento`
  ADD PRIMARY KEY (`id_ahuyentamiento`),
  ADD KEY `id_deteccion` (`id_deteccion`);

--
-- Indices de la tabla `calidad_aire`
--
ALTER TABLE `calidad_aire`
  ADD PRIMARY KEY (`id_calidad`),
  ADD KEY `id_sensor` (`id_sensor`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`categoria_id`),
  ADD KEY `categoria_idServ` (`categoria_idServ`);

--
-- Indices de la tabla `conversacion`
--
ALTER TABLE `conversacion`
  ADD PRIMARY KEY (`conv_id`),
  ADD KEY `conv_id_proc` (`conv_id_proc`),
  ADD KEY `conv_idUs_P` (`conv_idUs_P`),
  ADD KEY `conv_idUs_S` (`conv_idUs_S`);

--
-- Indices de la tabla `deteccion_movimiento`
--
ALTER TABLE `deteccion_movimiento`
  ADD PRIMARY KEY (`id_deteccion`),
  ADD KEY `id_sensor` (`id_sensor`);

--
-- Indices de la tabla `habilidades`
--
ALTER TABLE `habilidades`
  ADD PRIMARY KEY (`Habilidad_id`),
  ADD KEY `Habilidad_idUS` (`Habilidad_idUS`);

--
-- Indices de la tabla `medicion`
--
ALTER TABLE `medicion`
  ADD PRIMARY KEY (`id_medicion`),
  ADD KEY `id_sensor` (`id_sensor`);

--
-- Indices de la tabla `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`id_sensor`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ahuyentamiento`
--
ALTER TABLE `ahuyentamiento`
  MODIFY `id_ahuyentamiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calidad_aire`
--
ALTER TABLE `calidad_aire`
  MODIFY `id_calidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `categoria_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `conversacion`
--
ALTER TABLE `conversacion`
  MODIFY `conv_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `deteccion_movimiento`
--
ALTER TABLE `deteccion_movimiento`
  MODIFY `id_deteccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `habilidades`
--
ALTER TABLE `habilidades`
  MODIFY `Habilidad_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `medicion`
--
ALTER TABLE `medicion`
  MODIFY `id_medicion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sensor`
--
ALTER TABLE `sensor`
  MODIFY `id_sensor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ahuyentamiento`
--
ALTER TABLE `ahuyentamiento`
  ADD CONSTRAINT `ahuyentamiento_ibfk_1` FOREIGN KEY (`id_deteccion`) REFERENCES `deteccion_movimiento` (`id_deteccion`) ON DELETE CASCADE;

--
-- Filtros para la tabla `calidad_aire`
--
ALTER TABLE `calidad_aire`
  ADD CONSTRAINT `calidad_aire_ibfk_1` FOREIGN KEY (`id_sensor`) REFERENCES `sensor` (`id_sensor`) ON DELETE CASCADE;

--
-- Filtros para la tabla `deteccion_movimiento`
--
ALTER TABLE `deteccion_movimiento`
  ADD CONSTRAINT `deteccion_movimiento_ibfk_1` FOREIGN KEY (`id_sensor`) REFERENCES `sensor` (`id_sensor`) ON DELETE CASCADE;

--
-- Filtros para la tabla `medicion`
--
ALTER TABLE `medicion`
  ADD CONSTRAINT `medicion_ibfk_1` FOREIGN KEY (`id_sensor`) REFERENCES `sensor` (`id_sensor`) ON DELETE CASCADE;

--
-- Filtros para la tabla `sensor`
--
ALTER TABLE `sensor`
  ADD CONSTRAINT `sensor_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `usuario` (`id_cliente`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
