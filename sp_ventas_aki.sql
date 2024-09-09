USE ventas_aki;
#SP para obtener ventas por vendedor: 
#Puedes crear un SP que tome como entrada el ID de un vendedor y devuelva todas las ventas realizadas por ese vendedor.
Drop Function if exists ventasvendedor;
DELIMITER //
CREATE PROCEDURE ventasVendedor(IN vendedorId INT)
BEGIN
    SELECT *
    FROM ventas
    WHERE id_vendedor = idvendedor;
    
END// 
DELIMITER ;

#SP para calcular el costo total de una venta: Si deseas obtener el costo total de una venta específica
DELIMITER //
CREATE PROCEDURE CalculateTotalCost(IN idventa INT, OUT totalCost DECIMAL(10, 2))
BEGIN
    SELECT SUM(costos_directos + costos_indirectos)
    INTO totalCost
    FROM ventas;
    END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Calculateventaporciudad()
BEGIN
    SELECT 
        t.ciudad,
        SUM(v.valor_unidad * v.cantidad) AS total_venta
    FROM ventas v
    INNER JOIN territorio t ON v.id_territorio = t.id_territorio
    GROUP BY t.ciudad
    ORDER BY total_venta DESC;
END//
DELIMITER ;
