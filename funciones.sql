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

-- Función para calcular el costo total (directo + indirecto)
DELIMITER $$
CREATE FUNCTION calcular_costos(costo_directo DECIMAL(10,2), costo_indirecto DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN costo_directo + costo_indirecto;
END$$
DELIMITER ;

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

# calcula el precio del producto
DELIMITER $$
CREATE VIEW precio_total AS
SELECT 
    Id_Prod,
    Cantidad,
    Valor Unidad,
    costo_indirecto,
    costo_directo,
    Valor_Unidad * Cantidad AS calcular_precio
    calcular_costos (costo_directo,P_ventaprecio_ventas costo_indirecto) AS costo_total,
    (valor_unidad*cantidad)+calcular_costos(costo_directo, costo_indirecto) AS precio_total
FROM 
    ventas
ORDER BY 
    costo_total ASC
LIMIT 1
DELIMITER ;








