USE ventas_aki;
use mysql ;
SET sql_mode='';
#consultar todas las tablas vistas
SHOW FULL TABLES;
-- visualización de las vistas 
SHOW FULL TABLES
WHERE table_type='view';

CREATE OR REPLACE VIEW vista_popularidad_metodos_pago AS
SELECT 
    mp.descripcion AS metodo_pago,
    COUNT(v.cod_pago) AS cantidad_usos
FROM 
    ventas v
INNER JOIN 
    medios_de_pago mp ON v.cod_pago = mp.cod_pago
GROUP BY 
    mp.descripcion
ORDER BY 
    cantidad_usos DESC;

# Calcula el total gastado por cliente
CREATE VIEW Analisis_Clientes AS
SELECT
    c.id_cliente,
    c.nombre_completo,
    SUM(v.valor_unidad * v.cantidad) AS total_gastado,
    COUNT(c.id_cliente) AS total_compras,
    MAX(v.valor_unidad * v.cantidad) AS compra_maxima,
    m.descripcion AS medio_pago_frecuente
FROM
    clientes c
JOIN
    ventas v ON c.id_cliente = v.id_cliente
JOIN
    medios_de_pago m ON v.cod_pago = m.cod_pago
GROUP BY
    c.id_cliente, c.nombre_completo, m.descripcion
ORDER BY
    total_gastado DESC;
-- Consultar la vista
SELECT * FROM Analisis_Clientes;

# Vista de la cantidad de empleados del sexo femenino
CREATE OR REPLACE VIEW cantidad_empleados_femenino AS
SELECT COUNT(*) AS cantidad_empleados_femenino
FROM vendedor
WHERE genero = "Femenino";
SELECT * From cantidad_empleados_femenino;

-- Vista de los tipos de garantía de los productos pequeños.
CREATE OR REPLACE VIEW productos_vw AS
SELECT 
    garantia, 
    tamano, 
    Descripcion_Abreviada
FROM 
    producto p
WHERE 
    tamano LIKE '%Pequeno%';

-- Consultar la vista
SELECT * FROM productos_vw;







