-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 28-08-2024 a las 21:34:31
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `papu`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_incidencia`
--

DROP TABLE IF EXISTS `categoria_incidencia`;
CREATE TABLE IF NOT EXISTS `categoria_incidencia` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria_incidencia`
--

INSERT INTO `categoria_incidencia` (`categoria_id`, `nombre_categoria`) VALUES
(1, 'Hardware'),
(2, 'Software1'),
(3, 'Redes'),
(4, 'Seguridad'),
(5, 'Mantenimiento'),
(8, 'DISCO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

DROP TABLE IF EXISTS `comentario`;
CREATE TABLE IF NOT EXISTS `comentario` (
  `comentario_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_incidencia` int(11) DEFAULT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `comentario` text NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comentario_id`),
  KEY `id_incidencia` (`id_incidencia`),
  KEY `id_tecnico` (`id_tecnico`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`comentario_id`, `id_incidencia`, `id_tecnico`, `id_usuario`, `comentario`, `fecha`) VALUES
(1, 3, 2, 3, 'Se ha resuelto el problema con la red. Verifique su conexión.', '2024-08-28 17:55:00'),
(3, 1, 2, 3, 'dasdsf', '2024-08-28 15:22:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(200) NOT NULL,
  `nombre_fantasia` varchar(200) DEFAULT NULL,
  `ruc` varchar(13) NOT NULL,
  `direccion` varchar(1000) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `razon_social`, `nombre_fantasia`, `ruc`, `direccion`, `telefono`, `correo`) VALUES
(1, 'DevsWeb S.A.', 'DevsWeb', '1234567890123', 'Av. Principal 123, Quito', '0998765432', 'contacto@devsweb.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

DROP TABLE IF EXISTS `equipo`;
CREATE TABLE IF NOT EXISTS `equipo` (
  `equipo_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_equipo` varchar(50) NOT NULL,
  `descripcion` text,
  `modelo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`equipo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`equipo_id`, `nombre_equipo`, `descripcion`, `modelo`) VALUES
(1, 'Laptop XPS 13', 'Portatil ultrafin', 'XPS 13 9310'),
(2, 'iPhone 13', 'Teléfono inteligente de última generación', 'A2621'),
(3, 'Galaxy S21', 'Teléfono inteligente Android', 'SM-G991B'),
(4, 'MacBook Pro 16', 'Portátil de alto rendimiento', 'MVVJ2LL/A'),
(5, 'Lenovo', 'Ultra delgada', '2a4154sa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_estado_incidencia`
--

DROP TABLE IF EXISTS `historial_estado_incidencia`;
CREATE TABLE IF NOT EXISTS `historial_estado_incidencia` (
  `historial_id` int(11) NOT NULL AUTO_INCREMENT,
  `incidencia_id` int(11) NOT NULL,
  `estado_anterior` varchar(20) NOT NULL,
  `estado_nuevo` varchar(20) NOT NULL,
  `fecha_cambio` datetime DEFAULT CURRENT_TIMESTAMP,
  `cambiado_por` int(11) NOT NULL,
  PRIMARY KEY (`historial_id`),
  KEY `incidencia_id` (`incidencia_id`),
  KEY `cambiado_por` (`cambiado_por`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencia`
--

DROP TABLE IF EXISTS `incidencia`;
CREATE TABLE IF NOT EXISTS `incidencia` (
  `incidencia_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `prioridad` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `categoria_id` int(11) DEFAULT NULL,
  `equipo_id` int(11) DEFAULT NULL,
  `marca_id` int(11) DEFAULT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `id_administrador` int(11) DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`incidencia_id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `categoria_id` (`categoria_id`),
  KEY `equipo_id` (`equipo_id`),
  KEY `marca_id` (`marca_id`),
  KEY `id_tecnico` (`id_tecnico`),
  KEY `id_administrador` (`id_administrador`),
  KEY `fk_incidencia_empresa` (`empresa_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `incidencia`
--

INSERT INTO `incidencia` (`incidencia_id`, `id_usuario`, `descripcion`, `prioridad`, `estado`, `fecha`, `categoria_id`, `equipo_id`, `marca_id`, `id_tecnico`, `id_administrador`, `empresa_id`) VALUES
(1, 3, 'hola lore', 'Alta', 'Abierta', '2024-08-28 06:13:00', 1, 1, 1, 2, 1, 1),
(2, 3, 'DAÑADO ', 'Alta', 'Abierta', '2024-08-28 07:36:00', 1, 1, 1, 2, 1, 1),
(3, 14, 'ffdfsfddf', 'Alta', 'Abierta', '2024-08-28 07:36:00', 1, 1, 1, 15, 4, 1),
(4, 14, 'ffdfsfddf', 'Alta', 'Abierta', '2024-08-28 07:36:00', 1, 1, 1, 15, 2, 1),
(5, 3, 'hola es 5', 'Alta', 'Abierta', '2024-08-28 09:09:00', 1, 1, 1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `marca_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(50) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`marca_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`marca_id`, `nombre_marca`, `descripcion`) VALUES
(1, 'Samsung', 'Electrónica y tecnología innovadora'),
(2, 'Apple', 'Tecnología de consumo y software'),
(3, 'Dell', 'Computadoras y accesorios'),
(4, 'HP', 'Computadoras y soluciones de impresión'),
(5, 'Lenovo', 'Computadoras y dispositivos electrónicos'),
(6, 'Hp s', 'sellada y nueva'),
(7, 'Silla Gamer', 'RGB con luz x');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE IF NOT EXISTS `perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_perfil` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id`, `nombre_perfil`) VALUES
(1, 'Administrador'),
(2, 'Técnico'),
(3, 'Usuario'),
(8, 'Administracion'),
(7, 'Administracion'),
(9, 'Marketing'),
(10, 'Limpieza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `perfil_id` int(11) DEFAULT NULL,
  `bloqueado` tinyint(1) DEFAULT '0',
  `empresa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`),
  KEY `perfil_id` (`perfil_id`),
  KEY `fk_usuario_empresa` (`empresa_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombres`, `apellidos`, `correo`, `contraseña`, `telefono`, `direccion`, `estado`, `perfil_id`, `bloqueado`, `empresa_id`) VALUES
(1, 'Alexander', 'Lorenso', 'hola', '123', '0959786832', 'Pisulli Barrio de hombres', 'activo', 1, 0, 1),
(2, 'SENIOR XD ', 'Gómez', 'chao', '12345', '9876532165', 'Avenida 456', 'Activo', 2, 0, 1),
(3, 'Luis', 'Martínez', 'luis', '1', '123456789189', 'Boulevard 789', 'Activo', 3, 0, 1),
(4, 'el macho', 'alvarez', 'jefersonalvarez009@gmail.com', '1', '0959186832', 'jefersonalvarez009@gmail.com', 'activo', 1, 0, 1),
(12, 'Alexander', 'Lorenzo', 'alexander@mail.com', '123', '0956786832', 'Pisulli Barrio de hombres', 'activo', 1, 0, 1),
(13, 'Ana', 'Gómez', 'ana@mail.com', '12345', '9876532165', 'Avenida 456', 'activo', 2, 0, 1),
(14, 'Luis', 'Sanchez', 'luis@mail.com', 'contrasena3', '1234567890', 'Boulevard 789', 'activo', 3, 0, 1),
(16, 'Señor Senior', 'Alvan Albvanior', 'alv@gmail.com', '1111', '0959186822', 'Pisulli quito ', 'A', 3, 0, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
