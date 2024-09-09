-- Trigger para actualizar el total de ventas por ciudad después de una inserción en la tabla ventas
DELIMITER //
CREATE TRIGGER after_insert_ventas
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN
    UPDATE territorio t
    JOIN (
        SELECT 
            v.id_territorio,
            SUM(v.valor_unidad * v.cantidad) AS total_venta
        FROM ventas v
        GROUP BY v.id_territorio
    ) AS subquery ON t.id_territorio = subquery.id_territorio
    SET t.total_venta = subquery.total_venta;
END//
DELIMITER ;

-- Trigger para actualizar el total de ventas por ciudad después de una actualización en la tabla ventas
DELIMITER //
CREATE TRIGGER after_update_ventas
AFTER UPDATE ON ventas
FOR EACH ROW
BEGIN
    UPDATE territorio t
    JOIN (
        SELECT 
            v.id_territorio,
            SUM(v.valor_unidad * v.cantidad) AS total_venta
        FROM ventas v
        GROUP BY v.id_territorio
    ) AS subquery ON t.id_territorio = subquery.id_territorio
    SET t.total_venta = subquery.total_venta;
END//
DELIMITER ;

-- Trigger para actualizar el total de ventas por ciudad después de una eliminación en la tabla ventas:
DELIMITER //
CREATE TRIGGER after_delete_ventas
AFTER DELETE ON ventas
FOR EACH ROW
BEGIN
    UPDATE territorio t
    JOIN (
        SELECT 
            v.id_territorio,
            SUM(v.valor_unidad * v.cantidad) AS total_venta
        FROM ventas v
        GROUP BY v.id_territorio
    ) AS subquery ON t.id_territorio = subquery.id_territorio
    SET t.total_venta = subquery.total_venta;
END//
DELIMITER ;


-- Trigger para después de una inserción en la tabla vendedor
DELIMITER //
CREATE TRIGGER after_insert_vendedor
AFTER INSERT ON vendedor
FOR EACH ROW
BEGIN
    UPDATE cantidad_empleados_femenino
    SET cantidad_empleados_femenino = (
        SELECT COUNT(*)
        FROM vendedor
        WHERE genero = "Femenino"
    );
END//

-- Triggers para después de una actualización en la tabla

DELIMITER //
CREATE TRIGGER after_update_vendedor
AFTER UPDATE ON vendedor
FOR EACH ROW
BEGIN
    UPDATE cantidad_empleados_femenino
    SET cantidad_empleados_femenino = (
        SELECT COUNT(*)
        FROM vendedor
        WHERE genero = "Femenino"
    );
END//
DELIMITER ;

-- Trigger para después de una eliminación en la tabla vendedor
DELIMITER //
CREATE TRIGGER after_delete_vendedor
AFTER DELETE ON vendedor
FOR EACH ROW
BEGIN
    UPDATE cantidad_empleados_femenino
    SET cantidad_empleados_femenino = (
        SELECT COUNT(*)
        FROM vendedor
        WHERE genero = "Femenino"
    );
END//
DELIMITER ;


