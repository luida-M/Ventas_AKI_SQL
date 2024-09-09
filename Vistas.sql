USE ventas_aki;
use mysql ;
SET sql_mode='';
# vista de los tipos de garantia de los productos pequeños.
CREATE VIEW productos_vw AS
SELECT garantia, tamano, Descripcion_Abreviada
FROM producto
where tamano like "%pequeno%";
SELECT * FROM productos_vw;

#consultar todas las tablas vistas
SHOW FULL TABLES;

-- visualización de las vistas 
SHOW FULL TABLES
WHERE table_type='view';
-- creo la tabla y concatena tablas (clientes y ventas) 
SELECT c.nombre_completo, c.Descuento, count(c.nombre_completo) 
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.cod_pago = 101
group by c.nombre_completo;

#Vista de total de productos vendidos
CREATE VIEW Cantidad_vendida AS
SELECT 
	id_prod, 
	sum(Cantidad) AS total_cantidad
FROM ventas
GROUP BY id_prod, total_cantidad;
-- LIMIT 1;
SELECT * FROM Cantidad_vendida;

CREATE VIEW Efectivo AS
SELECT 
	v.id_cliente,
    v.id_territorio,
    v.cod_pago,
    v.id_prod
FROM ventas as v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN territorio t ON v.id_territorio = t.id_territorio
INNER JOIN medios_de_pago m ON v.cod_pago = m.cod_pago
INNER JOIN producto p ON v.id_prod = p.id_producto
WHERE v.cod_pago= "Efectivo"
group by 
   v.id_cliente, 
    v.id_territorio, 
    v.cod_pago, 
    v.id_prod;
select * from Efectivo;


# Muestra la ventas por provincia
CREATE VIEW venta_ciudad AS
SELECT 
	v.id_venta, 
	SUM(v.valor_unidad * v.cantidad) AS total_venta
FROM ventas v
INNER JOIN territorio as t ON v.id_territorio = t.id_territorio
GROUP BY t.ciudad
ORDER BY total_venta DESC;
SELECT * From venta_ciudad;

# Vista de la cantidad de empleados del sexo femenino
CREATE VIEW cantidad_empleados_femenino AS
SELECT COUNT(*) AS cantidad_empleados_femenino
FROM vendedor
WHERE genero = "Femenino";
SELECT * From cantidad_empleados_femenino;




