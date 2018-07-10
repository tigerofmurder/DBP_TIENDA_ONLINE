-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2018 a las 22:09:26
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_online`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_producto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `img_producto`, `categoria`, `precio`, `stock`, `descripcion`, `color`) VALUES
(1, 'CAMISA VESTIR LISA', 'productos\\manga_larga\\camisa_vestir_lisa.jpg', 'manga_larga', '10', '10', 'Camisa lisa manga larga. Corte Regular. Cuello italiano con vivo interno a tono. Con cartera.', 'blanco'),
(2, 'CAMISA LISA SLIM FIT', 'productos\\slim_fit\\camisa_lisa_slim_fit.jpg', 'slim_fit', '15', '23', 'Camisa lisa satinada manga larga con tejido 100% de algodón. Corte Slim Fit. Cuello soft. Sin cartera.', 'negro'),
(3, 'CAMISA RATIER', 'productos\\regular\\camisa_ratier.jpg', 'regular', '23', '10', 'Camisa ratier manga larga. Corte Regular. Cuello punta botón con vivo interno a contratono. Con Cartera.', 'celeste claro'),
(4, 'CAMISA LISA', 'productos\\manga_corta\\camisa_lisa.jpg', 'manga_corta', '25', '12', 'Camisa lisa manga corta con tejido de 100% algodón. Corte Regular. Cuello soft con botón escondido. Con vivo interno en cuello y manga a contra-tono. Con Cartera.', 'azul marino'),
(5, 'CAMISA SLIM FIT THREAD', 'productos\\manga_corta\\camisa_fil_a_slim_fit.jpg', 'manga_corta', '30', '15', 'Camisa lisa de fil a fil con tejido de 100% algodón y manga corta. Corte Slim Fit. Cuello punta botón. Con vivo interno en cuello y manga a contratono. Con Cartera.', 'rosa'),
(6, 'CAMISA VESTIR CUADROS SLIM FIT', 'productos\\slim_fit\\camisa_cuadros.jpg', 'slim_fit', '30', '30', 'Camisa cuadros manga larga. Corte Slim Fit. Cuello noche con vivo interno en combinación. Con Cartera.', 'gris medio'),
(17, 'CAMISA VESTIR SLIIM FIT', 'productos/manga_larga/camisa_vestir_slim_fit.jpg', 'manga_larga', '32.00', '14', 'Camisa lisa ceremonial manga larga. Corte Slim Fit. Cuello noche vivo interno a contratono. Cartera oculta.', 'blanco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`nombre`, `apellidos`, `email`, `password`) VALUES
('admin', 'root', 'admin@root.com', '12345678'),
('Jonathan', 'Cueva', 'tigerofmurder@gmail.com', 'masacre'),
('miguel', 'coope', 'n@gamil.com', '1234'),
('LPerez', 'cueva', 'daniel963226875@gmail.com', 'nnnn'),
('JGomez', 'cueva', 'JGomez@com.com', '2222'),
('asd', 'ads', 'JGomez@gmail.com', '2222'),
('LPerez', 'cueva', 'JGo@c.com', '2222'),
('LPerez', 'cueva', 'JGo@ce.com', 'weewe'),
('JGomez', 'allen', 'tigerofmurder@gdasmail.com', 'nose'),
('LPerez', 'cueva', 'tigerofmhjjjhjhhjhjurder@gmail.com', 'masacre'),
('LPerez', 'cueva', 'tigerofmurder@gmail.comrde', 'masacre');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
