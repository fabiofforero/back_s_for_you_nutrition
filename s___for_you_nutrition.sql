-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-10-2024 a las 18:27:19
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `s___for_you_nutrition.sql`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cantidad ingrediente`
--

CREATE TABLE `cantidad ingrediente` (
  `Id` int(4) NOT NULL,
  `Id_ingrediente` int(4) NOT NULL,
  `Id_producto` int(4) NOT NULL,
  `Cantidad_usar` double NOT NULL,
  `Unidad_de_medida` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Id` int(4) NOT NULL,
  `Id_persona` int(4) DEFAULT NULL,
  `Id_tipo_compra` int(4) NOT NULL,
  `Puntos_fidelizacion` int(2) NOT NULL,
  `Descuento_inicial` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `Id` int(4) NOT NULL,
  `Id_pedido` int(4) NOT NULL,
  `Fecha_factura` date NOT NULL,
  `Impuesto` double NOT NULL,
  `Valor_total` double NOT NULL,
  `Metodo_pago` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestor_pedidos`
--

CREATE TABLE `gestor_pedidos` (
  `Id` int(4) NOT NULL,
  `Id_persona` int(4) NOT NULL,
  `Fecha_contratacion` date NOT NULL,
  `Salario` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente`
--

CREATE TABLE `ingrediente` (
  `Id` int(4) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Cantidad` int(6) NOT NULL,
  `Fecha_llegada` date NOT NULL,
  `Feca_vencimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente_adicional`
--

CREATE TABLE `ingrediente_adicional` (
  `Id` int(4) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Precio` int(6) NOT NULL,
  `Cantidad` int(6) NOT NULL,
  `Unidad_medida` int(5) NOT NULL,
  `Id_ingrediente` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `Id` int(4) NOT NULL,
  `Id_ingrediente` int(4) NOT NULL,
  `Fecha_ingreso` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `Id` int(4) NOT NULL,
  `Id_seccion_menu` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `Id` int(4) NOT NULL,
  `Id_persona` int(4) NOT NULL,
  `Id_pedido` int(4) NOT NULL,
  `Mensaje` varchar(255) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `Id` int(4) NOT NULL,
  `Id_cliente` int(4) NOT NULL,
  `Fecha` date NOT NULL,
  `Estado` varchar(40) NOT NULL,
  `Id_ingrediente` int(4) NOT NULL,
  `Id_tipo_compra` int(4) NOT NULL,
  `Ubicacion_entrega` varchar(40) NOT NULL,
  `Total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `Id` int(4) NOT NULL,
  `Documento` int(4) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Telefono` bigint(11) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Direccion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`Id`, `Documento`, `Nombres`, `Apellidos`, `Telefono`, `Email`, `Direccion`) VALUES
