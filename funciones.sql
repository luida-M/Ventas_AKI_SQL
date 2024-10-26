USE ventas_aki;

#calcula el precio de ventas
DELIMITER $$
CREATE FUNCTION P_venta (cantidad INT, valor_unidad INT)
RETURNS DECIMAL(11,2)
NO SQL
BEGIN
	DECLARE resultado DECIMAL(11,2);
	SET resultado = (Cantidad * valor_unidad);
	RETURN resultado;
END$$
DELIMITER ;

-- Función para calcular la suma de los costos totales (directo + indirecto)--
DELIMITER $$
CREATE FUNCTION calcular_suma_costos()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE total_costos DECIMAL(10,2);
  SELECT SUM(costos_directos + costos_indirectos) INTO total_costos FROM ventas;
  RETURN total_costos;
END$$
DELIMITER ;
SELECT calcular_suma_costos();

# Obtener el nombre del cliente
DELIMITER $$
CREATE FUNCTION obtenerNombrecliente(Parametro INT) 
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
  DECLARE nombrecliente VARCHAR(100);
  SET nombrecliente = (SELECT nombre_completo FROM clientes WHERE id_cliente = Parametro);
  RETURN nombrecliente;
END$$
DELIMITER ;
select obtenerNombrecliente();
--

DESCRIBE mysql.user;

--

# calcula el precio total del producto
DELIMITER $$
CREATE FUNCTION calcular_precio_total_producto(id_prod INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE precio_total_producto DECIMAL(10,2);
  SELECT SUM(valor_unidad * cantidad + costos_directos + costos_indirectos) INTO precio_total_producto
  FROM ventas
  WHERE id_prod = id_prod;
  RETURN precio_total_producto;
END$$
DELIMITER ;
SELECT calcular_precio_total_producto(1) AS precio_total_producto;

-- Venta por cliente
DELIMITER $$
CREATE FUNCTION CalcularTotalVentasCliente(id_cliente INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(valor_unidad * cantidad) INTO total
    FROM ventas
    WHERE id_cliente = id_cliente;
    RETURN total;
END $$
DELIMITER ;
SELECT CalcularTotalVentasCliente(1);






