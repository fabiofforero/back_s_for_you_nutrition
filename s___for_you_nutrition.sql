-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2024 a las 17:42:01
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
-- Base de datos: `s___for_you_nutrition`
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
  `Unidad_de_medida` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `ID` int(4) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Id_departamento` int(4) NOT NULL
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
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `Nombre` varchar(50) NOT NULL,
  `ID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `Id` int(4) NOT NULL,
  `Id_pedido` int(4) NOT NULL,
  `Fecha_factura` date NOT NULL,
  `Id_producto` int(4) NOT NULL,
  `Cantidad` int(50) NOT NULL,
  `valor_unitario` double NOT NULL,
  `Subtotal` double NOT NULL
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
  `Fecha_ingreso` date NOT NULL,
  `Id_ingrediente` int(4) NOT NULL
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
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `Id` int(4) NOT NULL,
  `Descripcion` varchar(50) NOT NULL
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
  `Id_factura` int(4) NOT NULL,
  `Fecha` date NOT NULL,
  `Estado` varchar(40) NOT NULL,
  `Id_ingrediente` int(4) NOT NULL,
  `Id_tipo_compra` int(4) NOT NULL,
  `Ubicacion_entrega` varchar(40) NOT NULL,
  `Total` double NOT NULL,
  `Id_Metodo_pago` int(4) NOT NULL
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
  `Telefono` bigint(10) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Direccion` varchar(150) NOT NULL,
  `Id_ciudad` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `Calorias` double NOT NULL,
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
  ADD UNIQUE KEY `Id` (`Id`),
  ADD KEY `Id_ingrediente` (`Id_ingrediente`),
  ADD KEY `Id_producto` (`Id_producto`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD KEY `Id_departamento` (`Id_departamento`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD KEY `Id_tipo_compra` (`Id_tipo_compra`),
  ADD KEY `Id_persona` (`Id_persona`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD KEY `Id_pedido` (`Id_pedido`),
  ADD KEY `Id_producto` (`Id_producto`);

--
-- Indices de la tabla `gestor_pedidos`
--
ALTER TABLE `gestor_pedidos`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD KEY `Id_persona` (`Id_persona`);

--
-- Indices de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`);

--
-- Indices de la tabla `ingrediente_adicional`
--
ALTER TABLE `ingrediente_adicional`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD KEY `Id_ingrediente` (`Id_ingrediente`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD KEY `Id_ingrediente` (`Id_ingrediente`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD KEY `Id_seccion_menu` (`Id_seccion_menu`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD KEY `Id_persona` (`Id_persona`),
  ADD KEY `Id_pedido` (`Id_pedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD KEY `Id_cliente` (`Id_cliente`),
  ADD KEY `Id_tipo_compra` (`Id_tipo_compra`),
  ADD KEY `Id_ingrediente` (`Id_ingrediente`),
  ADD KEY `Id_factura` (`Id_factura`),
  ADD KEY `Id_Metodo_pago` (`Id_Metodo_pago`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD KEY `Id_ciudad` (`Id_ciudad`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD KEY `Id_ingrediente` (`Id_ingrediente`),
  ADD KEY `producto_ibfk_1` (`Id_cantidad_ingrediente`);

--
-- Indices de la tabla `programa_fidelizacion`
--
ALTER TABLE `programa_fidelizacion`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD KEY `Id_cliente` (`Id_cliente`);

--
-- Indices de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD KEY `Id_persona` (`Id_persona`);

--
-- Indices de la tabla `seccion_menu`
--
ALTER TABLE `seccion_menu`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`),
  ADD KEY `Id_producto` (`Id_producto`),
  ADD KEY `Id_ingrediente_adicional` (`Id_ingrediente_adicional`);

--
-- Indices de la tabla `tipo_compra`
--
ALTER TABLE `tipo_compra`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cantidad ingrediente`
--
ALTER TABLE `cantidad ingrediente`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gestor_pedidos`
--
ALTER TABLE `gestor_pedidos`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingrediente_adicional`
--
ALTER TABLE `ingrediente_adicional`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programa_fidelizacion`
--
ALTER TABLE `programa_fidelizacion`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seccion_menu`
--
ALTER TABLE `seccion_menu`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_compra`
--
ALTER TABLE `tipo_compra`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

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
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`Id_departamento`) REFERENCES `departamento` (`ID`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`Id_tipo_compra`) REFERENCES `tipo_compra` (`Id`),
  ADD CONSTRAINT `cliente_ibfk_3` FOREIGN KEY (`Id_persona`) REFERENCES `persona` (`Id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`Id_pedido`) REFERENCES `pedido` (`Id`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`Id_producto`) REFERENCES `producto` (`Id`);

--
-- Filtros para la tabla `gestor_pedidos`
--
ALTER TABLE `gestor_pedidos`
  ADD CONSTRAINT `gestor_pedidos_ibfk_1` FOREIGN KEY (`Id_persona`) REFERENCES `persona` (`Id`);

--
-- Filtros para la tabla `ingrediente_adicional`
--
ALTER TABLE `ingrediente_adicional`
  ADD CONSTRAINT `ingrediente_adicional_ibfk_1` FOREIGN KEY (`Id_ingrediente`) REFERENCES `ingrediente` (`Id`);

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
  ADD CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`Id_pedido`) REFERENCES `pedido` (`Id`),
  ADD CONSTRAINT `notificacion_ibfk_2` FOREIGN KEY (`Id_persona`) REFERENCES `persona` (`Id`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`Id_cliente`) REFERENCES `cliente` (`Id`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`Id_ingrediente`) REFERENCES `ingrediente` (`Id`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`Id_tipo_compra`) REFERENCES `tipo_compra` (`Id`),
  ADD CONSTRAINT `pedido_ibfk_4` FOREIGN KEY (`Id_factura`) REFERENCES `factura` (`Id`),
  ADD CONSTRAINT `pedido_ibfk_5` FOREIGN KEY (`Id_Metodo_pago`) REFERENCES `metodo_pago` (`Id`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`Id_ciudad`) REFERENCES `ciudad` (`ID`);

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