(1, 1051061312, 'andres santiago', 'ferrucho espitia', 3134085602, 'ferruchoandres@uniboyaca.edu.co', 'call-11-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Id` int(4) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Precio` double NOT NULL,
  `Disponibilidad` tinyint(1) NOT NULL,
  `Id_ingrediente` int(4) NOT NULL,
  `Id_cantidad_ingrediente` int(4) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Tamaño` int(6) NOT NULL,
  `Calorias` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa_fidelizacion`
--

CREATE TABLE `programa_fidelizacion` (
  `Id` int(4) NOT NULL,
  `Id_cliente` int(4) NOT NULL,
  `Puntos_acumulados` int(2) NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repartidor`
--

CREATE TABLE `repartidor` (
  `Id` int(4) NOT NULL,
  `Id_persona` int(4) NOT NULL,
  `Fecha_contratacion` date NOT NULL,
  `Salario` double NOT NULL,
  `Direccion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_menu`
--

CREATE TABLE `seccion_menu` (
  `Id` int(4) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Calorias` int(11) NOT NULL,
  `Id_producto` int(4) NOT NULL,
  `Id_ingrediente_adicional` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_compra`
--

CREATE TABLE `tipo_compra` (
  `Id` int(4) NOT NULL,
  `Descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cantidad ingrediente`
--
ALTER TABLE `cantidad ingrediente`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_ingrediente` (`Id_ingrediente`),
  ADD KEY `Id_producto` (`Id_producto`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_pedido` (`Id_pedido`);

--
-- Indices de la tabla `gestor_pedidos`
--
ALTER TABLE `gestor_pedidos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_persona` (`Id_persona`);

--
-- Indices de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `ingrediente_adicional`
--
ALTER TABLE `ingrediente_adicional`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_ingrediente` (`Id_ingrediente`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_seccion_menu` (`Id_seccion_menu`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_persona` (`Id_persona`),
  ADD KEY `Id_pedido` (`Id_pedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_cliente` (`Id_cliente`),
  ADD KEY `Id_tipo_compra` (`Id_tipo_compra`),
  ADD KEY `Id_ingrediente` (`Id_ingrediente`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_ingrediente` (`Id_ingrediente`),
  ADD KEY `producto_ibfk_1` (`Id_cantidad_ingrediente`);

--
-- Indices de la tabla `programa_fidelizacion`
--
ALTER TABLE `programa_fidelizacion`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_cliente` (`Id_cliente`);

--
-- Indices de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_persona` (`Id_persona`);

--
-- Indices de la tabla `seccion_menu`
--
ALTER TABLE `seccion_menu`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_producto` (`Id_producto`),
  ADD KEY `Id_ingrediente_adicional` (`Id_ingrediente_adicional`);

--
-- Indices de la tabla `tipo_compra`
--
ALTER TABLE `tipo_compra`
  ADD PRIMARY KEY (`Id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cantidad ingrediente`
--
ALTER TABLE `cantidad ingrediente`
  ADD CONSTRAINT `cantidad ingrediente_ibfk_1` FOREIGN KEY (`Id_ingrediente`) REFERENCES `ingrediente` (`Id`),
  ADD CONSTRAINT `cantidad ingrediente_ibfk_2` FOREIGN KEY (`Id_producto`) REFERENCES `producto` (`Id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`Id_pedido`) REFERENCES `pedido` (`Id`);

--
-- Filtros para la tabla `gestor_pedidos`
--
ALTER TABLE `gestor_pedidos`
  ADD CONSTRAINT `gestor_pedidos_ibfk_1` FOREIGN KEY (`Id_persona`) REFERENCES `persona` (`Id`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`Id_ingrediente`) REFERENCES `ingrediente` (`Id`);

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`Id_seccion_menu`) REFERENCES `seccion_menu` (`Id`);

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`Id_persona`) REFERENCES `persona` (`Id`),
  ADD CONSTRAINT `notificacion_ibfk_2` FOREIGN KEY (`Id_pedido`) REFERENCES `pedido` (`Id`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`Id_cliente`) REFERENCES `cliente` (`Id`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`Id_tipo_compra`) REFERENCES `tipo_compra` (`Id`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`Id_ingrediente`) REFERENCES `ingrediente` (`Id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Id_cantidad_ingrediente`) REFERENCES `cantidad ingrediente` (`Id`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`Id_ingrediente`) REFERENCES `ingrediente` (`Id`);

--
-- Filtros para la tabla `programa_fidelizacion`
--
ALTER TABLE `programa_fidelizacion`
  ADD CONSTRAINT `programa_fidelizacion_ibfk_1` FOREIGN KEY (`Id_cliente`) REFERENCES `cliente` (`Id`);

--
-- Filtros para la tabla `repartidor`
--
ALTER TABLE `repartidor`
  ADD CONSTRAINT `repartidor_ibfk_1` FOREIGN KEY (`Id_persona`) REFERENCES `persona` (`Id`);

--
-- Filtros para la tabla `seccion_menu`
--
ALTER TABLE `seccion_menu`
  ADD CONSTRAINT `seccion_menu_ibfk_1` FOREIGN KEY (`Id_producto`) REFERENCES `producto` (`Id`),
  ADD CONSTRAINT `seccion_menu_ibfk_2` FOREIGN KEY (`Id_ingrediente_adicional`) REFERENCES `ingrediente_adicional` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
